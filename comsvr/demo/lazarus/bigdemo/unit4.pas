unit Unit4;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  StdCtrls, ActnList, SynEdit, SynHighlighterPas, uPSComponent, SynEditTypes,
  SynEditMarkupSpecialLine, uPSUtils, uPSComponent_COM, uPSComponent_Default,
  uPSComponent_Forms, uPSComponent_Controls, uPSComponent_StdCtrls, uPSRuntime,
  uPSDebugger;

type

  { TForm4 }

  TForm4 = class(TForm)
    ActionZatrzymaj: TAction;
    ActionPrzejdz: TAction;
    ActionWejdz: TAction;
    ActionWstrzymaj: TAction;
    ActionUruchom: TAction;
    ActionSkladnia: TAction;
    ActionZapisz: TAction;
    ActionOtworz: TAction;
    ActionNowy: TAction;
    ActionList1: TActionList;
    ImageList1: TImageList;
    MemoLog: TMemo;
    OpenDialog1: TOpenDialog;
    PSDbg: TPSScriptDebugger;
    PSDllPlugin1: TPSDllPlugin;
    PSImport_Classes1: TPSImport_Classes;
    PSImport_ComObj1: TPSImport_ComObj;
    PSImport_Controls1: TPSImport_Controls;
    PSImport_DateUtils1: TPSImport_DateUtils;
    PSImport_Forms1: TPSImport_Forms;
    PSImport_StdCtrls1: TPSImport_StdCtrls;
    SaveDialog1: TSaveDialog;
    Splitter1: TSplitter;
    StatusBar: TStatusBar;
    SynEditSrc: TSynEdit;
    SynPasSyn1: TSynPasSyn;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    procedure ActionNowyExecute(Sender: TObject);
    procedure ActionOtworzExecute(Sender: TObject);
    procedure ActionPrzejdzExecute(Sender: TObject);
    procedure ActionSkladniaExecute(Sender: TObject);
    procedure ActionUruchomExecute(Sender: TObject);
    procedure ActionWejdzExecute(Sender: TObject);
    procedure ActionWstrzymajExecute(Sender: TObject);
    procedure ActionZapiszExecute(Sender: TObject);
    procedure ActionZatrzymajExecute(Sender: TObject);
    procedure PSDbgAfterExecute(Sender: TPSScript);
    procedure PSDbgBreakpoint(Sender: TObject; const FileName: tbtstring;
      APosition, Row, Col: Cardinal);
    procedure PSDbgCompile(Sender: TPSScript);
    procedure PSDbgExecute(Sender: TPSScript);
    procedure PSDbgIdle(Sender: TObject);
    procedure PSDbgLineInfo(Sender: TObject; const FileName: tbtstring;
      APosition, Row, Col: Cardinal);
    function PSDbgNeedFile(Sender: TObject; const OrginFileName: tbtstring;
      var FileName, Output: tbtstring): Boolean;
    procedure SynEditSrcDropFiles(Sender: TObject; X, Y: integer;
      AFiles: TStrings);
    procedure SynEditSrcSpecialLineColors(Sender: TObject; Line: integer;
      var Special: boolean; var FG, BG: TColor);
    procedure SynEditSrcStatusChange(Sender: TObject; Changes: TSynStatusChanges
      );
  private
    FActiveLine: Integer;
    FFileName: String;
    FResume: Boolean;
    function SaveCheck: Boolean;
    procedure DebugStr(AValue: String);
    procedure DebugVar(AValue: Variant);
    procedure ObjAdd(AObj: Variant);
    function GetKSeF: Variant;

    function Compile: Boolean;
    function Execute: Boolean;
  public

  end;

var
  Form4: TForm4;

implementation

uses Unit1, Variants, VarUtils, LibGovPL_1_0_TLB;

{$R *.lfm}

const
  isRunningOrPaused = [isRunning, isPaused];

{ TForm4 }

procedure TForm4.SynEditSrcStatusChange(Sender: TObject;
  Changes: TSynStatusChanges);
begin
  StatusBar.SimpleText := IntToStr(SynEditSrc.CaretY)+':'+IntToStr(SynEditSrc.CaretX);
end;

function TForm4.SaveCheck: Boolean;
begin
  if SynEditSrc.Modified then
  begin
    case MessageDlg('Plik został zmieniony. Czy zapisać zmiany?', mtConfirmation, mbYesNoCancel, 0) of
      mrYes: begin
        ActionZapisz.Execute;
        Result := FFileName <> '';
      end;
      mrNo: Result := True;
      else
        Result := False;
    end;
  end
  else
    Result := True;
