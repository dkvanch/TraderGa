﻿unit FramPrice;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListBox, FMX.Controls.Presentation, FMX.Objects, FMX.Edit, fDM, Data.DB,
  MemDS, DBAccess, Uni, FMX.EditBox, FMX.NumberBox;

type
  TFramePrice = class(TFrame)
    cbShop: TComboBox;
    cbKind: TComboBox;
    cbProduct: TComboBox;
    cbConcurent: TComboBox;
    cbConcurentSize: TComboBox;
    cbGASize: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    btnSavePrice: TSpeedButton;
    edtGAPrice: TNumberBox;
    edtConcurentPrice: TNumberBox;
    spSavePrice: TUniStoredProc;
    procedure btnSavePriceClick(Sender: TObject);
  private
    procedure Fill_Combos(ACombo: TComboBox; AQuery: TUniQuery);
    procedure OpenAllQueries;
    function SavePrice: Integer;
    function SavePriceToDB(AShop_ID, AKind_ID, AProduct_ID, AConcurent_ID, AConcurentSize_ID, AGASize_ID: Integer; AConcurentPrice, AGAPrice: Double): Integer;
  public
    MFProc: TMFProc;
    procedure InitFrame;
  end;

implementation

{$R *.fmx}

procedure TFramePrice.btnSavePriceClick(Sender: TObject);
var
  S: string;
begin
  if SavePrice > 0 then
  begin
    edtConcurentPrice.Value:= 0;
    edtGAPrice.Value:= 0;
    S:= 'ფასი დაფიქსირებულია, გმადლობთ';
  end
  else
    S:= 'ფასი არ დაფიქსირდა, შეამოწმეთ მონაცემები';

  MFProc(c_Go_First_Page, S, nil);
end;

procedure TFramePrice.InitFrame;
begin
  OpenAllQueries;

  Fill_Combos(cbShop, DM.qrShop);
  Fill_Combos(cbKind, DM.qrKind);
  Fill_Combos(cbProduct, DM.qrProduct);
  Fill_Combos(cbConcurent, DM.qrConcurent);
  Fill_Combos(cbConcurentSize, DM.qrConcurent_Size);
  Fill_Combos(cbGASize, DM.qrGA_Size);
end;

procedure TFramePrice.OpenAllQueries;
var
  I: Integer;
  vQ: TUniQuery;
begin
  for I:= 0 to self.ComponentCount - 1 do
    if self.Components[I] is TUniQuery then
    begin
      vQ:= TUniQuery(self.Components[I]);
      if not vQ.Active then
        vQ.Open;
    end;
end;

procedure TFramePrice.Fill_Combos(ACombo: TComboBox; AQuery: TUniQuery);
var
  Item: TListBoxItem;
begin
  ACombo.Clear;
  AQuery.First;

  ACombo.ListBox.BeginUpdate;
  while not AQuery.eof do
  begin
    Item:= TListBoxItem.Create(ACombo);
    Item.Height:= 40;

    Item.ItemData.Text:= AQuery.FieldByName('Item_Name').AsString;
    Item.Tag:= AQuery.FieldByName('ID_Item').AsInteger;
    ACombo.AddObject(Item);

    AQuery.Next;
  end;
  AQuery.First;
  ACombo.ItemIndex:= 0;
  ACombo.ListBox.EndUpdate;
end;

function TFramePrice.SavePrice: Integer;
var
  vShop, vKind, vProduct, vConcurent, vConcurentSize, vGASize: TListBoxItem;
  vConcurentPrice, vGAPrice: Single;
begin
  vShop:= cbShop.ListItems[cbShop.ItemIndex];
  vKind:= cbKind.ListItems[cbKind.ItemIndex];
  vProduct:= cbProduct.ListItems[cbProduct.ItemIndex];
  vConcurent:= cbConcurent.ListItems[cbConcurent.ItemIndex];
  vConcurentSize:= cbConcurentSize.ListItems[cbConcurentSize.ItemIndex];
  vGASize:= cbGASize.ListItems[cbGASize.ItemIndex];

  vConcurentPrice:= edtConcurentPrice.Value;
  vGAPrice:= edtGAPrice.Value;

  if (vConcurentPrice > 0) and (vGAPrice > 0) then
    result:= SavePriceToDB(vShop.Tag, vKind.Tag, vProduct.Tag, vConcurent.Tag, vConcurentSize.Tag, vGASize.Tag, vConcurentPrice, vGAPrice)
  else
    result:= -1;
end;

function TFramePrice.SavePriceToDB(AShop_ID, AKind_ID, AProduct_ID, AConcurent_ID, AConcurentSize_ID, AGASize_ID: Integer; AConcurentPrice, AGAPrice: Double): Integer;
begin
  spSavePrice.Prepare;
  spSavePrice.ParamByName('').AsInteger:= AShop_ID;
  spSavePrice.ParamByName('').AsInteger:= AKind_ID;
  spSavePrice.ParamByName('').AsInteger:= AProduct_ID;
  spSavePrice.ParamByName('').AsInteger:= AConcurent_ID;
  spSavePrice.ParamByName('').AsInteger:= AConcurentSize_ID;
  spSavePrice.ParamByName('').AsInteger:= AGASize_ID;
  spSavePrice.ParamByName('').AsFloat:= AConcurentPrice;
  spSavePrice.ParamByName('').AsFloat:= AGAPrice;
  spSavePrice.Execute;
  result:= spSavePrice.ParamByName('').AsInteger;
end;

end.
