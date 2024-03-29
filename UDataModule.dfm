object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 403
  Width = 606
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      'Database=C:\Delphi\Diagnostic\diagnostic.db'
      'Synchronous=Normal')
    LoginPrompt = False
    Left = 24
    Top = 8
  end
  object FDQueryPatients: TFDQuery
    IndexFieldNames = 'ID_Patient'
    Connection = FDConnection1
    SQL.Strings = (
      'select * from Patients')
    Left = 96
    Top = 8
    ParamData = <
      item
        Name = 'ID_Patient'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object DataSourcePatients: TDataSource
    DataSet = FDQueryPatients
    Left = 72
    Top = 72
  end
  object DataSourceEvents: TDataSource
    DataSet = FDQueryEvents
    Left = 184
    Top = 64
  end
  object FDQueryEvents: TFDQuery
    IndexFieldNames = 'ID_Patient'
    MasterSource = DataSourcePatients
    MasterFields = 'ID_Patient'
    Connection = FDConnection1
    SQL.Strings = (
      'select * from Events where ID_Patient=:ID_Patient')
    Left = 232
    Top = 8
    ParamData = <
      item
        Name = 'ID_PATIENT'
        DataType = ftAutoInc
        ParamType = ptInput
        Value = 1
      end>
  end
  object FDQueryTypeEvent: TFDQuery
    IndexFieldNames = 'ID_TypeEvent'
    Connection = FDConnection1
    SQL.Strings = (
      'select * from TypeEvent')
    Left = 352
    Top = 8
  end
  object DataSourceTypeEvent: TDataSource
    DataSet = FDQueryTypeEvent
    Left = 352
    Top = 80
  end
end
