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
  //accesstoken
  System.JSON, System.Net.URLClient, System.Net.HttpClient,
  System.Net.HttpClientComponent,
  System.StrUtils,IdURI,
  REST.Json,DateUtils,REST.Types,System.Threading,
  //************
  //FMX.Helpers.Android,
  //Androidapi.JNI.Util,

  FMX.Memo, FMX.Calendar, System.ImageList, FMX.ImgList, FMX.WebBrowser,
  Data.Bind.ObjectScope, REST.Client, REST.Authenticator.OAuth, IPPeerClient;
type
 TTypeFileYD = (DataBaseFile, PriorityFile, UpdateFile);
 TTypeRequestYD =(DeleteFileFromYD,SaveFileToYD,MetaInfoPriorityFiles,MetaInfoUpdateFile,LoadFileFromYD);
 TTypeLog = (Ok,Error);

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
    EditEmail: TEdit;
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
    Layout20: TLayout;
    LabelPatientCardFirstName: TLabel;
    LabelPatientCardLastName: TLabel;
    LabelPatientCardMiddleName: TLabel;
    Image8: TImage;
    ButtonEventsList: TCornerButton;
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
    Label32: TLabel;
    ListView1: TListView;
    Label13: TLabel;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkFillControlToField3: TLinkFillControlToField;
    ListView2: TListView;
    BindSourceDB2: TBindSourceDB;
    DateEditBirthdayDate: TDateEdit;
    LabelPatientCardPhone1: TLabel;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    LinkPropertyToFieldText4: TLinkPropertyToField;
    LinkPropertyToFieldText5: TLinkPropertyToField;
    NewEvent: TTabItem;
    Layout9: TLayout;
    LabelToolBar: TLabel;
    LabelStatusDB: TLabel;
    ComboBox1: TComboBox;
    Layout24: TLayout;
    Layout25: TLayout;
    Label17: TLabel;
    Label18: TLabel;
    Memo1: TMemo;
    Label20: TLabel;
    Panel2: TPanel;
    MemoLog: TMemo;
    DateEdit1: TDateEdit;
    Panel5: TPanel;
    Layout26: TLayout;
    Layout27: TLayout;
    DownButtonBack: TImage;
    ButtonSettings: TCornerButton;
    Image12: TImage;
    Label19: TLabel;
    SpeedButton1: TSpeedButton;
    EventsList: TTabItem;
    ImagePage: TImage;
    ImageZeroPatientCard: TImage;
    ImageZeroNewPatient: TImage;
    ImageZeroPatientsList: TImage;
    ImageZeroSettings: TImage;
    ImageZeroNewEvent: TImage;
    ImageZeriEventsList: TImage;
    ImageZeroHome: TImage;
    PanelZeroImages: TPanel;
    AccessTokenTab: TTabItem;
    ImageZeroAuthorization: TImage;
    Panel6: TPanel;
    BindSourceDB3: TBindSourceDB;
    DownPanelBack: TPanel;
    Label14: TLabel;
    DownPanelOk: TPanel;
    Image7: TImage;
    Label15: TLabel;
    DownPanelSave: TPanel;
    Image11: TImage;
    Label16: TLabel;
    DownPanelCreate: TPanel;
    Image13: TImage;
    Label21: TLabel;
    DownPanelEdit: TPanel;
    Image14: TImage;
    Label22: TLabel;
    LinkFillControlToField2: TLinkFillControlToField;
    Layout23: TLayout;
    LabelPatientCardEmail: TLabel;
    LinkPropertyToFieldText6: TLinkPropertyToField;
    LabelPatientCardBirthday: TLabel;
    LinkPropertyToFieldText7: TLinkPropertyToField;
    Layout28: TLayout;
    Panel7: TPanel;
    Image6: TImage;
    Label23: TLabel;
    ButtonExit: TCornerButton;
    Image15: TImage;
    Label24: TLabel;
    LinkFillControlToField4: TLinkFillControlToField;
    ImageList1: TImageList;
    OAuth2Authenticator1: TOAuth2Authenticator;
    CornerButton1: TCornerButton;
    LogRect: TRectangle;
    Layout29: TLayout;
    LogGrayMemo: TMemo;
    AniIndicator1: TAniIndicator;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    CornerButton3: TCornerButton;
    PanelWebBrowser: TPanel;
    Layout30: TLayout;
    Log: TTabItem;
    Layout31: TLayout;
    CornerButton4: TCornerButton;
    CornerButton5: TCornerButton;
    procedure Switch1Switch(Sender: TObject);
    procedure ButtonNewPatientClick(Sender: TObject);
    procedure CornerButton2Click(Sender: TObject);
    procedure ButtonEventsListClick(Sender: TObject);
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
    procedure ButtonSettingsClick(Sender: TObject);
    procedure ImagePageResize(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure DownButtonSaveNewPatientClick(Sender: TObject);
    procedure DownPanelOkClick(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure ButtonExitClick(Sender: TObject);
    procedure CornerButton1Click(Sender: TObject);
    procedure CornerButton3Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure CornerButton4Click(Sender: TObject);
    procedure CornerButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure TabControlChange;
    function CheckNewOrEditPatient(): boolean;
    procedure BeforEditPatient;
    procedure LogWrite(LogType: TTypeLog; str: string);

    procedure GetAccessToken;
    procedure OnDidFinishLoadATWebBrowser(ASender:TObject);
    procedure OnDidFinishErrorATWebBrowser(ASender:TObject);
    function  REST_YandexDisk(FTypeRequestYD: TTypeRequestYD;
                  FTypeFileYD: TTypeFileYD; FFileName: string): Boolean;
    procedure RESTAfterExecute1;
  end;

const
  AppKey='59d9d0d722f44267ab288b0bb6fd5d15';
  RedirectURI = 'http://localhost';
  AuthURL = 'https://oauth.yandex.ru/authorize?response_type=token&client_id=%s&redirect_uri=%s&device_id=%s&device_name=%s';
  BaseURL = 'https://cloud-api.yandex.net/v1';


var
  Form11: TForm11;
  NewOrEditPatient: boolean=true;
  //Disp: JDisplayMetrics;
  sScale,scale: Single;
  OSPlatform: string;

  NativeClientHeight, NativeClientWidth: Single; // Для формы
  ScreenService: IFMXScreenService;
  ScreenSize,sScreenSize: TPoint;

  //accesstoken
  IDDevice: integer=0;
  DeviceBrand: string;
  DeviceSerial: string;
  AccessToken: string='';
  IniFile: TextFile;
  IniFilePath: string;
  IniList: TStringList;
  RESTDestinationFile: string;
  TypeFileYD:TTypeFileYD;
  TypeRequestYD:TTypeRequestYD;
  FlagRESTAfterExecute:Boolean;
  ResponceStatus: string;
  FlagRESTStatus: Boolean;
  //*****

  AccessTokenWebBrouser: TWebBrowser;
implementation  //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

{$R *.fmx}



procedure TForm11.OnDidFinishErrorATWebBrowser(ASender: TObject);
begin

end;

procedure TForm11.OnDidFinishLoadATWebBrowser(ASender:TObject);
var
 StrArr:TStringDynArray;
 i: integer;
 IniFilePath,strIni: string;
 IniFile: TextFile;
 FlagGetAccessToken: Boolean;
begin
  LogWrite(Ok, '-------------------');
  LogWrite(Ok,'after redirect to '+AccessTokenWebBrouser.URL);

  FlagGetAccessToken:=false;

  if StartsText('https://localhost',AccessTokenWebBrouser.URL) then
   begin
    LogWrite(Ok,AccessTokenWebBrouser.URL);

    //разбиваем строку
    StrArr:=SplitString(AccessTokenWebBrouser.URL,'#?=&');

    i:=1;
    while i<length(StrArr) do
     begin
      LogWrite(Ok,'StrArr['+IntToStr(i)+']='+StrArr[i]);
      LogWrite(Ok,'StrArr['+IntToStr(i+1)+']='+StrArr[i+1]);

      if StrArr[i]='access_token' then
       begin
        OAuth2Authenticator1.AccessToken:=StrArr[i+1];
        AccessToken:=OAuth2Authenticator1.AccessToken;
        FlagGetAccessToken:=true;
       end;

      if StrArr[i]='refresh_token' then
       begin
        OAuth2Authenticator1.RefreshToken:=StrArr[i+1];
       end;

      if StrArr[i]='expires_in' then
       begin
        LogWrite(Ok,'expires_in: '+DateToStr(now+round(StrToInt(StrArr[i+1])/60/60/24)));
        OAuth2Authenticator1.AccessTokenExpiry:=(now+round(StrToInt(StrArr[i+1])/60/60/24));

        IniFilePath:=TPath.GetDocumentsPath+PathDelim+'RopaSisIni.rsi';
          if not (FileExists(IniFilePath)) then
           begin
            ShowMessage('файл RopaSisIni отсутствует !')
           end
          else
           begin
            if FlagGetAccessToken then
             begin
              AssignFile(IniFile,IniFilePath);
              Rewrite(IniFile);
              strIni:='';
              strIni:='AccessToken='+OAuth2Authenticator1.AccessToken;
              strIni:=strIni+', '+'expires_in='+DateTimeToStr(OAuth2Authenticator1.AccessTokenExpiry);
              Writeln(IniFile,strIni);
              CloseFile(IniFile);
              LogWrite(Ok,'файл RopaSisIni перезаписан ');
             end;
           end;

       end;

      if StrArr[i]='code' then
       begin
        // и делаем запрос на получение токена
        // код подтверждения во втором элементе
        OAuth2Authenticator1.AuthCode:=StrArr[i+1];
        OAuth2Authenticator1.ChangeAuthCodeToAccesToken;
       end;

      if StrArr[i]='error' then
       begin
        // обрабатываем ошибку
        if StrArr[i+1]='access_denied' then
         ShowMessage('Отказ в предоставлении доступа');
        if StrArr[i+1]='unauthorized_client' then
         ShowMessage('Приложение заблокировано, либо ожидает модерации');
       end;

      i:=i+2;
     end;

     LogWrite(Ok,'AccessToken= '+OAuth2Authenticator1.AccessToken);
     LogWrite(Ok,'RefreshToken= '+OAuth2Authenticator1.RefreshToken);
     LogWrite(Ok,'AccessTokenExpiry= '+DateTimeToStr(OAuth2Authenticator1.AccessTokenExpiry));
     LogWrite(Ok,'-------------------');

    // WebBrowser1.URL:='';
     //WebBrowser1.Stop;
    // WebBrowser1.Visible:=false;
    AccessTokenWebBrouser.Free;
    TabControl1.SetActiveTabWithTransition(Authorization, TTabTransition.Slide,  TTabTransitionDirection.Reversed);

    // Edit9.SetFocus;
   end;


end;

procedure TForm11.GetAccessToken;
var
 strURL: string;
begin
 LogWrite(Ok, 'GetAccessToken');
 AccessTokenWebBrouser:=TWebBrowser.Create(self);
 AccessTokenWebBrouser.Parent:=PanelWebBrowser;
 AccessTokenWebBrouser.Align:=TAlignLayout.Client;
 AccessTokenWebBrouser.OnDidFinishLoad:=OnDidFinishLoadATWebBrowser;
 AccessTokenWebBrouser.OnDidFailLoadWithError:=OnDidFinishLoadATWebBrowser;

// TabControl1.SetActiveTabWithTransition(Authorization, TTabTransition.Slide,  TTabTransitionDirection.Normal);



strURL:=OAuth2Authenticator1.AuthorizationEndpoint;
strURL:=strURL+'?'+'response_type='+'token';
strURL:=strURL+'&'+'client_id='+OAuth2Authenticator1.ClientID;
strURL:=strURL+'&'+'redirect_url='+TIdURI.URLEncode(OAuth2Authenticator1.RedirectionEndpoint);
//strURL:=strURL+'&'+'device_id='+DeviceSerial;
//strURL:=strURL+'&'+'device_name='+DeviceBrand;
LogWrite(Ok, strURL);
//strURL:=strURL+'&'+'login_hint='+TIdURI.URLEncode('RopaSis@yandex.ru');
AccessTokenWebBrouser.URL:=strURL;
Application.ProcessMessages;
end;

procedure TForm11.ButtonNewPatientClick(Sender: TObject);
begin
 NewOrEditPatient:=true;
 TabControl1.SetActiveTabWithTransition(NewPatient, TTabTransition.Slide,  TTabTransitionDirection.Normal);
end;

procedure TForm11.ButtonSettingsClick(Sender: TObject);
begin
 TabControl1.SetActiveTabWithTransition(Settings, TTabTransition.Slide,  TTabTransitionDirection.Normal);
end;

procedure TForm11.BeforEditPatient;
begin
 EditFirstName.Text:=DataModule1.FDQueryPatients.FieldByName('FirstName').AsString;
 EditMiddleName.Text:=DataModule1.FDQueryPatients.FieldByName('MiddleName').AsString;
 EditLastName.Text:=DataModule1.FDQueryPatients.FieldByName('LastName').AsString;
 Switch1.IsChecked:=DataModule1.FDQueryPatients.FieldByName('Gender').AsBoolean;
 DateEditBirthdayDate.Date:=DataModule1.FDQueryPatients.FieldByName('BirthdayDate').AsDateTime;
 EditPhone1.Text:=DataModule1.FDQueryPatients.FieldByName('Phone1').AsString;
 EditPhone2.Text:=DataModule1.FDQueryPatients.FieldByName('Phone2').AsString;
 EditEmail.Text:=DataModule1.FDQueryPatients.FieldByName('Email').AsString;
end;

procedure TForm11.ButtonEventsListClick(Sender: TObject);
begin
 TabControl1.SetActiveTabWithTransition(EventsList, TTabTransition.Slide,  TTabTransitionDirection.Normal);
end;

procedure TForm11.ButtonExitClick(Sender: TObject);
begin
 Application.Terminate;
end;

function TForm11.CheckNewOrEditPatient(): boolean;
begin
 Result:=false;
 try
    begin
     if (Trim(EditLastName.Text)='') or (Trim(EditFirstName.Text)='') or (Trim(EditMiddleName.Text)='') or (Trim(EditPhone1.Text)='')
     then
      begin
       ShowMessage('Не все пола заполнены');
       Exit;
      end;

      begin
       DataModule1.FDQueryPatients.Edit;
       if NewOrEditPatient then DataModule1.FDQueryPatients.Insert;
       DataModule1.FDQueryPatients.FieldByName('FirstName').AsString:=EditFirstName.Text;
       DataModule1.FDQueryPatients.FieldByName('MiddleName').AsString:=EditMiddleName.Text;
       DataModule1.FDQueryPatients.FieldByName('LastName').AsString:=EditLastName.Text;
       DataModule1.FDQueryPatients.FieldByName('FullName').AsString:=EditLastName.Text+' '+EditFirstName.Text+' '+EditMiddleName.Text;
       DataModule1.FDQueryPatients.FieldByName('Gender').AsBoolean:=Switch1.IsChecked;
       DataModule1.FDQueryPatients.FieldByName('BirthdayDate').AsDateTime:=DateEditBirthdayDate.Date;
       DataModule1.FDQueryPatients.FieldByName('Phone1').AsString:=EditPhone1.Text;
       DataModule1.FDQueryPatients.FieldByName('Phone2').AsString:=EditPhone2.Text;
       DataModule1.FDQueryPatients.FieldByName('Email').AsString:=EditEmail.Text;
      end;
    end;
  DataModule1.FDQueryPatients.Post;
  Result:=true;

 except on e:Exception do
  ShowMessage(e.Message);
 end;

 EditFirstName.Text:='';
 EditMiddleName.Text:='';
 EditLastName.Text:='';
 DateEditBirthdayDate.Date:= Now;
 EditPhone1.Text:='';
 EditPhone2.Text:='';
 EditEmail.Text:='';

 DataModule1.FDQueryPatients.Active:=false;
 ListView1.Items.Clear;
 DataModule1.FDQueryPatients.Active:=true;
end;

procedure TForm11.CornerButton1Click(Sender: TObject);
begin
 REST_YandexDisk(MetaInfoPriorityFiles,PriorityFile,'');
end;

procedure TForm11.CornerButton2Click(Sender: TObject);
begin
 TabControl1.SetActiveTabWithTransition(PatientsList, TTabTransition.Slide,  TTabTransitionDirection.Normal);
end;

procedure TForm11.CornerButton3Click(Sender: TObject);
begin
 //REST_YandexDisk(SaveFileToYD,PriorityFile,DeviceSerial+'.txt');
 REST_YandexDisk(SaveFileToYD,PriorityFile,'RopaSisIni.rsi');
end;

procedure TForm11.CornerButton4Click(Sender: TObject);
begin
GetAccessToken;
end;

procedure TForm11.CornerButton5Click(Sender: TObject);
begin
     LogWrite(Ok,'AccessToken= '+OAuth2Authenticator1.AccessToken);
     LogWrite(Ok,'RefreshToken= '+OAuth2Authenticator1.RefreshToken);
     LogWrite(Ok,'AccessTokenExpiry= '+DateTimeToStr(OAuth2Authenticator1.AccessTokenExpiry));
     LogWrite(Ok,'-------------------');
end;

procedure TForm11.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 DataModule1.FDConnection1.Connected:=false;
end;

procedure TForm11.FormCreate(Sender: TObject);
var
 str:string;
 MemoTemp: TMemo;
 fileStream: TFileStream;
begin
 PanelZeroImages.Visible:=false;
 NewOrEditPatient:=true;
 TabControl1.ActiveTab:=AccessTokenTab;

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
   TabControlChange;

  //accesstoken

    IniFilePath:=TPath.GetDocumentsPath+PathDelim+'RopaSisIni.rsi';
 if not (FileExists(IniFilePath)) then
  begin
   ShowMessage(IniFilePath+' файл RopaSisIni отсутствует !');
   IniFilePath:=TPath.GetDocumentsPath+PathDelim+'RopaSisIni.rsi';
   MemoTemp:=TMemo.Create(Self);
   MemoTemp.Lines.Add('AccessToken=, expires_in=');
   MemoTemp.Lines.SaveToFile(IniFilePath);
   MemoTemp.Free;
   LogWrite(Ok,('create file '+IniFilePath));
  end
 else
  begin
    IniList:=TStringList.Create;
    AssignFile(IniFile,IniFilePath);
    Reset(IniFile);
    Readln(IniFile,str);
    IniList.CommaText := str;
    CloseFile(IniFile);

    AccessToken := IniList.Values['AccessToken'];
    OAuth2Authenticator1.AccessToken:=AccessToken;

     LogWrite(Ok, 'RopaSisIni.rsi');
     LogWrite(Ok,AccessToken);
     LogWrite(Ok,IniList.Values['expires_in']);
     LogWrite(Ok,IntToStr(DaysBetween(Date, StrToDate(IniList.Values['expires_in'])))+' days');

    if (DaysBetween(Date, StrToDate(IniList.Values['expires_in'])))<=30 then
     GetAccessToken;

    if OAuth2Authenticator1.AccessToken='' then
     GetAccessToken
    else
     Label32.Text:=AccessToken;

    IniList.Free;
  end;

  IniFilePath:=TPath.GetDocumentsPath+PathDelim+DeviceSerial+'.txt';
 if not (FileExists(IniFilePath)) then
  begin
   MemoTemp:=TMemo.Create(Self);
   MemoTemp.Lines.Add(DateTimeToStr(Now));
   MemoTemp.Lines.SaveToFile(IniFilePath);
   MemoTemp.Free;
   LogWrite(Ok,'create file DeviceSerial.txt');
  end
 else
  begin
   LogWrite(Ok,'finded file DeviceSerial.txt');
  end;



end;

procedure TForm11.FormResize(Sender: TObject);
begin
if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, IInterface(ScreenService)) then
  begin
    sScreenSize := ScreenService.GetScreenSize.Round;
    sScale := ScreenService.GetScreenScale;
    LogWrite(Ok,('diScreenLogic :'+ intToStr( sScreenSize.x) + ' x ' + intToStr( sScreenSize.y)));
    LogWrite(Ok,('diScreenPhis :'+ floatToStr(sScreenSize.x * sScale) + ' x ' + floatToStr(sScreenSize.y * sScale)));
    LogWrite(Ok,('diScreenWidth :'+ intToStr(sScreenSize.x)));
    LogWrite(Ok,('diScreenHeight :'+ intToStr(sScreenSize.y)));
    LogWrite(Ok,('diScale :'+ FloatToStr( sScale)));
  end;

  case TOSVersion.Platform of
    pfWindows: begin
      OSPlatform := 'Windows';
      Layout24.Align:= TAlignLayout.Left;
      Layout24.Align:= TAlignLayout.Center;
      Layout24.Width:=sScreenSize.X div 4;

      Layout27.Align:= TAlignLayout.Left;
      Layout27.Align:= TAlignLayout.Center;
      Layout27.Width:=sScreenSize.X div 4;
    end;

    pfAndroid: begin
      OSPlatform := 'Android';
      Layout24.Align:= TAlignLayout.Client;
      Layout24.Width:=sScreenSize.X;

      Layout27.Align:= TAlignLayout.Client;
      Layout27.Width:=sScreenSize.X;
    end;
    else
     begin
      OSPlatform := 'UNKNOWN';
      Layout24.Align:= TAlignLayout.Center;
      Layout24.Width:=sScreenSize.X div 4;

      Layout27.Align:= TAlignLayout.Center;
      Layout27.Width:=sScreenSize.X div 4;
     end;
  end;
end;

procedure TForm11.DownButtonBackClick(Sender: TObject);
begin
  case TabControl1.ActiveTab.Index of
   0:begin //Authorization
      TabControl1.SetActiveTabWithTransition(Authorization, TTabTransition.Slide,  TTabTransitionDirection.Reversed);
   end;
   1:begin //Home
      TabControl1.SetActiveTabWithTransition(Home, TTabTransition.Slide,  TTabTransitionDirection.Reversed);
   end;
   2:begin //NewPatient
      TabControl1.SetActiveTabWithTransition(PatientsList, TTabTransition.Slide,  TTabTransitionDirection.Reversed);
   end;
   3:begin //PatientsList
      TabControl1.SetActiveTabWithTransition(Home, TTabTransition.Slide,  TTabTransitionDirection.Reversed);
   end;
   4:begin //PatientCard
      TabControl1.SetActiveTabWithTransition(PatientsList, TTabTransition.Slide,  TTabTransitionDirection.Reversed);
   end;
   5:begin //Settings
      TabControl1.SetActiveTabWithTransition(Home, TTabTransition.Slide,  TTabTransitionDirection.Reversed);
   end;
   6:begin //NewEvent
      TabControl1.SetActiveTabWithTransition(PatientCard, TTabTransition.Slide,  TTabTransitionDirection.Reversed);
   end;
   7:begin //EventsList
      TabControl1.SetActiveTabWithTransition(Home, TTabTransition.Slide,  TTabTransitionDirection.Reversed);
   end;
   8:begin //EditPatient
      TabControl1.SetActiveTabWithTransition(Home, TTabTransition.Slide,  TTabTransitionDirection.Reversed);
   end;
  end;
end;

procedure TForm11.DownButtonBackResize(Sender: TObject);
begin
 Self.Width:=Self.Height;
end;

procedure TForm11.DownButtonSaveNewPatientClick(Sender: TObject);
begin
 if CheckNewOrEditPatient then
  DownButtonBackClick(sender);
end;

procedure TForm11.DownPanelOkClick(Sender: TObject);
begin
 if (TabControl1.ActiveTab=PatientsList) and( ListView1.ItemIndex>=0)then
  begin
   TabControl1.SetActiveTabWithTransition(PatientCard, TTabTransition.Slide,  TTabTransitionDirection.Normal);
  end
end;

procedure TForm11.ImagePageResize(Sender: TObject);
begin
 ImagePage.Width:=ImagePage.Height;
end;

procedure TForm11.Image10Click(Sender: TObject);
var
 MemoTemp: TMemo;
begin
 IniFilePath:=TPath.GetDocumentsPath+PathDelim+'RopaSisIni.rsi';
   MemoTemp:=TMemo.Create(Self);
   MemoTemp.Lines.Add('AccessToken=AQAAAABWtd7JAAdShFVue4geV0RHpyr4NJ8BoBE, expires_in=20.01.2020');
   MemoTemp.Lines.SaveToFile(IniFilePath);
   MemoTemp.Free;
   LogWrite(Ok,('create file '+IniFilePath));

end;

procedure TForm11.Image8Click(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TForm11.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  DataModule1.FDQueryPatients.Locate('FullName',AItem.Text,[loPartialKey]);

  DataModule1.FDQueryEvents.Active:=false;
  ListView2.Items.Clear;
  DataModule1.FDQueryEvents.Active:=true;
  DownPanelOk.Enabled:=true;
end;

procedure TForm11.LogWrite(LogType: TTypeLog; str: string);
begin
 case LogType of
   Ok: MemoLog.Lines.Add('Ok - '+str);
   Error: MemoLog.Lines.Add('Error - '+str);
 end;
end;

procedure TForm11.Panel7Click(Sender: TObject);
begin
 NewOrEditPatient:=false;
 BeforEditPatient;

 TabControl1.SetActiveTabWithTransition(NewPatient, TTabTransition.Slide,  TTabTransitionDirection.Normal);

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

procedure TForm11.TabControl1Change(Sender: TObject);
begin
TabControlChange;
end;

procedure TForm11.TabControlChange;
begin
 case TabControl1.ActiveTab.Index of
  0: begin
   LabelToolBar.Text:='Authorization';
   ImagePage.MultiResBitmap.Bitmaps[1].Assign(ImageZeroAuthorization.MultiResBitmap.Bitmaps[1]);
   DownPanelBack.Enabled:=false;
   DownPanelEdit.Enabled:=false;
   DownPanelCreate.Enabled:=false;
   DownPanelSave.Enabled:=false;
   DownPanelOk.Enabled:=false;
  end;
  1: begin
   LabelToolBar.Text:='Начальная страница';
   ImagePage.MultiResBitmap.Bitmaps[1].Assign(ImageZeroHome.MultiResBitmap.Bitmaps[1]);
   DownPanelBack.Enabled:=false;
   DownPanelEdit.Enabled:=false;
   DownPanelCreate.Enabled:=false;
   DownPanelSave.Enabled:=false;
   DownPanelOk.Enabled:=false;
  end;
  2: begin
   LabelToolBar.Text:='Добавления пациента';
   ImagePage.MultiResBitmap.Bitmaps[1].Assign(ImageZeroNewPatient.MultiResBitmap.Bitmaps[1]);
   DownPanelBack.Enabled:=true;
   DownPanelEdit.Enabled:=false;
   DownPanelCreate.Enabled:=false;
   DownPanelSave.Enabled:=true;
   DownPanelOk.Enabled:=false;
  end;
  3: begin
   LabelToolBar.Text:='Список пациентов';
   ImagePage.MultiResBitmap.Bitmaps[1].Assign(ImageZeroPatientsList.MultiResBitmap.Bitmaps[1]);
   DownPanelBack.Enabled:=true;
   DownPanelEdit.Enabled:=false;
   DownPanelCreate.Enabled:=false;
   DownPanelSave.Enabled:=false;
   DownPanelOk.Enabled:=false;
  end;
  4: begin
   LabelToolBar.Text:='Карточка пациента';
   ImagePage.MultiResBitmap.Bitmaps[1].Assign(ImageZeroPatientCard.MultiResBitmap.Bitmaps[1]);
   DownPanelBack.Enabled:=true;
   DownPanelEdit.Enabled:=true;
   DownPanelCreate.Enabled:=true;
   DownPanelSave.Enabled:=false;
   DownPanelOk.Enabled:=false;
  end;
  5: begin
   LabelToolBar.Text:='Настройки';
   ImagePage.MultiResBitmap.Bitmaps[1].Assign(ImageZeroSettings.MultiResBitmap.Bitmaps[1]);
   DownPanelBack.Enabled:=true;
   DownPanelEdit.Enabled:=false;
   DownPanelCreate.Enabled:=false;
   DownPanelSave.Enabled:=false;
   DownPanelOk.Enabled:=false;
  end;
  6: begin
   LabelToolBar.Text:='Создать напоминание';
   ImagePage.MultiResBitmap.Bitmaps[1].Assign(ImageZeroNewEvent.MultiResBitmap.Bitmaps[1]);
   DownPanelBack.Enabled:=true;
   DownPanelEdit.Enabled:=false;
   DownPanelCreate.Enabled:=false;
   DownPanelSave.Enabled:=true;
   DownPanelOk.Enabled:=false;
  end;
  7: begin
   LabelToolBar.Text:='Список напоминаний';
   ImagePage.MultiResBitmap.Bitmaps[1].Assign(ImageZeriEventsList.MultiResBitmap.Bitmaps[1]);
   DownPanelBack.Enabled:=true;
   DownPanelEdit.Enabled:=true;
   DownPanelCreate.Enabled:=true;
   DownPanelSave.Enabled:=false;
   DownPanelOk.Enabled:=false;
  end;
 end;
end;





procedure TForm11.RESTAfterExecute1;
var
 JSONArray: TJSONArray;
 JSONObject: TJSONObject;
  i,total: Integer;
begin

   case RESTRequest1.Response.StatusCode of
    200: begin
          //все нормально, для отладки выведем полученный JSON
          LogGrayMemo.Lines.Add('Запрос выполнен удачно: '+IntToStr(RESTRequest1.Response.StatusCode));
          LogGrayMemo.Lines.Add(RESTRequest1.Response.Content);
           try
             case TypeRequestYD of
               DeleteFileFromYD: ;
               SaveFileToYD: ;
               MetaInfoPriorityFiles: begin

                               JSONObject:=TJSONObject(RESTRequest1.Response.JSONValue).GetValue('_embedded') as TJSONObject;
                               total:=StrToInt(JSONObject.GetValue('total').Value);
                               LogGrayMemo.Lines.Add('total='+IntToStr(total));
                               //получаем список файлов



                               if total>0 then
                                begin
                                  JSONArray:=JSONObject.GetValue('items') as TJSONArray;
                                  ResponceStatus:=TJSONObject(JSONArray.Items[0]).Values['name'].Value;
                                  for i := 0 to total-1 do
                                   begin
                                    LogGrayMemo.Lines.Add('name: '+TJSONObject(JSONArray.Items[i]).Values['name'].Value);
                                    LogGrayMemo.Lines.Add('created: '+TJSONObject(JSONArray.Items[i]).Values['created'].Value);
                                   end;
                                end
                               else
                                begin
                                 LogGrayMemo.Lines.Add('папка пустая, файлов нет');
                                 ResponceStatus:='FolderEmpty';
                                end;
                              end;
              MetaInfoUpdateFile: ;
              LoadFileFromYD: LogGrayMemo.Lines.Add('200 - файл успешно скачан');
             end;
           except on E: Exception do
            ShowMessage('ERROR: RESTAfterExecute1( -'+e.Message);
           end;

         end;
    201: LogGrayMemo.Lines.Add('201 - файл успешно загружен');
    202: begin
          case TypeRequestYD of
           DeleteFileFromYD: LogGrayMemo.Lines.Add('202 - удаление начато, требуется отслеживание');

           SaveFileToYD: LogGrayMemo.Lines.Add('202 - файл загружен на сервер, но пока не передан в папку назначения');
          end;
         end;
    204: LogGrayMemo.Lines.Add('204 - файл успешно удален');
    400: LogGrayMemo.Lines.Add('400 - Некорректные данные');
    403: LogGrayMemo.Lines.Add('403 - Доступ запрещён. Возможно, у приложения недостаточно прав для данного действия');

    404: begin
          LogGrayMemo.Lines.Add('404 - Не удалось найти запрошенный ресурс');
          ResponceStatus:='FileEmpty';
         end;
    406: LogGrayMemo.Lines.Add('406 - Ресурс не может быть представлен в запрошенном формате');
    409: LogGrayMemo.Lines.Add('409 - Указанного пути "{path}" не существует');
    412: LogGrayMemo.Lines.Add('412 - при дозагрузке файла был передан неверный диапазон в заголовке Content-Range');
    413: LogGrayMemo.Lines.Add('413 - размер файла превышает 10Гб');
    500: LogGrayMemo.Lines.Add('500 - внутренняя ошибка сервера, попробуйте позже');
    503: LogGrayMemo.Lines.Add('503 - сервис недоступен, попробуйте позже');
    507: LogGrayMemo.Lines.Add('507 - исчерпано место на Диске');

    else begin
          LogGrayMemo.Lines.Add(IntToStr(RESTRequest1.Response.StatusCode)+' - другая  ошибка');
         end;
   end;

end;

function TForm11.REST_YandexDisk(FTypeRequestYD: TTypeRequestYD;
  FTypeFileYD: TTypeFileYD; FFileName: string): Boolean;
var
 Tasks: TArray<iTask>;
 I: Integer;
 Link: string;
 http: THTTPClient;
 FileStream:TFileStream;
 begin
  LogGrayMemo.Lines.Add('REST_YandexDisk');

  TypeFileYD:=FTypeFileYD;
  TypeRequestYD:=FTypeRequestYD;

  LogRect.Visible:=true;
  LogRect.Align:=TAlignLayout.Client;
  LogRect.BringToFront;
  LogGrayMemo.Lines.Clear;
  Result:=false;
  AniIndicator1.BringToFront;
  AniIndicator1.Visible:=true;

  Application.ProcessMessages;


  OAuth2Authenticator1.TokenType:=TOAuth2TokenType.ttNONE;

   //подготавливаем параметры
  RESTClient1.BaseURL:=BaseURL;

  RESTRequest1.Params.Clear;
  RESTRequest1.Params.Add;
  //в первую очередь дополнительный заголовок в запрос
  //с токеном, иначе будет 401 UNAUTHORIZED
  RESTRequest1.Params[0].Kind:=TRESTRequestParameterKind.pkHTTPHEADER;
  RESTRequest1.Params[0].name:='Authorization';
  RESTRequest1.Params[0].Options:=[poDoNotEncode];
  RESTRequest1.Params[0].Value:='OAuth ' + OAuth2Authenticator1.AccessToken;

  LogGrayMemo.Lines.Add('подготавливаем параметры BaseURL '+BaseURL);

    //далее - путь загрузки
  RESTRequest1.Params.Add;
  RESTRequest1.Params[1].name:='path';

  case TypeFileYD of
   DataBaseFile: RESTRequest1.Params[1].Value:='app:/'+FFileName;//Value:='app:/DataBase/'+FFileName;
   PriorityFile: RESTRequest1.Params[1].Value:='app:/'+FFileName;//Value:='app:/Priority/'+FFileName;
   UpdateFile:   RESTRequest1.Params[1].Value:='app:/'+FFileName; //Value:='app:/Update/'+FFileName;   //на конкретный файл надо
  end;

  LogGrayMemo.Lines.Add('путь загрузки');
 // устанавливаем параметры запроса
  case TypeRequestYD of
   DeleteFileFromYD: begin
                      //Признак безвозвратного удаления
                      RESTRequest1.Params.Add;
                      RESTRequest1.Params[2].name:='permanently';
                      RESTRequest1.Params[2].Value:='true';
                     end;
   SaveFileToYD: begin
                  RESTRequest1.Params.Add;
                  RESTRequest1.Params[2].name:='overwrite';
                  RESTRequest1.Params[2].Value:='true';
                 end;
   MetaInfoPriorityFiles: begin
                           //установить сортировку
                           RESTRequest1.Params.Add;
                           RESTRequest1.Params[2].name:='sort';
                           RESTRequest1.Params[2].Value:='created';
                          end;
   MetaInfoUpdateFile: ;
   LoadFileFromYD: ;
  end;

  LogGrayMemo.Lines.Add('устанавливаем параметры запроса');

 // устанавливаем метод запроса
  case TypeRequestYD of
   DeleteFileFromYD: begin
                      RESTRequest1.Resource:='/disk/resources';
                      RESTRequest1.Method:=rmDELETE;
                     end;
   SaveFileToYD: begin
                  RESTRequest1.Resource:='/disk/resources/upload';
                  RESTRequest1.Method:=rmGet;
                 end;
   MetaInfoPriorityFiles: begin
                           RESTRequest1.Resource:='/disk/resources';
                           RESTRequest1.Method:=rmGET;
                          end;
   MetaInfoUpdateFile: ;
   LoadFileFromYD: begin
                    RESTRequest1.Resource:='/disk/resources/download';
                    RESTRequest1.Method:=rmGet;
                   end;
  end;

  LogGrayMemo.Lines.Add('устанавливаем метод запроса');

  //Создаём задачу.

  FlagRESTAfterExecute:=false;

  SetLength(Tasks, 2);
   Tasks[0] := TTask.Create(procedure ()
                            begin
                              try
                                RESTRequest1.Execute; //выполняем запрос
                              except on E: Exception do
                                ShowMessage('ERROR: RESTRequest1.Execute -'+e.Message);
                              end;
                            end);

   LogGrayMemo.Lines.Add('Отправка запроса на ЯндексДиск');

   LogGrayMemo.Lines.Add('befor Запускаем задачу');

   //Запускаем задачу.
   Tasks[0].Start;
   //Ждем завершение потока
   TTask.WaitForAny(Tasks[0]);

   Application.ProcessMessages;

   LogGrayMemo.Lines.Add('Application.ProcessMessages');

  case TypeRequestYD of
   DeleteFileFromYD: RESTAfterExecute1;
   SaveFileToYD: begin
                  if RESTRequest1.Response.StatusCode=200 then
                   begin
                    //все нормально, для отладки выведем полученный JSON
                    LogGrayMemo.Lines.Add('AfterExecute SaveFileToYD:');
                    LogGrayMemo.Lines.Add(RESTRequest1.Response.Content);

                    //выделяем ссылку на загрузку
                    Link:=TJSONObject(RESTRequest1.Response.JSONValue).GetValue('href').Value;
                    LogGrayMemo.lines.add(Link);   //запоминаем базовый путь

                    //   ссылку на загрузку
                    RESTClient1.BaseURL:=Link;
                    //очищаем параметры, токен при это не нужен       RESTRequest1.Params.Clear;
                    RESTRequest1.Resource:='';
                    //добавляем файл в запрос
                    RESTRequest1.AddFile(TPath.GetDocumentsPath+PathDelim+FFileName);
                    //метод - PUT
                    RESTRequest1.Method:=rmPUT;
                    //ну и отправляем файл на сервер

                    Application.ProcessMessages;
                    tasks[1] := TTask.Create(procedure ()
                                         begin
                                          RESTRequest1.Execute; //выполняем запрос
                                         end);
                    //Запускаем задачу.
                    tasks[1].Start;
                    TTask.WaitForAny(Tasks[1]);
                    LogGrayMemo.Lines.Add('Загрузка выполнена');
                   end
                  else
                   begin
                    LogGrayMemo.Lines.Add('запрос ссылки - ошибка '+RESTRequest1.Response.StatusCode.ToString);
                   end;
                 end;
   MetaInfoPriorityFiles: RESTAfterExecute1;
   MetaInfoUpdateFile: ;
   LoadFileFromYD: begin
                    if RESTRequest1.Response.StatusCode=200 then
                     begin
                      //все нормально, для отладки выведем полученный JSON
                      LogGrayMemo.Lines.Add('AfterExecute LoadFileFromYD:');
                      LogGrayMemo.Lines.Add(RESTRequest1.Response.Content);

                      //выделяем ссылку на скачивания
                      Link:=TJSONObject(RESTRequest1.Response.JSONValue).GetValue('href').Value;
                      LogGrayMemo.lines.add(Link);





                      //прописываем ссылку на загрузку
                      RESTClient1.BaseURL:=Link;
                      //очищаем параметры, токен при это не нужен       RESTRequest1.Params.Clear;
                      RESTRequest1.Resource:='';
                      //добавляем файл в запрос

                     // RESTRequest1.AddFile(TPath.GetDocumentsPath+PathDelim);
                      //RESTRequest1.Resource:='/disk/resources/download';
                      //метод - GET
                      RESTRequest1.Method:=rmGET;      //ну и скачивание файл на сервер


                      Application.ProcessMessages;
                      Tasks[1] := TTask.Create(procedure ()
                      begin
begin
  //Создим класс для закачки
  http:=THTTPClient.Create;
  //каталог, куда файл положить
  //Поток для сохранения
  FileStream:=TFileStream.Create(TPath.GetDownloadsPath+PathDelim+FFileName, fmCreate);
  try
    //Качаем
    http.Get(Link,FileStream);
  finally
    //Нас учили чистить за собой
    http.Free;
    FileStream.Free;
  end;
end;



                     end);
                    //  Запускаем задачу.
                      Tasks[1].Start;
                      TTask.WaitForAny(Tasks[1]);

                      LogGrayMemo.Lines.Add('LoadFileFromYD: загружен');
                     end
                    else
                     begin
                      LogGrayMemo.Lines.Add('запрос ссылки - ошибка '+RESTRequest1.Response.StatusCode.ToString);
                     end;
                   end;
  end;


   SetLength(Tasks, 0);
   Application.ProcessMessages;

   //LogGrayMemo.Lines.Add('Результат - '+ResponceStatus);
   Result:=FlagRESTStatus;


   RESTAfterExecute1;



   AniIndicator1.Visible:=false;
   LogRect.Visible:=false;
   Application.ProcessMessages;
end;


end.
