{ **************************************************************************** }
{                                                                              }
{ LibGovPl4                                                                    }
{                                                                              }
{ Copyright (c) 2016 - 2023 GM Systems Michał Gawrycki                         }
{                                                                              }
{ **************************************************************************** }

unit uEDeklar;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, uTypes, uObject, uException, lgBackend, lgEDeklaracja, lgXAdES;

const
  LGP_EDEK_GATE_PRODUCTION = 0;
  LGP_EDEK_GATE_TEST = 1;

  LGP_EDEK_SIGN_CERTIFICATE = 0;
  LGP_EDEK_SIGN_AUTHDATA = 1;

function lgpEDek_Create(AXMLCanonizator, AEDekGate: LGP_PCHAR; var AEDekObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpEDek_GetXAdES(AEDekObj: LGP_OBJECT; var AXAdESObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpEDek_SetXAdES(AEDekObj: LGP_OBJECT; AXAdESObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpEDek_GetXMLCanonizatorClass(AEDekObj: LGP_OBJECT; var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpEDek_SetXMLCanonizatorClass(AEDekObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpEDek_GetEDekGateClass(AEDekObj: LGP_OBJECT; var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpEDek_SetEDekGateClass(AEDekObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpEDek_GetCanonization(AEDekObj: LGP_OBJECT; var AC14N: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpEDek_SetCanonization(AEDekObj: LGP_OBJECT; AC14N: LGP_INT32): LGP_EXCEPTION; stdcall;

function lgpEDek_PodpiszCertyfikatem(AEDekObj: LGP_OBJECT; ADane: LGP_PCHAR; ACertyfikat: LGP_OBJECT; var ADanePodpisane: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpEDek_PodpiszCertyfikatemStream(AEDekObj: LGP_OBJECT; ADane: LGP_OBJECT; ACertyfikat: LGP_OBJECT; ADanePodpisane: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpEDek_PodpiszDanymiAut(AEDekObj: LGP_OBJECT; ADane: LGP_PCHAR; AImie, ANazwisko, ANIP: LGP_PCHAR; ADataUr: LGP_DOUBLE; AKwota: LGP_CURRENCY; var ADanePodpisane: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpEDek_PodpiszDanymiAutStream(AEDekObj: LGP_OBJECT; ADane: LGP_OBJECT; AImie, ANazwisko, ANIP: LGP_PCHAR; ADataUr: LGP_DOUBLE; AKwota: LGP_CURRENCY; ADanePodpisane: LGP_OBJECT): LGP_EXCEPTION; stdcall;

function lgpEDek_Wyslij(AEDekObj: LGP_OBJECT; ADanePodpisane: LGP_PCHAR; ARodzajBramki: LGP_INT32; ARodzajPodpisu: LGP_INT32; var ANrRef: LGP_OBJECT; var AStatus: LGP_INT32; var AStatusOpis: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpEDek_WyslijStream(AEDekObj: LGP_OBJECT; ADanePodpisane: LGP_OBJECT; ARodzajBramki: LGP_INT32; ARodzajPodpisu: LGP_INT32; var ANrRef: LGP_OBJECT; var AStatus: LGP_INT32; var AStatusOpis: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpEDek_PobierzUPO(AEDekObj: LGP_OBJECT; ANrRef: LGP_PCHAR; ARodzajBramki: LGP_INT32; var AStatus: LGP_INT32; var AStatusOpis: LGP_OBJECT; var ADaneUPO: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpEDek_PobierzUPOStream(AEDekObj: LGP_OBJECT; ANrRef: LGP_PCHAR; ARodzajBramki: LGP_INT32; var AStatus: LGP_INT32; var AStatusOpis: LGP_OBJECT; ADaneUPO: LGP_OBJECT): LGP_EXCEPTION; stdcall;

implementation

function lgpEDek_Create(AXMLCanonizator, AEDekGate: LGP_PCHAR;
  var AEDekObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AEDekObj := nil;
  try
    AEDekObj := TlgEDeklaracja.Create(nil);
    with TObject(AEDekObj) as TlgEDeklaracja do
    begin
      XMLCanonizator := XMLCanonizatorClasses.FindByClassName(AXMLCanonizator);
      EDekGate := EDekGateClasses.FindByClassName(AEDekGate);
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpEDek_GetXAdES(AEDekObj: LGP_OBJECT; var AXAdESObj: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AXAdESObj := nil;
  try
    CheckObject(AEDekObj, TlgEDeklaracja);
    AXAdESObj := (TObject(AEDekObj) as TlgEDeklaracja).XAdES;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpEDek_SetXAdES(AEDekObj: LGP_OBJECT; AXAdESObj: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AEDekObj, TlgEDeklaracja);
    CheckObject(AXAdESObj, TlgXAdES);
    (TObject(AEDekObj) as TlgEDeklaracja).XAdES := TlgXAdES(AXAdESObj);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpEDek_GetXMLCanonizatorClass(AEDekObj: LGP_OBJECT;
  var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AClassName := nil;
  try
    CheckObject(AEDekObj, TlgEDeklaracja);
    with TObject(AEDekObj) as TlgEDeklaracja do
    begin
      if XMLCanonizator <> nil then
        AClassName := @(PVmt(XMLCanonizator.ClassType)^.vClassName^[1]);
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpEDek_SetXMLCanonizatorClass(AEDekObj: LGP_OBJECT;
  AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AEDekObj, TlgEDeklaracja);
    with TObject(AEDekObj) as TlgEDeklaracja do
    begin
      if AClassName = nil then
        XMLCanonizator := nil
      else
        XMLCanonizator := XMLCanonizatorClasses.FindByClassName(AClassName);
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpEDek_GetEDekGateClass(AEDekObj: LGP_OBJECT;
  var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AClassName := nil;
  try
    CheckObject(AEDekObj, TlgEDeklaracja);
    with TObject(AEDekObj) as TlgEDeklaracja do
    begin
      if EDekGate <> nil then
        AClassName := @(PVmt(EDekGate.ClassType)^.vClassName^[1]);
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpEDek_SetEDekGateClass(AEDekObj: LGP_OBJECT; AClassName: LGP_PCHAR
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AEDekObj, TlgEDeklaracja);
    with TObject(AEDekObj) as TlgEDeklaracja do
    begin
      if AClassName = nil then
        EDekGate := nil
      else
        EDekGate := EDekGateClasses.FindByClassName(AClassName);
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpEDek_GetCanonization(AEDekObj: LGP_OBJECT; var AC14N: LGP_INT32
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AEDekObj, TlgEDeklaracja);
    AC14N := Integer((TObject(AEDekObj) as TlgEDeklaracja).Canonization);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpEDek_SetCanonization(AEDekObj: LGP_OBJECT; AC14N: LGP_INT32
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AEDekObj, TlgEDeklaracja);
    (TObject(AEDekObj) as TlgEDeklaracja).Canonization := AC14N <> 0;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpEDek_PodpiszCertyfikatem(AEDekObj: LGP_OBJECT; ADane: LGP_PCHAR;
  ACertyfikat: LGP_OBJECT; var ADanePodpisane: LGP_OBJECT): LGP_EXCEPTION;
  stdcall;
var
  PodpDane: String;
begin
  Result := nil;
  ADanePodpisane := nil;
  try
    CheckObject(AEDekObj, TlgEDeklaracja);
    CheckObject(ACertyfikat, TlgCertificate);
    (TObject(AEDekObj) as TlgEDeklaracja).PodpiszCertyfikatem(ADane, TlgCertificate(ACertyfikat), PodpDane);
    ADanePodpisane := TStringObject.Create(PodpDane);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpEDek_PodpiszCertyfikatemStream(AEDekObj: LGP_OBJECT;
  ADane: LGP_OBJECT; ACertyfikat: LGP_OBJECT; ADanePodpisane: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
var
  DaneWej, DaneWyj: String;
begin
  Result := nil;
  try
    CheckObject(AEDekObj, TlgEDeklaracja);
    CheckObject(ACertyfikat, TlgCertificate);
    CheckObject(ADane, TStream);
    CheckObject(ADanePodpisane, TStream);
    SetLength(DaneWej, TStream(ADane).Size);
    TStream(ADane).Read(DaneWej[1], TStream(ADane).Size);
    (TObject(AEDekObj) as TlgEDeklaracja).PodpiszCertyfikatem(DaneWej, TlgCertificate(ACertyfikat), DaneWyj);
    TStream(ADanePodpisane).Write(DaneWyj[1], Length(DaneWyj));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpEDek_PodpiszDanymiAut(AEDekObj: LGP_OBJECT; ADane: LGP_PCHAR;
  AImie, ANazwisko, ANIP: LGP_PCHAR; ADataUr: LGP_DOUBLE; AKwota: LGP_CURRENCY;
  var ADanePodpisane: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  PodpDane: String;
begin
  Result := nil;
  ADanePodpisane := nil;
  try
    CheckObject(AEDekObj, TlgEDeklaracja);
    (TObject(AEDekObj) as TlgEDeklaracja).PodpiszDanymiAut(ADane, AImie,
      ANazwisko, ANIP, ADataUr, AKwota, PodpDane);
    ADanePodpisane := TStringObject.Create(PodpDane);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpEDek_PodpiszDanymiAutStream(AEDekObj: LGP_OBJECT;
  ADane: LGP_OBJECT; AImie, ANazwisko, ANIP: LGP_PCHAR; ADataUr: LGP_DOUBLE;
  AKwota: LGP_CURRENCY; ADanePodpisane: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  DaneWej, DaneWyj: String;
begin
  Result := nil;
  ADanePodpisane := nil;
  try
    CheckObject(AEDekObj, TlgEDeklaracja);
    CheckObject(ADane, TStream);
    CheckObject(ADanePodpisane, TStream);
    SetLength(DaneWej, TStream(ADane).Size);
    TStream(ADane).Read(DaneWej[1], TStream(ADane).Size);
    (TObject(AEDekObj) as TlgEDeklaracja).PodpiszDanymiAut(DaneWej, AImie,
      ANazwisko, ANIP, ADataUr, AKwota, DaneWyj);
    TStream(ADanePodpisane).Write(DaneWyj[1], Length(DaneWyj));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpEDek_Wyslij(AEDekObj: LGP_OBJECT; ADanePodpisane: LGP_PCHAR;
  ARodzajBramki: LGP_INT32; ARodzajPodpisu: LGP_INT32; var ANrRef: LGP_OBJECT;
  var AStatus: LGP_INT32; var AStatusOpis: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  NrRef: String;
  SttusOp: String;
begin
  Result := nil;
  AStatusOpis := nil;
  AStatus := 0;
  try
    CheckObject(AEDekObj, TlgEDeklaracja);
    (TObject(AEDekObj) as TlgEDeklaracja).Wyslij(ADanePodpisane, TlgEDekGateType(ARodzajBramki),
      TlgEDekSignType(ARodzajPodpisu), NrRef, AStatus, SttusOp);
    ANrRef := TStringObject.Create(NrRef);
    AStatusOpis := TStringObject.Create(SttusOp);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpEDek_WyslijStream(AEDekObj: LGP_OBJECT; ADanePodpisane: LGP_OBJECT;
  ARodzajBramki: LGP_INT32; ARodzajPodpisu: LGP_INT32; var ANrRef: LGP_OBJECT;
  var AStatus: LGP_INT32; var AStatusOpis: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  NrRef: String;
  SttusOp: String;
  Dane: String;
begin
  Result := nil;
  AStatusOpis := nil;
  AStatus := 0;
  try
    CheckObject(AEDekObj, TlgEDeklaracja);
    CheckObject(ADanePodpisane, TStream);
    SetLength(Dane, TStream(ADanePodpisane).Size);
    TStream(ADanePodpisane).Read(Dane[1], TStream(ADanePodpisane).Size);
    (TObject(AEDekObj) as TlgEDeklaracja).Wyslij(Dane, TlgEDekGateType(ARodzajBramki),
      TlgEDekSignType(ARodzajPodpisu), NrRef, AStatus, SttusOp);
    ANrRef := TStringObject.Create(NrRef);
    AStatusOpis := TStringObject.Create(SttusOp);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpEDek_PobierzUPO(AEDekObj: LGP_OBJECT; ANrRef: LGP_PCHAR;
  ARodzajBramki: LGP_INT32; var AStatus: LGP_INT32;
  var AStatusOpis: LGP_OBJECT; var ADaneUPO: LGP_OBJECT): LGP_EXCEPTION;
  stdcall;
var
  UPO: String;
  SttusOp: String;
begin
  Result := nil;
  AStatusOpis := nil;
  ADaneUPO := nil;
  try
    CheckObject(AEDekObj, TlgEDeklaracja);
    (TObject(AEDekObj) as TlgEDeklaracja).PobierzUPO(ANrRef, TlgEDekGateType(ARodzajBramki), AStatus, SttusOp, UPO);
    AStatusOpis := TStringObject.Create(SttusOp);
    if UPO <> '' then
      ADaneUPO := TStringObject.Create(UPO);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpEDek_PobierzUPOStream(AEDekObj: LGP_OBJECT; ANrRef: LGP_PCHAR;
  ARodzajBramki: LGP_INT32; var AStatus: LGP_INT32;
  var AStatusOpis: LGP_OBJECT; ADaneUPO: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  UPO: String;
  SttusOp: String;
begin
  Result := nil;
  AStatusOpis := nil;
  try
    CheckObject(AEDekObj, TlgEDeklaracja);
    CheckObject(ADaneUPO, TStream);
    (TObject(AEDekObj) as TlgEDeklaracja).PobierzUPO(ANrRef, TlgEDekGateType(ARodzajBramki), AStatus, SttusOp, UPO);
    AStatusOpis := TStringObject.Create(SttusOp);
    if UPO <> '' then
      TStream(ADaneUPO).Write(UPO[1], Length(UPO));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

end.

