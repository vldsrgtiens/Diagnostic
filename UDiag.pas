unit UDiag;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts, FMX.TabControl, FMX.Edit,
  FMX.DateTimeCtrls, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, System.Actions, FMX.ActnList;

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
    ImagePatientPlus: TImage;
    Panel2: TPanel;
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
    Layout9: TLayout;
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
    DateEditBirthday: TDateEdit;
    Rectangle1: TRectangle;
    PatientsList: TTabItem;
    Layout15: TLayout;
    ListView1: TListView;
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
    procedure Switch1Switch(Sender: TObject);
    procedure ButtonNewPatientClick(Sender: TObject);
    procedure CornerButton2Click(Sender: TObject);
    procedure ButtonSettingsClick(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
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

procedure TForm11.CornerButton2Click(Sender: TObject);
begin
TabControl1.ActiveTab:=TabControl1.Tabs[3];
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

procedure TForm11.Switch1Switch(Sender: TObject);
begin
 if Switch1.IsChecked then
  LabelGender.Text:='женщина'
 else
  LabelGender.Text:='мужчина';

end;

end.
