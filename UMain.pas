unit UMain;  //eenehqtyldhemucx

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.TabControl, FMX.Layouts, FMX.MultiresBitmap,
  FMX.Platform, IdURI, System.StrUtils, System.IOUtils,// IdHTTP,
  IdSMTP, IdAttachment, IdMessage, IdMessageParts, IdEMailAddress,
  IdAttachmentFile, IdMessageBuilder, System.Threading,
  System.Net.URLClient, System.Net.HttpClient,
  System.Net.HttpClientComponent, System.JSON,
  REST.Json,DateUtils,REST.Types, TypInfo,
  EncdDecd, IdSASL,
  IdOAuth2Bearer, IdSSLOpenSSL,
  IdContext, EmailUnit, MySettings, //IdSSLOpenSSLHeaders, IdSSLOpenSSLHeaders_Static,

  IdSASLXOAuth, UDM,


  //Androidapi.JNI.GraphicsContentViewText,
  //Androidapi.JNI.JavaTypes,
  //FMX.Helpers.Android,
  //Androidapi.JNI.Net,

  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.WebBrowser,
  IPPeerClient, Data.Bind.Components, Data.Bind.ObjectScope, REST.Client,
  REST.Authenticator.OAuth, FMX.Ani, System.Notification, FMX.ListBox,
   System.ImageList, FMX.ImgList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.FMXUI.Wait,
  FMX.Effects, FMX.Edit, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack,
  IdBaseComponent, IdComponent,  IdMessageClient, IdSMTPBase,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.DBScope, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdServerIOHandler, IdSSL, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.DateTimeCtrls, FMX.EditBox, FMX.NumberBox, FMX.ComboEdit;

type
 TTypeFileYD = (DataBaseFile, PriorityFile, UpdateFile, Empty);
 TTypeRequestYD =(DeleteFileFromYD,SaveFileToYD,MetaInfoPriorityFiles,MetaInfoUpdateFile,LoadFileFromYD,GetUserInfo);



 TCard = class
    private
      Email : string;
      PhoneNumber: string;
      EmailLastSendDate  : TDateTime;
      PhoneNumberLastSendDate  : TDateTime;
    public
      // Коструктрор
      constructor Create(FEmail : string; FPhoneNumber: string);
 end;

 TMyFindingThread = class(TThread)
  private
    FName: string;
    FEmail: string;
    FPhone: string;
    procedure Progress;
    procedure PrintLog(str: string);
    procedure FindProg;
    procedure DOC_Files;
//    procedure EndThreads;
  public
    procedure Execute; override;
  end;

 TSaveInDBaseThread = class(TThread)
  private
    FTotal: integer;
    FCountEmails: integer;
    FCountPhones: integer;
    procedure Progress;
    procedure SaveInDBase;
  public
    procedure Execute; override;
  end;



type
  TForm11 = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    Layout1: TLayout;
    TabControl1: TTabControl;
    Intro: TTabItem;
    LayoutDownEdit: TLayout;
    DownButtonBack: TImage;
    Label14: TLabel;
    Image7: TImage;
    Label15: TLabel;
    Image11: TImage;
    Label16: TLabel;
    Image13: TImage;
    Label21: TLabel;
    Image14: TImage;
    Label22: TLabel;
    LogPage: TTabItem;
    Layout2: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    MemoLog: TMemo;
    LayoutWebBrowser: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    Layout7: TLayout;
    CornerButton1: TCornerButton;
    OAuth2Authenticator1: TOAuth2Authenticator;
    Authorization: TTabItem;
    LabelUserEmail: TLabel;
    Home: TTabItem;
    Layout8: TLayout;
    ErrorTab: TTabItem;
    Label2: TLabel;
    Layout9: TLayout;
    FloatAnimation2: TFloatAnimation;
    Layout10: TLayout;
    LabelAuth: TLabel;
    LayoutMainHomeSplitterCenter: TLayout;
    LayoutMainHomeSplitterL: TLayout;
    LayoutMainHomeSplitterR: TLayout;
    GridLayout1: TGridLayout;
    Layout11: TLayout;
    Layout12: TLayout;
    GridLayout2: TGridLayout;
    Layout13: TLayout;
    GridLayout3: TGridLayout;
    Layout14: TLayout;
    Image5: TImage;
    Image3: TImage;
    CornerButton2: TCornerButton;
    Image2: TImage;
    Image1: TImage;
    CornerButton3: TCornerButton;
    CornerButton4: TCornerButton;
    Image6: TImage;
    CornerButton5: TCornerButton;
    Image8: TImage;
    CornerButton6: TCornerButton;
    CornerButton7: TCornerButton;
    CornerButton8: TCornerButton;
    CornerButton9: TCornerButton;
    Image15: TImage;
    Label1: TLabel;
    Image10: TImage;
    ScanFiles: TTabItem;
    Layout16: TLayout;
    LayoutScanCenter: TLayout;
    CornerButton13: TCornerButton;
    Image16: TImage;
    Label6: TLabel;
    LayoutScanR: TLayout;
    LayoutScanL: TLayout;
    Panel2: TPanel;
    OpenDialog1: TOpenDialog;
    LabelFindFiles: TLabel;
    Panel3: TPanel;
    CornerButton16: TCornerButton;
    Image19: TImage;
    Label9: TLabel;
    PanelProgressBars: TPanel;
    ProgressBarTotal: TProgressBar;
    ProgressBarFile: TProgressBar;
    LabelProgressFile: TLabel;
    LabelProgressTotal: TLabel;
    MemoEmailFromFiles: TMemo;
    CornerButton14: TCornerButton;
    Popup1: TPopup;
    LayoutPopUp: TLayout;
    ListBox1: TListBox;
    Panel1: TPanel;
    InetOn: TImage;
    InetOff: TImage;
    Label7: TLabel;
    Label8: TLabel;
    Settings: TTabItem;
    SendEmails: TTabItem;
    Layout17: TLayout;
    Layout22: TLayout;
    LayoutSendEmailsR: TLayout;
    LayoutSendEmailsL: TLayout;
    Panel4: TPanel;
    Panel5: TPanel;
    ButtonChooseToSendSingleEmail: TCornerButton;
    Image18: TImage;
    Label11: TLabel;
    ButtonChooseToSendMultyEmails: TCornerButton;
    Image17: TImage;
    Label10: TLabel;
    DownPanelBack: TCornerButton;
    DownPanelOk: TCornerButton;
    DownPanelEdit: TCornerButton;
    DownPanelCreate: TCornerButton;
    DownPanelSave: TCornerButton;
    Layout18: TLayout;
    Layout19: TLayout;
    Layout20: TLayout;
    Edit1: TEdit;
    Label12: TLabel;
    Layout21: TLayout;
    CornerButton15: TCornerButton;
    Image20: TImage;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    ButtonSendingEmails: TCornerButton;
    Image21: TImage;
    Label13: TLabel;
    Panel11: TPanel;
    Label18: TLabel;
    TextOfLetter: TTabItem;
    LayoutSendEmailsLetter: TLayout;
    NameSender: TEdit;
    Label19: TLabel;
    SubjectMail: TEdit;
    Panel12: TPanel;
    Label20: TLabel;
    ProgressBar1: TProgressBar;
    Layout24: TLayout;
    Layout25: TLayout;
    Panel6: TPanel;
    Panel16: TPanel;
    Layout30: TLayout;
    Label27: TLabel;
    Label29: TLabel;
    TextLetter: TMemo;
    Layout31: TLayout;
    Layout32: TLayout;
    Panel7: TPanel;
    Panel13: TPanel;
    Label23: TLabel;
    Panel14: TPanel;
    ImageCreateLatter: TImage;
    ImageDefault: TImage;
    OpenDialog2: TOpenDialog;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    TabItem2: TTabItem;
    CornerButton18: TCornerButton;
    CornerButton19: TCornerButton;
    AccessTokenWebBrouser: TWebBrowser;
    XOAUTH2: TTabItem;
    Panel15: TPanel;
    Image22: TImage;
    ImageLetter: TImage;
    LayoutSendEmailsNavigation: TLayout;
    ImageLeft: TImage;
    ImageRight: TImage;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    Label25: TLabel;
    Rectangle1: TRectangle;
    StyleBook1: TStyleBook;
    Timer1: TTimer;
    LabelSendEmailTextLetter: TMemo;
    IdSMTP1: TIdSMTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    TimerSendEmail: TTimer;
    MemoSendingEmails: TMemo;
    LayoutSendingEmails: TLayout;
    ScrollBox1: TScrollBox;
    Label4: TLabel;
    SendSMS: TTabItem;
    Panel17: TPanel;
    Panel19: TPanel;
    Layout15: TLayout;
    Panel20: TPanel;
    LabelPlus3: TLabel;
    LayoutSMSNumerEdit: TLayout;
    CornerButton10: TCornerButton;
    Image4: TImage;
    EditNum1_6: TEdit;
    Layout27: TLayout;
    Panel21: TPanel;
    ButtonSendSMSByNumber: TCornerButton;
    Image9: TImage;
    Label26: TLabel;
    ButtonSendSMSByDBase: TCornerButton;
    Image12: TImage;
    Label28: TLabel;
    Panel22: TPanel;
    CornerButton20: TCornerButton;
    Image23: TImage;
    Label30: TLabel;
    Panel23: TPanel;
    Layout28: TLayout;
    Rectangle2: TRectangle;
    Label33: TLabel;
    Memo1: TMemo;
    Layout29: TLayout;
    Image25: TImage;
    Image26: TImage;
    Layout33: TLayout;
    LayoutSendSMS: TLayout;
    LabelPlus1: TLabel;
    LabelPlus2: TLabel;
    LabelMinus2: TLabel;
    LabelMinus1: TLabel;
    LabelMinus3: TLabel;
    PopupSMS: TPopup;
    LayoutPopUpSMS: TLayout;
    ListBox2: TListBox;
    LayoutSMSMostTop: TLayout;
    LayoutSMSMostBottom: TLayout;
    Layout23: TLayout;
    Label5: TLabel;
    Image24: TImage;
    Image27: TImage;
    Layout26: TLayout;
    ListView1: TListView;
    CornerButton11: TCornerButton;
    BindSourceDB2: TBindSourceDB;
    LinkFillControlToFieldEMail: TLinkFillControlToField;
    CornerButton12: TCornerButton;
    LayoutAnotherAccount: TLayout;
    LayoutFiveEditButtons: TGridLayout;
    Layout34: TLayout;
    Layout35: TLayout;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Layout36: TLayout;
    ImageLetterDiag: TImage;
    ImageLetterWork: TImage;
    LabelWork: TLabel;
    LabelDiag: TLabel;
    LayoutSettings: TLayout;
    Panel18: TPanel;
    Panel24: TPanel;
    Panel27: TPanel;
    Label17: TLabel;
    Layout37: TLayout;
    Label24: TLabel;
    SettingsEmailCountEmailsSendInDay: TNumberBox;
    Layout38: TLayout;
    Label31: TLabel;
    SettingsEmailMinDaysToSend: TNumberBox;
    Label32: TLabel;
    Panel25: TPanel;
    Label34: TLabel;
    Layout39: TLayout;
    Label35: TLabel;
    NumberBox3: TNumberBox;
    Layout40: TLayout;
    Label36: TLabel;
    NumberBox4: TNumberBox;
    Label37: TLabel;
    Layout41: TLayout;
    Label38: TLabel;
    NumberBox1: TNumberBox;
    Label39: TLabel;
    DateEdit1: TDateEdit;
    Panel26: TPanel;
    Layout42: TLayout;
    ComboBox2: TComboBox;
    EditPass: TEdit;
    Layout43: TLayout;
    LabelEmail: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    SpeedButton1: TSpeedButton;
    ImageList1: TImageList;
    SpeedButton2: TSpeedButton;
    LinkFillControlToField1: TLinkFillControlToField;
    Panel28: TPanel;
    Memo2: TMemo;
    EditLogin: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure CornerButton1Click(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure CornerButton13Click(Sender: TObject);
    procedure CornerButton16Click(Sender: TObject);
    procedure CornerButton14Click(Sender: TObject);
    procedure CornerButton4Click(Sender: TObject);
    procedure ButtonSendSMSByNumberClick(Sender: TObject);
    procedure ButtonChooseToSendSingleEmailClick(Sender: TObject);
    procedure ButtonChooseToSendMultyEmailsClick(Sender: TObject);
    procedure Image20Click(Sender: TObject);
    procedure ButtonSendingEmailsClick(Sender: TObject);
    procedure InetOffClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Memo1Click(Sender: TObject);
    procedure Label27Click(Sender: TObject);
    procedure DownPanelBackClick(Sender: TObject);
    procedure ImageRightClick(Sender: TObject);
    procedure ImageLeftClick(Sender: TObject);
    procedure NameSenderChange(Sender: TObject);
    procedure TextLetterChange(Sender: TObject);
    procedure SubjectMailChange(Sender: TObject);
    procedure TimerSendEmailTimer(Sender: TObject);
    procedure CornerButton19Click(Sender: TObject);
    procedure CornerButton6Click(Sender: TObject);
    procedure CornerButton7Click(Sender: TObject);
    procedure ButtonSendSMSByDBaseClick(Sender: TObject);
    procedure ListBox2ItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure EditNum1_6Click(Sender: TObject);
    procedure EditNum1_6Change(Sender: TObject);
    procedure EditNum1_6Enter(Sender: TObject);
    procedure EditNum1_6Exit(Sender: TObject);
    procedure EditNum1_6Typing(Sender: TObject);
    procedure CornerButton20Click(Sender: TObject);
    procedure Memo1ChangeTracking(Sender: TObject);
    procedure Memo1Exit(Sender: TObject);
    procedure CornerButton11Click(Sender: TObject);
    procedure CornerButton12Click(Sender: TObject);
    procedure CornerButton5Click(Sender: TObject);
    procedure CornerButton8Click(Sender: TObject);
    procedure SettingsEmailCountEmailsSendInDayChange(Sender: TObject);
    procedure SettingsEmailMinDaysToSendChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }

    function  FindPhoneInBase(FPhone: string): boolean;
    procedure SaveInDataBase;
    function  ConnectBase(FCurrentDB:TCurrentDB): boolean;
    function  SaveAccessTokenFile:boolean;
    function  LoadAccessTokenFile :boolean;
    procedure CheckAccessToken;
    procedure CheckDirectoryAndBase;
    procedure GetAccessToken(FAccountName: string);
    procedure OnDidFinishLoadATWebBrowser(ASender:TObject);
    procedure ScanFolderTextFiles(Folder:string);

    //function CheckInternet:boolean;
    procedure MakeCallTo(PhoneNumber:string);
    function ConnectToSMTP_YD:boolean;

    function REST_YandexDisk(FTypeRequestYD: TTypeRequestYD;
               FTypeFileYD: TTypeFileYD; FFileName: string): Boolean;
    procedure RESTAfterExecute1;
    procedure LoadImageLetter;

    procedure SaveImageToLetterDB;
    procedure RefreshLetter;
    procedure RepeatSend;
    procedure StartMultySendEmails;
    procedure StopMultySendEmails;
    procedure multiText;
    procedure unvisibleNumbers;
    procedure visibleNumbers;
    procedure CheckDataBase;
    function ConnectToAccount():boolean;
    function DisConnectToAccount():boolean;
    function LoadSettingsFile:boolean;
    function SaveSettingsFile:boolean;
    procedure ReStartTimer;
    procedure StopTimer;

  end;

  {
  // ID Приложения / Client ID 04e10d6c56b942728f22ea1ab5c69b1d
  // Секрет / Client Secret  79a25dfe79ed4935a2c623e670323cdf
  // https://oauth.mail.ru/login

  GET https://oauth.mail.ru/login
    ?client_id=XXXX
    &response_type=code
    &scope=userinfo
    &redirect_uri=http://domain.net
    &state=some_state

   }

