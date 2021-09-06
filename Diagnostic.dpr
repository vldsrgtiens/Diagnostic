program Diagnostic;

uses
  System.StartUpCopy,
  FMX.Forms,
  UDiag in 'UDiag.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
