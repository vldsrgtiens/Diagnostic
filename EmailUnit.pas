unit EmailUnit;

interface

uses
System.Types, FMX.Types,
DateUtils, MySettings, System.SysUtils,
IdAttachment,  IdMessageParts, IdAttachmentFile,
IdSMTP, IdSASL, IdSASLCollection, IdSASLXOAUTH,
IdSSL, IdSSLOpenSSL,  IDMessage, IdMessageBuilder,
FMX.Surfaces, Data.DB,System.StrUtils, System.TypInfo,
IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, EncdDecd,
UDM, System.Classes, FMX.Graphics, System.IOUtils, fmx.dialogs;
//system.NetEncoding;

type
 TDomain =(mail=0,yandex=1,yahoo=2,gmail=3);

 TDomainConst = record
    SmtpHost : string;
    SmtpPort : Integer;
    Domain: string;
  end;


 TFSettingsEmail = record
   EmailCountEmailsSendInDay: integer;
   EmailMinDaysToSend: integer;
   EmailCurrentAccount: integer;
 end;

 TEmailConstants = record
    AuthenticationType : TAuthType;
    SmtpHost : string;
    SmtpPort : Integer;
    PopHost : string;
    PopPort : Integer;
    AuthName : string;
    TLS : TIdUseTLS;
 end;

 function  Email_SMTP_Connect(FAccessToken,FMyEmailAccount: string): TTypeLog;
 function  Email_SMTP_Connect2(FLogin,FPassword: string): TTypeLog;
 procedure Email_SMTP_Disconnect;
 function  Email_FindEmailInBase(FEmail: string): boolean;
 function  Email_FindPhoneInBase(FPhone: string): boolean;
 function  Email_GetEmailFromBase(FTypeLetter: TFTypeLetter): string;
 function  Email_AppendEmailToBase(FEmail: string): TTypeLog;
 function  Email_AppendPhoneToBase(FPhone: string): TTypeLog;
 function  Email_SendEmail(FAccessToken,FMyEmailAccount: string; Fmsg: TIDMessage): integer;
 function  Email_SendEmail2(FLogin,FPassword: string; Fmsg: TIDMessage): integer;
 function  Email_IsValidEmail(Value: string): boolean;
 function  Email_CheckAllowed(s: string): boolean;
 procedure Email_CreateMessage(Fmsg: TIdMessage; FCurrentNumLetter: integer;  FRecipientEmail, FMyEmailAccount:string );
 function  Email_CreateMessageText(MyTextMessage:TStrings): string;
 function  Email_LoadImageFromLetterDB(FID_Letter:integer):TBitmap;
 function  GetAccountName(Fid:integer):string;
 function  GetAccountDomain(Fid:integer):integer;
 function  GetAccountPwd(Fid:integer):string;
 function  AppendAccount(FFullName,FName,FPwd:string;FDomainIndex:integer):boolean;

 //IdMessage.Body.Text := 'Hello Body';

const
 FDomainConst :   array[TDomain] of TDomainConst =
  ( //(mail=0,yandex=1,yahoo=2,gmail=3)
    (  SmtpHost : 'smtp.mail.ru';
       SmtpPort : 465;
       Domain: '@mail.ru';
    ),
    (  SmtpHost : 'smtp.yandex.com';
       SmtpPort : 465;
       Domain: '@yandex.ru';
    ),
    (  SmtpHost : 'smtp.mail.yahoo.com';
       SmtpPort : 465;
       Domain: '@yahoo.com';
    ),
    (  SmtpHost : 'smtp.gmail.com';
       SmtpPort : 465;
       Domain: '@gmail.com';
    )
  );

 EmailConstants :   TEmailConstants =
    (  AuthenticationType : TIdSASLXOAuth;
       SmtpHost : 'smtp.yandex.com';
       SmtpPort : 465;//587;//
       PopHost : 'imap.yandex.ru';
       PopPort : 993;
       AuthName : 'XOAUTH2';
       TLS : utUseImplicitTLS;
    );


