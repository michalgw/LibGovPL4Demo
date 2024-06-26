program lgp4demo;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, datetimectrls, Unit1, Unit2
  { you can add units after this };

{$R *.res}

begin
  {$if declared(UseHeapTrace)}
  GlobalSkipIfNoLeaks := True;
  {$endIf}
  RequireDerivedFormResource := True;
  Application.Title := 'lgp4demo';
  Application.Scaled := True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

