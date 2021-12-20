unit UDM_Android;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.Types, FMX.Controls,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite,
  FireDAC.Comp.UI;

type
  TDM_Android = class(TDataModule)
    StyleBook1: TStyleBook;
    FDConnectionEmailDB: TFDConnection;
    FDConnectionPhoneDB: TFDConnection;
    FDQueryEmailDB: TFDQuery;
    FDQueryPhoneDB: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDQueryLettersDB: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_Android: TDM_Android;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
