program lgp4libdemo;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, datetimectrls, Unit1, LibGovPl4Intf, LibGovPl4Obj, LibGovPl4KSeFObj,
  LibGovPl4Backend, LibGovPl4XAdES, LibGovPl4KSeF, LibGovPl4EDek, LibGovPl4JPK
  { you can add units after this };

{$R *.res}

begin
  {$if declared(UseHeapTrace)}
  GlobalSkipIfNoLeaks := True;
  {$endIf}
  RequireDerivedFormResource := True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

