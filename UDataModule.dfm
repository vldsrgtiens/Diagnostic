object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 403
  Width = 606
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      'Database=C:\Delphi\Diagnostic\diagnostic.db'
      'Synchronous=Normal')
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 8
  end
  object FDQueryPatients: TFDQuery
    Active = True
    IndexFieldNames = 'ID_Patient'
    Connection = FDConnection1
    SQL.Strings = (
      'select * from Patients')
    Left = 24
    Top = 64
    ParamData = <
      item
        Name = 'ID_Patient'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object DataSourcePatients: TDataSource
    DataSet = FDQueryPatients
    Left = 144
    Top = 72
  end
  object DataSourceEvents: TDataSource
    DataSet = FDQueryEvents
    Left = 144
    Top = 176
  end
  object FDQueryEvents: TFDQuery
    Active = True
    IndexFieldNames = 'ID_Patient'
    MasterSource = DataSourcePatients
    MasterFields = 'ID_Patient'
    Connection = FDConnection1
    SQL.Strings = (
      'select * from Events where ID_Patient=:ID_Patient')
    Left = 32
    Top = 160
    ParamData = <
      item
        Name = 'ID_PATIENT'
        DataType = ftAutoInc
        ParamType = ptInput
        Value = 1
      end>
  end
end
