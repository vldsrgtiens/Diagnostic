unit vkbdhelper;

{
  Force focused control visible when Android Virtual Keyboard showed or hiden
  How to use:
  place vkdbhelper into your project uses section.No more code needed.

  Changes
  =======
  2016.1.8
  * Fix a bug when user switch to other app
  2015.7.12
  * Fix space after hide ime and rotate
  * Fix rotate detection

}
interface

implementation

{ .$DEFINE QLOG_INCLUDED }

uses classes, sysutils, System.Types, System.Messaging, FMX.Types, FMX.Controls,
  FMX.Layouts,
  FMX.Forms, FMX.Platform {$IF QLOG_INCLUDED}, qlog{$ENDIF}, typinfo,
  FMX.Platform.Android, FMX.Helpers.Android, FMX.VirtualKeyboard,
  FMX.VirtualKeyboard.Android, System.Rtti,
  Androidapi.JNI.GraphicsContentViewText, Androidapi.JNI.Embarcadero;

type
  TVKStateHandler = class(TComponent)
  protected
    FVKMsgId: Integer; // TVKStateChangeMessage 消息的订阅ID
    FSizeMsgId: Integer; // TSizeChangedMessage 消息的订阅ID
    FLastControl: TControl; // 最后一次调整的ScrollBox

    FLastMargin: TPointF; // 原始缩进
    FLastAlign: TAlignLayout; // 原始对齐
    FLastBounds: TRectF; // 原始位置

    FVKVisibleTimer: TTimer; // 用于检查虚拟键盘是否可见的定时器
    procedure DoVKVisibleChanged(const Sender: TObject;
      const Msg: System.Messaging.TMessage);
    procedure DoSizeChanged(const Sender: TObject;
      const Msg: System.Messaging.TMessage);
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure DoVKVisibleCheck(ASender: TObject);
    procedure EnableVKCheck(AEnabled: Boolean);
  public
    constructor Create(AOwner: TComponent); overload; override;
    destructor Destroy; override;
  end;

var
  VKHandler: TVKStateHandler;

function GetVKBounds(var ARect: TRect): Boolean;
var
  ContentRect, TotalRect: JRect;
begin
  ContentRect := TJRect.Create;
  TotalRect := TJRect.Create;
  MainActivity.getWindow.getDecorView.getWindowVisibleDisplayFrame(ContentRect);
  MainActivity.getWindow.getDecorView.getDrawingRect(TotalRect);
  Result := TotalRect.Bottom <> ContentRect.Bottom;
  if Result then
  begin
    ARect.Left := TotalRect.Left;
    ARect.Top := ContentRect.Bottom;
    ARect.Right := TotalRect.Right;
    ARect.Bottom := TotalRect.Bottom;
  end;
end;

/// 根据MainActivity的可视区域和绘图区域大小来确定是否显示了虚拟键盘
function IsVKVisible: Boolean;
var
  R: TRect;
begin
  Result := GetVKBounds(R);
end;

{ TVKStateHandler }
/// 构造函数，订阅消息并创建定时器
constructor TVKStateHandler.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FVKMsgId := TMessageManager.DefaultManager.SubscribeToMessage
    (TVKStateChangeMessage, DoVKVisibleChanged);
  FSizeMsgId := TMessageManager.DefaultManager.SubscribeToMessage
    (TSizeChangedMessage, DoSizeChanged);
  FVKVisibleTimer := TTimer.Create(Self);
  FVKVisibleTimer.Enabled := False;
  FVKVisibleTimer.Interval := 100; // 每100ms检查一次状态
  FVKVisibleTimer.OnTimer := DoVKVisibleCheck;
end;

/// 析构函数，取消消息订阅
destructor TVKStateHandler.Destroy;
begin
  TMessageManager.DefaultManager.Unsubscribe(TVKStateChangeMessage, FVKMsgId);
  TMessageManager.DefaultManager.Unsubscribe(TSizeChangedMessage, FSizeMsgId);
  inherited;
end;

procedure TVKStateHandler.DoSizeChanged(const Sender: TObject;
  const Msg: System.Messaging.TMessage);
var
  ASizeMsg: TSizeChangedMessage absolute Msg;
  R: TRect;
  AScene: IScene;
  AScale: Single;
