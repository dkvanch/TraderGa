program TraderGA;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {frmMain},
  framLogOn in 'framLogOn.pas' {frameLogOn: TFrame},
  fDM in 'fDM.pas' {DM: TDataModule},
  framFirst_Page in 'framFirst_Page.pas' {frameFirst_Page: TFrame},
  FramPrice in 'FramPrice.pas' {FramePrice: TFrame},
  FramAnalitics in 'FramAnalitics.pas' {FrameAnalitics: TFrame},
  FramDiagram in 'FramDiagram.pas' {FrameDiagram: TFrame},
  UNetworkState in '..\Common\firemonkey-network-state-master\Source\UNetworkState.pas',
  UNetworkState.Android in 'UNetworkState.Android.pas',
  UNetworkState.iOS in 'UNetworkState.iOS.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
