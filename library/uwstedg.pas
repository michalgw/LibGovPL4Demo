{ **************************************************************************** }
{                                                                              }
{ LibGovPl4                                                                    }
{                                                                              }
{ Copyright (c) 2016 - 2023 GM Systems Michał Gawrycki                         }
{                                                                              }
{ **************************************************************************** }

unit uWSTEDG;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, uTypes, uObject, uException, lgBackend
  {$IFDEF LGP_ENABLE_WST}
  , lgWSTProtocol
  {$ENDIF}
  ;

function lgpWST_RegisterTransport: LGP_EXCEPTiON; stdcall;
function lgpWST_GetHTTPClient(var AHTTPClient: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpWST_SetHTTPClient(AHTTPClient: LGP_OBJECT): LGP_EXCEPTION; stdcall;

implementation

function lgpWST_RegisterTransport: LGP_EXCEPTiON; stdcall;
begin
  {$IFDEF LGP_ENABLE_WST}
  Result := nil;
  try
    LGPL4_RegisterHTTP_Transport();
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
  {$ELSE}
  Result := lgpCreateExceptioObject('Brak obsługi WebServiceToolkit');
  {$ENDIF}
end;

function lgpWST_GetHTTPClient(var AHTTPClient: LGP_OBJECT): LGP_EXCEPTION;
  stdcall;
begin
  {$IFDEF LGP_ENABLE_WST}
  Result := nil;
  AHTTPClient := nil;
  try
    AHTTPClient := GetLGHTTPClient;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
  {$ELSE}
  Result := lgpCreateExceptioObject('Brak obsługi WebServiceToolkit');
  {$ENDIF}
end;

function lgpWST_SetHTTPClient(AHTTPClient: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  {$IFDEF LGP_ENABLE_WST}
  Result := nil;
  try
    CheckObject(AHTTPClient, TlgHTTPClient);
    SetLGHTTPClient(TlgHTTPClient(AHTTPClient));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
  {$ELSE}
  Result := lgpCreateExceptioObject('Brak obsługi WebServiceToolkit');
  {$ENDIF}
end;

end.