begin
  if Sender = Screen.ActiveForm then
  begin
    if GetVKBounds(R) then
    begin
      if Assigned(FLastControl) then
      begin
        if FLastControl is TLayout then
        begin
          if FLastControl.TagObject = Self then
          begin
{$IFDEF QLOG_INCLUDED}
            PostLog(llHint, '[VKHelper] Layout是由本对象创建，调整为屏幕尺寸');
{$ENDIF}
            FLastControl.SetBounds(0, 0, Screen.ActiveForm.Width,
              Screen.ActiveForm.Height);
          end;
        end
        else //
          TCustomScrollBox(FLastControl).Margins.Bottom := 0;
      end;
      if Supports(Sender, IScene, AScene) then
      begin
        AScale := AScene.GetSceneScale;
        R.Left := Trunc(R.Left / AScale);
        R.Top := Trunc(R.Top / AScale);
        R.Right := Trunc(R.Right / AScale);
        R.Bottom := Trunc(R.Bottom / AScale);
{$IFDEF QLOG_INCLUDED}
        PostLog(llHint, '[VKHelper]屏幕尺寸变更为 %d - %d，虚拟键盘区域：(%d,%d)-(%d-%d)',
          [ASizeMsg.Value.Width, ASizeMsg.Value.Height, R.Left, R.Top, R.Right,
          R.Bottom]);
{$ENDIF}
        TMessageManager.DefaultManager.SendMessage(Sender,
          TVKStateChangeMessage.Create(true, R));
      end;
    end
{$IFDEF QLOG_INCLUDED}
    else
      PostLog(llHint, '[VKHelper]屏幕尺寸变更为 %d - %d，虚拟键盘处于隐藏状态',
        [ASizeMsg.Value.Width, ASizeMsg.Value.Height]);
{$ENDIF}
  end;
end;

/// 虚拟键盘可见性变更消息
procedure TVKStateHandler.DoVKVisibleChanged(const Sender: TObject;
  const Msg: System.Messaging.TMessage);
var
  AVKMsg: TVKStateChangeMessage absolute Msg;
  ACtrl: TControl;
  ACtrlBounds, AVKBounds, ATarget: TRectF;
  // 移动指定父上的子对象到新的父对象
  procedure MoveCtrls(AOldParent, ANewParent: TFmxObject);
  var
    I: Integer;
    AChild: TFmxObject;
  begin
    I := 0;
    while I < AOldParent.ChildrenCount do
    begin
      AChild := AOldParent.Children[I];
      if AChild <> ANewParent then
      begin
        if AChild.Parent = AOldParent then
        begin
          AChild.Parent := ANewParent;
          Continue;
        end;
      end;
      Inc(I);
    end;
  end;
  procedure AdjustByLayout(R: TRectF; ARoot: TFmxObject);
  var
    ALayout: TLayout;
  begin
{$IFDEF QLOG_INCLUDED}
    PostLog(llDebug, '[VKHelper] 当前根对象为:%s - %s',
      [ARoot.ClassName, ARoot.Name]);
    PostLog(llDebug, '[VKHelper] 当前第一个子对象为：%s - %s',
      [ARoot.Children[0].ClassName, ARoot.Children[0].Name]);
{$ENDIF}
    if (ARoot.ChildrenCount = 1) and (ARoot.Children[0] is TLayout) then
    // 多于1个，说明没有添加Layout
    begin
      ALayout := ARoot.Children[0] as TLayout;
{$IFDEF QLOG_INCLUDED}
      PostLog(llDebug, '[VKHelper] 找到 Layout: %s', [ALayout.Name]);
{$ENDIF}
      if ALayout.Align <> TAlignLayout.None then
      begin
{$IFDEF QLOG_INCLUDED}
        PostLog(llDebug, '[VKHelper]发现Layout控件 %s ，记录当前参数：', [ALayout.Name]);
        PostLog(llDebug, '[VKHelper] .Align=%s',
          [GetEnumName(TypeInfo(TAlignLayout), Integer(ALayout.Align))]);
        PostLog(llDebug, '[VKHelper] .BoundsRect={%f,%f)-(%f,%f)',
          [ALayout.BoundsRect.Left, ALayout.BoundsRect.Top,
          ALayout.BoundsRect.Right, ALayout.BoundsRect.Bottom]);
        PostLog(llDebug, '[VKHelper] .Postion=(%f,%f)',
          [ALayout.Position.X, ALayout.Position.Y]);
{$ENDIF}
        FLastAlign := ALayout.Align;
      end;
      FLastBounds := ALayout.BoundsRect;
      FLastMargin.Y := ALayout.Position.Y;
      FLastMargin.X := ALayout.Position.X;
      ALayout.Align := TAlignLayout.None;
    end
    else
    begin
{$IFDEF QLOG_INCLUDED}
      PostLog(llDebug, '[VKHelper]没有可调整控件，创建一个Layout');
{$ENDIF}
      ALayout := TLayout.Create(ARoot);
      ALayout.Parent := ARoot;
      ALayout.TagObject := Self;
      MoveCtrls(ARoot, ALayout);
      FLastMargin.Y := 0;
      FLastMargin.X := 0;
      FLastAlign := TAlignLayout.Client;
      FLastBounds := TRectF.Create(0, 0, 0, 0);
    end;
    if ARoot is TForm then
    begin
      if (TForm(ARoot).Width <> ALayout.Width) or
        (TForm(ARoot).Height <> ALayout.Height) then
        ALayout.SetBounds(0, 0, TForm(ARoot).Width, TForm(ARoot).Height);
    end;
    // 如果没有滚动框，就加一个Layout，然后再将所有的元素移动到这个Layout上
    ALayout.Position.Y := R.Bottom - ACtrlBounds.Bottom;
    if FLastControl <> ALayout then
    begin
      if Assigned(FLastControl) then
        FLastControl.RemoveFreeNotification(Self);
      FLastControl := ALayout;
      FLastControl.FreeNotification(Self);
      EnableVKCheck(true);
    end;
  end;