var
 FSettingsEmail: TFSettingsEmail;
 SMTP: TIdSMTP;
 SMTP_AuthType: IdSMTP.TIdSMTPAuthenticationType;
 SSLOpen : TIdSSLIOHandlerSocketOpenSSL;
 xoauthSASL : TIdSASLListEntry;
 IdSSLIOHandlerSocketOpenSSL : TIdSSLIOHandlerSocketOpenSSL;
 PCountEmails: integer;
 PCountPhones: integer;
 ValueFiles: integer;
 ValueEmail: integer;
 ValuePhone: integer;
 BeforEmail: string;
 SpamCountSend: integer;
 TodaySendingEmail: integer;
 FDomain: string;
 FlagSMTPConnected: boolean;


implementation

function  AppendAccount(FFullName,FName,FPwd:string;FDomainIndex:integer):boolean;
begin
 result:= false;
  if DM.FDConnectionAccountDB.Connected then
   begin
    begin
     if not DM.FDQueryAccountDB.Active then DM.FDQueryAccountDB.Active := true;

     if not DM.FDQueryAccountDB.Locate('FullName',FFullName,[]) then
      begin

       with DM do
        begin
         FDQueryAccountDB.Active:=true;
         FDQueryAccountDB.Append;
         FDQueryAccountDB.FieldByName('FullName').AsString := FFullName;
         FDQueryAccountDB.FieldByName('Name').AsString := FName;
         FDQueryAccountDB.FieldByName('DomainIndex').AsInteger := FDomainIndex;
         FDQueryAccountDB.FieldByName('Pwd').AsString := EncodeString(FPwd);
         try
          FDQueryAccountDB.Post;
          result:=true;
          SLog(Ok,'Append Account');
         except
          on E : Exception do
           begin
            LastException:=(E.ClassName+' поднята ошибка, с сообщением : '+E.Message);
            SLog(Error,LastException);
           end;
         end;
         FDQueryAccountDB.Active:=false;
        end;
      end;
    end;
   end;
end;

function  GetAccountName(Fid:integer):string;
begin
 result:='';
 if DM.FDConnectionAccountDB.Connected then
  begin
    begin
     if not DM.FDQueryAccountDB.Active then DM.FDQueryAccountDB.Active := true;

     if DM.FDQueryAccountDB.Locate('ID_Account',Fid,[]) then
        result := DM.FDQueryAccountDB.FieldByName('Name').asstring;

    end;
  end;
end;

function  GetAccountDomain(Fid:integer):integer;
begin
 result:=0;
 if DM.FDConnectionAccountDB.Connected then
  begin
    begin
     if not DM.FDQueryAccountDB.Active then DM.FDQueryAccountDB.Active := true;

     if DM.FDQueryAccountDB.Locate('ID_Account',Fid,[]) then
        result := DM.FDQueryAccountDB.FieldByName('DomainIndex').asinteger;

    end;
  end;
end;

function  GetAccountPwd(Fid:integer):string;
begin
 result:='';
 if DM.FDConnectionAccountDB.Connected then
  begin
    begin
     if not DM.FDQueryAccountDB.Active then DM.FDQueryAccountDB.Active := true;

     if DM.FDQueryAccountDB.Locate('ID_Account',Fid,[]) then
        result := DecodeString(DM.FDQueryAccountDB.FieldByName('Pwd').asstring);

    end;
  end;
end;

