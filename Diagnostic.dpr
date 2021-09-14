program Diagnostic;

uses
  System.StartUpCopy,
  FMX.Forms,
  UDataModule in 'UDataModule.pas' {DataModule1: TDataModule},
  UDiag in 'UDiag.pas' {Form11};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm11, Form11);
  Application.Run;
end.
