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
    FVKMsgId: Integer; // TVKStateChangeMessage ��Ϣ�Ķ���ID
    FSizeMsgId: Integer; // TSizeChangedMessage ��Ϣ�Ķ���ID
    FLastControl: TControl; // ���һ�ε�����ScrollBox

    FLastMargin: TPointF; // ԭʼ����
    FLastAlign: TAlignLayout; // ԭʼ����
    FLastBounds: TRectF; // ԭʼλ��

    FVKVisibleTimer: TTimer; // ���ڼ����������Ƿ�ɼ��Ķ�ʱ��
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

/// ����MainActivity�Ŀ�������ͻ�ͼ�����С��ȷ���Ƿ���ʾ���������
function IsVKVisible: Boolean;
var
  R: TRect;
begin
  Result := GetVKBounds(R);
end;

{ TVKStateHandler }
/// ���캯����������Ϣ��������ʱ��
constructor TVKStateHandler.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FVKMsgId := TMessageManager.DefaultManager.SubscribeToMessage
    (TVKStateChangeMessage, DoVKVisibleChanged);
  FSizeMsgId := TMessageManager.DefaultManager.SubscribeToMessage
    (TSizeChangedMessage, DoSizeChanged);
  FVKVisibleTimer := TTimer.Create(Self);
  FVKVisibleTimer.Enabled := False;
  FVKVisibleTimer.Interval := 100; // ÿ100ms���һ��״̬
  FVKVisibleTimer.OnTimer := DoVKVisibleCheck;
end;

/// ����������ȡ����Ϣ����
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
            PostLog(llHint, '[VKHelper] Layout���ɱ����󴴽�������Ϊ��Ļ�ߴ�');
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
        PostLog(llHint, '[VKHelper]��Ļ�ߴ���Ϊ %d - %d�������������(%d,%d)-(%d-%d)',
          [ASizeMsg.Value.Width, ASizeMsg.Value.Height, R.Left, R.Top, R.Right,
          R.Bottom]);
{$ENDIF}
        TMessageManager.DefaultManager.SendMessage(Sender,
          TVKStateChangeMessage.Create(true, R));
      end;
    end
{$IFDEF QLOG_INCLUDED}
    else
      PostLog(llHint, '[VKHelper]��Ļ�ߴ���Ϊ %d - %d��������̴�������״̬',
        [ASizeMsg.Value.Width, ASizeMsg.Value.Height]);
{$ENDIF}
  end;
end;

/// ������̿ɼ��Ա����Ϣ
procedure TVKStateHandler.DoVKVisibleChanged(const Sender: TObject;
  const Msg: System.Messaging.TMessage);
var
  AVKMsg: TVKStateChangeMessage absolute Msg;
  ACtrl: TControl;
  ACtrlBounds, AVKBounds, ATarget: TRectF;
  // �ƶ�ָ�����ϵ��Ӷ����µĸ�����
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
    PostLog(llDebug, '[VKHelper] ��ǰ������Ϊ:%s - %s',
      [ARoot.ClassName, ARoot.Name]);
    PostLog(llDebug, '[VKHelper] ��ǰ��һ���Ӷ���Ϊ��%s - %s',
      [ARoot.Children[0].ClassName, ARoot.Children[0].Name]);
{$ENDIF}
    if (ARoot.ChildrenCount = 1) and (ARoot.Children[0] is TLayout) then
    // ����1����˵��û�����Layout
    begin
      ALayout := ARoot.Children[0] as TLayout;
{$IFDEF QLOG_INCLUDED}
      PostLog(llDebug, '[VKHelper] �ҵ� Layout: %s', [ALayout.Name]);
{$ENDIF}
      if ALayout.Align <> TAlignLayout.None then
      begin
{$IFDEF QLOG_INCLUDED}
        PostLog(llDebug, '[VKHelper]����Layout�ؼ� %s ����¼��ǰ������', [ALayout.Name]);
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
      PostLog(llDebug, '[VKHelper]û�пɵ����ؼ�������һ��Layout');
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
    // ���û�й����򣬾ͼ�һ��Layout��Ȼ���ٽ����е�Ԫ���ƶ������Layout��
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
/// ��ָ���������ƶ�������
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
      if AParent is TCustomScrollBox then // ���й�����������ܲ��ܹ���
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
              PostLog(llHint, '[VKHelper]���� ScrollBox �ؼ�:%s',
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
          // ��Ҫ��һ�������ͻ������ݣ��Ա�֤���ܹ�������ָ������
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
  if AVKMsg.KeyboardVisible then // ���̿ɼ�
  begin
    if Screen.FocusControl <> nil then
    begin
      ACtrl := Screen.FocusControl.GetObject as TControl;
      ACtrlBounds := ACtrl.AbsoluteRect;
      AVKBounds := TRectF.Create(AVKMsg.KeyboardBounds);
{$IFDEF QLOG_INCLUDED}
      PostLog(llHint, '[VKHelper]�ؼ�����:(%f,%f)-(%f,%f),�����������:(%f,%f)-(%f,%f)',
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
        PostLog(llHint, '[VKHelper]���������ʾ������ǰ������ƿɼ�������Ҫ����');
{$ENDIF}
      end;
    end
{$IFDEF QLOG_INCLUDED}
    else
      PostLog(llHint, '[VKHelper]���������ʾ����Screen.FocusControlȴΪ��');
{$ENDIF}
  end
  else // ��������
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

/// ��ʱ�������������Ƿ�����
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
  if not IsVKVisible then // ���������������غ������
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
  PostLog(llHint, '[VKHelper] �������״̬�����');
{$ENDIF}
end;

/// ��Ӧ����ͷ�֪ͨ���Ա��������Ч��ַ
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
