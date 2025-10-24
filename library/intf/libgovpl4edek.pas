{ **************************************************************************** }
{                                                                              }
{ LibGovPl4                                                                    }
{                                                                              }
{ Copyright (c) 2016 - 2023 GM Systems Michał Gawrycki                         }
{                                                                              }
{ **************************************************************************** }

unit LibGovPl4EDek;

{$I libgovpl4def.inc}

interface

uses
  Classes, SysUtils, LibGovPl4Intf, LibGovPl4Obj, LibGovPl4Backend, LibGovPl4XAdES;

type
  ElgEdekException = class(ElgBackendError);

  { TlgoEDeklaracja }

  TlgoEDeklaracja = class(TlgoObject)
  private
    FXAdES: TlgoXAdES;
    function GetCanonization: Boolean;
    function GetEDekGate: UTF8String;
    function GetXMLCanonizator: UTF8String;
    procedure SetCanonization(AValue: Boolean);
    procedure SetEDekGate(AValue: UTF8String);
    procedure SetXAdES(AValue: TlgoXAdES);
    procedure SetXMLCanonizator(AValue: UTF8String);
  public
    constructor Create;

    procedure PodpiszCertyfikatem(const ADane: UTF8String; ACertyfikat: TlgoCertificate; out ADanePodpisane: UTF8String);
    procedure PodpiszDanymiAut(const ADane: UTF8String; const AImie, ANazwisko, ANIP: UTF8String; const ADataUr: TDateTime; const AKwota: Currency; out ADanePodpisane: UTF8String);

    function Wyslij(const ADanePodpisane: UTF8String; const ARodzajBramki: TlgoEDekGateType; const ARodzajPodpisu: TlgoEDekSignType; out ANrRef: UTF8String; out AStatus: Integer; out AStatusOpis: UTF8String): Integer;
    function PobierzUPO(const ANrRef: UTF8String; const ARodzajBramki: TlgoEDekGateType; out AStatus: Integer; out AStatusOpis: UTF8String; out ADaneUPO: UTF8String): Integer;

    property XAdES: TlgoXAdES read FXAdES write SetXAdES;
    property XMLCanonizator: UTF8String read GetXMLCanonizator write SetXMLCanonizator;
    property EDekGate: UTF8String read GetEDekGate write SetEDekGate;
    property Canonization: Boolean read GetCanonization write SetCanonization;
  end;


implementation

{ TlgoEDeklaracja }

function TlgoEDeklaracja.GetCanonization: Boolean;
var
  V: Integer;
begin
  lgoCheckResult(lgpEDek_GetCanonization(ExtObject, V));
  Result := V <> 0;
end;

function TlgoEDeklaracja.GetEDekGate: UTF8String;
var
  P: LGP_PSSTRING;
begin
  lgoCheckResult(lgpEDek_GetEDekGateClass(ExtObject, P));
  if P <> nil then
    Result := P^
  else
    Result := '';
end;

function TlgoEDeklaracja.GetXMLCanonizator: UTF8String;
var
  P: LGP_PSSTRING;
begin
  lgoCheckResult(lgpEDek_GetXMLCanonizatorClass(ExtObject, P));
  if P <> nil then
    Result := P^
  else
    Result := '';
end;

procedure TlgoEDeklaracja.SetCanonization(AValue: Boolean);
begin
  lgoCheckResult(lgpEDek_SetCanonization(ExtObject, Integer(AValue)));
end;

procedure TlgoEDeklaracja.SetEDekGate(AValue: UTF8String);
begin
  lgoCheckResult(lgpEDek_SetEDekGateClass(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoEDeklaracja.SetXAdES(AValue: TlgoXAdES);
var
  O: LGP_OBJECT;
begin
  if FXAdES = AValue then Exit;
  if AValue <> nil then
    O := AValue.ExtObject
  else
    O := nil;
  lgoCheckResult(lgpEDek_SetXAdES(ExtObject, O));
  FXAdES := AValue;
end;

procedure TlgoEDeklaracja.SetXMLCanonizator(AValue: UTF8String);
begin
  lgoCheckResult(lgpEDek_SetXMLCanonizatorClass(ExtObject, LGP_PCHAR(AValue)));
end;

constructor TlgoEDeklaracja.Create;
begin
  lgoCheckResult(lgpEDek_Create(nil, nil, ExtObject));
end;

procedure TlgoEDeklaracja.PodpiszCertyfikatem(const ADane: UTF8String;
  ACertyfikat: TlgoCertificate; out ADanePodpisane: UTF8String);
var
  DanePodp: LGP_OBJECT;
begin
  lgoCheckResult(lgpEDek_PodpiszCertyfikatem(ExtObject, LGP_PCHAR(ADane), ACertyfikat.Item, DanePodp));
  ADanePodpisane := lgoGetString(DanePodp);
end;

procedure TlgoEDeklaracja.PodpiszDanymiAut(const ADane: UTF8String; const AImie,
  ANazwisko, ANIP: UTF8String; const ADataUr: TDateTime; const AKwota: Currency;
  out ADanePodpisane: UTF8String);
var
  DanePodp: LGP_OBJECT;
begin
  lgoCheckResult(lgpEDek_PodpiszDanymiAut(ExtObject, LGP_PCHAR(ADane), LGP_PCHAR(AImie),
    LGP_PCHAR(ANazwisko), LGP_PCHAR(ANIP), ADataUr, AKwota, DanePodp));
  ADanePodpisane := lgoGetString(DanePodp);
end;

function TlgoEDeklaracja.Wyslij(const ADanePodpisane: UTF8String;
  const ARodzajBramki: TlgoEDekGateType;
  const ARodzajPodpisu: TlgoEDekSignType; out ANrRef: UTF8String; out
  AStatus: Integer; out AStatusOpis: UTF8String): Integer;
var
  NrRef, Opis: LGP_OBJECT;
begin
  lgoCheckResult(lgpEDek_Wyslij(ExtObject, LGP_PCHAR(ADanePodpisane), LGP_INT32(ARodzajBramki),
    LGP_INT32(ARodzajPodpisu), NrRef, AStatus, Opis));
  ANrRef := lgoGetString(NrRef);
  AStatusOpis := lgoGetString(Opis);
  Result := AStatus;
end;

function TlgoEDeklaracja.PobierzUPO(const ANrRef: UTF8String;
  const ARodzajBramki: TlgoEDekGateType; out AStatus: Integer; out
  AStatusOpis: UTF8String; out ADaneUPO: UTF8String): Integer;
var
  UPO, Opis: LGP_OBJECT;
begin
  lgoCheckResult(lgpEDek_PobierzUPO(ExtObject, LGP_PCHAR(ANrRef), LGP_INT32(ARodzajBramki),
    AStatus, Opis, UPO));
  AStatusOpis := lgoGetString(Opis);
  ADaneUPO := lgoGetString(UPO);
  Result := AStatus;
end;

initialization
  lgoRegisterExceptionClass(ElgEdekException);

end.