/// 将指定的区域移动可视区
  procedure ScrollInToRect(R: TRectF);
  var
    AParent, ALastParent: TFmxObject;
    AParentBounds: TRectF;
    AScrollBox: TCustomScrollBox;
    AOffset: Single;
  begin
    AParent := ACtrl.Parent;
    AScrollBox := nil;
    ALastParent := AParent;
    while Assigned(AParent) do
    begin
      if AParent is TCustomScrollBox then // 父有滚动框，则测试能不能滚动
      begin
        AScrollBox := AParent as TCustomScrollBox;
        AParentBounds := AScrollBox.AbsoluteRect;
        if AParentBounds.Contains(R) then
        begin
          AOffset := ACtrlBounds.Top - R.Top;
          if (AParentBounds.Bottom > AVKBounds.Top) or
            (AParentBounds.Bottom < AParentBounds.Height) then
          begin
            if (FLastControl <> AScrollBox) then
            begin
              if Assigned(FLastControl) then
                FLastControl.RemoveFreeNotification(Self);
{$IFDEF QLOG_INCLUDED}
              PostLog(llHint, '[VKHelper]发现 ScrollBox 控件:%s',
                [AScrollBox.Name]);
{$ENDIF}
              FLastMargin.Y := AScrollBox.Margins.Bottom;
              FLastMargin.X := AScrollBox.Margins.Left;
              FLastControl := AScrollBox;
              FLastControl.FreeNotification(Self);
              EnableVKCheck(true);
            end;
            AScrollBox.Margins.Bottom := AParentBounds.Bottom - AVKBounds.Top;
          end;
          // 需要进一步调整客户区内容，以保证它能够调整到指定区域
          AScrollBox.ViewportPosition :=
            TPointF.Create(AScrollBox.ViewportPosition.X,
            AScrollBox.ViewportPosition.Y + AOffset);
          Break;
        end;
      end;
      ALastParent := AParent;
      AParent := AParent.Parent;
    end;
    if not Assigned(AScrollBox) then
      AdjustByLayout(R, ALastParent);
  end;

