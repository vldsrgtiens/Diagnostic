unit UDM_Windows;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.Types, FMX.Controls,
  FireDAC.Comp.UI;

type
  TDM_Windows = class(TDataModule)
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
  DM_Windows: TDM_Windows;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