function  Email_SMTP_Connect2(FLogin,FPassword: string): TTypeLog;
begin
 Result:=Warning;

 //IdOpenSSLSetLibPath(TPath.GetDocumentsPath);

  SLog(Info,FLogin);

  if SMTP = nil then  SMTP := TIdSMTP.Create;//(Application);

  SMTP.Host := FDomainConst[TDomain( GetEnumValue(TypeInfo(TDomain),FDomain))].SMTPHost;
  SMTP.Port := FDomainConst[TDomain( GetEnumValue(TypeInfo(TDomain),FDomain))].SMTPPort;
  SMTP.AuthType := satDefault;//satSASL;
  SMTP.Username := FLogin;
  SMTP.Password := FPassword;
  SMTP.HeloName := 'SMTPBusinessTools';//--решаем проблему отправки писем, если у компьютера руссоке имя

  {
  xoauthSASL := SMTP.SASLMechanisms.Add;
  xoauthSASL.SASL := TIdSASLXOAuth.Create(nil);
  TIdSASLXOAuth(xoauthSASL.SASL).Token := FAccessToken;
  TIdSASLXOAuth(xoauthSASL.SASL).User :=FMyEmailAccount;
   }

  //это необходимо использовать для SSL
  SSLOpen := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  //IdSSLOpenSSL.LoadOpenSSLLibrary(TPath.GetDocumentsPath+PathDelim+'libssl.so');
  SSLOpen.Destination := SMTP.Host+':'+IntToStr(SMTP.Port);
  SSLOpen.Host := SMTP.Host;
  SSLOpen.Port := SMTP.Port;
  SSLOpen.DefaultPort := 0;
  SSLOpen.SSLOptions.Method := sslvSSLv23; //sslvTLSv1;//
  SSLOpen.SSLOptions.Mode :=    sslmUnassigned;
//  IdOpenSSLSetLibPath(TPath.GetDocumentsPath)

  SMTP.IOHandler := SSLOpen;
  SMTP.UseTLS :=  utUseImplicitTLS; //utUseExplicitTLS;//

    if not LoadOpenSSLLibrary then SLog(Error,'not LoadOpenSSLLibrary');
 try
  SMTP.Connect;
  if SMTP.Connected then
   begin
    result:=Ok;

    SLog(Info,'SMTP.Connected ');
   end;
 except
    on E : Exception do
     begin
      result:=Error;
      SLog(Info,DateTimeToStr(Now)+E.ClassName+' поднята ошибка, с сообщением : '+E.Message);
      ShowMessage('Connect fail: '+E.Message);
      LastException:=(E.ClassName+' поднята ошибка, с сообщением : '+E.Message);
     end;
 end;

 //msg1.free;

end;

function Email_CreateMessageText(MyTextMessage:TStrings): string;
var
 str: string;
 ind: integer;
begin

 for ind := 0 to MyTextMessage.Count-1 do
  begin
   str:=str+MyTextMessage[ind]+'<br>';
  end;
 Result:=str;

end;

function Email_LoadImageFromLetterDB(FID_Letter:integer):TBitmap;
var
 BlobStream: TStream;
 FBitmap: TBitmap;
begin
 result:=nil;
 if DM.FDConnectionEmailDB.Connected then
  begin
  try
   begin
    if not DM.FDQueryLettersDB.Active then DM.FDQueryLettersDB.Active := true;
     DM.FDQueryLettersDB.Locate('ID_Letter',FID_Letter,[]);
    if DM.FDQueryLettersDB.FieldByName('WithImage').asboolean then
     begin
      FBitmap:= TBitmap.create;
      try
       // access a stream from a blob like this
       BlobStream := DM.FDQueryLettersDB.CreateBlobStream(DM.FDQueryLettersDB.FieldByName('Image'),TBlobStreamMode.bmRead);
       // access a string from a field like this
       // load your blob stream data into a control
       FBitmap.LoadFromStream(BlobStream);
       result:=FBitmap;
      finally
       BlobStream.Free;
       //FBitmap.Free;
      end;
     end
    else
     begin
      //FBitmap.Assign(Image22.Bitmap);
      FBitmap:=nil;
      SLog(Error,'NOT WithImage');
     end;
   end;
  except
   on e: Exception do
    begin
     SLog(Error,'Email_LoadImageFromLetterDB '+e.Message);
    end;
  end;
 end
 else
  SLog(Error,'NOT DM.FDConnectionEmailDB.Connected');

end;

procedure  Email_CreateMessage(Fmsg: TIdMessage; FCurrentNumLetter: integer;  FRecipientEmail, FMyEmailAccount:string );
var
  att: TIdAttachmentFile;
  path: string;
  //cid : WideString;
  cid : String;
  TempFileImagePath: string;
  Stream: TMemoryStream;
  Surf: TBitmapSurface;
  FImage: TBitmap;
