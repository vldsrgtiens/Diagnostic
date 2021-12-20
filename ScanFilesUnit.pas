unit ScanFilesUnit;

interface

uses
  System.SysUtils,
  System.Classes;

type
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

var

  FindingThread:TMyFindingThread;
  SaveInDBaseThread : TSaveInDBaseThread;
  ValueProgressScanFile: integer;
  ValueFiles: integer;
  ValueEmail: integer;
  ValuePhone: integer;
  countFiles: integer;
  PCountEmails: integer;
  PCountPhones: integer;
  ScanFilesList: TList;

implementation

{ TCard }

constructor TCard.Create(FEmail, FPhoneNumber: string);
begin
 Self.Email:=FEmail;
 Self.PhoneNumber:=FPhoneNumber;
 Self.EmailLastSendDate:= EncodeDate(2000, 1, 1);
 Self.PhoneNumberLastSendDate:= EncodeDate(2000, 1, 1);
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
 if ValueProgressScanFile=100 then
  begin
   str:=FName;
   delete(str,1,length(chosenDirectory)+1);
   str:=str+' : '+FEmail+' : '+FPhone;
   Form11.MemoEmailFromFiles.Lines.Add(str);
  end;
 //Form1.MemoFindingEMail.Lines.Add(TCard(FindingFiles.Last).Email);
 Form11.LabelProgressFile.Text:=FName;
 Form11.LabelProgressTotal.Text:=IntToStr(ValueFiles)+' / '+IntToStr(CountFiles);
end;

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
 Form11.Log(Ok,inttostr(PCountEmails)+' : '+inttostr(PCountPhones));
// Form11.Log(Ok,'SCard : '+SCard.PhoneNumber);
 Form11.Log(Ok,'TSaveInDBaseThread.Progress');
 //Application.ProcessMessages;
end;

procedure TSaveInDBaseThread.SaveInDBase;
 var
  SCard: TCard;
begin
  FCountEmails:=0; FCountPhones:=0;
  FTotal:=0;
  for SCard in ScanFilesList do
   begin
     Form11.Log(Ok,'SCard : '+SCard.Email);
    if not Form11.FindEmailInBase(SCard.Email) then
     begin
      Form11.Log(Ok,'SCard : '+SCard.Email);
      Form11.AppendCardToBase(Emails, SCard.Email);
      FCountEmails:=FCountEmails+1;
     end;
     Form11.Log(Ok,'SCard : '+SCard.PhoneNumber);
    if Form11.FindPhoneInBase(SCard.PhoneNumber)=false then
     begin
      Form11.Log(Ok,'Find SCard : '+SCard.PhoneNumber);
      Form11.AppendCardToBase(Phones, SCard.PhoneNumber);
      FCountPhones:=FCountPhones+1;
     end;
    FTotal:=FTotal+1;

    Synchronize(Progress);
   end;
end;




end.
