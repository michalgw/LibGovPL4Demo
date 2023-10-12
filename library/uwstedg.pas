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
  Classes, SysUtils, uTypes, uObject, uException, lgWSTProtocol, lgBackend;

function lgpWST_RegisterTransport: LGP_EXCEPTiON; stdcall;
function lgpWST_GetHTTPClient(var AHTTPClient: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpWST_SetHTTPClient(AHTTPClient: LGP_OBJECT): LGP_EXCEPTION; stdcall;

implementation

function lgpWST_RegisterTransport: LGP_EXCEPTiON; stdcall;
begin
  Result := nil;
  try
    LGPL4_RegisterHTTP_Transport();
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpWST_GetHTTPClient(var AHTTPClient: LGP_OBJECT): LGP_EXCEPTION;
  stdcall;
begin
  Result := nil;
  AHTTPClient := nil;
  try
    AHTTPClient := GetLGHTTPClient;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpWST_SetHTTPClient(AHTTPClient: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AHTTPClient, TlgHTTPClient);
    SetLGHTTPClient(TlgHTTPClient(AHTTPClient));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

end.