begin

 FImage:=TBitmap.Create;

 Fmsg.ContentType := 'html; charset=windows-1251' ;
 Fmsg.Subject := DM.FDQueryLettersDB.FieldByName('Subject').AsString+ '               :'+DateTimeToStr(Now);
 Fmsg.From.Name := DM.FDQueryLettersDB.FieldByName('From').AsString;
 Fmsg.Recipients.EMailAddresses := FRecipientEmail;
 Fmsg.From.Address := FMyEmailAccount;


      if (DM.FDQueryLettersDB.FieldByName('WithImage').AsBoolean) then
       begin
        TempFileImagePath:=PathToAppDirectory+'temp'+inttostr(DM.FDQueryLettersDB.FieldByName('ID_Letter').AsInteger)+'.jpg' ;

        if TFile.Exists(TempFileImagePath) then
         TFile.Delete(TempFileImagePath);

        FImage:=Email_LoadImageFromLetterDB(FCurrentNumLetter) ;
         SLog(Info,'FImage create '+TempFileImagePath);

        //if not FileExists(TempFileImagePath) then
         // TFile.Create(TempFileImagePath);
         SLog(Info,'FImage <> nil ');
          Stream := TMemoryStream.Create;
          try
            Stream.Position := 0;
            Surf := TBitmapSurface.Create;
            try
              Surf.Assign(FImage);
              // use the codec to save Surface to stream
             if not TBitmapCodecManager.SaveToStream(Stream,Surf,'.jpg') then
              raise EBitmapSavingFailed.Create('Error saving Bitmap to jpg');
            finally
             Surf.Free;
            end;
             // do something with the png stream image
         //FImage.LoadFromStream(Stream);

            // comparison output as PNG from the stream
            Stream.Position := 0;
            Stream.SaveToFile(TempFileImagePath);
          finally
           Stream.Free;
          end;
          SLog(Info,'FImage create ');
       end;


        with TIdMessageBuilderHtml.Create do
         begin
          PlainTextContentTransfer:='html';
          PlainTextCharset:='windows-1251';

          if ((DM.FDQueryLettersDB.FieldByName('WithImage').AsBoolean)) then
           begin
            HTML.Text:='<html><body> <br><br>'+ DM.FDQueryLettersDB.FieldByName('TextLetter').asstring +'<br><br><img src="cid:'+ExtractFileName(TempFileImagePath)+'" height=100% width=100% >  <br><br>' +' <br> '+DateTimeToStr(Now)+'<br> </body></html>';
            cid:=ExtractFileName(TempFileImagePath);
            HtmlFiles.Add(TempFileImagePath,cid);
           end
          else
           HTML.Text:='<html><body> <br><br>'+ DM.FDQueryLettersDB.FieldByName('TextLetter').AsString +  '<br><br>' +' <br> '+DateTimeToStr(Now)+'<br> </body></html>';

          HTMLCharset:='windows-1251';

          FillMessage(Fmsg);
          SLog(Info,'FillMessage');
         end;
       Fmsg.SaveToFile(PathToAppDirectory+'msg.eml');
 // msg.free;
 // if FileExists(TempFileImagePath) then TFile.Delete(TempFileImagePath);
 // msg.From.Address := MyEmailAccount; {&lt;&lt;Должно совпадать с SMTP.UserName}
 // msg.Recipients.EMailAddresses :=RecipientEmail;

 FImage.Free;

end;

function Email_SMTP_Connect(FAccessToken,FMyEmailAccount: string): TTypeLog;
var
 msg1: TIDMessage;
begin
 Result:=Warning;

 //IdOpenSSLSetLibPath(TPath.GetDocumentsPath);

  if SMTP = nil then  SMTP := TIdSMTP.Create;//(Application);

  SMTP.Host := EmailConstants.SMTPHost;
  SMTP.Port := EmailConstants.SMTPPort;
  SMTP.AuthType := satSASL;
  SMTP.Username := FMyEmailAccount;
  SMTP.HeloName := 'SMTPBusinessTools';//--решаем проблему отправки писем, если у компьютера руссоке имя

  xoauthSASL := SMTP.SASLMechanisms.Add;
  xoauthSASL.SASL := TIdSASLXOAuth.Create(nil);
  TIdSASLXOAuth(xoauthSASL.SASL).Token := FAccessToken;
  TIdSASLXOAuth(xoauthSASL.SASL).User :=FMyEmailAccount;

  //это необходимо использовать для SSL
  SSLOpen := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  //IdSSLOpenSSL.LoadOpenSSLLibrary(TPath.GetDocumentsPath+PathDelim+'libssl.so');
  SSLOpen.Destination := SMTP.Host+':'+IntToStr(SMTP.Port);
  SSLOpen.Host := SMTP.Host;
  SSLOpen.Port := SMTP.Port;
  SSLOpen.DefaultPort := 0;
  SSLOpen.SSLOptions.Method := sslvSSLv23; //sslvTLSv1;//
  SSLOpen.SSLOptions.Mode :=    sslmUnassigned;
