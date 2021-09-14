unit UDiag;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts, FMX.TabControl, FMX.Edit,
  FMX.DateTimeCtrls, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, System.Actions,
  UDataModule,Data.DB,
  FMX.ActnList, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, FireDAC.UI.Intf, FireDAC.FMXUI.Wait,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Stan.Intf, FireDAC.Comp.UI, Data.Bind.Controls,
  Fmx.Bind.Navigator;

type
  TForm11 = class(TForm)
    TabControl1: TTabControl;
    Authorization: TTabItem;
    Home: TTabItem;
    Layout1: TLayout;
    Layout2: TLayout;
    ButtonNewPatient: TCornerButton;
    Image1: TImage;
    Label1: TLabel;
    CornerButton2: TCornerButton;
    Image2: TImage;
    Label2: TLabel;
    StatusBarTop: TStatusBar;
    StatusBarBottom: TStatusBar;
    NewPatient: TTabItem;
    Layout3: TLayout;
    Panel1: TPanel;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    Label3: TLabel;
    EditLastName: TEdit;
    Layout7: TLayout;
    Label4: TLabel;
    EditFirstName: TEdit;
    Layout8: TLayout;
    Label5: TLabel;
    EditMiddleName: TEdit;
    PanelKeyboard: TPanel;
    Layout10: TLayout;
    Label6: TLabel;
    Switch1: TSwitch;
    LabelGender: TLabel;
    Layout11: TLayout;
    Label7: TLabel;
    EditPhone1: TEdit;
    Image3: TImage;
    Layout12: TLayout;
    Label8: TLabel;
    EditPhone2: TEdit;
    Image4: TImage;
    Layout13: TLayout;
    Label9: TLabel;
    EditPhoneEmail: TEdit;
    Image5: TImage;
    Layout14: TLayout;
    Label10: TLabel;
    Rectangle1: TRectangle;
    PatientsList: TTabItem;
    Layout15: TLayout;
    Layout16: TLayout;
    PatientCard: TTabItem;
    Layout17: TLayout;
    Layout18: TLayout;
    Panel3: TPanel;
    TabControlPatienCard: TTabControl;
    Layout19: TLayout;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    Image6: TImage;
    Layout20: TLayout;
    LabelPatientCardFirstName: TLabel;
    LabelPatientCardLastName: TLabel;
    LabelPatientCardMiddleName: TLabel;
    Image7: TImage;
    Image8: TImage;
    ButtonSettings: TCornerButton;
    Image9: TImage;
    Label11: TLabel;
    Settings: TTabItem;
    Layout21: TLayout;
    ActionList1: TActionList;
    ChangeTabAction1: TChangeTabAction;
    StyleBook1: TStyleBook;
    Panel4: TPanel;
    Layout22: TLayout;
    Image10: TImage;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    CornerButton1: TCornerButton;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    SpeedButton1: TSpeedButton;
    Label12: TLabel;
    ListView1: TListView;
    Label13: TLabel;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkFillControlToField3: TLinkFillControlToField;
    Layout23: TLayout;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    ListView2: TListView;
    BindSourceDB2: TBindSourceDB;
    LinkFillControlToField6: TLinkFillControlToField;
    DateEditBirthdayDate: TDateEdit;
    LinkControlToFieldBirthdayDate: TLinkControlToField;
    procedure Switch1Switch(Sender: TObject);
    procedure ButtonNewPatientClick(Sender: TObject);
    procedure CornerButton2Click(Sender: TObject);
    procedure ButtonSettingsClick(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CornerButton1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

{$R *.fmx}

procedure TForm11.ButtonNewPatientClick(Sender: TObject);
begin
 TabControl1.ActiveTab:=TabControl1.Tabs[2];
end;

procedure TForm11.ButtonSettingsClick(Sender: TObject);
begin
TabControl1.ActiveTab:=TabControl1.Tabs[5];
end;

procedure TForm11.CornerButton1Click(Sender: TObject);
begin
DataModule1.FDConnection1.Connected:= True;
   if DataModule1.FDConnection1.Connected then
    CornerButton1.Text:= 'Connected'
   else
    CornerButton1.Text:= 'Not Connected';
end;

procedure TForm11.CornerButton2Click(Sender: TObject);
begin
TabControl1.ActiveTab:=TabControl1.Tabs[3];
end;

procedure TForm11.FormCreate(Sender: TObject);
begin

 //DataModule1.FDConnection1.Connected:= True;
   if DataModule1.FDConnection1.Connected then
    begin
     CornerButton1.Text:= 'Connected';
     DataModule1.FDQueryPatients.Active:=true;
     DataModule1.FDQueryEvents.Active:=true;
    end
   else
    begin
     CornerButton1.Text:= 'Not Connected';
    end;

end;

procedure TForm11.Image7Click(Sender: TObject);
begin


 case  TabControl1.TabIndex of
  1: begin  //Home
      //TabControl1.ActiveTab:=Authorization;
      ChangeTabAction1.Tab := PatientsList;
      ChangeTabAction1.Direction:= TTabTransitionDirection.Reversed;
      // Call the action
      ChangeTabAction1.ExecuteTarget(nil);
     end;

 end;

end;

procedure TForm11.Image8Click(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TForm11.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  DataModule1.FDQueryPatients.Locate('FullName',AItem.Text,[loPartialKey]);
  Label16.Text:='кол-во записей: '+IntToStr(DataModule1.FDQueryEvents.RecordCount);

  //DataModule1.FDQueryEvents.ExecSQL;
  //DataModule1.FDQueryEvents.Refresh;
end;

procedure TForm11.SpeedButton1Click(Sender: TObject);
begin
 DataModule1.FDQueryPatients.Next;
 //BindSourceDB2.DataSet.Refresh;
end;

procedure TForm11.Switch1Switch(Sender: TObject);
begin
 if Switch1.IsChecked then
  LabelGender.Text:='женщина'
 else
  LabelGender.Text:='мужчина';

end;

end.
