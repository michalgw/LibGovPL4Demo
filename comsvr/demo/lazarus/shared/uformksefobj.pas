unit uFormKSeFObj;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, Menus;

type

  { TFormKSeFObj }

  TFormKSeFObj = class(TForm)
    MenuItem1: TMenuItem;
    PopupMenu1: TPopupMenu;
    TreeView1: TTreeView;
    procedure MenuItem1Click(Sender: TObject);
  private

  public
    procedure AddObject(AObj: IUnknown; AParentNode: TTreeNode);
  end;

var
  FormKSeFObj: TFormKSeFObj;

procedure ShowObject(AObj: IUnknown);

implementation

uses
  TypInfo, Variants, Clipbrd, LibGovPL_1_0_TLB;

{$R *.lfm}

procedure ShowObject(AObj: IUnknown);
var
  F: TFormKSeFObj;
begin
  F := TFormKSeFObj.Create(Application);
  F.AddObject(AObj, nil);
  F.TreeView1.FullExpand;
  F.ShowModal;
  F.Free;
end;

{ TFormKSeFObj }

procedure TFormKSeFObj.MenuItem1Click(Sender: TObject);
begin
  if TreeView1.Selected <> nil then
    Clipboard.AsText := TreeView1.Selected.Text;
end;

procedure TFormKSeFObj.AddObject(AObj: IUnknown; AParentNode: TTreeNode);
const
  PROP_TYPES: array[lgcPTUnknown..lgcPTObjectList] of String = (
    'Unknown type', 'String', 'Int32', 'Int64', 'Double', 'Currency', 'Boolean',
    'DateTime', 'Object', 'ObjectList');
var
  IObj, IPropObj: IlgcObject;
  IArr: IlgcList;
  PropList: Variant;
  PropName: String;
  PropType: lgcPropertyType;
  NodeObj: TTreeNode;
  NodeProp: TTreeNode;
  I, J: Integer;
  S: String;
  O: OleVariant;
  A: Pointer;
begin
  if not Supports(AObj, IlgcObject, IObj) then
    Exit;
  NodeObj := TreeView1.Items.AddChild(AParentNode, IObj.GetObjClassName);
  PropList := IObj.ListProps;
  for I := VarArrayLowBound(PropList, 1) to VarArrayHighBound(PropList, 1) do
  begin
    O := Null;
    PropName := PropList[I];
    PropType := IObj.PropType(PropName);
    S := '';
    case PropType of
      lgcPTString: S := IObj.StringProp[PropName];
      lgcPTInt32: S := IntToStr(IObj.IntegerProp[PropName]);
      lgcPTInt64: S := IntToStr(IObj.Int64Prop[PropName]);
      lgcPTDouble: S := FloatToStr(IObj.DoubleProp[PropName]);
      lgcPTCurrency: S := CurrToStr(IObj.CurrencyProp[PropName]);
      lgcPTBoolean: S := BoolToStr(IObj.BooleanProp[PropName]);
      lgcPTDateTime: S := DateTimeToStr(IObj.DateProp[PropName]);
      lgcPTObject, lgcPTObjectList: begin
        if PropType = lgcPTObject then
          S := '(Object)'
        else
          S := '(Object list)';
        O := IObj.GetObjectProp(PropName);
        if VarIsNull(O) then
          S := S + ' (Null)'
        else if VarIsType(O, varDispatch) and Supports(O, IlgcList, IArr) then
          S := S + ' (Count: ' + IntToStr(IArr.Count) + ')';
      end;
    end;
    NodeProp := TreeView1.Items.AddChild(NodeObj, Format('%s: %s = %s', [PropName, PROP_TYPES[PropType], S]));
    if (PropType in [lgcPTObject, lgcPTObjectList]) and (VarIsType(O, varDispatch)) then
      if (PropType = lgcPTObject) and Supports(O, IlgcObject, IPropObj) then
        AddObject(IPropObj, NodeProp)
      else if Supports(O, IlgcList, IArr) then
        for J := 0 to IArr.Count - 1 do
          AddObject(IArr[J], NodeProp);
  end;
end;

end.