end;

procedure TForm4.DebugStr(AValue: String);
begin
  MemoLog.Append(AValue);
end;

procedure TForm4.DebugVar(AValue: Variant);
begin
  try
    DebugStr(VarToStr(AValue));
  except
    on E: Exception do
      DebugStr('Wyjątek: ' + E.Message);
  end;
end;

procedure TForm4.ObjAdd(AObj: Variant);
var
  I: IlgcObject;
begin
  if VarIsType(AObj, [varDispatch, varUnknown]) and Supports(AObj, IlgcObject, I) then
    Form1.ObjAdd(I);
end;

function TForm4.GetKSeF: Variant;
begin
  Result := Form1.KSeF;
end;

function TForm4.Compile: Boolean;
var
  i: Longint;
begin
  PSDbg.Script.Assign(SynEditSrc.Lines);
  Result := PSDbg.Compile;
  //MemoLog.Clear;
  for i := 0 to PSDbg.CompilerMessageCount -1 do
  begin
    MemoLog.Append(PSDbg.CompilerMessages[i].MessageToString);
  end;
  if Result then
    MemoLog.Append('Skompilowano poprawnie.');
end;

function TForm4.Execute: Boolean;
begin
  if PSDbg.Execute then
  begin
    MemoLog.Append('Zakończono sukcesem.');
    Result := True;
  end else
  begin
    MemoLog.Append(Format('[Runtime error] %s(%d:%d), bytecode(%d:%d): %s',
      [ExtractFileName(FFileName), PSDbg.ExecErrorRow, PSDbg.ExecErrorCol,
      PSDbg.ExecErrorProcNo, PSDbg.ExecErrorByteCodePosition, PSDbg.ExecErrorToString])); //Birb
    Result := False;
  end;
end;

procedure TForm4.SynEditSrcSpecialLineColors(Sender: TObject; Line: integer;
  var Special: boolean; var FG, BG: TColor);
begin
  if PSDbg.HasBreakPoint(PSDbg.MainFileName, Line) then
  begin
    Special := True;
    if Line = FActiveLine then
    begin
      BG := clWhite;
      FG := clRed;
    end else
    begin
      FG := clWhite;
      BG := clRed;
    end;
  end
  else if Line = FActiveLine then
  begin
    Special := True;
    FG := clWhite;
    bg := clBlue;
  end
  else
    Special := False;
end;

procedure TForm4.SynEditSrcDropFiles(Sender: TObject; X, Y: integer;
  AFiles: TStrings);
begin
  if AFiles.Count>=1 then
    if SaveCheck then
    begin
      SynEditSrc.ClearAll;
      SynEditSrc.Lines.LoadFromFile(AFiles[0]);
      SynEditSrc.Modified := False;
      FFileName := AFiles[0];
    end;
end;

procedure TForm4.ActionNowyExecute(Sender: TObject);
begin
  if SaveCheck then
  begin
    SynEditSrc.ClearAll;
    SynEditSrc.Modified := False;
    FFileName := '';
  end;
end;

procedure TForm4.ActionOtworzExecute(Sender: TObject);
begin
  if SaveCheck then //check if script changed and not yet saved
  begin
    if OpenDialog1.Execute then
    begin
      SynEditSrc.ClearAll;
      SynEditSrc.Lines.LoadFromFile(OpenDialog1.FileName);
      SynEditSrc.Modified := False;
      FFileName := OpenDialog1.FileName;
    end;
  end;
end;

procedure TForm4.ActionPrzejdzExecute(Sender: TObject);
begin
  if PSDbg.Exec.Status in isRunningOrPaused then
    PSDbg.StepOver
  else
  begin
    if Compile then
    begin
      PSDbg.StepOver;
      Execute;
    end;
  end;
end;

procedure TForm4.ActionSkladniaExecute(Sender: TObject);
begin
  Compile;
end;

procedure TForm4.ActionUruchomExecute(Sender: TObject);
begin
  if PSDbg.Running then
  begin
    FResume := True
  end else
  begin
    if Compile then
      Execute;
  end;
end;

procedure TForm4.ActionWejdzExecute(Sender: TObject);
begin
  if PSDbg.Exec.Status in isRunningOrPaused then
    PSDbg.StepInto
  else
  begin
    if Compile then
    begin
      PSDbg.StepInto;
      Execute;
    end;
  end;