//  IdOpenSSLSetLibPath(TPath.GetDocumentsPath)

  SMTP.IOHandler := SSLOpen;
  SMTP.UseTLS :=  utUseImplicitTLS; //utUseExplicitTLS;//

    if not LoadOpenSSLLibrary then SLog(Error,'not LoadOpenSSLLibrary');
   SLog(Info,'befor Connect');
 try
  SMTP.Connect;
  if SMTP.Connected then
   begin
    result:=Ok;
    SLog(Info,'SMTP.Connected ');
   end;
 except
    on E : Exception do
     begin
      result:=Error;
      SLog(Info,DateTimeToStr(Now)+E.ClassName+' поднята ошибка, с сообщением : '+E.Message);
      LastException:=(E.ClassName+' поднята ошибка, с сообщением : '+E.Message);
     end;
 end;

 //msg1.free;
end;

procedure Email_SMTP_Disconnect;
begin
   if SMTP<>nil then
   begin
    //SMTP.Disconnect();
    SMTP.Free;
   end;

end;

function Email_FindEmailInBase(FEmail: string): boolean;
begin
 with DM do
  begin
   FDQueryEmailDB.Active:=true;
   Result:= FDQueryEmailDB.Locate('EMail',FEmail,[]);
   FDQueryEmailDB.Active:=false;
  end;
end;

function Email_FindPhoneInBase(FPhone: string): boolean;
begin
 with DM do
  begin
   FDQueryPhoneDB.Active:=true;
   SLog(Ok,'Path to Phone DB: '+ DM.FDConnectionPhoneDB.Params.Values['Database'] );
   Result:= FDQueryPhoneDB.Locate('Phone',FPhone,[]);
   FDQueryPhoneDB.Active:=false;
  end;
end;

function Email_GetEmailFromBase(FTypeLetter: TFTypeLetter): string; // 'empty'
var
 FDate: TDate;
 FlagNext: boolean;
 FStatus:string;
begin
 result:='empty';
 FlagNext:=false;
  case FTypeLetter of
    Work: DM.FDQueryEmailDB.IndexFieldNames:='LastDateEmailWork';
    Diagnost: DM.FDQueryEmailDB.IndexFieldNames:='LastDateEmailDiag';
    Another: DM.FDQueryEmailDB.IndexFieldNames:='LastDateEmailAnother';
  end;
  DM.FDQueryEmailDB.SQL.Clear;
  DM.FDQueryEmailDB.SQL.Add('select * from EMails'); // отсортировать по LastDate
  DM.FDQueryEmailDB.Active:=true;
  DM.FDQueryEmailDB.First;
 repeat
  //FDate:=DM.FDQueryEmailDB.FieldByName('LastDateEmail').AsDateTime;

  case FTypeLetter of
    Work: FDate:=DM.FDQueryEmailDB.FieldByName('LastDateEmailWork').AsDateTime;
    Diagnost: FDate:=DM.FDQueryEmailDB.FieldByName('LastDateEmailDiag').AsDateTime;
    Another: FDate:=DM.FDQueryEmailDB.FieldByName('LastDateEmailAnother').AsDateTime;
  end;

  FStatus:=DM.FDQueryEmailDB.FieldByName('StatusEmail').AsString;
  FDate:=IncDay(FDate, FSettingsEmail.EmailMinDaysToSend);
  if ((FDate<=Now) and (FStatus<>'Error')) then
   begin
    result:=DM.FDQueryEmailDB.FieldByName('Email').AsString;
    DM.FDQueryEmailDB.Active:=false;
    FlagNext:=false;
   end
  else
   begin
    if not DM.FDQueryEmailDB.Eof then
     begin
      FlagNext:=true;
      DM.FDQueryEmailDB.Next;
     end
    else
     FlagNext:=false;
   end;
 until (FlagNext=false);
 DM.FDQueryEmailDB.Active:=false;
