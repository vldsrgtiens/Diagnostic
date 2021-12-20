program BusinessTools;

uses
  System.StartUpCopy,
  FMX.Forms,
  UMain in 'UMain.pas' {Form11},
  UDM in 'UDM.pas' {DM: TDataModule},
  IdSASLXOAUTH in 'IdSASLXOAUTH.pas',
  EmailUnit in 'EmailUnit.pas',
  MySettings in 'MySettings.pas',
  SMSUnit in 'SMSUnit.pas';

{$R *.res}

begin
 //IdOpenSSLSetLibPath('/system/lib/');
 //IdOpenSSLSetLibPath(TPath.GetPublicPath);

  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm11, Form11);
  Application.Run;
end.
