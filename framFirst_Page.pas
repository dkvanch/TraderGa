unit framFirst_Page;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, fDM;

type
  TframeFirst_Page = class(TFrame)
    Image1: TImage;
    btnGoPrice: TSpeedButton;
    btnGoAnalitics: TSpeedButton;
    Label1: TLabel;
    procedure btnGoPriceClick(Sender: TObject);
    procedure btnGoAnaliticsClick(Sender: TObject);
  private
    { Private declarations }
  public
    MFProc: TMFProc;
    procedure InitFrame;
  end;

implementation

{$R *.fmx}

procedure TframeFirst_Page.btnGoAnaliticsClick(Sender: TObject);
begin
  MFProc(c_Go_Analitics, '', nil);
end;

procedure TframeFirst_Page.btnGoPriceClick(Sender: TObject);
begin
  MFProc(c_Go_Price, '', nil);
end;

procedure TframeFirst_Page.InitFrame;
begin

end;

end.
