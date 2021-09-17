unit UDiag;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts, FMX.TabControl, FMX.Edit,
  FMX.DateTimeCtrls, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, System.Actions,
  UDataModule,Data.DB,System.IOUtils,//FMX.Helpers.Android, Androidapi.JNI.Util,
  FMX.ActnList, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, FireDAC.UI.Intf, FireDAC.FMXUI.Wait,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Stan.Intf, FireDAC.Comp.UI, Data.Bind.Controls,
  Fmx.Bind.Navigator, FMX.ListBox, FMX.ScrollBox,
  //Androidapi.Helpers,
  FMX.Platform,

  {$IFDEF ANDROID}
   vkbdhelper,
  {$ENDIF}


  //FMX.Helpers.Android,
  //Androidapi.JNI.Util,

  FMX.Memo, FMX.Calendar;

type
  TForm11 = class(TForm)
    TabControl1: TTabControl;
    Authorization: TTabItem;
    Home: TTabItem;
    Layout1: TLayout;
    Layout2: TLayout;
    ButtonNewPatient: TCornerButton;
    Image1: TImage;
    Label1: TLabel;
    CornerButton2: TCornerButton;
    Image2: TImage;
    Label2: TLabel;
    StatusBarTop: TStatusBar;
    StatusBarBottom: TStatusBar;
    NewPatient: TTabItem;
    Layout3: TLayout;
    Panel1: TPanel;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    Label3: TLabel;
    EditLastName: TEdit;
    Layout7: TLayout;
    Label4: TLabel;
    EditFirstName: TEdit;
    Layout8: TLayout;
    Label5: TLabel;
    EditMiddleName: TEdit;
    PanelKeyboard: TPanel;
    Layout10: TLayout;
    Label6: TLabel;
    Switch1: TSwitch;
    LabelGender: TLabel;
    Layout11: TLayout;
    Label7: TLabel;
    EditPhone1: TEdit;
    Image3: TImage;
    Layout12: TLayout;
    Label8: TLabel;
    EditPhone2: TEdit;
    Image4: TImage;
    Layout13: TLayout;
    Label9: TLabel;
    EditPhoneEmail: TEdit;
    Image5: TImage;
    Layout14: TLayout;
    Label10: TLabel;
    Rectangle1: TRectangle;
    PatientsList: TTabItem;
    Layout15: TLayout;
    Layout16: TLayout;
    PatientCard: TTabItem;
    Layout17: TLayout;
    Layout18: TLayout;
    Panel3: TPanel;
    TabControlPatienCard: TTabControl;
    Layout19: TLayout;
    History: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    Image6: TImage;
    Layout20: TLayout;
    LabelPatientCardFirstName: TLabel;
    LabelPatientCardLastName: TLabel;
    LabelPatientCardMiddleName: TLabel;
    Image8: TImage;
    ButtonSettings: TCornerButton;
    Image9: TImage;
    Label11: TLabel;
    Settings: TTabItem;
    Layout21: TLayout;
    ActionList1: TActionList;
    ChangeTabAction1: TChangeTabAction;
    StyleBook1: TStyleBook;
    Panel4: TPanel;
    Layout22: TLayout;
    Image10: TImage;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    Label12: TLabel;
    ListView1: TListView;
    Label13: TLabel;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkFillControlToField3: TLinkFillControlToField;
    Layout23: TLayout;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    ListView2: TListView;
    BindSourceDB2: TBindSourceDB;
    LinkFillControlToField6: TLinkFillControlToField;
    DateEditBirthdayDate: TDateEdit;
    LinkControlToFieldBirthdayDate: TLinkControlToField;
    LabelPatientCardPhone1: TLabel;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    LinkPropertyToFieldText4: TLinkPropertyToField;
    LinkPropertyToFieldText5: TLinkPropertyToField;
    SpeedButton2: TSpeedButton;
    NewEvent: TTabItem;
    Layout9: TLayout;
    LabelToolBar: TLabel;
    LabelStatusDB: TLabel;
    ComboBox1: TComboBox;
    Layout24: TLayout;
    Layout25: TLayout;
    Label17: TLabel;
    BindSourceDB3: TBindSourceDB;
    LinkFillControlToField2: TLinkFillControlToField;
    Label18: TLabel;
    Memo1: TMemo;
    Label20: TLabel;
    Panel2: TPanel;
    Memo2: TMemo;
    DateEdit1: TDateEdit;
    Panel5: TPanel;
    Layout26: TLayout;
    Layout27: TLayout;
    DownButtonBack: TImage;
    CornerButton1: TCornerButton;
    Image12: TImage;
    Label19: TLabel;
    SpeedButton1: TSpeedButton;
    Image7: TImage;
    procedure Switch1Switch(Sender: TObject);
    procedure ButtonNewPatientClick(Sender: TObject);
    procedure CornerButton2Click(Sender: TObject);
    procedure ButtonSettingsClick(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure DownButtonBackResize(Sender: TObject);
    procedure DownButtonBackClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure TabControlChange;
  end;

var
  Form11: TForm11;
  //Disp: JDisplayMetrics;
  sScale,scale: Single;
  OSPlatform: string;

  NativeClientHeight, NativeClientWidth: Single; // Для формы
  ScreenService: IFMXScreenService;
  ScreenSize,sScreenSize: TPoint;


implementation

{$R *.fmx}

procedure TForm11.ButtonNewPatientClick(Sender: TObject);
begin
 TabControl1.SetActiveTabWithTransition(NewPatient, TTabTransition.Slide,  TTabTransitionDirection.Normal);
end;

procedure TForm11.ButtonSettingsClick(Sender: TObject);
begin
 TabControl1.SetActiveTabWithTransition(Settings, TTabTransition.Slide,  TTabTransitionDirection.Normal);
end;

procedure TForm11.CornerButton2Click(Sender: TObject);
begin
 TabControl1.SetActiveTabWithTransition(PatientsList, TTabTransition.Slide,  TTabTransitionDirection.Normal);
end;

procedure TForm11.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 DataModule1.FDConnection1.Connected:=false;
end;

procedure TForm11.FormCreate(Sender: TObject);
begin
 {$IFDEF ANDROID}
  DataModule1.FDConnection1.Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'diagnostic.db') ;//'$(DOC)/diagnostic.db';
  //TPath.Combine(TPath.GetDocumentsPath, 'filename')  { Внутренний доступ}
 {$ENDIF}

 {$IFDEF WINDOWS}
  DataModule1.FDConnection1.Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'diagnostic.db');//'C:\Delphi\Diagnostic\diagnostic.db';
 {$ENDIF}

  DataModule1.FDConnection1.Connected:= False;
 DataModule1.FDConnection1.Connected:= True;
   if DataModule1.FDConnection1.Connected then
    begin
     LabelStatusDB.Text:= 'Connected';
     DataModule1.FDQueryTypeEvent.Active:=true;
     DataModule1.FDQueryPatients.Active:=true;
     DataModule1.FDQueryEvents.Active:=true;

    end
   else
    begin
     LabelStatusDB.Text:= 'Not Connected';
    end;