var
  Form11: TForm11;
  ScreenService: IFMXScreenService;
  ScreenSize,sScreenSize: TPoint;
  sScale,scale: Single;
  msg: TIdMessage;

  chosenDirectory:string;
  countFiles: integer;
  ScanFilesList: TList;
  FindingThread:TMyFindingThread;
  SaveInDBaseThread : TSaveInDBaseThread;
  
  ValueProgressScanFile: integer;

  CurrentDB: TCurrentDB;
  LastActivPage: TTabItem;
  ChooseToMultySendEmails: boolean;
  SendImageFullPath: string;
  FlagImageAddToLetter: boolean;
  FlagEditOrCreateEmailLetter: boolean; //edit-false create-true
  



  TypeFileYD:TTypeFileYD;
  TypeRequestYD:TTypeRequestYD;
  FlagRESTAfterExecute: boolean;
  ResponceStatus: string;
  FlagRESTStatus: Boolean;
  NewOldAccount: string;

  EndDateReportingPeriod: TDate;


  Count1plusNSMS: integer;
  PhoneNumber: string;
  //SMTP    : TIdSMTP;

  CountClickTemp: integer;
  FlagConnectToAccount: boolean;
  FlagChangeSettings: boolean;
  //-- решаем проблему отправки писем, если у компьютера руссоке имя
  //  lSMTP.HeloName := 'tfo';

implementation

{$R *.fmx}

function TForm11.SaveSettingsFile:boolean;
var
 IniFile: TextFile;
 IniList: TStringList;
 str: string;
begin
 result:=true;

 //FileSettings:=PathToAppDirectory+SettingsFileName;
 FSettingsEmail.EmailCountEmailsSendInDay:=strtoint(SettingsEmailCountEmailsSendInDay.Text);
 FSettingsEmail.EmailMinDaysToSend:=strtoint(SettingsEmailMinDaysToSend.Text);


   SLog(Ok,' start save file: '+FileSettings);
    AssignFile(IniFile,FileSettings);
    Rewrite(IniFile);

    str:='';
    str:='CountEmailsSendInDay='+ inttostr(FSettingsEmail.EmailCountEmailsSendInDay);
    str:=str+', '+'MinDaysToSend='+ inttostr(FSettingsEmail.EmailMinDaysToSend);
    str:=str+', '+'CurrentAccount='+ inttostr(FSettingsEmail.EmailCurrentAccount);

    Writeln(IniFile,str);
    CloseFile(IniFile);
   SLog(Ok,' finish save file: '+FileSettings);

 FlagChangeSettings:=false;
end;

function TForm11.LoadSettingsFile:boolean;
var
 IniFile: TextFile;
 IniList: TStringList;
 str: string;
 AccountID: integer;
begin
 result:=true;

 if not FileExists(FileSettings) then
  begin
   SLog(Ok,' start create file: '+FileSettings);
    AssignFile(IniFile,FileSettings);
     Rewrite(IniFile);
     str:='';
     str:='CountEmailsSendInDay='+SettingsEmailCountEmailsSendInDay.Text;
     str:=str+', '+'MinDaysToSend='+SettingsEmailMinDaysToSend.Text;
     str:=str+', '+'CurrentAccount='+'0';
     Writeln(IniFile,str);
     CloseFile(IniFile);
   SLog(Ok,' finish create file: '+FileSettings);
  end;

  begin

  //  pg.office.tomsk@mail.ru  xzGFw59YKJFSi1e2BAXL

   SLog(Ok,' start load file: '+FileSettings);
    IniList:=TStringList.Create;
    AssignFile(IniFile,FileSettings);
    Reset(IniFile);
    Readln(IniFile,str);
    IniList.CommaText := str;
    FSettingsEmail.EmailCountEmailsSendInDay:=strtoint(IniList.Values['CountEmailsSendInDay']);
    SettingsEmailCountEmailsSendInDay.Value:=FSettingsEmail.EmailCountEmailsSendInDay;

    FSettingsEmail.EmailMinDaysToSend:=strtoint(IniList.Values['MinDaysToSend']);
    SettingsEmailMinDaysToSend.Value:=FSettingsEmail.EmailMinDaysToSend;

    FSettingsEmail.EmailCurrentAccount:=strtoint(IniList.Values['CurrentAccount']);
    if ConnectBase(Account) then
     begin
      if FSettingsEmail.EmailCurrentAccount>0 then
       begin
        EditLogin.Text:=GetAccountName(FSettingsEmail.EmailCurrentAccount);
        ComboBox2.ItemIndex:=GetAccountDomain(FSettingsEmail.EmailCurrentAccount);
        EditPass.text:=GetAccountPwd(FSettingsEmail.EmailCurrentAccount);
       end;

     end;


    CloseFile(IniFile);
    IniList.Free;
   SLog(Ok,' finish load file: '+FileSettings);
  end;
end;

function TForm11.ConnectToAccount():boolean;
var
 FResultSend: integer;