end;

function Email_AppendPhoneToBase(FPhone: string): TTypeLog;
begin
 result:=Warning;
  SLog(Ok,'Befor Append Phone');
 with DM do
  begin
   FDQueryPhoneDB.Active:=true;
   FDQueryPhoneDB.Append;
   FDQueryPhoneDB.FieldByName('Phone').AsString := FPhone;
   FDQueryPhoneDB.FieldByName('LastDatePhone').AsDateTime := EncodeDate(2000, 1, 1);
   FDQueryPhoneDB.FieldByName('StatusPhone').AsString := 'unknown';
    try
     FDQueryPhoneDB.Post;
     result:=Ok;
     SLog(Ok,'Append Phone');
    except
      on E : Exception do
       begin
        result:=Error;
        LastException:=(E.ClassName+' поднята ошибка, с сообщением : '+E.Message);
        SLog(Error,LastException);
       end;
    end;
    FDQueryPhoneDB.Active:=false;
  end;
end;

function Email_AppendEmailToBase(FEmail: string): TTypeLog;
begin
 result:=Warning;
 SLog(Ok,'Befor Append Email');
 with DM do
  begin
   FDQueryEmailDB.Active:=true;
   FDQueryEmailDB.Append;
   FDQueryEmailDB.FieldByName('EMail').AsString := FEmail;
   FDQueryEmailDB.FieldByName('LastDateEmailWork').AsDateTime := EncodeDate(2000, 1, 1);
   FDQueryEmailDB.FieldByName('LastDateEmailDiag').AsDateTime := EncodeDate(2000, 1, 1);
   FDQueryEmailDB.FieldByName('LastDateEmailAnother').AsDateTime := EncodeDate(2000, 1, 1);
   FDQueryEmailDB.FieldByName('StatusEmail').AsString := 'unknown';
    try
     FDQueryEmailDB.Post;
     result:=Ok;
     SLog(Ok,'Append Email');
    except
      on E : Exception do
       begin
        result:=Error;
        LastException:=(E.ClassName+' поднята ошибка, с сообщением : '+E.Message);
        SLog(Error,LastException);
       end;
    end;
    FDQueryEmailDB.Active:=false;
  end;

  {
  case FTypeLetter of
    Work: FDate:=DM.FDQueryEmailDB.FieldByName('LastDateEmailWork').AsDateTime;
    Diagnost: FDate:=DM.FDQueryEmailDB.FieldByName('LastDateEmailDiag').AsDateTime;
    Another: FDate:=DM.FDQueryEmailDB.FieldByName('LastDateEmailAnother).AsDateTime;
  end;
  }
end;

function  Email_SendEmail2(FLogin,FPassword: string; Fmsg: TIDMessage): integer;
begin

 if smtp=nil then
   Email_SMTP_Connect2(FLogin,FPassword);


 if not SMTP.Connected then Email_SMTP_Connect2(FLogin,FPassword);

 if SMTP.Connected then
    begin
     try
      SLog(Info,'sendEmail - SMTP.Connected');
      SMTP.Send(Fmsg);
      SLog(Info,'Email was Send to '+Fmsg.Recipients.EMailAddresses );
      Result:=0; //without error

      //showmessage('Письмо отправлено');
      except on E: Exception do
      begin
       SLog(Error,DateTimeToStr(Now)+' : '+E.ClassName+' поднята ошибка, с сообщением : '+E.Message);
       //showmessage(E.ClassName+' поднята ошибка, с сообщением : '+E.Message);
      result:=4; //another error
       if Pos('timeout exceeded',E.Message)>0 then Result:=2;//Error: timeout exceeded
       //if Pos('SPAM',E.Message)>0 then Result:=1;//Error: SPAM
       if Pos('Socket Error',E.Message)>0 then Result:=6;//internet non found
       if Pos('invalid mailbox',E.Message)>0 then Result:=7;//user not found
       if Pos('recipient verification failed',E.Message)>0 then Result:=2;//user not found
       if Pos('authentication failed',E.Message)>0 then Result:=11;//Error: разрешение для почтовых программ
       if Pos('Try again later',E.Message)>0 then Result:=8;//Too many message from
       if Pos('Message rejected under',E.Message)>0 then Result:=5;//Too many message from
       SLog(Error,'error   SMTP.Send № '+IntToStr(Result));//
      // if Result=4 then
        //Log(Error,'error   SMTP.Send № '+IntToStr(Result)+' : '+E.ClassName+' поднята ошибка, с сообщением : '+E.Message);
      end;
     end;

    end
  else
   begin
    Result:=3;//error not connected
   end;
end;


function  Email_SendEmail(FAccessToken,FMyEmailAccount: string; Fmsg: TIDMessage): integer;
begin
 if smtp=nil then
   Email_SMTP_Connect(FAccessToken,FMyEmailAccount);


 if not SMTP.Connected then Email_SMTP_Connect(FAccessToken,FMyEmailAccount);

 if SMTP.Connected then
    begin
     try
      SLog(Info,'sendEmail - SMTP.Connected');
      SMTP.Send(Fmsg);
      SLog(Info,'Email was Send');
      Result:=0; //without error
      //showmessage('Письмо отправлено');
      except on E: Exception do
      begin
       SLog(Error,DateTimeToStr(Now)+' : '+E.ClassName+' поднята ошибка, с сообщением : '+E.Message);
       //showmessage(E.ClassName+' поднята ошибка, с сообщением : '+E.Message);
      result:=4; //another error
       if Pos('timeout exceeded',E.Message)>0 then Result:=2;//Error: timeout exceeded
       //if Pos('SPAM',E.Message)>0 then Result:=1;//Error: SPAM
       if Pos('Socket Error',E.Message)>0 then Result:=6;//internet non found
       if Pos('invalid mailbox',E.Message)>0 then Result:=7;//user not found
       if Pos('authentication failed',E.Message)>0 then Result:=11;//Error: разрешение для почтовых программ
       if Pos('Try again later',E.Message)>0 then Result:=8;//Too many message from
       if Pos('Message rejected under',E.Message)>0 then Result:=5;//Too many message from
       SLog(Error,'error   SMTP.Send № '+IntToStr(Result));//
      // if Result=4 then
        //Log(Error,'error   SMTP.Send № '+IntToStr(Result)+' : '+E.ClassName+' поднята ошибка, с сообщением : '+E.Message);
      end;
     end;

    end
  else
   begin
    Result:=3;//error not connected
   end;
end;

function Email_IsValidEmail(Value: string): boolean;
var
  i: integer;
  namePart, serverPart: string;
begin
  Result:= false;
  i:= Pos('@', Value);
  if i = 0 then Exit;

  if Pos('@', Value,i+1)<>0 then Exit;

  namePart:= Copy(Value, 1, i - 1);
  serverPart:= Copy(Value, i + 1, Length(Value));
  if (Length(namePart) = 0) or ((Length(serverPart) < 5)) then Exit;

  i:= Pos('.', serverPart);
  if (i = 0) or (i > (Length(serverPart) - 2)) then Exit;

  if Pos('.', serverPart,i+1)<>0 then Exit;

  Result:= Email_CheckAllowed(namePart) and Email_CheckAllowed(serverPart);

end;

function Email_CheckAllowed(s: string): boolean;
  var
    i: integer;
  begin

    Result:= false;
    {$IFDEF ANDROID}
      for i:= 0 to Length(s)-1 do
    {$ENDIF}

    {$IFDEF MSWINDOWS}
     for i:= 1 to Length(s) do
    {$ENDIF}


    begin
      if not (s[i] in ['a'..'z', 'A'..'Z', '0'..'9', '_', '-', '.']) then Exit;
    end;
    Result:= true;
end;









end.