end;

procedure TForm11.FormResize(Sender: TObject);
begin
if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, IInterface(ScreenService)) then
  begin
    sScreenSize := ScreenService.GetScreenSize.Round;
    sScale := ScreenService.GetScreenScale;
    Memo2.Lines.Add('diScreenLogic :'+ intToStr( sScreenSize.x) + ' x ' + intToStr( sScreenSize.y));
    Memo2.Lines.Add('diScreenPhis :'+ floatToStr(sScreenSize.x * sScale) + ' x ' + floatToStr(sScreenSize.y * sScale));
    Memo2.Lines.Add('diScreenWidth :'+ intToStr(sScreenSize.x));
    Memo2.Lines.Add('diScreenHeight :'+ intToStr(sScreenSize.y));
    Memo2.Lines.Add('diScale :'+ FloatToStr( sScale));
  end;

  case TOSVersion.Platform of
    pfWindows: begin
      OSPlatform := 'Windows';
      Layout24.Align:= TAlignLayout.Left;
      Layout24.Align:= TAlignLayout.Center;
      Layout24.Width:=sScreenSize.X div 4;
      Layout26.Align:= TAlignLayout.Left;
      Layout26.Align:= TAlignLayout.Center;
      Layout26.Width:=sScreenSize.X div 4;
      Layout27.Align:= TAlignLayout.Left;
      Layout27.Align:= TAlignLayout.Center;
      Layout27.Width:=sScreenSize.X div 4;
    end;

    pfAndroid: begin
      OSPlatform := 'Android';
      Layout24.Align:= TAlignLayout.Client;
      Layout24.Width:=sScreenSize.X;
      Layout26.Align:= TAlignLayout.Client;
      Layout26.Width:=sScreenSize.X;
      Layout27.Align:= TAlignLayout.Client;
      Layout27.Width:=sScreenSize.X;
    end;
    else
     begin
      OSPlatform := 'UNKNOWN';
      Layout24.Align:= TAlignLayout.Center;
      Layout24.Width:=sScreenSize.X div 4;
      Layout26.Align:= TAlignLayout.Center;
      Layout26.Width:=sScreenSize.X div 4;
      Layout27.Align:= TAlignLayout.Center;
      Layout27.Width:=sScreenSize.X div 4;
     end;
  end;