begin
  if AVKMsg.KeyboardVisible then // 键盘可见
  begin
    if Screen.FocusControl <> nil then
    begin
      ACtrl := Screen.FocusControl.GetObject as TControl;
      ACtrlBounds := ACtrl.AbsoluteRect;
      AVKBounds := TRectF.Create(AVKMsg.KeyboardBounds);
{$IFDEF QLOG_INCLUDED}
      PostLog(llHint, '[VKHelper]控件区域:(%f,%f)-(%f,%f),虚拟键盘区域:(%f,%f)-(%f,%f)',
        [ACtrlBounds.Left, ACtrlBounds.Top, ACtrlBounds.Right,
        ACtrlBounds.Bottom, AVKBounds.Left, AVKBounds.Top, AVKBounds.Right,
        AVKBounds.Bottom]);
{$ENDIF}
      if (ACtrlBounds.Bottom > AVKBounds.Top) or (ACtrlBounds.Top < 0) then
      begin
        ATarget := ACtrlBounds;
        ATarget.Top := AVKBounds.Top - ACtrlBounds.Height;
        ATarget.Bottom := ATarget.Top + ACtrlBounds.Height;
        ScrollInToRect(ATarget);
      end
      else
      begin
        EnableVKCheck(true);
{$IFDEF QLOG_INCLUDED}
        PostLog(llHint, '[VKHelper]虚拟键盘显示，但当前焦点控制可见，不需要调整');
{$ENDIF}
      end;
    end
{$IFDEF QLOG_INCLUDED}
    else
      PostLog(llHint, '[VKHelper]虚拟键盘显示，但Screen.FocusControl却为空');
{$ENDIF}
  end
  else // 键盘隐藏
  begin
    if Assigned(FLastControl) then
    begin
      if FLastControl is TCustomScrollBox then
      begin
        FLastControl.Margins.Bottom := FLastMargin.Y;
        FLastControl.Margins.Left := FLastMargin.X;
      end
      else
      begin
        if FLastAlign = TAlignLayout.None then
        begin
          FLastControl.Position.Y := FLastMargin.Y;
          FLastControl.Position.X := FLastMargin.X;
        end
        else
        begin
          FLastControl.BoundsRect := FLastBounds;
          FLastControl.Align := FLastAlign;
        end;
      end;
      FLastControl := nil;
      EnableVKCheck(False);
    end;
  end;
end;

/// 定时器检查虚拟键盘是否隐藏
procedure TVKStateHandler.DoVKVisibleCheck(ASender: TObject);
  procedure FMXAndroidFix;
  var
    AService: IFMXVirtualKeyboardService;
    AVK: TVirtualKeyboardAndroid;
    AListener: TVKListener;
    AContext: TRttiContext;
    AType: TRttiType;
    AField: TRttiField;
  begin
    if TPlatformServices.Current.SupportsPlatformService
      (IFMXVirtualKeyboardService, AService) then
    begin
      AVK := AService as TVirtualKeyboardAndroid;
      AContext := TRttiContext.Create;
      AType := AContext.GetType(AVK.ClassType);
      if Assigned(AType) then
      begin
        AField := AType.GetField('FVKListener');
        if Assigned(AField) then
        begin
          AListener := AField.GetValue(AVK).AsObject as TVKListener;
          AListener.onVirtualKeyboardHidden;
        end;
      end;
      Screen.ActiveForm.Focused := nil;
    end;
  end;

begin
  if not IsVKVisible then // 解决掉虚拟键盘隐藏后的问题
  begin
    EnableVKCheck(False);
    if Assigned(Screen.FocusControl) then
      TMessageManager.DefaultManager.SendMessage(Screen.FocusControl.GetObject,
        TVKStateChangeMessage.Create(False, TRect.Create(0, 0, 0, 0)));
    // FMXAndroidFix;
  end;
end;

procedure TVKStateHandler.EnableVKCheck(AEnabled: Boolean);
begin
  FVKVisibleTimer.Enabled := AEnabled;
{$IFDEF QLOG_INCLUDED}
  PostLog(llHint, '[VKHelper] 虚拟键盘状态检查变更');
{$ENDIF}
end;

/// 响应组件释放通知，以避免访问无效地址
procedure TVKStateHandler.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  if Operation = opRemove then
  begin
    if FLastControl = AComponent then
      FLastControl := nil;
  end;
  inherited;
end;

initialization

VKHandler := TVKStateHandler.Create(nil);

finalization

FreeAndNil(VKHandler);

end.
