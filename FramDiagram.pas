unit FramDiagram;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMXTee.Engine, FMXTee.Procs, FMXTee.Chart, fDM,
  FMXTee.Series;

type
  TFrameDiagram = class(TFrame)
    Chart1: TChart;
    Panel1: TPanel;
    Series1: TBarSeries;
    Series2: TBarSeries;
  private
    procedure Get_New_Line_Series(ASeries: TBarSeries);
  public
    MFProc: TMFProc;
    AnaliticObject: TAnaliticObject;
    procedure InitFrame;
    procedure DrawDiagram;
  end;

implementation

{$R *.fmx}

{ TFrameDiagram }

procedure TFrameDiagram.InitFrame;
begin

end;

procedure TFrameDiagram.DrawDiagram;
var
  vGA_Min: Double;
  vGA_Mid: Double;
  vGA_Max: Double;
  vCo_Min: Double;
  vCo_Mid: Double;
  vCo_Max: Double;
begin
  Series1.Clear;
  Series2.Clear;

  DM.spDiagram_Data.Prepare;

  DM.qrDiagramData.ParamByName('in_month_rera').AsInteger:= AnaliticObject.Month_ID;
  DM.qrDiagramData.ParamByName('in_id_shop').AsInteger:= AnaliticObject.Shop_ID;
  DM.qrDiagramData.ParamByName('in_id_kind').AsInteger:= AnaliticObject.Kind_ID;
  DM.qrDiagramData.ParamByName('in_id_concurent').AsInteger:= AnaliticObject.Concurent_ID;
  DM.qrDiagramData.ParamByName('in_id_product').AsInteger:= AnaliticObject.Product_ID;

  DM.qrDiagramData.Execute;

  vGA_Min:= DM.qrDiagramData.ParamByName('out_ga_min').AsFloat;
  vGA_Mid:= DM.qrDiagramData.ParamByName('out_ga_mid').AsFloat;
  vGA_Max:= DM.qrDiagramData.ParamByName('out_ga_max').AsFloat;

  vCo_Min:= DM.qrDiagramData.ParamByName('out_conc_min').AsFloat;
  vCo_Mid:= DM.qrDiagramData.ParamByName('out_conc_mid').AsFloat;
  vCo_Max:= DM.qrDiagramData.ParamByName('out_conc_max').AsFloat;

  Series1.AddXY(vGA_Min, 1);
  Series1.AddXY(vGA_Mid, 2);
  Series1.AddXY(vGA_Max, 3);

  Series1.AddXY(vCo_Min, 1);
  Series1.AddXY(vCo_Mid, 2);
  Series1.AddXY(vCo_Max, 3);

end;

procedure TFrameDiagram.Get_New_Line_Series(ASeries: TBarSeries);
begin
  //ASeries.AddXY()
end;

end.
