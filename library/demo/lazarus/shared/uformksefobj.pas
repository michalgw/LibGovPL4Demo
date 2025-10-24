unit uFormKSeFObj;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, Menus,
  LibGovPl4KSeFObj, LibGovPl4KSeFObj2;

type

  { TFormKSeFObj }

  TFormKSeFObj = class(TForm)
    MenuItem1: TMenuItem;
    PopupMenu1: TPopupMenu;
    TreeView1: TTreeView;
    procedure MenuItem1Click(Sender: TObject);
  private

  public
    procedure AddObject(AObj: TObject; AParentNode: TTreeNode);
  end;

var
  FormKSeFObj: TFormKSeFObj;

procedure ShowObject(AObj: TObject);

implementation

uses
  TypInfo, Variants, Clipbrd;

{$R *.lfm}

procedure ShowObject(AObj: TObject);
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

procedure TFormKSeFObj.AddObject(AObj: TObject; AParentNode: TTreeNode);
var
  PropList: PPropList;
  PropCnt: Integer;
  NodeObj: TTreeNode;
  NodeProp: TTreeNode;
  Prop: PPropInfo;
  I, J: Integer;
  S: String;
  O: TObject;
  P: Pointer;
begin
  NodeObj := TreeView1.Items.AddChild(AParentNode, AObj.ClassName);
  PropCnt := GetPropList(AObj, PropList);
  for I := 0 to PropCnt - 1 do
  begin
    O := nil;
    Prop := PropList^[I];
    S := Prop^.Name + ': ' + Prop^.PropType^.Name + ' = ';
    case Prop^.PropType^.Kind of
      tkEnumeration: S := S + GetEnumName(Prop^.PropType, GetOrdProp(AObj, Prop));
      tkSet: S := S + GetSetProp(AObj, Prop, True);
      tkInteger, tkBool: S := S + IntToStr(GetOrdProp(AObj, Prop));
      tkInt64, tkQWord: S := S + IntToStr(GetInt64Prop(AObj, Prop));
      tkFloat: begin
        if SameText('TDateTime', Prop^.PropType^.Name) then
          S := S + DateTimeToStr(GetFloatProp(AObj, Prop))
        else
          S := S + FloatToStr(GetFloatProp(AObj, Prop));
      end;
      tkAString, tkSString: S := S + GetStrProp(AObj, Prop);
      tkClass: begin
        S := S + '(object)';
        O := GetObjectProp(AObj, Prop);
        if O = nil then
          S := S + ' (NIL)'
        else if O is TKSeFArray then
          S := S + ' (Count: ' + IntToStr(TKSeFArray(O).Count) + ')'
        else if O is TKSeF2Array then
          S := S + ' (Count: ' + IntToStr(TKSeFArray(O).Count) + ')';
      end;
      tkDynArray: begin
        {if GetTypeData(Prop^.PropType)^.ElType2^.Kind in [tkSString, tkAString, tkUString] then
        begin
          P := GetDynArrayProp(AObj, Prop);
          S := S + ' (Count: ' + IntToStr(Length(TStringArray(P))) + ') = ';
          for J := 0 to Length(TStringArray(P)) - 1 do
          begin
            S := S + TStringArray(P)[J];
            if J < Length(TStringArray(P)) - 1 then
              S := S + ', ';
          end;
        end;}
      end;
    end;
    NodeProp := TreeView1.Items.AddChild(NodeObj, S);
    if (Prop^.PropType^.Kind = tkClass) and Assigned(O) then
    begin
      if (O is TKSeFArray) then
      begin
        for J := 0 to TKSeFArray(O).Count - 1 do
          AddObject(TKSeFArray(O).Items[J], NodeProp);
      end
      else if (O is TKSeF2Array) then
      begin
        for J := 0 to TKSeF2Array(O).Count - 1 do
          AddObject(TKSeF2Array(O).Items[J], NodeProp);
      end
      else if (O is TKSeFObject) then
        AddObject(TKSeFObject(O), NodeProp)
      else if (O is TKSeF2Object) then
        AddObject(TKSeF2Object(O), NodeProp)
    end;
  end;
  Freemem(PropList);
end;

end.

