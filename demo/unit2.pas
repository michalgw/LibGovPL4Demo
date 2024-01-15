unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, lgKSeFTypes;

type

  { TForm2 }

  TForm2 = class(TForm)
    TreeView1: TTreeView;
  private

  public
    procedure AddObject(AObj: TObject; AParentNode: TTreeNode);
  end;

var
  Form2: TForm2;

procedure ShowObject(AObj: TKSeFObject);

implementation

uses
  TypInfo, Variants;

procedure ShowObject(AObj: TKSeFObject);
var
  F: TForm2;
begin
  F := TForm2.Create(Application);
  F.AddObject(AObj, nil);
  F.TreeView1.FullExpand;
  F.ShowModal;
  F.Free;
end;

{$R *.lfm}

{ TForm2 }

procedure TForm2.AddObject(AObj: TObject; AParentNode: TTreeNode);
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
        else if Supports(O, IKSeFArray_GUID) then
          S := S + ' (Count: ' + IntToStr((O as IKSeFArray).IntfCount) + ')';
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
      if Supports(O, IKSeFArray_GUID) then
        with O as IKSeFArray do
        begin
          for J := 0 to IntfCount - 1 do
            AddObject(IntfGetItem(J), NodeProp);
        end
      else
        AddObject(O, NodeProp)
    end;
  end;
  Freemem(PropList);
end;

end.

