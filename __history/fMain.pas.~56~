unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Controls.Presentation, FMX.StdCtrls, framLogOn, fDM, framFirst_Page,
  FramPrice, FramAnalitics, FramDiagram, UNetworkState, System.ImageList,
  FMX.ImgList;

type
  TfrmMain = class(TForm)
    TabControl1: TTabControl;
    tbLogOn: TTabItem;
    tblFirst_Page: TTabItem;
    ToolBar1: TToolBar;
    frameLogOn1: TframeLogOn;
    tblPrice: TTabItem;
    tblAnalitics: TTabItem;
    tblDiagram: TTabItem;
    TabItem4: TTabItem;
    frameFirst_Page1: TframeFirst_Page;
    FramePrice1: TFramePrice;
    FrameAnalitics1: TFrameAnalitics;
    StyleBook1: TStyleBook;
    FrameDiagram1: TFrameDiagram;
    SpeedButton1: TSpeedButton;
    ImageList1: TImageList;
    procedure FormCreate(Sender: TObject);
  private
    FNetworkState: TNetworkState;
    procedure Login;
    procedure InitFrames;
    procedure DoOnChange(Sender: TObject; Value: TNetworkStateValue);
    procedure NetworkState;
  public
    procedure Event_From_Frame(Command: Integer; AMessage: String; AObject: TObject);
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.iPhone47in.fmx IOS}
{$R *.NmXhdpiPh.fmx ANDROID}

procedure TfrmMain.Login;
begin
  tbLogOn.Visible:= false;
  TabControl1.ActiveTab:= tblFirst_Page;
end;

procedure TfrmMain.DoOnChange(Sender: TObject; Value: TNetworkStateValue);
begin
//  if Value = nsConnectedWifi then
//    self.Memo1.Lines.Add('On change: Connected with WiFi')
//  else if Value = nsConnectedMobileData then
//    self.Memo1.Lines.Add('On change: Connected with mobile data')
//  else if self.FNetworkState.CurrentValue = nsDisconnected then
//    self.Memo1.Lines.Add('On change: Disconnected')
//  else
//    self.Memo1.Lines.Add('On change: Unknown');
end;

procedure TfrmMain.Event_From_Frame(Command: Integer; AMessage: String; AObject: TObject);
begin
  case Command of
    c_Go_First_Page:
      Login;
    c_Go_Price:
      TabControl1.ActiveTab:= tblPrice;
    c_Go_Analitics:
      TabControl1.ActiveTab:= tblAnalitics;
    c_Go_Diagram: begin
      TabControl1.ActiveTab:= tblDiagram;
      FrameDiagram1.DrawDiagram;
    end;
  end;


//    frameFirst_Page1
//  FramePrice1
//  FrameAnalitics1
//  FrameDiagram1
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  TabControl1.TabPosition:= TTabPosition.None;
  InitFrames;
  tbLogOn.Visible:= true;
  TabControl1.ActiveTab:= tbLogOn;
end;

procedure TfrmMain.NetworkState;
var
  vNetValue: TNetworkStateValue;
begin
  self.FNetworkState := TNetworkState.Factory(self, DoOnChange);
  vNetValue:= self.FNetworkState.CurrentValue;

  if (vNetValue <> nsConnectedWifi) and (vNetValue <> nsConnectedMobileData) then
  begin

  end;

{
    if self.FNetworkState.CurrentValue = nsConnectedWifi then
      self.Memo1.Lines.Add('On startup: Connected with WiFi')
    else if self.FNetworkState.CurrentValue = nsConnectedMobileData then
      self.Memo1.Lines.Add('On startup: Connected with mobile data')
    else if self.FNetworkState.CurrentValue = nsDisconnected then
      self.Memo1.Lines.Add('On startup: Disconnected')
    else
      self.Memo1.Lines.Add('On startup: Unknown');
}
end;

procedure TfrmMain.InitFrames;
begin
  TabControl1.TabPosition:= TTabPosition.None;
  frameLogOn1.InitFrame;
  frameLogOn1.MFProc:= Event_From_Frame;

  frameFirst_Page1.MFProc:= Event_From_Frame;
  frameFirst_Page1.InitFrame;
  FramePrice1.MFProc:= Event_From_Frame;
  FramePrice1.InitFrame;
  FrameAnalitics1.MFProc:= Event_From_Frame;
  FrameAnalitics1.InitFrame;
  FrameDiagram1.MFProc:= Event_From_Frame;
  FrameDiagram1.InitFrame;
end;

end.
