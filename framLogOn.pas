unit framLogOn;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, fDM;

type
  TframeLogOn = class(TFrame)
    edtUser: TEdit;
    edtPassword: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnLogon: TButton;
    lblErrorLog: TLabel;
    procedure btnLogonClick(Sender: TObject);
  private
    FLogedOn: Boolean;
    procedure SetLogedOn(const Value: Boolean);
    function GetLogedOn: Boolean;
    procedure LogOn;
    procedure DB_LogOn(AUser, APassword: String; AID_User, AUser_Type: Integer);
  public
    User_ID: Integer;
    User_Name: String;
    User_Type: Integer;
    MFProc: TMFProc;

    property LogedOn: Boolean read GetLogedOn write SetLogedOn default false;
    procedure InitFrame;

  end;

implementation

{$R *.fmx}
//var MFProc: TMFProc;

procedure TframeLogOn.btnLogonClick(Sender: TObject);
begin
  LogedOn:= false;
  if (edtUser.Text = '') or (edtPassword.Text = '') then begin
    lblErrorLog.Visible:= not LogedOn;
    exit;
  end;

  LogOn;
  lblErrorLog.Visible:= not LogedOn;
  if LogedOn then begin
    MFProc(c_Go_First_Page, User_Name, nil);
  end;
end;

procedure TframeLogOn.LogOn;
begin
  LogedOn:= false;
  if (edtUser.Text <> '') and (edtPassword.Text <> '') then begin
    DB_LogOn(edtUser.Text, edtPassword.Text, User_ID, User_Type);
    LogedOn:= User_ID > -1;
  end;
end;

procedure TframeLogOn.DB_LogOn(AUser, APassword: String; AID_User, AUser_Type: Integer);
begin

end;

function TframeLogOn.GetLogedOn: Boolean;
begin
  result:= FLogedOn;
end;

procedure TframeLogOn.InitFrame;
begin
  lblErrorLog.Visible:= false;
  User_ID:= 1;
  User_Type:= -1;
end;

procedure TframeLogOn.SetLogedOn(const Value: Boolean);
begin
  FLogedOn := Value;
end;

end.