begin
 result:=false;
 FlagConnectToAccount:=false;

 if Email_SMTP_Connect2(EditLogin.text+FDomainConst[TDomain( GetEnumValue(TypeInfo(TDomain),FDomain))].Domain,EditPass.Text)=Ok then
    begin
     if msg<>nil then
      begin
       msg.free;
      end;

      msg := TIdMessage.Create();

      Email_CreateMessage(msg, CurrentNumLetter, EditLogin.text+FDomainConst[TDomain( GetEnumValue(TypeInfo(TDomain),FDomain))].Domain, EditLogin.text+FDomainConst[TDomain( GetEnumValue(TypeInfo(TDomain),FDomain))].Domain);

      //msg.Recipients.EMailAddresses := EditLogin.text+FDomainConst[TDomain( GetEnumValue(TypeInfo(TDomain),FDomain))].Domain;
      msg.Subject := 'Проверка подключения';
      FResultSend:=Email_SendEmail2(EditLogin.text+FDomainConst[TDomain( GetEnumValue(TypeInfo(TDomain),FDomain))].Domain,EditPass.Text, msg);
     if FResultSend=0 then
       begin
        result:=true;
        SpeedButton2.ImageIndex:=3;
        SpeedButton2.Text:='ПОДКЛЮЧЕНО';
        ButtonSendingEmails.Enabled:=true;
        RestartTimer;
        FlagConnectToAccount:=true;
        if AppendAccount(EditLogin.text+FDomainConst[TDomain( GetEnumValue(TypeInfo(TDomain),FDomain))].Domain,EditLogin.text,EditPass.Text,ComboBox2.ItemIndex) then
         begin
          if MyMessage('Установить данный аккаунт по умолчанию?')=System.UITypes.TMsgDlgBtn.mbYes then
           begin
            if not DM.FDQueryAccountDB.Active then DM.FDQueryAccountDB.Active := true;
            if DM.FDQueryAccountDB.Locate('FullName',EditLogin.text+FDomainConst[TDomain( GetEnumValue(TypeInfo(TDomain),FDomain))].Domain,[]) then
             begin
              FSettingsEmail.EmailCurrentAccount:= DM.FDQueryAccountDB.FieldByName('ID_Account').AsInteger;
              SaveSettingsFile;
             end;
           end;
         end;
       end
     else
      begin
       if (FResultSend=2) or (FResultSend=5) or (FResultSend=8) then
        showMessage('Аккаунт временно заблокирован с подозрением на СПАМ, попробуйте позже')
       else
        begin
         if (FResultSend=11) then
          showMessage('Проверьте правильность ввода логина и пароля'+#13#10+'Возможно Ваш ящик врнеменно заблокирован, попробуйте войти в Вашу почту через браузер'+#13#10+' При необходимости восстановите доступ')
         else
          showMessage('Проверьте правильность ввода логина и пароля');

        end;

       SpeedButton2.ImageIndex:=2;
       SpeedButton2.Text:='подключиться к аккаунту';
       //showMessage('not connect to Account');
       ButtonSendingEmails.Enabled:=false;
      end;
    end
   else
    begin
     SpeedButton2.ImageIndex:=2;
     SpeedButton2.Text:='подключиться';
     showMessage('not connect to Account');
     ButtonSendingEmails.Enabled:=false;
    end
end;

procedure TForm11.StartMultySendEmails;
begin

  EndDateReportingPeriod:=EncodeDate(2021, 12, 24);

 if ( now>EndDateReportingPeriod) then
  begin
   ShowMessage('Тестовый период использования программы окончен.'+#13#10+' Необходимо продлить срок использования программы');
   SLog(Error,DateTimeToStr(Now)+ ' : Период использования программы окончен');
   StopMultySendEmails;
   Exit;
  end;


 if not ConnectBase(Emails) then
  begin
   ShowMessage('Не удалось подключиться к базе');
   SLog(Error,DateTimeToStr(Now)+ ' : не удалось подключиться к базе');
   StopMultySendEmails;
   Exit;
  end;

  SLog(Ok,'начинаем рассылку');

  Label20.Text:='';
  ProgressBar1.value:=0;
  MemoSendingEmails.lines.clear;
  ButtonSendingEmails.Tag:=1;//включаем рассылку
  Label13.Text:= 'Остановить рассылку';
  LayoutSendingEmails.Height:=Panel11.Height;
  TodaySendingEmail:=0;
  SpamCountSend:=0;
  BeforEmail:='';
  TimerSendEmail.Enabled:=true;
end;

procedure TForm11.StopMultySendEmails;
begin
 TimerSendEmail.Enabled:=false;
 ButtonSendingEmails.Tag:=0;//включаем рассылку
 Label13.Text:= 'Запустить Email рассылку';
 LayoutSendingEmails.Height:=0;
 RestartTimer;
end;


procedure TForm11.StopTimer;
begin
 Timer1.Enabled:=false;
end;

procedure TForm11.RepeatSend;
var
 SendResult: integer;
 RRecipientEmail: string;
 sender: tobject;
begin
 CurrentTypeLetter:=TFTypeLetter( DM.FDQueryLettersDB.FieldByName('TypeLetter').AsInteger);
 RRecipientEmail:=Email_GetEmailFromBase(CurrentTypeLetter);
 if RRecipientEmail=BeforEmail then SpamCountSend:=SpamCountSend+1;

// MemoLog.Lines.Add('error   SMTP.Send : '+E.ClassName+' поднята ошибка, с сообщением : '+E.Message);
 SLog(Info,DateTimeToStr(Now)+ '  :  '+'получен Email для отправки: '+RRecipientEmail);



 if ((TodaySendingEmail<FSettingsEmail.EmailCountEmailsSendInDay)and(RRecipientEmail<>'empty')) then
  begin
   SLog(Info,DateTimeToStr(Now)+ '  :  '+'полученный Email подходит для отправки: '+RRecipientEmail);

   if Email_IsValidEmail(RRecipientEmail) then
    begin
     msg.Recipients.EMailAddresses := RRecipientEmail;
     //SendResult:=Email_SendEmail(OAuth2Authenticator1.AccessToken, LabelUserEmail.text, msg)
     SendResult:=Email_SendEmail2(EditLogin.text+FDomainConst[TDomain( GetEnumValue(TypeInfo(TDomain),FDomain))].Domain,EditPass.Text, msg);
    end

   else
    SendResult:=2;

   case SendResult of
    0: begin
         SLog(Info,DateTimeToStr(Now)+ ' отправлено : '+RRecipientEmail);
         MemoSendingEmails.Lines.Add(DateTimeToStr(Now)+ ' отправлено : '+RRecipientEmail);
         MemoSendingEmails.GoToTextEnd;
         //MemoSendingEmails.VScrollBar.Value := MemoSendingEmails.VScrollBar.Max;
         TodaySendingEmail:=TodaySendingEmail+1;
         Label20.Text:=IntToStr(TodaySendingEmail)+'/'+IntToStr(FSettingsEmail.EmailCountEmailsSendInDay);
         ProgressBar1.value:=(TodaySendingEmail/FSettingsEmail.EmailCountEmailsSendInDay)*100;
         DM.FDQueryEmailDB.Active:=true;
         DM.FDQueryEmailDB.Locate('Email',RRecipientEmail,[]);
         DM.FDQueryEmailDB.Edit;
           case CurrentTypeLetter of
            Work: DM.FDQueryEmailDB.FieldByName('LastDateEmailWork').AsDateTime:=Now;
            Diagnost: DM.FDQueryEmailDB.FieldByName('LastDateEmailDiag').AsDateTime:=Now;
            Another: DM.FDQueryEmailDB.FieldByName('LastDateEmailAnother').AsDateTime:=Now;
           end;
         DM.FDQueryEmailDB.FieldByName('StatusEmail').AsString:='Ok';
         DM.FDQueryEmailDB.Post;
         SpamCountSend:=0;
         TimerSendEmail.Interval:=300;
         TimerSendEmail.Enabled:=true;
       end;
    1: begin  //SPAM
        SLog(Info,DateTimeToStr(Now)+ ' Error№1: Spam : '+RRecipientEmail);
        BeforEmail:=RRecipientEmail;
        if SpamCountSend=5 then
         begin
          DM.FDQueryEmailDB.Active:=true;
          DM.FDQueryEmailDB.Locate('Email',RRecipientEmail,[]);
          DM.FDQueryEmailDB.Edit;
           case CurrentTypeLetter of
            Work: DM.FDQueryEmailDB.FieldByName('LastDateEmailWork').AsDateTime:=IncDay(Now,1-FSettingsEmail.EmailMinDaysToSend);
            Diagnost: DM.FDQueryEmailDB.FieldByName('LastDateEmailDiag').AsDateTime:=IncDay(Now,1-FSettingsEmail.EmailMinDaysToSend);
            Another: DM.FDQueryEmailDB.FieldByName('LastDateEmailAnother').AsDateTime:=IncDay(Now,1-FSettingsEmail.EmailMinDaysToSend);
           end;
          DM.FDQueryEmailDB.Post;
          MemoSendingEmails.Lines.Add(DateTimeToStr(Now)+' Error: '+ RRecipientEmail+' - почтовый сервер блокирует отправка, подозрение на спам, попробуем позже');
          SLog(Info,RRecipientEmail+' - отправка невозможна, подозрение на спам, попробуем позже');
         end;
        TimerSendEmail.Interval:=5000*SpamCountSend;
        TimerSendEmail.Enabled:=true;
       end;
    2: begin  //Error
        SLog(Info,DateTimeToStr(Now)+ ' Error: №2 : '+RRecipientEmail);
         DM.FDQueryEmailDB.Active:=true;
         DM.FDQueryEmailDB.Locate('Email',RRecipientEmail,[]);
         DM.FDQueryEmailDB.Edit;
           case CurrentTypeLetter of
            Work: DM.FDQueryEmailDB.FieldByName('LastDateEmailWork').AsDateTime:=Now;
            Diagnost: DM.FDQueryEmailDB.FieldByName('LastDateEmailDiag').AsDateTime:=Now;
            Another: DM.FDQueryEmailDB.FieldByName('LastDateEmailAnother').AsDateTime:=Now;
           end;
         DM.FDQueryEmailDB.FieldByName('StatusEmail').AsString:='Error';
         DM.FDQueryEmailDB.Post;
         MemoSendingEmails.Lines.Add(DateTimeToStr(Now)+' Error: '+ RRecipientEmail+' - что-то не нравится этот email');
         TimerSendEmail.Interval:=300;
         TimerSendEmail.Enabled:=true;
       end;
    3: begin  //Error
        SLog(Info,DateTimeToStr(Now)+ ' Error№3: Account not Connected');
        MemoSendingEmails.Lines.Add(DateTimeToStr(Now)+' Error: Обрыв подключения');
        ShowMessage('Обрыв подключения к аккаунту ');
        StopMultySendEmails;
       end;
    4: begin  //Error
        SLog(Info,DateTimeToStr(Now)+' Error№4: unnown error');
        //Log(Error,DateTimeToStr(Now)+ '  :  '+RRecipientEmail);
        // DM.FDQueryEmailDB.Active:=true;
        // DM.FDQueryEmailDB.Locate('Email',RRecipientEmail,[]);
        // DM.FDQueryEmailDB.Edit;
        // DM.FDQueryEmailDB.FieldByName('LastDateEmail').AsDateTime:=Now;
        // DM.FDQueryEmailDB.FieldByName('StatusEmail').AsString:='Error';
        // DM.FDQueryEmailDB.Post;
         //TimerSendEmail.Interval:=300;
         //TimerSendEmail.Enabled:=true;
        ShowMessage('Непредвиденный сбой... ');
        StopMultySendEmails;
       end;
    5: begin  //Error
        SLog(Info,DateTimeToStr(Now)+ ' Error№5: Message rejected under suspicion of SPAM');
        //ErrorMessage('Сообщение отклонено по подозрению в спаме ');
         DM.FDQueryEmailDB.Active:=true;
         DM.FDQueryEmailDB.Locate('Email',RRecipientEmail,[]);
         DM.FDQueryEmailDB.Edit;
           case CurrentTypeLetter of
            Work: DM.FDQueryEmailDB.FieldByName('LastDateEmailWork').AsDateTime:=IncDay(Now,1-FSettingsEmail.EmailMinDaysToSend);
            Diagnost: DM.FDQueryEmailDB.FieldByName('LastDateEmailDiag').AsDateTime:=IncDay(Now,1-FSettingsEmail.EmailMinDaysToSend);
            Another: DM.FDQueryEmailDB.FieldByName('LastDateEmailAnother').AsDateTime:=IncDay(Now,1-FSettingsEmail.EmailMinDaysToSend);
           end;
         DM.FDQueryEmailDB.Post;
         TimerSendEmail.Interval:=5000;
         TimerSendEmail.Enabled:=true;
       end;
    6: begin  //Error
        SLog(Info,DateTimeToStr(Now)+ ' Error №6: Socket Error');
        ShowMessage('Отсутствует интернет ');
        StopMultySendEmails;
       end;
    7: begin  //Error
        SLog(Info,DateTimeToStr(Now)+ ' Error: №7: '+RRecipientEmail+' данный адрес не существует');
         DM.FDQueryEmailDB.Active:=true;
         DM.FDQueryEmailDB.Locate('Email',RRecipientEmail,[]);
         DM.FDQueryEmailDB.Edit;
           case CurrentTypeLetter of
            Work: DM.FDQueryEmailDB.FieldByName('LastDateEmailWork').AsDateTime:=Now;
            Diagnost: DM.FDQueryEmailDB.FieldByName('LastDateEmailDiag').AsDateTime:=Now;
            Another: DM.FDQueryEmailDB.FieldByName('LastDateEmailAnother').AsDateTime:=Now;
           end;
         DM.FDQueryEmailDB.FieldByName('StatusEmail').AsString:='Error';
         DM.FDQueryEmailDB.Post;
         MemoSendingEmails.Lines.Add(DateTimeToStr(Now)+' Error: '+ RRecipientEmail+' данный адрес не существует');
         TimerSendEmail.Interval:=200;
         TimerSendEmail.Enabled:=true;
       end;
    8: begin  //Error
        SLog(Info,DateTimeToStr(Now)+ ' Error №8: Too many message from ... Try again later');
        ShowMessage('Почтовый сервер приостановил отправку писем с данного аккаунта из-за подозрения на СПАМ. Перезапустите рассылку чере 1 час ');
        StopMultySendEmails;
       end;
    11:begin  //Error
        SLog(Info,DateTimeToStr(Now)+ ' Error №11: authentication failed ... ');
        ShowMessage('Похоже вы не дали разрешение почтовым программам отправлять письма ');

        StopMultySendEmails;
       end;
   end;
  end
 else
 begin

  if(TodaySendingEmail= FSettingsEmail.EmailCountEmailsSendInDay)then
   begin
    SLog(Ok,DateTimeToStr(Now)+ 'отправка пакета завершена, отправлено писем '+IntToStr(TodaySendingEmail)+'шт.');
    ShowMessage('отправка пакета завершена, отправлено писем '+IntToStr(TodaySendingEmail)+'шт.');
    //ShowTrayBalloon(bfInfo,'Information','Отправлено '+IntToStr(TodaySendingEmail)+' сообщений');
    //SetExecTimer;
    //StatusBar1.Panels[1].Text:='';
   end;


  if(RRecipientEmail='empty') then
   begin
    SLog(Ok,DateTimeToStr(Now)+ 'Отправлено писем '+IntToStr(TodaySendingEmail)+'шт., нет подходящих Email');
    ShowMessage('Отправлено писем '+IntToStr(TodaySendingEmail)+'шт., нет подходящих Email');
    //ShowTrayBalloon(bfWarning,'Warning','Отправлено '+IntToStr(TodaySendingEmail)+' сообщений, подходящих Email нет');
    //SetExecTimer;
    //StatusBar1.Panels[1].Text:='';
   end;

  StopMultySendEmails;
 end;

end;







procedure TForm11.SubjectMailChange(Sender: TObject);
begin
 DownPanelSave.Enabled:=true;
end;

function TForm11.DisConnectToAccount: boolean;
var
 FResultSend: integer;

begin
 result:=false;
 FlagConnectToAccount:=false;

 Email_SMTP_Disconnect;

 showMessage('Время ожидания отправки сообщений истекло'+#10#13+'подключитесь заного');

 SpeedButton2.ImageIndex:=2;
 SpeedButton2.Text:='подключиться к аккаунту';
 //showMessage('not connect to Account');
 ButtonSendingEmails.Enabled:=false;

end;

procedure TForm11.DownPanelBackClick(Sender: TObject);
var
 MemStream: TMemoryStream;
begin
  if TabControl1.ActiveTab = ScanFiles then
   begin
    case TComponent(Sender).Tag of
     1:begin //back
        LayoutDownEdit.Visible:=false;
        Application.ProcessMessages;
        TabControl1.SetActiveTabWithTransition(Home, TTabTransition.Slide,  TTabTransitionDirection.Reversed);
       end;
     2:begin //edit
       end;
     3:begin //create
       end;
     4:begin //save
       end;
     5:begin //ok
       end;
    end;
   end;

  if TabControl1.ActiveTab = Settings then
   begin
    case TComponent(Sender).Tag of
     1:begin //back
        if not FlagChangeSettings then
         begin
          LayoutDownEdit.Visible:=false;
          Application.ProcessMessages;
          TabControl1.SetActiveTabWithTransition(Home, TTabTransition.Slide,  TTabTransitionDirection.Reversed);
         end
        else
         begin
          if MyMessage('Сохранить внесенные изменения?')=System.UITypes.TMsgDlgBtn.mbYes then
           begin
            SaveSettingsFile;
            DownPanelSave.Enabled:=false;

            LayoutDownEdit.Visible:=false;
            Application.ProcessMessages;
            TabControl1.SetActiveTabWithTransition(Home, TTabTransition.Slide,  TTabTransitionDirection.Reversed);
           end
          else
           begin
            LayoutDownEdit.Visible:=false;
            Application.ProcessMessages;
            TabControl1.SetActiveTabWithTransition(Home, TTabTransition.Slide,  TTabTransitionDirection.Reversed);
           end;
         end;
       end;
     2:begin //edit
       end;
     3:begin //create
       end;
     4:begin //save
        if FlagChangeSettings then
         begin
          SaveSettingsFile;
          DownPanelSave.Enabled:=false;
         end;
       end;
     5:begin //ok
       end;
    end;
   end;


  if TabControl1.ActiveTab = SendEmails then
   begin
    case TComponent(Sender).Tag of
     1:begin //back
        DM.FDQueryEmailDB.Active:=false;
        LayoutDownEdit.Visible:=false;
        Application.ProcessMessages;
        TabControl1.SetActiveTabWithTransition(Home, TTabTransition.Slide,  TTabTransitionDirection.Reversed);
       end;
     2:begin //edit

        NameSender.Text:=DM.FDQueryLettersDB.FieldByName('From').AsString ;
        SubjectMail.text:=DM.FDQueryLettersDB.FieldByName('Subject').AsString;
        TextLetter.text :=ReplaceStr(DM.FDQueryLettersDB.FieldByName('TextLetter').AsString,'<br>',#13#10);
        ComboBox1.ItemIndex:=DM.FDQueryLettersDB.FieldByName('TypeLetter').AsInteger;
        FlagEditOrCreateEmailLetter:=false;
        ImageCreateLatter.bitmap.Assign(Email_LoadImageFromLetterDB(CurrentNumLetter));
        if ImageCreateLatter.bitmap=nil then
         begin
           SLog(Error,'ImageCreateLatter.bitmap=nil');

          ImageCreateLatter.bitmap.Assign(Image22.Bitmap);
         end;


        TabControl1.SetActiveTabWithTransition(TextOfLetter, TTabTransition.Slide,  TTabTransitionDirection.Normal);
       end;
     3:begin //create
        NameSender.Text:='';
        SubjectMail.text:='';
        TextLetter.text :='';
        FlagEditOrCreateEmailLetter:=true;
        TabControl1.SetActiveTabWithTransition(TextOfLetter, TTabTransition.Slide,  TTabTransitionDirection.Normal);
       end;
     4:begin //save
       end;
     5:begin //ok
       end;
    end;
   end;

  if TabControl1.ActiveTab = TextOfLetter then
   begin
    case TComponent(Sender).Tag of
     1:begin //back
        if not DownPanelSave.Enabled then
         TabControl1.SetActiveTabWithTransition(SendEmails, TTabTransition.Slide,  TTabTransitionDirection.Reversed)
        else
         begin
          if MyMessage('Изменения не сохранены. Выйти без сохранения?')=System.UITypes.TMsgDlgBtn.mbYes then
           begin
            TabControl1.SetActiveTabWithTransition(SendEmails, TTabTransition.Slide,  TTabTransitionDirection.Reversed)
           end;
         end;
       end;
     2:begin //edit
       end;
     3:begin //create
       end;
     4:begin //save
        if (NameSender.Text='') or (SubjectMail.Text='') or (TextLetter.Text='') or (ComboBox1.ItemIndex=-1) then
         begin
          ShowMessage('Заполните все поля письма');
         end
        else
         begin
              //false-edit true-create
              if FlagEditOrCreateEmailLetter then
               DM.FDQueryLettersDB.Append
              else
               DM.FDQueryLettersDB.Edit;

               DM.FDQueryLettersDB.FieldByName('From').AsString := NameSender.Text;
               DM.FDQueryLettersDB.FieldByName('Subject').AsString := SubjectMail.Text;
               DM.FDQueryLettersDB.FieldByName('TextLetter').AsString := Email_CreateMessageText(TextLetter.Lines);
               DM.FDQueryLettersDB.FieldByName('TypeLetter').AsInteger := ComboBox1.ItemIndex;

              if FlagImageAddToLetter then
               begin
                DM.FDQueryLettersDB.FieldByName('WithImage').AsBoolean := true;
                MemStream := TMemoryStream.Create;
                try
                 ImageCreateLatter.Bitmap.SaveToStream(MemStream);
                 MemStream.Seek(0,0);
                 (DM.FDQueryLettersDB.FieldByName('Image') as TBlobField).LoadFromStream(MemStream);//,ftBlob);


                finally
                 MemStream.free;
                end;
               end;

               DM.FDQueryLettersDB.Post;
               showmessage('Письмо создано!');

           FlagImageAddToLetter:=false;
           TabControl1.SetActiveTabWithTransition(SendEmails, TTabTransition.Slide,  TTabTransitionDirection.Reversed);
         end;
       end;
     5:begin //ok

       end;
    end;
   end;
end;


procedure TForm11.EditNum1_6Change(Sender: TObject);
begin
EditNum1_6.SelStart := Length(EditNum1_6.Text);
 if Length(EditNum1_6.Text)<=2 then
  begin
     EditNum1_6.Text:='+7';
     EditNum1_6.SelStart := 2;
  end;
 EditNum1_6.SelLength := 0;
end;

procedure TForm11.EditNum1_6Click(Sender: TObject);
begin
 EditNum1_6.SelStart := Length(EditNum1_6.Text);
 EditNum1_6.SelLength := 0;
end;

procedure TForm11.EditNum1_6Enter(Sender: TObject);
begin
if Length(EditNum1_6.Text)<2 then
 begin
  EditNum1_6.Text:='+7';
  EditNum1_6.SelStart := Length(EditNum1_6.Text);
  EditNum1_6.SelLength := 0;
 end;
end;

procedure TForm11.EditNum1_6Exit(Sender: TObject);
begin
 PhoneNumber:=EditNum1_6.Text;
end;

procedure TForm11.visibleNumbers;
begin
 LabelMinus3.Visible:=false;
 LabelPlus3.Visible:=false;
 LabelMinus2.Visible:=false;
 LabelPlus2.Visible:=false;
 LabelMinus1.Visible:=false;
 LabelPlus1.Visible:=false;

 LabelMinus3.Visible:=true;
 LabelPlus3.Visible:=true;
 LabelMinus2.Visible:=true;
 LabelPlus2.Visible:=true;
 LabelMinus1.Visible:=true;
 LabelPlus1.Visible:=true;

 LabelMinus2.Align:=TAlignLayout.Top;
 LabelPlus2.Align:=TAlignLayout.Bottom;
 LabelMinus1.Align:=TAlignLayout.Top;
 LabelPlus1.Align:=TAlignLayout.Bottom;
 LabelMinus2.Align:=TAlignLayout.Bottom;
 LabelPlus2.Align:=TAlignLayout.Top;
 LabelMinus1.Align:=TAlignLayout.Bottom;
 LabelPlus1.Align:=TAlignLayout.Top;

end;

procedure TForm11.unvisibleNumbers;
var
 s:string;
 i,hp,hm: integer;
 hh: integer;
begin
 visibleNumbers;
 multiText;
 i:=Count1plusNSMS*2;
 if i>0 then s:='+'+IntToStr(i) else s:='';
 hh:=31;
 Label30.Text:='Отправить 1'+s+' SMS';
 hm:=1;hp:=2;
 if Count1plusNSMS<3 then
  begin
   hp:=hp-1;
   LabelMinus3.Visible:=false;
   LabelPlus3.Visible:=false;
  end;

 if Count1plusNSMS<2 then
  begin
   hp:=hp-1;
   LabelMinus2.Visible:=false;
   LabelPlus2.Visible:=false;
  end;

 if Count1plusNSMS<1 then
  begin
   hm:=hm-1;
   LabelMinus1.Visible:=false;
   LabelPlus1.Visible:=false;
  end;

//  LayoutTotal.Height:=31*6+32;

end;


procedure TForm11.multiText;
var
 snum,s: string;
 num: integer;
begin
 if Length(EditNum1_6.Text)<12 then
  begin
    LabelPlus3.Text:='+7**********';
    LabelPlus2.Text:='+7**********';
    LabelPlus1.Text:='+7**********';
    LabelMinus1.Text:='+7**********';
    LabelMinus2.Text:='+7**********';
    LabelMinus3.Text:='+7**********';
  end
 else
      begin
       s:=EditNum1_6.Text;
       snum:=Copy(s,6,7);
       Delete(s,6,7);
       num:=StrToInt(snum);
       LabelPlus3.Text:=s+IntToStr(num+3);
       LabelPlus2.Text:=s+IntToStr(num+2);
       LabelPlus1.Text:=s+IntToStr(num+1);
       LabelMinus1.Text:=s+IntToStr(num-1);
       LabelMinus2.Text:=s+IntToStr(num-2);
       LabelMinus3.Text:=s+IntToStr(num-3);
      end;


end;


procedure TForm11.EditNum1_6Typing(Sender: TObject);
var
 s,snum:string;
 ch: char;
 len,Num: integer;
begin

 s:=EditNum1_6.Text;
 len:=length (EditNum1_6.Text);
 ch:=s[len-1];
 if (len <= 2) then
  begin
    EditNum1_6.Text:='+7';
    EditNum1_6.SelStart :=len;// Length(EditNum1_6.Text);
    EditNum1_6.SelLength := 0;
  end
 else
 begin
  if (len<=12)and (CharInSet(ch,['0'..'9'])) then
    begin
     if (len=12)or(len=11) then
      begin
       multiText;
      end;
    end
   else
   begin
    Delete(s,len,1);
    EditNum1_6.Text:=s;
   end;
 end;
end;

function TForm11.SaveAccessTokenFile:boolean;
var
 IniFile: TextFile;
 str: string;
begin
  begin
   SLog(Ok,' start create file: '+FileAccessToken);
    AssignFile(IniFile,FileAccessToken);
     Rewrite(IniFile);
     str:='';
     str:='AccessToken='+OAuth2Authenticator1.AccessToken;
     str:=str+', '+'expires_in='+DateToStr(OAuth2Authenticator1.AccessTokenExpiry);
     str:=str+', '+'user_email='+MyEmailAccount;
     Writeln(IniFile,str);
     CloseFile(IniFile);
   SLog(Ok,' finish create file: '+FileAccessToken);
  end;
end;

procedure TForm11.ScanFolderTextFiles(Folder: string);
begin
  ProgressBarTotal.Value:=0;
  ProgressBarFile.Value:=0;
  PanelProgressBars.Enabled:=true;

 if CountFiles>0 then
  begin

   FindingThread := TMyFindingThread.create(true);
   FindingThread.FreeOnTerminate := false;
    {$IFDEF ANDROID}
     FindingThread.priority := 5;
    {$ENDIF}

    {$IFDEF MSWINDOWS}
     FindingThread.priority := tpNormal;
    {$ENDIF}

   FindingThread.Start;

   FindingThread.WaitFor;
   FreeAndNil(FindingThread);
  end;

end;

procedure TForm11.SettingsEmailMinDaysToSendChange(Sender: TObject);
begin
 FlagChangeSettings:=true;
 DownPanelSave.Enabled:=true;
end;

procedure TForm11.SettingsEmailCountEmailsSendInDayChange(Sender: TObject);
begin
  FlagChangeSettings:=true;
  DownPanelSave.Enabled:=true;
end;

procedure TForm11.SpeedButton1Click(Sender: TObject);
begin
 if SpeedButton1.ImageIndex = 0 then
  begin
   SpeedButton1.ImageIndex:=1;
   EditPass.Password:=true;
  end
 else
  begin
   SpeedButton1.ImageIndex:=0;
   EditPass.Password:=false;
  end;

end;

procedure TForm11.SpeedButton2Click(Sender: TObject);
begin
 if (EditLogin.text<>'') and (EditPass.Text<>'') and (ComboBox2.ItemIndex<>-1) then
  begin
   FDomain:=GetEnumName(TypeInfo(TDomain),ComboBox2.ItemIndex);

   ConnectToAccount;
  end
 else
  ShowMessage('Введите логин и пароль');
end;


{
procedure TForm11.Switch1Switch(Sender: TObject);
var
  Notification: TNotification;
begin
 if switch1.IsChecked=true then //если switch активен, то...
  begin
   Notification := NotificationCenter1.CreateNotification;//создаем экземпляр класса TNotification
   try //обработчик ошибок
      Notification.Name := 'MyNotification';  // Название
      Notification.AlertBody := 'Уведомление: Hello World!';  // содержание уведомления
      Notification.FireDate := Now + EncodeTime(0, 0, 4, 0);   // Задержка отправки на 4 секунды
      NotificationCenter1.ScheduleNotification(Notification); //отправка уведомления в компонент
      Log(Ok,'Notification Ok');
   finally
    Notification.DisposeOf; //очистка переменной при возникновении ошибки
    Log(Error,'Notification error');
   end;
  end;
 if switch1.IsChecked=false then //код при отключении switch'а
  begin
   NotificationCenter1.CancelNotification('MyNotification');//отключаем центр уведомлений
  end;
end;
}


procedure TForm11.TabControl1Change(Sender: TObject);
begin


// LayoutWebBrowser.Visible:=false;

 if TabControl1.ActiveTab = Intro then
  begin
   LayoutDownEdit.Visible:=false;
  end;

 if TabControl1.ActiveTab = Home then
  begin
   LayoutDownEdit.Visible:=false;
  end;

 if TabControl1.ActiveTab = Authorization then
  begin
   //FloatAnimationWebBrowser.StopValue:=LabelAuth.Height;
   //LayoutWebBrowser.Visible:=true;
   //LayoutDownEdit.Visible:=false;
  end;


 if TabControl1.ActiveTab = SendEmails then
  begin
   LayoutDownEdit.Visible:=true;
   DownPanelBack.Enabled:=true;
   DownPanelEdit.Enabled:=true;
   DownPanelCreate.Enabled:=true;
   DownPanelSave.Enabled:=false;
   DownPanelOk.Enabled:=false;
   LayoutSendEmailsNavigation.width:= LayoutSendEmailsLetter.width-16;
   LabelEmail.Text:='Введите логин пароль почты для рассылки';
   RefreshLetter;
   if not ConnectBase(Account) then
    begin
     ShowMessage('Проблема подключения к базе аккаунтов');
     SLog(Error,'Проблема подключения к базе аккаунтов');
    end;
  end;

 if TabControl1.ActiveTab = ScanFiles then
  begin
   CornerButton16.Enabled:=false;
   LayoutDownEdit.Visible:=true;
   DownPanelBack.Enabled:=true;
   DownPanelEdit.Enabled:=false;
   DownPanelCreate.Enabled:=false;
   DownPanelSave.Enabled:=false;
   DownPanelOk.Enabled:=false;
  end;

 if TabControl1.ActiveTab = Settings then
  begin
   //CornerButton16.Enabled:=false;
   LoadSettingsFile;
   LayoutDownEdit.Visible:=true;
   DownPanelBack.Enabled:=true;
   DownPanelEdit.Enabled:=false;
   DownPanelCreate.Enabled:=false;
   DownPanelSave.Enabled:=false;
   DownPanelOk.Enabled:=false;
   FlagChangeSettings:=false;
  end;

 if TabControl1.ActiveTab = TextOfLetter then
  begin
   LayoutDownEdit.Visible:=true;
   DownPanelBack.Enabled:=true;
   DownPanelEdit.Enabled:=false;
   DownPanelCreate.Enabled:=false;
   DownPanelSave.Enabled:=false;
   DownPanelOk.Enabled:=false;
   Panel7.height:=80+Panel13.height - 90;
  end;
end;

procedure TForm11.TextLetterChange(Sender: TObject);
begin
 DownPanelSave.Enabled:=true;
end;

procedure TForm11.Timer1Timer(Sender: TObject);
begin
 Timer1.Enabled:=false;
 DisConnectToAccount;
end;

procedure TForm11.TimerSendEmailTimer(Sender: TObject);
begin
 TimerSendEmail.Enabled:=false;
 RepeatSend;
end;

procedure TForm11.Label27Click(Sender: TObject);
begin
  if (Sender is TComponent) then
   begin
    case TComponent(Sender).Tag of
     1:begin
        if Panel7.height=80 then Panel7.height:=80+Panel13.height - 90;
     end;
     2:begin
        Panel7.height:=80;
        LoadImageLetter;
     end;
    end;
   end;
end;

procedure TForm11.ListBox2ItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
 PopupSMS.IsOpen:=false;
 Count1plusNSMS:=ListBox2.ItemIndex;
 LayoutSMSMostTop.height:= (3-Count1plusNSMS)*20;
 LayoutSMSMostBottom.height:= (3-Count1plusNSMS)*20;
 unvisibleNumbers;
 SLog(Ok,'CountPlusSMS= '+inttostr(Count1plusNSMS));

    Layout15.Width:=Layout27.Width-68;
   Application.ProcessMessages;
   Label30.Text:='Отправить SMS';
   Application.ProcessMessages;
   ButtonSendSMSByDBase.Enabled:=true;
   Application.ProcessMessages;
   ButtonSendSMSByNumber.Enabled:=false;
   Application.ProcessMessages;
   LayoutSMSNumerEdit.width:= Layout15.Width;
   Application.ProcessMessages;
end;

function TForm11.LoadAccessTokenFile:boolean;
var
 IniFile: TextFile;
 IniList: TStringList;
 str: string;
begin
 result:=true;

 //FileAccessToken:=PathToAccountDirectory+AccessTokenFileName;
 FileAccessToken:=PathToAppDirectory+AccessTokenFileName;

 if not FileExists(FileAccessToken) then
  begin
   SLog(Ok,' start create file: '+FileAccessToken);
    AssignFile(IniFile,FileAccessToken);
     Rewrite(IniFile);
     str:='';
     str:='AccessToken='+OAuth2Authenticator1.AccessToken;
     str:=str+', '+'expires_in='+DateToStr(EncodeDate(2000,01,01));
     str:=str+', '+'user_email='+'';
     Writeln(IniFile,str);
     CloseFile(IniFile);
   SLog(Ok,' finish create file: '+FileAccessToken);
  end;

  begin
   SLog(Ok,' start load file: '+FileAccessToken);
    IniList:=TStringList.Create;
    AssignFile(IniFile,FileAccessToken);
    Reset(IniFile);
    Readln(IniFile,str);
    IniList.CommaText := str;
    OAuth2Authenticator1.AccessToken:=IniList.Values['AccessToken'];
    OAuth2Authenticator1.AccessTokenExpiry:= StrToDate(IniList.Values['expires_in']);
    MyEmailAccount:=IniList.Values['user_email'];
    LabelUserEmail.Text:=MyEmailAccount;
    CloseFile(IniFile);
    IniList.Free;
   SLog(Ok,' finish load file: '+FileAccessToken);
  end;

  SLog(Ok,'load.AccessToken : '+OAuth2Authenticator1.AccessToken);
  SLog(Ok,'load.AccessTokenExpiry : '+DateToStr(OAuth2Authenticator1.AccessTokenExpiry));

end;





procedure TForm11.LoadImageLetter;
const
  RequiredSclae = 1.0;
var
  BitmapItem: TFixedBitmapItem;
  Bitmap: TBitmap;
begin
 OpenDialog2.InitialDir:=TPath.GetDownloadsPath;
 OpenDialog2.Filter:='Файлы картинок *.jpg;*.jpeg;*.png|*.jpg;*.jpeg;*.png';


  if OpenDialog2.Execute then
  begin
    // Запрашиваем картинку для нужного Scale
    Bitmap := ImageCreateLatter.MultiResBitmap.Bitmaps[RequiredSclae];
    // Проверяем, есть картинка или нет.
    if Bitmap = nil then
    begin
      // Если нет, то заводим контейнер для новой картинки
      BitmapItem := ImageCreateLatter.MultiResBitmap.Add;
      BitmapItem.Scale := RequiredSclae;
      Bitmap := BitmapItem.Bitmap;
    end;
    Bitmap.LoadFromFile(OpenDialog2.FileName);
    FlagImageAddToLetter:=true;
     DownPanelSave.Enabled:=true;
  end;

end;

procedure TForm11.CheckAccessToken;
begin
     SLog(Ok,'CheckAccessToken');
     SLog(Ok,OAuth2Authenticator1.AccessToken);
     SLog(Ok,DateToStr(OAuth2Authenticator1.AccessTokenExpiry));

    //if LoadAccessTokenFile then

      SLog(Ok,'minus '+floatToStr(((OAuth2Authenticator1.AccessTokenExpiry-Date))));
      SLog(Ok,'accesstoken- '+OAuth2Authenticator1.AccessToken);

      if (NewOldAccount='old') then
       NewOldAccount:=MyEmailAccount
      else
       NewOldAccount:='example';

      GetAccessToken(NewOldAccount);

      if ((OAuth2Authenticator1.AccessTokenExpiry-Date)<=30) or (OAuth2Authenticator1.AccessToken='') then
       begin
        GetAccessToken(NewOldAccount);
        application.processmessages;
        SLog(Ok,' AccessTokenExpiry-Date)<=30 ');
       end;
//      else
{
       begin
        if MyEmailAccount='' then REST_YandexDisk(GetUserInfo,Empty,'');
        LabelUserEmail.Text:= MyEmailAccount;
        MemoLog.Lines:=FSLog;
        TabControl1.SetActiveTabWithTransition(Home, TTabTransition.None,  TTabTransitionDirection.Normal);
       end;
}



   MemoLog.Lines:=FSLog;

end;

procedure TForm11.CheckDataBase;
begin
 if not FileExists(PathToEmailDirectory+'Emails.db') then
  if FileExists(PathToEmptyDirectory+'Emails_empty.db') then
   begin
    try
     TFile.Copy(PathToEmptyDirectory+'Emails_empty.db', PathToEmailDirectory+'Emails.db');
    except
     //Отлавливаем ошибку EInOutError и ничего не делаем.
     on E : Exception do
      SLog(Error,'email '+E.ClassName+' поднята ошибка, с сообщением : '+E.Message);
    end;
   end;
     DM.FDConnectionEmailDB.Params.Values['Database'] := PathToEmailDirectory+'Emails.db';//'$(DOC)/db.s3db';//assets

 if not FileExists(PathToSmsDirectory+'Phones.db') then
  if FileExists(PathToEmptyDirectory+'Phones_empty.db') then
   begin
    try
     TFile.Copy(PathToEmptyDirectory+'Phones_empty.db', PathToSmsDirectory+'Phones.db');
    except
     //Отлавливаем ошибку EInOutError и ничего не делаем.
     on E : Exception do
      SLog(Error,'sms '+E.ClassName+' поднята ошибка, с сообщением : '+E.Message);
    end;
   end;
     DM.FDConnectionPhoneDB.Params.Values['Database'] := PathToSmsDirectory+'Phones.db';//'$(DOC)/db.s3db';//assets

 if not FileExists(PathToEmailDirectory+'Account.db') then
  if FileExists(PathToEmptyDirectory+'Account_empty.db') then
   begin
    try
     TFile.Copy(PathToEmptyDirectory+'Account_empty.db', PathToEmailDirectory+'Account.db');
    except
     //Отлавливаем ошибку EInOutError и ничего не делаем.
     on E : Exception do
      SLog(Error,'email '+E.ClassName+' поднята ошибка, с сообщением : '+E.Message);
    end;
   end;
     DM.FDConnectionAccountDB.Params.Values['Database'] := PathToEmailDirectory+'Account.db';//'$(DOC)/db.s3db';//assets


end;

procedure TForm11.CheckDirectoryAndBase;
begin
 SAfterAccessAccountPutPath;
 CheckDataBase;
 LoadSettingsFile;

 SLog(Ok,'PathToAppDirectory : '+PathToAppDirectory);
 SLog(Ok,'AccessTokenFile : '+FileAccessToken);
 SLog(Ok,'SettingsFile: '+FileSettings);
 SLog(Ok,'DataBaseFile : '+FileDataBase);
 SLog(Ok,'DataBaseEmptyFile : '+FileDataBaseEmpty);
 SLog(Ok,'PathToEmptyDirectory : '+PathToEmptyDirectory);
 SLog(Ok,'GetDocumentsPath : '+TPath.GetDocumentsPath);


end;

procedure TForm11.GetAccessToken(FAccountName: string);
var
 strURL,strN: string;
 i: integer;
begin
 AccessTokenWebBrouser.visible:=true;
 AccessTokenWebBrouser.URL:='https://yandex.ru';
 AccessTokenWebBrouser.OnDidFinishLoad:=OnDidFinishLoadATWebBrowser;

 strURL:=OAuth2Authenticator1.AuthorizationEndpoint;
 strURL:=strURL+'?'+'response_type='+'token';//'token';
 strURL:=strURL+'&'+'client_id='+OAuth2Authenticator1.ClientID;
 //strURL:=strURL+'&'+'client_secret='+OAuth2Authenticator1.ClientSecret;
 strURL:=strURL+'&'+'redirect_uri='+TIdURI.URLEncode(OAuth2Authenticator1.RedirectionEndpoint);
 //strURL:=strURL+'&'+'device_id='+DeviceSerial;
 //strURL:=strURL+'&'+'device_name='+DeviceBrand;
 strURL:=strURL+'&'+'login_hint='+FAccountName;//TIdURI.URLEncode('RopaSis');
// strURL:=strURL+'&'+'scope='+'https://mail.google.com openid';
 //strURL:=strURL+'&'+'state=some_state';
 //strURL:=strURL+'&'+'display=mobile';
 Slog(Ok,' Open brawser: '+strURL);

  AccessTokenWebBrouser.URL:=strURL;

 //Application.processmessages;
end;

procedure TForm11.OnDidFinishLoadATWebBrowser(ASender:TObject);
var
 StrArr:TStringDynArray;
 i: integer;
 IniFilePath,strIni: string;
 IniFile: TextFile;
begin
  SLog(Ok,'-------------------');
  SLog(Ok,'after redirect to '+AccessTokenWebBrouser.URL);

  if StartsText('https://localhost',AccessTokenWebBrouser.URL) then
   begin
    SLog(Ok,'StartsText  https://localhost - НАЙДЕН');
    //разбиваем строку
    StrArr:=SplitString(AccessTokenWebBrouser.URL,'#?=&');

    i:=1;
    while i<length(StrArr) do
     begin
      SLog(Ok,'StrArr['+IntToStr(i)+']='+StrArr[i]);
      SLog(Ok,'StrArr['+IntToStr(i+1)+']='+StrArr[i+1]);

      if StrArr[i]='access_token' then
       begin
        OAuth2Authenticator1.AccessToken:=StrArr[i+1];
//            strIni:=strIni+', '+'expires_in='+DateToStr(OAuth2Authenticator1.AccessTokenExpiry);
       end;

      if StrArr[i]='refresh_token' then
       begin
        OAuth2Authenticator1.RefreshToken:=StrArr[i+1];
       end;

      if StrArr[i]='expires_in' then
       begin
        OAuth2Authenticator1.AccessTokenExpiry:=now+round(StrToInt(StrArr[i+1])/60/60/24);
       end;

      if StrArr[i]='code' then
       begin
        // и делаем запрос на получение токена
        // код подтверждения во втором элементе
        OAuth2Authenticator1.AuthCode:=StrArr[i+1];
        OAuth2Authenticator1.ChangeAuthCodeToAccesToken;
        OAuth2Authenticator1.ResponseType:=REST.Authenticator.OAuth.TOAuth2ResponseType.rtCODE;
        OAuth2Authenticator1.ChangeAuthCodeToAccesToken;
       end;

      if StrArr[i]='error' then
       begin
        // обрабатываем ошибку
        if StrArr[i+1]='access_denied' then
         ShowMessage('Отказ в предоставлении доступа');
        if StrArr[i+1]='unauthorized_client' then
         ShowMessage('Приложение заблокировано, либо ожидает модерации');

         TabControl1.SetActiveTabWithTransition(ErrorTab, TTabTransition.None,  TTabTransitionDirection.Reversed);
         Exit;
       end;

      i:=i+2;
     end;

     SLog(Ok,'AccessToken= '+OAuth2Authenticator1.AccessToken);
     SLog(Ok,'RefreshToken= '+OAuth2Authenticator1.RefreshToken);
     SLog(Ok,'AccessTokenExpiry= '+DateTimeToStr(OAuth2Authenticator1.AccessTokenExpiry));
     SLog(Ok,'-------------------');

    AccessTokenWebBrouser.URL:='';
    AccessTokenWebBrouser.Stop;
    //AccessTokenWebBrouser.Visible:=false;

     if  (OAuth2Authenticator1.AccessToken<>'') then REST_YandexDisk(GetUserInfo,Empty,'');

     if MyEmailAccount<>'' then
      begin
       LabelUserEmail.Text:= MyEmailAccount;
       SaveAccessTokenFile;
       CheckDirectoryAndBase;
      //Application.ProcessMessages;
       MemoLog.Lines:=FSLog;
       TabControl1.SetActiveTabWithTransition(Home, TTabTransition.None,  TTabTransitionDirection.Normal);
       AccessTokenWebBrouser.visible:=false;
      end;
   end;
end;



procedure TForm11.ButtonSendSMSByDBaseClick(Sender: TObject);
begin
   Layout15.Width:=0;
   Application.ProcessMessages;
   Label30.Text:='Отправить SMS';
   Application.ProcessMessages;
   ButtonSendSMSByDBase.Enabled:=false;
   Application.ProcessMessages;
   ButtonSendSMSByNumber.Enabled:=true;
   Application.ProcessMessages;
end;

procedure TForm11.ButtonSendSMSByNumberClick(Sender: TObject);
begin
 //LayoutPopUpSMS.Parent:=PopupSMS;
 LayoutPopUpSMS.Position.Point:=TPointF.Zero;
 LayoutPopUpSMS.Width:=ButtonSendSMSByNumber.width;
 LayoutPopUpSMS.Height:=80;
 PopupSMS.Width:=LayoutPopUpSMS.Width;
 PopupSMS.Height:=LayoutPopUpSMS.Height;

 PopupSMS.IsOpen:=not PopupSMS.IsOpen;

end;

procedure TForm11.CornerButton11Click(Sender: TObject);
begin
  DM.FDQueryEmailDB.Active:=true;
end;

procedure TForm11.CornerButton12Click(Sender: TObject);
begin
 NewOldAccount:='new';
 MyEmailAccount:='';
 OAuth2Authenticator1.AccessToken:='';
 LayoutDownEdit.Visible:=false;
 Application.processmessages;
 TabControl1.SetActiveTabWithTransition(Authorization, TTabTransition.None,  TTabTransitionDirection.Normal);
 CheckAccessToken;
end;

procedure TForm11.CornerButton13Click(Sender: TObject);
begin
  CornerButton16.Enabled:=false;
  MemoEmailFromFiles.Lines.Clear;
 //OpenDialog.Filter:='Текстовые файлы *.txt;*.doc;*.rtf|*.txt;*.doc;*.rtf';


  if SelectDirectory('Выберите папку с файлами резюме', '',chosenDirectory ) then
   begin
    countFiles:=0;
    countFiles:=countFiles+Length(TDirectory.GetFiles(chosenDirectory, '*.doc'));
    countFiles:=countFiles+Length(TDirectory.GetFiles(chosenDirectory, '*.rtf'));
    countFiles:=countFiles+Length(TDirectory.GetFiles(chosenDirectory, '*.txt'));
    LabelFindFiles.Text:='Найдено '+IntToStr(countFiles)+' файлов';

    if countFiles>0 then CornerButton16.Enabled:=true;
   end
  else
   ShowMessage('not insert folder with text files');

end;

procedure TForm11.CornerButton14Click(Sender: TObject);
begin
Popup1.IsOpen:=not Popup1.IsOpen;
//CheckInternet;
end;

procedure TForm11.ButtonChooseToSendMultyEmailsClick(Sender: TObject);
begin
   Layout19.Width:=0;
   Application.ProcessMessages;
   ChooseToMultySendEmails:=true;
   Label13.Text:='Запустить Email рассылку';
   Application.ProcessMessages;
   ButtonChooseToSendMultyEmails.Enabled:=false;
   Application.ProcessMessages;
   ButtonChooseToSendSingleEmail.Enabled:=true;
   Application.ProcessMessages;
end;



function TForm11.FindPhoneInBase(FPhone: string): boolean;
begin
       with DM do
        begin
          FDQueryPhoneDB.Active:=true;
          Result:= FDQueryPhoneDB.Locate('Phone',FPhone,[]);
          FDQueryPhoneDB.Active:=false;
        end;

   SLog(Ok,'FindPhoneInBase: '+FPhone+' : '+BoolToStr(Result,true));
end;



procedure TForm11.SaveImageToLetterDB;
var
 MemStream: TMemoryStream;
begin
 //FireDAC.Connected := True;
  MemStream := TMemoryStream.Create;
  try
   try
    Image1.Bitmap.SaveToStream(MemStream);
    MemStream.Seek(0,0);
    DM.FDQueryLettersDB.ParamByName('Media').LoadFromStream(MemStream,ftBlob);
    DM.FDQueryLettersDB.ParamByName('MType').AsString := '0';
    DM.FDQueryLettersDB.ExecSQL();
   except
    on e: Exception do
     begin
     //ShowMessage(e.Message);
     end;
   end;
  finally
   MemStream.Free;
  end;

 //FireDAC.Connected := False;
end;

procedure TForm11.SaveInDataBase;
begin
   SaveInDBaseThread := TSaveInDBaseThread.create(true);
   SaveInDBaseThread.freeonterminate := false;
    {$IFDEF ANDROID}
     SaveInDBaseThread.priority := 5;
    {$ENDIF}

    {$IFDEF MSWINDOWS}
     SaveInDBaseThread.priority := tpNormal;
    {$ENDIF}

   SaveInDBaseThread.Start;

   SaveInDBaseThread.WaitFor;
   FreeAndNil(SaveInDBaseThread);
end;

procedure TForm11.ComboBox2Change(Sender: TObject);
begin
 FDomain:=GetEnumName(TypeInfo(TDomain),ComboBox2.ItemIndex); //GetEnumName(TypeInfo(TDomain),
 LabelEmail.Text:=FDomain;
end;

function TForm11.ConnectBase(FCurrentDB:TCurrentDB): boolean;
var
 FDConnection: TFDConnection;
 str: string;
begin
 Result:=false;


       with DM do
        begin

         case FCurrentDB of
          Emails: begin
                    FDConnectionEmailDB.Connected:=true;
                    result:=FDConnectionEmailDB.Connected;
                    str:='Emails';
                  end;
          Phones: begin
                    FDConnectionPhoneDB.Connected:=true;
                    result:=FDConnectionPhoneDB.Connected;
                    str:='Phones';
                  end;
           Diagnostic: begin
                    //FDConnectionEmailDB.Params.Values['Database'] := PathToAppDirectory+'Emails_empty.db';//'$(DOC)/db.s3db';//assets
                    //FDConnectionDiagnosticDB.Connected:=true;
                    //result:=FDConnectionDiagnosticDB.Connected;
                    //str:='Diagnostic';
                       end;
          Account: begin
                    FDConnectionAccountDB.Connected:=true;
                    result:=FDConnectionAccountDB.Connected;
                    str:='Account';
                  end;
         end;
        end;


   if result then
    begin
     SLog(Ok,  ' Connect with DB: '+str);
     Result:=true;
    end
   else
    begin
     SLog(Error,('Ошибка подключения к базе - '+ str));
     ShowMessage('Ошибка подключения к базе'+ str);
    end;

end;


function TForm11.ConnectToSMTP_YD: boolean;
begin
{
 try
  IdSMTP1.AuthenticationType:=atLogin;
  IdSMTP1.Host:='smtp.rambler.ru';
  IdSMTP1.Port:=25;
  IdSMTP1.Username:='xxxxxxxxx@rambler.ru';
  IdSMTP1.Password:='password';
  IdSMTP1.Connect;
 except
  on e:Exception do
 end;
   }
end;

procedure TForm11.CornerButton16Click(Sender: TObject);
begin
 ScanFilesList:=TList.Create;
 try
  ScanFolderTextFiles(chosenDirectory);


  if ScanFilesList.Count=0 then
   begin
    ShowMessage('Нечего добавлять в базу');
   end
  else
   begin
    if (ConnectBase(Emails) and ConnectBase(Phones)) then
     begin
      ProgressBarFile.Value:=0;
      ProgressBarFile.Max:=ScanFilesList.Count;
      LabelProgressFile.Text:='...';
      ProgressBarTotal.Value:=0;
      ProgressBarTotal.Max:=ScanFilesList.Count;
      LabelProgressTotal.Text:='...';
      SLog(Ok,'Записей в ScanFilesList: '+IntToStr(ScanFilesList.Count));
      ShowMessage('Добавление новых Email адресов в базу... Терпение!!');
      SaveInDataBase;

      ShowMessage('Добавлено: '+IntToStr(PCountEmails)+' емайл адресов, '+IntToStr(PCountPhones)+' номеров телефонов');
      //ErrorMessage('Добавлено новых Email  адресов: '+IntToStr(ProgressBarFile.Position)+'шт.');

     end;
   end;

   ProgressBarFile.Value:=0;
   ProgressBarFile.Max:=ScanFilesList.Count;
   LabelProgressFile.Text:='...';
   ProgressBarTotal.Value:=0;
   ProgressBarTotal.Max:=ScanFilesList.Count;
   LabelProgressTotal.Text:='...';
   ScanFilesList.Clear;
   CornerButton16.Enabled:=false;
   LabelFindFiles.Text:='';
   chosenDirectory:='';
   CountFiles:=0;
   MemoEmailFromFiles.Lines.Clear;

  PanelProgressBars.Enabled:=false;
 finally
  ScanFilesList.Free;
 end;


end;

procedure TForm11.ButtonSendingEmailsClick(Sender: TObject);
begin
  if msg<>nil then
   begin
    msg.free;
   end;

  msg := TIdMessage.Create();

  Email_CreateMessage(msg, CurrentNumLetter, Edit1.text, EditLogin.text+FDomainConst[TDomain( GetEnumValue(TypeInfo(TDomain),FDomain))].Domain);

    SLog(Info,'message create ');

 if ButtonSendingEmails.Tag=0 then
  begin

 DM.FDQueryEmailDB.Active:=true;

 if ChooseToMultySendEmails=false then
  begin
   if Email_IsValidEmail(Edit1.Text) then
    begin
     StopTimer;
     ShowMessage('Отправка письма на один адрес');
     msg.Recipients.EMailAddresses := Edit1.text;
     //Email_SendEmail(OAuth2Authenticator1.AccessToken,LabelUserEmail.text, msg);
     Email_SendEmail2(EditLogin.text+FDomainConst[TDomain( GetEnumValue(TypeInfo(TDomain),FDomain))].Domain,EditPass.Text, msg);
     RestartTimer;
    end
   else
    begin
     ShowMessage('Введите корректный Email адрес');
    end;

  end
 else
  begin
   StopTimer;
   ShowMessage('Запуск рассылки');


   StartMultySendEmails;
  end;
  end
 else // остановить рассылку
  begin
   StopMultySendEmails;
  end;
end;

procedure TForm11.ButtonChooseToSendSingleEmailClick(Sender: TObject);
begin
   Layout19.Width:=Layout18.Width-68;
   Application.ProcessMessages;
   ChooseToMultySendEmails:=false;
   Label13.Text:='Отправить письмо получателю';
   Application.ProcessMessages;
   ButtonChooseToSendMultyEmails.Enabled:=true;
   Application.ProcessMessages;
   ButtonChooseToSendSingleEmail.Enabled:=false;
   Application.ProcessMessages;
end;

procedure TForm11.CornerButton19Click(Sender: TObject);
begin
 // SLog(Ok,'ConnectBase: '+PathToAppDirectory+'Emails_empty.db');
 //SLog(Ok,'ConnectBase: '+'$(DOC)/Emails_empty.db');

 //ConnectBase(Emails);
 //ConnectBase(Phones);

 //DM.FDQueryEmailDB.Active:=true;
 //Memo2.lines.add('count'+inttostr(DM.FDQueryEmailDB.RecordCount));
 //DM.FDQueryEmailDB.Active:=false;
 MemoLog.Lines:=FSLog;
end;

procedure TForm11.CornerButton1Click(Sender: TObject);
begin
 LayoutDownEdit.Visible:=false;
 NewOldAccount:='old';
 Application.processmessages;
 TabControl1.SetActiveTabWithTransition(Authorization, TTabTransition.None,  TTabTransitionDirection.Normal);
 CheckAccessToken;
end;

procedure TForm11.CornerButton20Click(Sender: TObject);
 var
 str:string;
begin
{

 if ExpiredDateFLAG=true then
  begin
   if (Length(EditNum1_6.Text)=12) and (Length(Label8.Text)>0) and (Label8.Text<>'')then
    begin


   try
    SendSMS(EditNum1_6.Text,Trim(Label8.Text));

    if Count1plusNSMS>=1 then
     begin
      SendSMS(LabelPlus1.Text,Label8.Text);
      SendSMS(LabelMinus1.Text,Label8.Text);
     end;

    if Count1plusNSMS>=2 then
     begin
      SendSMS(LabelPlus2.Text,Label8.Text);
      SendSMS(LabelMinus2.Text,Label8.Text);
     end;

    if Count1plusNSMS>=3 then
     begin
      SendSMS(LabelPlus3.Text,Label8.Text);
      SendSMS(LabelMinus3.Text,Label8.Text);
     end;

     if Count1plusNSMS=0 then
      str:='SMS отправлено'
     else
      str:='SMS-ки отправлены';

      ShowMessageEvent(str);
      Image10Click(Sender);
   except
    on E : Exception do
      ShowMessage(E.ClassName+' поднята ошибка, с сообщением : '+E.Message);
   end;
    end
   else
   begin
     ShowMessageEvent('Введите корректно сообщение и номер телефона');
   end;
  end
 else
 begin
  ShowMessageEvent('Пробный период истек, функционал ограничен');
 end;
 }
end;

procedure TForm11.CornerButton4Click(Sender: TObject);
begin
 if not ConnectBase(Emails) then ShowMessage('not connect with EmailsDB');

 inc(CountClickTemp);
 //label3.text:='CornerButton4: '+ inttostr(CountClickTemp);

 TabControl1.SetActiveTabWithTransition(SendEmails, TTabTransition.Slide,  TTabTransitionDirection.Normal);
 LastActivPage:=Home;
end;

procedure TForm11.CornerButton5Click(Sender: TObject);
begin
 TabControl1.SetActiveTabWithTransition(SendSMS, TTabTransition.Slide,  TTabTransitionDirection.Normal);
 LastActivPage:=Home;
end;

procedure TForm11.CornerButton6Click(Sender: TObject);
begin
 TabControl1.SetActiveTabWithTransition(ScanFiles, TTabTransition.Slide,  TTabTransitionDirection.Normal);
 LastActivPage:=Home;
end;

procedure TForm11.CornerButton7Click(Sender: TObject);
begin
 TabControl1.SetActiveTabWithTransition(Settings, TTabTransition.Slide,  TTabTransitionDirection.Normal);
 LastActivPage:=Home;
end;

procedure TForm11.CornerButton8Click(Sender: TObject);
begin
TabControl1.SetActiveTabWithTransition(Settings, TTabTransition.Slide,  TTabTransitionDirection.Normal);
 LastActivPage:=Home;
end;

procedure TForm11.FormCreate(Sender: TObject);
var
FDConnection: TFDConnection;
begin
InetOffClick(Sender);
Layout15.Width:=0;
visibleNumbers;
// {$IFDEF ANDROID}
//  FDConnection1.Params.Values['Database'] := '$(DOC)/db.s3db';//assets
// {$ENDIF}

FlagConnectToAccount:=false;
CountClickTemp:=0;
LayoutDownEdit.Visible:=false;
//IdOpenSSLSetLibPath(TPath.GetPublicPath);
 //IdOpenSSLSetLibPath('/system/lib/');




  AccessTokenWebBrouser.visible:=false;

  case TOSVersion.Platform of
    pfWindows: OSDevice:=Windows;
    pfAndroid: OSDevice:=Android;
    else begin
       ShowMessage('Программа не работает в операционной системе данного устройства');
       exit;
    end;
  end;


 LastActivPage:=Home;

 LayoutSendingEmails.Height:=0;

 LayoutPopUp.Parent:=Popup1;
 LayoutPopUp.Position.Point:=TPointF.Zero;
 Popup1.Width:=LayoutPopUp.Width;
 Popup1.Height:=LayoutPopUp.Height;




 Layout19.Width:=0;
 ButtonChooseToSendMultyEmailsClick(sender);
 ChooseToMultySendEmails:=true;

 TabControl1.ActiveTab:=Intro;
 Form11.StyleBook:= DM.StyleBook1;




 sLog(Ok,'TDirectory.GetCurrentDirectory : '+TDirectory.GetCurrentDirectory);
 sLog(Ok,'TPath.GetHomePath : '+TPath.GetHomePath+AccessTokenFileName);
 sLog(Ok,'TPath.GetDocumentsPath : '+TPath.GetDocumentsPath+AccessTokenFileName);
 sLog(Ok,'TPath.GetLibraryPath : '+TPath.GetLibraryPath+AccessTokenFileName);
 sLog(Ok,'TPath.GetPublicPath : '+TPath.GetPublicPath+AccessTokenFileName);
 sLog(Ok,'TPath.GetCachePath : '+TPath.GetCachePath+AccessTokenFileName);

{
ExtractFilePath(Application.ExeName);

SysUtils ExtractFileDir Иизвлекает из полного имени файла название папки
SysUtils ExtractFileDrive Извлекает из полного имени файла название диска
SysUtils ExtractFileExt Извлекает из полного имени файла его расширение
SysUtils ExtractFileName Извлекает из полного имени файла краткое имя файла
SysUtils ExtractFilePath Извлекает из полного имени файла название патча
SysUtils FileAge Получение датя/время последнего изменения файла, не открывая его
SysUtils FileDateToDateTime Конвертирует формат даты/времени файла в значение TDateTime
SysUtils FileExists Возвращает True если указанный файл существует
SysUtils FileGetAttr Выдаёт атрибуты файла
 }
 SIntro;

 LoadAccessTokenFile;

 if MyEmailAccount='' then
  begin
   CornerButton12.text:='Продолжить...';
   Layout7.Visible:=false;
  end
 else
  begin
   Layout7.Visible:=true;
   CornerButton1.text:='Продолжить как '+#13#10+MyEmailAccount;
   CornerButton12.text:='Войти под другим аккаунтом'
  end;




 PanelProgressBars.Enabled:=false;



 //ImageCreateLatter.Picture.Assign(ImageDefault.Picture);

end;



procedure TForm11.FormDestroy(Sender: TObject);
begin

   if TFile.Exists(PathToAppDirectory+'temp.jpg') then
    TFile.Delete(PathToAppDirectory+'temp.jpg');

end;

procedure TForm11.FormResize(Sender: TObject);
var
 MarginPanelEditButton: integer;
begin


if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, IInterface(ScreenService)) then
  begin
    sScreenSize := ScreenService.GetScreenSize.Round;
    sScale := ScreenService.GetScreenScale;
    SLog(Ok,('diScreenLogic :'+ intToStr( sScreenSize.x) + ' x ' + intToStr( sScreenSize.y)));
    //Log(Ok,('diScreenPhis :'+ floatToStr(sScreenSize.x * sScale) + ' x ' + floatToStr(sScreenSize.y * sScale)));
   // Log(Ok,('diScreenWidth :'+ intToStr(sScreenSize.x)));
   // Log(Ok,('diScreenHeight :'+ intToStr(sScreenSize.y)));
    SLog(Ok,('diScale :'+ FloatToStr( sScale)));
  end;




  case OSDevice of
    Windows: begin
      //Form11.WindowState:=TWindowState.wsMaximized;
       if Form11.clientWidth>600 then
        LayoutMainHomeSplitterL.Width:=(Form11.clientWidth-500) div 2 //(sScreenSize.X div 3)*1;
       else
        LayoutMainHomeSplitterL.Width:=0; //(sScreenSize.X div 3)*1;

      LayoutMainHomeSplitterR.Width:=LayoutMainHomeSplitterL.Width;


      //Layout24.Margins.Left:= (sScreenSize.X div 8)*3;
      //Layout24.Width:=sScreenSize.X div 4;
      //LayoutPatientCard.Width:=sScreenSize.X div 4;
    end;

    Android: begin
      LayoutMainHomeSplitterL.Width:=0;
      LayoutMainHomeSplitterR.Width:=0;


      //Layout24.Align:= TAlignLayout.Client;
      //Layout24.Width:=sScreenSize.X;
      //LayoutPatientCard.Width:=sScreenSize.X div 4;
    end;
  end;

      GridLayout1.Width:=LayoutMainHomeSplitterCenter.Width;
      GridLayout1.ItemWidth:=GridLayout1.Width /2;
      GridLayout1.ItemHeight:=GridLayout1.ItemWidth /2.4;

      GridLayout2.ItemHeight:=GridLayout1.ItemHeight;
      GridLayout2.ItemWidth:=GridLayout1.ItemWidth/2;

      GridLayout3.ItemHeight:=GridLayout1.ItemHeight;
      GridLayout3.ItemWidth:=GridLayout1.ItemWidth/2;

      GridLayout1.Height:=GridLayout1.ItemHeight * 3 ;


      LayoutScanL.Width:=LayoutMainHomeSplitterR.Width;
      LayoutScanR.Width:=LayoutMainHomeSplitterL.Width;

      LayoutSendEmailsL.Width:=LayoutMainHomeSplitterR.Width;
      LayoutSendEmailsR.Width:=LayoutMainHomeSplitterL.Width;

      Layout31.Width:=LayoutMainHomeSplitterR.Width;
      Layout32.Width:=LayoutMainHomeSplitterL.Width;





      LayoutSendSMS.Margins.Left:=LayoutMainHomeSplitterL.Width;
      LayoutSendSMS.Margins.Right:=LayoutMainHomeSplitterR.Width;

      LayoutSettings.Margins.Left:=LayoutMainHomeSplitterL.Width;
      LayoutSettings.Margins.Right:=LayoutMainHomeSplitterR.Width;
end;



{
function TForm11.CheckInternet: boolean;
var
  HTTP: TIdHTTP;
begin
 result:=true;
  HTTP := TIdHTTP.Create(nil);
  HTTP.HandleRedirects := True;
    try
      HTTP.Get('http://www.ya.ru');
      InetOff.Visible:=false;
      InetOn.Visible:=true;
      Log(Ok,'Internet - on');
    except
      InetOff.Visible:=true;
      InetOn.Visible:=false;
      Log(Ok,'Internet - off');
      result:=false;
    end;
end;
}

procedure TForm11.Image20Click(Sender: TObject);
begin
 EditNum1_6.Text:='';
end;

procedure TForm11.ImageLeftClick(Sender: TObject);
begin
 //if not DM.FDQueryLettersDB.index then
 DM.FDQueryLettersDB.prior;
 RefreshLetter;
end;

procedure TForm11.ImageRightClick(Sender: TObject);
begin
// if not DM.FDQueryLettersDB.EOF then
  begin
   DM.FDQueryLettersDB.next;
   RefreshLetter;
  end;
end;

procedure TForm11.InetOffClick(Sender: TObject);
begin
 if TabControl1.TabPosition = TTabPosition.None then
  TabControl1.TabPosition:=TTabPosition.Top
 else
  TabControl1.TabPosition:=TTabPosition.None;
end;



procedure TForm11.MakeCallTo(PhoneNumber:string);
//var
// Intent: JIntent;
// URI: Jnet_Uri; //переменная содержащая телефон
begin
{
  Intent:=TJIntent.Create; //создаем новое намерение
  Intent.setAction(TJIntent.JavaClass.ACTION_CALL); //назначаем действие на активность(ACTION_CALL-позвонить)
  URI:=TJnet_Uri.JavaClass.parse(StringToJString('tel:'+edit1.text)); //'tel:+123456789'-запиьсь данных в URI
  Intent.setData(URI); //запись данных в переменную Intent
  SharedActivity.startActivity(Intent); //запуск активности
  }
end;

procedure TForm11.Memo1ChangeTracking(Sender: TObject);
var
 iChar,iSMS: integer;
begin
 iChar:=63 - Length(Memo1.Text) mod 63;
 iSMS:= Length(Memo1.Text) div 63;
 Label5.Text:='Ваш текст умещается в '+IntToStr(iSMS+1)+' SMS    '+IntToStr(iChar)+'/'+IntToStr(iSMS);
end;

procedure TForm11.Memo1Click(Sender: TObject);
begin
Memo1.opacity:=1;
end;

procedure TForm11.Memo1Exit(Sender: TObject);
begin
if Memo1.Text='' then
 Memo1.opacity:=1/2
else
 Memo1.opacity:=1;
end;

procedure TForm11.NameSenderChange(Sender: TObject);
begin
 DownPanelSave.Enabled:=true;
end;

{ TMyFindingThread }

procedure TMyFindingThread.DOC_Files;
var
 f: TextFile; // файл
 buf: string; // буфер для чтения из файла
 str, ExeFile: string;
 fCard: TCard;
 StartPos,EndPos,GavPos, ExtFiles: integer;
 s: string;
 flagSymbol,FindLeftPart,FindRightPart: boolean;
begin
 ValueFiles:=0;
 for ExtFiles := 0 to 2 do
  begin
   ExeFile:='';
   case ExtFiles of
    0: begin
         ExeFile:='*.doc';
       end;
    1: begin
         ExeFile:='*.rtf';
       end;
    2: begin
         ExeFile:='*.txt';
       end;
   end;

if ExeFile<>'' then

 for s in TDirectory.GetFiles(chosenDirectory, ExeFile) do
  begin
   FName:=s;
   AssignFile(f, fName);
   try
    Reset(f);
    ValueProgressScanFile:=0;
    FEmail:='';
    FPhone:='';
    Synchronize(progress);
    while not EOF(f) do
     begin
      FEmail:='';
      FPhone:='';

      readln(f, buf);
      if Pos('@',buf)<>0 then
       begin
        GavPos:=Pos('@',buf);
        str:='';
        StartPos:=GavPos-1;
        flagSymbol:=false;//false - допустимый символ
        FindLeftPart:=false;
        while (StartPos>=1) and (FindLeftPart=False) do
         begin
          if (not (buf[StartPos] in ['a'..'z', 'A'..'Z', '0'..'9', '_', '-', '.'])or (StartPos=1)) then
           begin
            if StartPos>1 then StartPos:=StartPos+1 else SLog(Ok,' StsrtPos=1 ');
            if StartPos<GavPos then
             begin
              FindLeftPart:=true;
              str:=Copy(buf,StartPos,GavPos-StartPos+1);
             end
            else
             begin
              StartPos:=0;
             end;
           end;
          StartPos:=StartPos-1;
         end;

        if FindLeftPart=True then
         begin
          EndPos:=GavPos+1;
          FindRightPart:=False;
           while (EndPos<=Length(buf)) and (FindRightPart=False) do
            begin
             if (not (buf[EndPos] in ['a'..'z', 'A'..'Z', '0'..'9', '_', '-', '.'])) or (EndPos=Length(buf) ) then
              begin
               if EndPos<>Length(buf) then EndPos:=EndPos-1;
               if EndPos>GavPos then
                begin
                 FindRightPart:=true;
                 str:=str+Copy(buf,GavPos+1,EndPos-GavPos);
                 str:=Trim(str);
                 if Email_IsValidEmail(str) then
                  begin
                   FEmail:=str;
                   ValueEmail:=ValueEmail+1;
                   SLog(Ok,' IsValidEmail - '+str);
                  end;
                 ValueProgressScanFile:=33;
                // Synchronize(progress);
                end
               else
                begin
                 EndPos:=Length(buf);
                end;
              end;
             EndPos:=EndPos+1;
            end;
         end;
       end;

      if Pos('+7',buf)<>0 then
       begin
        buf:=ReplaceStr(buf, '\uc0\u160', '');
          StartPos:=Pos('+7',buf);
          str:=Copy(buf,StartPos,2);
          EndPos:=StartPos+Length(str);
          FindRightPart:=False;
          while (EndPos<=Length(buf)) and (FindRightPart=False) do
           begin
            if (buf[EndPos] in ['0'..'9']) then
             begin
              str:=str+Copy(buf,EndPos,1);
              if Length(str)=12 then
               begin
                FindRightPart:=true;
                FPhone:=str;
                FPhone:=ReplaceStr(FPhone,'+','');
                //SLog(warning,'DOC-files '+FPhone);
               end;
             end;
            EndPos:=EndPos+1;
           end;
       end;

        if ((FEmail<>'') or (FPhone<>'')) then
         begin
          ScanFilesList.Add(TCard.Create(FEmail,FPhone));
         end;

      Synchronize(Progress);


     end;


      ValueProgressScanFile:=100;
      ValueFiles:=ValueFiles+1;

   finally
     CloseFile(f);
   end;
  end;
 end;

end;



procedure TMyFindingThread.Execute;
begin
 inherited;
 FindProg;
 //Synchronize(EndThreads);
end;

procedure TMyFindingThread.FindProg;
begin
     DOC_Files;
end;

procedure TMyFindingThread.PrintLog(str: string);
begin

end;

procedure TMyFindingThread.Progress;
var
 str: string;
begin
 Form11.ProgressBarTotal.Value:=round(ValueFiles*100/CountFiles);
 Form11.ProgressBarFile.Value:=ValueProgressScanFile;
 str:='';
 if (FEmail<>'') or (FPhone<>'') then
  begin
   str:=FName;
   delete(str,1,length(chosenDirectory)+1);
   str:=str+' : '+FEmail+' : '+FPhone;
   Form11.MemoEmailFromFiles.Lines.Add(str);
   Form11.MemoEmailFromFiles.GoToTextEnd;
  end;
 //Form1.MemoFindingEMail.Lines.Add(TCard(FindingFiles.Last).Email);
 Form11.LabelProgressFile.Text:=FName;
 Form11.LabelProgressTotal.Text:=IntToStr(ValueFiles)+' / '+IntToStr(CountFiles);
 Application.ProcessMessages;

end;

{ TCard }

constructor TCard.Create(FEmail, FPhoneNumber: string);
begin
 Self.Email:=FEmail;
 Self.PhoneNumber:=FPhoneNumber;
 Self.EmailLastSendDate:= EncodeDate(2000, 1, 1);
 Self.PhoneNumberLastSendDate:= EncodeDate(2000, 1, 1);
end;

{ TSaveInDBaseThread }

procedure TSaveInDBaseThread.Execute;
begin
  inherited;
  SaveInDBase;
end;

procedure TSaveInDBaseThread.Progress;
begin
 Form11.ProgressBarFile.Value:=FCountEmails;
 PCountEmails:=FCountEmails;
 PCountPhones:=FCountPhones;
 Form11.LabelProgressFile.Text:='Добавлено новых Email адресов - '+IntToStr(FCountEmails);
 Form11.ProgressBarTotal.Value:=FTotal;
 Form11.LabelProgressTotal.Text:='Обработано Email адресов - '+IntToStr(FTotal)+' / '+IntToStr(Round(Form11.ProgressBarTotal.Max));
 SLog(Ok,inttostr(PCountEmails)+' : '+inttostr(PCountPhones));
// Form11.Log(Ok,'SCard : '+SCard.PhoneNumber);
 SLog(Ok,'TSaveInDBaseThread.Progress');
 Application.ProcessMessages;
end;

procedure TSaveInDBaseThread.SaveInDBase;
 var
  SCard: TCard;
begin
  FCountEmails:=0; FCountPhones:=0;
  FTotal:=0;
  SLog(Ok,'SaveInDBaseThread ScanFilesList.Count : '+inttostr(ScanFilesList.count));

  for SCard in ScanFilesList do
   begin
     SLog(Ok,'SCard 1 : '+SCard.Email);
    if not Email_FindEmailInBase(SCard.Email) then
     begin
      SLog(Ok,'Find SCard 2 : '+SCard.Email);
      Email_AppendEmailToBase(SCard.Email);
      FCountEmails:=FCountEmails+1;
     end;

     SLog(Ok,'SCard 3 : '+SCard.PhoneNumber);
    if not Email_FindPhoneInBase(SCard.PhoneNumber) then
     begin
      SLog(Ok,'Find SCard new phone : '+SCard.PhoneNumber);
      Email_AppendPhoneToBase(SCard.PhoneNumber);
      FCountPhones:=FCountPhones+1;
     end;
    FTotal:=FTotal+1;
    SLog(Ok,'FTotal : '+inttostr(FTotal));
    Synchronize(Progress);
   end;
  SLog(Ok,'End For SCard');
end;

procedure TForm11.RefreshLetter;
begin
 LabelSendEmailTextLetter.Lines.Clear;

 if not DM.FDQueryLettersDB.Active then DM.FDQueryLettersDB.Active:=true;

 CurrentNumLetter:=DM.FDQueryLettersDB.FieldByName('ID_Letter').AsInteger;
 LabelWork.Text:=inttostr(CurrentNumLetter);
 LabelDiag.Text:=inttostr(CurrentNumLetter);



 LabelSendEmailTextLetter.Lines.Add('            Отправитель:');
 LabelSendEmailTextLetter.Lines.Add(DM.FDQueryLettersDB.FieldByName('From').AsString);
 LabelSendEmailTextLetter.Lines.Add('');
 LabelSendEmailTextLetter.Lines.Add('            Тема письма:');
 LabelSendEmailTextLetter.Lines.Add(DM.FDQueryLettersDB.FieldByName('Subject').AsString);
 LabelSendEmailTextLetter.Lines.Add('');
 LabelSendEmailTextLetter.Lines.Add('            Текст письма:');
 LabelSendEmailTextLetter.Lines.Add(ReplaceStr(DM.FDQueryLettersDB.FieldByName('TextLetter').AsString, '<br>', #13#10));

// LabelSendEmailTextLetter.Height:=LabelSendEmailTextLetter.ContentBounds.Height+150;


 //LabelSendEmailTextLetter.Lines.Add('ContentBounds '+inttostr(LabelSendEmailTextLetter.ContentBounds.Height));
 //LabelSendEmailTextLetter.Height:= LabelSendEmailTextLetter.Lines.Count*Abs(LabelSendEmailTextLetter.TextSettings.Font.Size*Screen.PixelsPerInch div 72);
 //FTypeLetter:= GetEnumName(TypeInfo(TFTypeLetter),DM.FDQueryLettersDB.FieldByName('TypeLetter').AsInteger);
 CurrentTypeLetter:= TFTypeLetter(DM.FDQueryLettersDB.FieldByName('TypeLetter').AsInteger);
  case CurrentTypeLetter of
    Work: begin
           ImageLetterDiag.Visible:=false;
           ImageLetterWork.Visible:=true;
          end;
    Diagnost: begin
               ImageLetterDiag.Visible:=true;
               ImageLetterWork.Visible:=false;
              end;
    else
     begin
      ImageLetterDiag.Visible:=false;
      ImageLetterWork.Visible:=false;
     end;
  end;

 //LabelSendEmailTextLetter.Lines.Add('--count - '+ inttostr(LabelSendEmailTextLetter.Lines.count));

 LabelSendEmailTextLetter.Height := LabelSendEmailTextLetter.Lines.count * 36;
 Rectangle1.Height := LabelSendEmailTextLetter.Lines.count * 40;

 if DM.FDQueryLettersDB.FieldByName('WithImage').AsBoolean then
  begin
    ImageLetter.Bitmap.Assign(Email_LoadImageFromLetterDB(CurrentNumLetter));
    ImageLetter.height:=150;
    Rectangle1.Height:=LabelSendEmailTextLetter.Lines.count * 40+160;
  end
 else
  begin
    ImageLetter.Bitmap:=nil;
    ImageLetter.height:=1;
    Rectangle1.Height:=LabelSendEmailTextLetter.Lines.count * 40;
  end
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
          SLog(Ok,'Запрос выполнен удачно: '+IntToStr(RESTRequest1.Response.StatusCode));
          SLog(Ok,RESTRequest1.Response.Content);
           try
             case TypeRequestYD of
               DeleteFileFromYD: ;
               SaveFileToYD: ;
               MetaInfoPriorityFiles: begin

                               JSONObject:=TJSONObject(RESTRequest1.Response.JSONValue).GetValue('_embedded') as TJSONObject;
                               total:=StrToInt(JSONObject.GetValue('total').Value);
                               SLog(Ok,'total='+IntToStr(total));
                               //получаем список файлов



                               if total>0 then
                                begin
                                  JSONArray:=JSONObject.GetValue('items') as TJSONArray;
                                  ResponceStatus:=TJSONObject(JSONArray.Items[0]).Values['name'].Value;
                                  for i := 0 to total-1 do
                                   begin
                                    SLog(Ok,'name: '+TJSONObject(JSONArray.Items[i]).Values['name'].Value);
                                    SLog(Ok,'created: '+TJSONObject(JSONArray.Items[i]).Values['created'].Value);
                                   end;
                                end
                               else
                                begin
                                 SLog(Ok,'папка пустая, файлов нет');
                                 ResponceStatus:='FolderEmpty';
                                end;
                              end;
              MetaInfoUpdateFile: ;
              LoadFileFromYD: SLog(Ok,'200 - файл успешно скачан');
             end;
           except on E: Exception do
            ShowMessage('ERROR: RESTAfterExecute1( -'+e.Message);
           end;

         end;
    201: SLog(Ok,'201 - файл успешно загружен');
    202: begin
          case TypeRequestYD of
           DeleteFileFromYD: SLog(Ok,'202 - удаление начато, требуется отслеживание');

           SaveFileToYD: SLog(Ok,'202 - файл загружен на сервер, но пока не передан в папку назначения');
          end;
         end;
    204: SLog(Ok,'204 - файл успешно удален');
    400: SLog(Ok,'400 - Некорректные данные');
    403: SLog(Ok,'403 - Доступ запрещён. Возможно, у приложения недостаточно прав для данного действия');

    404: begin
          SLog(Ok,'404 - Не удалось найти запрошенный ресурс');
          ResponceStatus:='FileEmpty';
         end;
    406: SLog(Ok,'406 - Ресурс не может быть представлен в запрошенном формате');
    409: SLog(Ok,'409 - Указанного пути "{path}" не существует');
    412: SLog(Ok,'412 - при дозагрузке файла был передан неверный диапазон в заголовке Content-Range');
    413: SLog(Ok,'413 - размер файла превышает 10Гб');
    500: SLog(Ok,'500 - внутренняя ошибка сервера, попробуйте позже');
    503: SLog(Ok,'503 - сервис недоступен, попробуйте позже');
    507: SLog(Ok,'507 - исчерпано место на Диске');

    else begin
          SLog(Ok,IntToStr(RESTRequest1.Response.StatusCode)+' - другая  ошибка');
         end;
   end;

end;

procedure TForm11.ReStartTimer;
begin
 Timer1.Enabled:=false;
 Timer1.Interval:=300000;
 Timer1.Enabled:=true;
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
  SLog(Ok,'');
  SLog(Ok,'--------REST_YandexDisk--------');


  TypeFileYD:=FTypeFileYD;
  TypeRequestYD:=FTypeRequestYD;
  {
  LogRect.Visible:=true;
  LogRect.Align:=TAlignLayout.Client;
  LogRect.BringToFront;

  Result:=false;
  AniIndicator1.BringToFront;
  AniIndicator1.Visible:=true;

  Application.ProcessMessages;
   }

  OAuth2Authenticator1.TokenType:=TOAuth2TokenType.ttNONE;

   //подготавливаем параметры
   if TypeRequestYD=GetUserInfo then
    RESTClient1.BaseURL:=OSConstants[OSDevice].BaseURLEmail
   else
    RESTClient1.BaseURL:=OSConstants[OSDevice].BaseURL;



  RESTRequest1.Params.Clear;
  RESTRequest1.Params.Add;
  //в первую очередь дополнительный заголовок в запрос
  //с токеном, иначе будет 401 UNAUTHORIZED
  RESTRequest1.Params[0].Kind:=TRESTRequestParameterKind.pkHTTPHEADER;
  RESTRequest1.Params[0].name:='Authorization';
  RESTRequest1.Params[0].Options:=[poDoNotEncode];
  RESTRequest1.Params[0].Value:='OAuth ' + OAuth2Authenticator1.AccessToken;

  if TypeRequestYD=GetUserInfo then
   SLog(Ok,'подготавливаем параметры BaseURL '+OSConstants[OSDevice].BaseURLEmail)
  else
   SLog(Ok,'подготавливаем параметры BaseURL '+OSConstants[OSDevice].BaseURL);



    //далее - путь загрузки
  if TypeRequestYD=GetUserInfo then
   begin
    RESTRequest1.Params.Add;
    RESTRequest1.Params[1].name:='format';
    RESTRequest1.Params[1].Value:='json';
   end
  else
   begin
    RESTRequest1.Params.Add;
    RESTRequest1.Params[1].name:='path';

    case TypeFileYD of
     DataBaseFile: RESTRequest1.Params[1].Value:='app:/'+FFileName;//Value:='app:/DataBase/'+FFileName;
     PriorityFile: RESTRequest1.Params[1].Value:='app:/'+FFileName;//Value:='app:/Priority/'+FFileName;
     UpdateFile:   RESTRequest1.Params[1].Value:='app:/'+FFileName; //Value:='app:/Update/'+FFileName;   //на конкретный файл надо
    end;

    SLog(Ok,'путь загрузки');
   end;

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
   GetUserInfo: ;
  end;

  SLog(Ok,'устанавливаем параметры запроса');

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
   GetUserInfo: ;
  end;

  SLog(Ok,'устанавливаем метод запроса');

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

   SLog(Ok,'Отправка запроса на ЯндексДиск... Запускаем задачу');

   //Запускаем задачу.
   Tasks[0].Start;
   //Ждем завершение потока
   TTask.WaitForAny(Tasks[0]);

   Application.ProcessMessages;

   SLog(Ok,'Application.ProcessMessages');

  case TypeRequestYD of
   DeleteFileFromYD: RESTAfterExecute1;
   SaveFileToYD: begin
                  if RESTRequest1.Response.StatusCode=200 then
                   begin
                    //все нормально, для отладки выведем полученный JSON
                    SLog(Ok,'AfterExecute SaveFileToYD:');
                    SLog(Ok,RESTRequest1.Response.Content);

                    //выделяем ссылку на загрузку
                    Link:=TJSONObject(RESTRequest1.Response.JSONValue).GetValue('href').Value;
                    SLog(Ok,Link);   //запоминаем базовый путь

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
                    SLog(Ok,'Загрузка выполнена');
                   end
                  else
                   begin
                    SLog(Ok,'запрос ссылки - ошибка '+RESTRequest1.Response.StatusCode.ToString);
                   end;
                 end;
   MetaInfoPriorityFiles: RESTAfterExecute1;
   MetaInfoUpdateFile: ;
   LoadFileFromYD: begin
                    if RESTRequest1.Response.StatusCode=200 then
                     begin
                      //все нормально, для отладки выведем полученный JSON
                      SLog(Ok,'AfterExecute LoadFileFromYD:');
                      SLog(Ok,RESTRequest1.Response.Content);

                      //выделяем ссылку на скачивания
                      Link:=TJSONObject(RESTRequest1.Response.JSONValue).GetValue('href').Value;
                      SLog(Ok,Link);





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

                      SLog(Ok,'LoadFileFromYD: загружен');
                     end
                    else
                     begin
                      SLog(Ok,'запрос ссылки - ошибка '+RESTRequest1.Response.StatusCode.ToString);
                     end;
                   end;
    GetUserInfo: begin
                  SLog(Ok,'AfterExecute GetUserInfo:');
                  SLog(Ok,RESTRequest1.Response.Content);

                  //выделяем ссылку c UserEmail
                      Link:=TJSONObject(RESTRequest1.Response.JSONValue).GetValue('default_email').Value;
                      SLog(Ok,'Get UserEmail: '+Link);
                      MyEmailAccount:=Link;


                 end;
  end;


   SetLength(Tasks, 0);
   Application.ProcessMessages;

   Result:=FlagRESTStatus;

   RESTAfterExecute1;

   SLog(Ok,'--------End REST_YandexDisk---------');
   SLog(Ok,'');

   {
   AniIndicator1.Visible:=false;
   LogRect.Visible:=false;

   }
   Application.ProcessMessages;
end;



end.
