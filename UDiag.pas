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
    Intro: TTabItem;
    TabItem2: TTabItem;
    Layout1: TLayout;
    ButtonDirectory: TSpeedButton;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    ButtonNext: TSpeedButton;
    ButtonExit: TSpeedButton;
    Image6: TImage;
    procedure ButtonDirectoryClick(Sender: TObject);
    procedure ButtonExitClick(Sender: TObject);
    procedure ButtonNextClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Findicons;
    procedure Rect(FileName: string);
    procedure LoadPNG(FileName: string);
  end;

var
  Form1: TForm1;
  chosenDirectory: string;
implementation

{$R *.fmx}

procedure TForm1.ButtonDirectoryClick(Sender: TObject);
begin
if SelectDirectory('Выберите каталог', 'C:\', chosenDirectory)
  then ShowMessage('Выбранный каталог = '+chosenDirectory)
  else ShowMessage('Выбор каталога прервался');
end;

procedure TForm1.ButtonExitClick(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TForm1.ButtonNextClick(Sender: TObject);
begin
 Rect('s');
end;

procedure TForm1.Findicons;
var
s,NowDir: string;

begin
 NowDir:=chosenDirectory+'\'+TimeToStr(now);
 TDirectory.CreateDirectory(NowDir);

 for s in TDirectory.GetFiles(chosenDirectory, '*.png') do
  begin
   LoadPNG(s);
   Exit;
  end;


end;

procedure TForm1.LoadPNG(FileName: string);
begin

end;

procedure TForm1.Rect(FileName: string);
const
  RequiredSclae = 1.0;
var
  BitmapItem: TFixedBitmapItem;
  Bitmap: TBitmap;
begin
  if OpenDialog1.Execute then
  begin
    // Запрашиваем картинку для нужного Scale
    Bitmap := Image6.MultiResBitmap.Bitmaps[RequiredSclae];
    // Проверяем, есть картинка или нет.
    if Bitmap = nil then
    begin
      // Если нет, то заводим контейнер для новой картинки
      BitmapItem := Image6.MultiResBitmap.Add;
      BitmapItem.Scale := RequiredSclae;
      Bitmap := BitmapItem.Bitmap;
    end;
    Bitmap.LoadFromFile(OpenDialog1.FileName);
    Bitmap.Canvas.  .Canvas.CopyRect(Rect(0, 0, 150, 150), bitm.Canvas, Rect(0, 0, 50, 50));
  end;
end;

{
procedure TForm1.Rect(FileName: string);
const
  MaxPixelCountA = MaxInt div SizeOf(TRGBQuad);
type
  PRGBAArray = ^TRGBAArray;
  TRGBAArray = array[0..MaxPixelCountA-1] of TRGBQuad;
var
  y,x: Integer;
  bmp: TBitmap;
  png, pnga: TPngObject;
  a: PRGBAArray;
  b: pByteArray;
begin
  png := TPngObject.Create;
  png.LoadFromFile(FileName);
  png.CreateAlpha;
  pnga := TPngObject.CreateBlank(COLOR_RGBALPHA, 16, 32, 32);
  bmp := Tbitmap.Create;
  bmp.Assign(png);
  bmp.PixelFormat:=pf32bit;
  For y:=0 To 31 Do // По сути это будет высота вырезаемого участва
  begin
    a := pnga.ScanLine[y];
    b := png.AlphaScanline[y];
    For x:=0 To 31 Do // Ну а это ширина
    begin
      a[x].rgbReserved := b[x];
    end;
  end;
  Form1.Image1.Canvas.Draw(64,0,pnga);
end;
end;
}

end.
