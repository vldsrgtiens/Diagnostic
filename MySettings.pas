unit MySettings;

interface

uses
IdSASL, IdExplicitTLSClientServerBase,
FMX.Layouts, FMX.Types, IdSASLXOAuth, System.StrUtils,
System.Classes, System.IOUtils, System.SysUtils, FMX.Dialogs, System.UITypes,
FMX.Platform;

type
 TCurrentDB = (Emails,Phones,Diagnostic,Account);
 TOSDevice =(Windows=0,Android=1);
 TTypeLog = (Ok,Error,Warning, Info);
 TFTypeLetter = (Work=0, Diagnost=1, Another=2, Empty=-1);

 TAuthType = class of TIdSASL;

  TOSConstants = record
    AuthenticationType : TAuthType;
    EmailAccount : string;
    SmtpHost : string;
    SmtpPort : Integer;
    PopHost : string;
    PopPort : Integer;
    AuthName : string;
    TLS : TIdUseTLS;
    PropertyMailPanelAlign: TAlignLayOut;
    BaseURL : string;
    BaseURLEmail : string;
    DayEndPeriod : byte;
  end;

procedure SLog(FType:TTypeLog; FStr: string);
procedure SIntro;
procedure SAfterAccessAccountPutPath;
function GetShortAccountName():string;
function MyMessage(MsgStr: string):TMsgDlgBtn;


const
 OSConstants :   array[TOSDevice] of TOSConstants =
  (        //windows
    (  AuthenticationType : TIdSASLXOAuth;
       SmtpHost : 'smtp.yandex.com';
       SmtpPort : 465;
       PopHost : 'imap.yandex.ru';
       PopPort : 993;
       AuthName : 'XOAUTH2';
       TLS : utUseImplicitTLS;
       PropertyMailPanelAlign: TAlignLayOut.Center;
       BaseURL : 'https://cloud-api.yandex.net/v1';
       BaseURLEmail : 'https://login.yandex.ru/info?';
       DayEndPeriod : 29;

    ),   //android
    (  AuthenticationType : TIdSASLXOAuth;
       SmtpHost : 'smtp.yandex.com';
       SmtpPort : 465;
       PopHost : 'imap.yandex.ru';
       PopPort : 993;
       AuthName : 'XOAUTH2';
       TLS : utUseImplicitTLS;
       PropertyMailPanelAlign: TAlignLayOut.Client;
       BaseURL : 'https://cloud-api.yandex.net/v1';
       BaseURLEmail : 'https://login.yandex.ru/info?';
       DayEndPeriod : 29;
    ));

  AppDirectoryName = 'BusinessTools';
  AccessTokenFileName = 'AccessTokenFile.ini';
  SettingsFileName = 'SettingsFile.ini';
  DataBaseEmptyFileName = 'Diagnostic_empty.db';
  DataBaseFileName = 'Diagnostic.db';

var
 LastException: string;
 FSLog: TStringList;
 OSDevice: TOSDevice;
 MyEmailAccount: string;

  PathToAppDirectory: string;
  PathToAccountDirectory: string;
  PathToEmptyDirectory: string;
  PathToDiagnosticDirectory: string;
  PathToEmailDirectory: string;
  PathToSmsDirectory: string;

  FileAccessToken: string;
  FileSettings: string;
  FileDataBaseEmpty: string;
  FileDataBase: string;

  CurrentTypeLetter: TFTypeLetter;
  CurrentNumLetter: integer;

implementation

function MyMessage(MsgStr: string):TMsgDlgBtn;
var
 ARes: TMsgDlgBtn;
begin
 MessageDlg(MsgStr, System.UITypes.TMsgDlgType.mtInformation,
    [
      System.UITypes.TMsgDlgBtn.mbYes,
      System.UITypes.TMsgDlgBtn.mbNo
    ], 0,
    procedure(const AResult: System.UITypes.TModalResult)
    begin
      case AResult of
        mrYES:
         begin
          ARes:=System.UITypes.TMsgDlgBtn.mbYes;
         end;
        mrNo:
         begin
          ARes:=System.UITypes.TMsgDlgBtn.mbNo;
         end;
      end;
    end);

  result:=ARes;

end;


function GetShortAccountName():string;
begin
 result:= MyEmailAccount;
 result:= LeftStr(result, Pos('@',result,1)-1);
 result:= ReplaceStr(result, '.', '_pt_');
 result:= ReplaceStr(result, '-', '_tr_');

end;

procedure SAfterAccessAccountPutPath;
begin
 PathToAccountDirectory:= PathToAppDirectory+GetShortAccountName+PathDelim;

 FileSettings:=PathToAccountDirectory+SettingsFileName;
 PathToDiagnosticDirectory:=PathToAccountDirectory+'Diagnostic'+PathDelim;
 PathToEmailDirectory:=PathToAccountDirectory+'Email'+PathDelim;
 PathToSmsDirectory:=PathToAccountDirectory+'SMS'+PathDelim;

 //FileAccessToken:=PathToAccountDirectory+AccessTokenFileName;



 if not TDirectory.Exists(PathToDiagnosticDirectory) then TDirectory.CreateDirectory(PathToDiagnosticDirectory);
 if not TDirectory.Exists(PathToEmailDirectory) then TDirectory.CreateDirectory(PathToEmailDirectory);
 if not TDirectory.Exists(PathToSmsDirectory) then TDirectory.CreateDirectory(PathToSmsDirectory);

end;

procedure SIntro;
begin
  case TOSVersion.Platform of
    pfWindows: OSDevice:=Windows;
    pfAndroid: OSDevice:=Android;
  end;

   case OSDevice of
    Windows:begin
             PathToEmptyDirectory:=ExtractFilePath(ParamStr(0));
             PathToAppDirectory:=TPath.GetPublicPath+PathDelim+AppDirectoryName+PathDelim ;
             if not TDirectory.Exists(PathToAppDirectory) then
                 TDirectory.CreateDirectory(PathToAppDirectory);
            end;
    Android:begin
             PathToAppDirectory:=TPath.GetDocumentsPath+PathDelim ;// TPath.GetHomePath+PathDelim ;
             PathToEmptyDirectory:=PathToAppDirectory;
            end;
   end;



   //FileAccessToken:=PathToAppDirectory+AccessTokenFileName;

 //PathToExeDirectory:=GetCurrentDir;

end;

procedure SLog(FType:TTypeLog; FStr: string);
begin
 if FSLog=nil then FSLog:=TStringList.Create;

 case FType of
   Ok: FSLog.Add('Ok: '+FStr);
   Error: FSLog.Add('Error: '+FStr);
   Warning: FSLog.Add('Warning: '+FStr);
   Info: FSLog.Add('Info: '+FStr);
 end;

end;

end.
