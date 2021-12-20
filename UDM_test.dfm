object DM_test: TDM_test
  OldCreateOrder = False
  Height = 361
  Width = 475
  object FDConnectionEmailDB: TFDConnection
    Params.Strings = (
      'Database=C:\Delphi\BusinessTools\Emails_empty.db'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 24
  end
  object FDQueryEmailDB: TFDQuery
    Connection = FDConnectionEmailDB
    SQL.Strings = (
      'select * from EMails')
    Left = 24
    Top = 80
  end
  object FDConnectionPhoneDB: TFDConnection
    Params.Strings = (
      'Database=C:\Delphi\BusinessTools\Phones_empty.db'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 104
    Top = 24
  end
  object FDQueryPhoneDB: TFDQuery
    IndexFieldNames = 'ID_Phone'
    Connection = FDConnectionPhoneDB
    SQL.Strings = (
      'select * from Phones')
    Left = 96
    Top = 88
  end
  object StyleBook1: TStyleBook
    Styles = <
      item
      end>
    Left = 168
    Top = 40
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 344
    Top = 48
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 104
    Top = 240
  end
end
