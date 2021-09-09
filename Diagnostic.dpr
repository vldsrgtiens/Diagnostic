program Diagnostic;

uses
  System.StartUpCopy,
  FMX.Forms,
  UDiag in 'UDiag.pas' {Form11};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm11, Form11);
  Application.Run;
end.