end;

procedure TForm11.DownButtonBackClick(Sender: TObject);
begin
  case TabControl1.ActiveTab.Index of
   0:begin
      LabelToolBar.Text:='Authorization';
      TabControl1.SetActiveTabWithTransition(Authorization, TTabTransition.Slide,  TTabTransitionDirection.Reversed);
   end;
   1:begin
      LabelToolBar.Text:='Home';
      TabControl1.SetActiveTabWithTransition(Home, TTabTransition.Slide,  TTabTransitionDirection.Reversed);
   end;
   2:begin
      LabelToolBar.Text:='Новый пациент';
      TabControl1.SetActiveTabWithTransition(Home, TTabTransition.Slide,  TTabTransitionDirection.Reversed);
   end;
   3:begin
      LabelToolBar.Text:='Список пациентов';
      TabControl1.SetActiveTabWithTransition(Home, TTabTransition.Slide,  TTabTransitionDirection.Reversed);
   end;
   4:begin
      LabelToolBar.Text:='Карточка пациента';
      TabControl1.SetActiveTabWithTransition(PatientsList, TTabTransition.Slide,  TTabTransitionDirection.Reversed);
   end;
   5:begin
      LabelToolBar.Text:='Настройки';
      TabControl1.SetActiveTabWithTransition(Home, TTabTransition.Slide,  TTabTransitionDirection.Reversed);
   end;
   6:begin
      LabelToolBar.Text:='Новое событие';
   end;
  end;
end;

procedure TForm11.DownButtonBackResize(Sender: TObject);
begin
 Self.Width:=Self.Height;
end;

procedure TForm11.Image8Click(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TForm11.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  DataModule1.FDQueryPatients.Locate('FullName',AItem.Text,[loPartialKey]);
  Label16.Text:='кол-во записей: '+IntToStr(DataModule1.FDQueryEvents.RecordCount);

  DataModule1.FDQueryEvents.Active:=false;
  ListView2.Items.Clear;
  DataModule1.FDQueryEvents.Active:=true;
end;

procedure TForm11.SpeedButton1Click(Sender: TObject);
begin
 if TabControl1.TabPosition=TTabPosition.Top then
  TabControl1.TabPosition:=TTabPosition.None
 else
  TabControl1.TabPosition:=TTabPosition.Top;
end;

procedure TForm11.SpeedButton2Click(Sender: TObject);
begin
 DataModule1.FDQueryEvents.Active:=false;
 ListView2.Items.Clear;
 DataModule1.FDQueryEvents.Active:=true;
end;

procedure TForm11.Switch1Switch(Sender: TObject);
begin
 if Switch1.IsChecked then
  LabelGender.Text:='женщина'
 else
  LabelGender.Text:='мужчина';

end;

procedure TForm11.TabControlChange;
begin

end;

end.
