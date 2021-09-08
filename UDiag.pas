unit UDiag;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Objects, FMX.StdCtrls, FMX.Controls.Presentation,
   IOUtils, FMX.MultiResBitmap ,
  FMX.Layouts;

type
  TForm1 = class(TForm)
    TabControl1: TTabControl;
    Authorization: TTabItem;
    HomeTab: TTabItem;
    Layout1: TLayout;
    SpeedButton1: TSpeedButton;

  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}







end.
