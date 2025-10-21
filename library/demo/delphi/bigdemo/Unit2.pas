unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, LibGovPl4KSeFObj;

type
  TForm2 = class(TForm)
    TreeView1: TTreeView;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AddObject(AObj: TKSeFObject; AParentNode: TTreeNode);
  end;

var
  Form2: TForm2;

procedure ShowObject(AObj: TKSeFObject);

implementation

uses
  TypInfo;

{$R *.dfm}

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

procedure TForm2.AddObject(AObj: TKSeFObject; AParentNode: TTreeNode);
var
  PropList: PPropList;
  PropCnt: Integer;
  NodeObj: TTreeNode;
  NodeProp: TTreeNode;
  Prop: PPropInfo;
  I, J: Integer;
  S: String;
  O: TObject;
begin
  NodeObj := TreeView1.Items.AddChild(AParentNode, AObj.ClassName);
  PropCnt := GetPropList(AObj, PropList);
  for I := 0 to PropCnt - 1 do
  begin
    O := nil;
    Prop := PropList^[I];
    S := Prop^.Name + ': ' + Prop^.PropType^.Name + ' = ';
    case Prop^.PropType^.Kind of
      tkEnumeration: S := S + GetEnumName(Prop^.PropType^, GetOrdProp(AObj, Prop));
      tkSet: S := S + GetSetProp(AObj, Prop, True);
      tkInteger: S := S + IntToStr(GetOrdProp(AObj, Prop));
      tkInt64: S := S + IntToStr(GetInt64Prop(AObj, Prop));
      tkFloat: begin
        if SameText('TDateTime', Prop^.PropType^.Name) then
          S := S + DateTimeToStr(GetFloatProp(AObj, Prop))
        else
          S := S + FloatToStr(GetFloatProp(AObj, Prop));
      end;
      tkLString, tkString: S := S + GetStrProp(AObj, Prop);
      tkClass: begin
        S := S + '(object)';
        O := GetObjectProp(AObj, Prop);
        if O = nil then
          S := S + ' (NIL)'
        else if O is TKSeFArray then
          S := S + ' (Count: ' + IntToStr(TKSeFArray(O).Count) + ')';
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
      else if (O is TKSeFObject) then
        AddObject(TKSeFObject(O), NodeProp)
    end;
  end;
  Freemem(PropList);
end;

end.