end;

procedure TForm4.ActionWstrzymajExecute(Sender: TObject);
begin
  if PSDbg.Exec.Status = isRunning then
  begin
    PSDbg.Pause;
    PSDbg.StepInto;
  end;
end;

procedure TForm4.ActionZapiszExecute(Sender: TObject);
begin
  SaveDialog1.FileName := FFileName;
  if SaveDialog1.Execute then
  begin
    FFileName := SaveDialog1.FileName;
    SynEditSrc.Lines.SaveToFile(FFileName);
    SynEditSrc.Modified := False;
  end;
end;

procedure TForm4.ActionZatrzymajExecute(Sender: TObject);
begin
  if PSDbg.Exec.Status in isRunningOrPaused then
    PSDbg.Stop;
end;

procedure TForm4.PSDbgAfterExecute(Sender: TPSScript);
begin
  Caption := 'Skrypt';
  FActiveLine := 0;
  SynEditSrc.Refresh;
end;

procedure TForm4.PSDbgBreakpoint(Sender: TObject; const FileName: tbtstring;
  APosition, Row, Col: Cardinal);
begin
  FActiveLine := Row;
  if (FActiveLine < SynEditSrc.TopLine +2) or (FActiveLine > SynEditSrc.TopLine + SynEditSrc.LinesInWindow -2) then
  begin
    SynEditSrc.TopLine := FActiveLine - (SynEditSrc.LinesInWindow div 2);
  end;
  SynEditSrc.CaretY := FActiveLine;
  SynEditSrc.CaretX := 1;

  SynEditSrc.Refresh;
end;

procedure TForm4.PSDbgCompile(Sender: TPSScript);
begin
  Sender.AddMethod(Self, @TForm4.DebugStr, 'procedure DebugStr(S: String)');
  Sender.AddMethod(Self, @TForm4.DebugVar, 'procedure DebugVar(V: Variant)');
  Sender.AddMethod(Self, @TForm4.ObjAdd, 'procedure ObjAdd(AObj: Variant)');
  Sender.AddMethod(Self, @TForm4.GetKSeF, 'function GetKSeF: Variant');
  //Sender.AddRegisteredVariable('Self', 'TForm');
  //Sender.AddRegisteredVariable('Application', 'TApplication');
end;

procedure TForm4.PSDbgExecute(Sender: TPSScript);
begin
  //PSDbg.SetVarToInstance('SELF', Self);
  //PSDbg.SetVarToInstance('APPLICATION', Application);
  Caption := 'Skrypt - uruchomiono';
end;

procedure TForm4.PSDbgIdle(Sender: TObject);
begin
  Application.ProcessMessages; //Birb: don't use Application.HandleMessage here, else GUI will be unrensponsive if you have a tight loop and won't be able to use Run/Reset menu action
  if FResume then
  begin
    FResume := False;
    PSDbg.Resume;
    FActiveLine := 0;
    SynEditSrc.Refresh;
  end;
end;

procedure TForm4.PSDbgLineInfo(Sender: TObject; const FileName: tbtstring;
  APosition, Row, Col: Cardinal);
begin
  if PSDbg.Exec.DebugMode <> dmRun then
  begin
    FActiveLine := Row;
    if (FActiveLine < SynEditSrc.TopLine +2) or (FActiveLine > SynEditSrc.TopLine + SynEditSrc.LinesInWindow -2) then
    begin
      SynEditSrc.TopLine := FActiveLine - (SynEditSrc.LinesInWindow div 2);
    end;
    SynEditSrc.CaretY := FActiveLine;
    SynEditSrc.CaretX := 1;

    SynEditSrc.Refresh;
  end
  else
    Application.ProcessMessages;
end;

function TForm4.PSDbgNeedFile(Sender: TObject; const OrginFileName: tbtstring;
  var FileName, Output: tbtstring): Boolean;
var
  Path: string;
  F: TFileStream;
begin
  if FFileName <> '' then
    Path := ExtractFilePath(FFileName)
  else
    Path := ExtractFilePath(ParamStr(0));
  Path := Path + FileName;
  try
    F := TFileStream.Create(Path, fmOpenRead or fmShareDenyWrite);
  except
    Result := False;
    Exit;
  end;
  try
    SetLength(Output, F.Size);
    F.Read(Output[1], Length(Output));
  finally
    F.Free;
  end;
  Result := True;
end;

end.

