program lgp4ksef2demo;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, datetimectrls, uFormMainBase
  { you can add units after this },
  lgWinHTTP, lgCNG, lgOpenSSL, lgFPC, lgDCPCrypt, lgPKCS11, uFormMain, 
uFormKSeFObj;

{$R *.res}

begin
  {$if declared(UseHeapTrace)}
  GlobalSkipIfNoLeaks := True;
  {$endIf}
  RequireDerivedFormResource := True;
  Application.Scaled := True;
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.

