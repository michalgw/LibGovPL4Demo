{ **************************************************************************** }
{                                                                              }
{ LibGovPl4                                                                    }
{                                                                              }
{ Copyright (c) 2016 - 2023 GM Systems Michał Gawrycki                         }
{                                                                              }
{ **************************************************************************** }

unit uLegacy;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

function edekInicjuj(AWinHandle: THandle; ATransport: LongWord; ARodzajSHA: LongWord): LongWord; stdcall;
function edekOstatniBladTekst: PWideChar; stdcall;
procedure edekZwolnijTekst(ATekst: PWideChar); stdcall;

function edekCertyfikatIlosc: Integer; stdcall;
function edekCertyfikatDane(AIndex: Integer; ADane:Integer; var ARes: PWideChar): Integer; stdcall;
procedure edekCertyfikatPokaz(AIndex: Integer); stdcall;

function edekPodpisz(APlikWej, APlikWyj: PWideChar; ACertIdx: Integer; ACertSerialNo: PWideChar): Integer; stdcall;
function edekPodpiszAut(APlikWej, APlikWyj, ANIP, AImie, ANazwisko, ADataUr, AKwota: PWideChar): Integer; stdcall;
function edekWyslij(APlikDek: PWideChar; ABramkaTestowa: LongBool; APodpis: LongBool; var ArefID: PWideChar; var AStatus: Integer; var AStatusOpis: PWideChar): Integer; stdcall;
function edekPobierzUPO(ARefId: PWideChar; ABramkaTestowa: LongBool; APlikWyj: PWideChar; var AStatus: Integer; var AStatusOpis: PWideChar): Integer; stdcall;

function jpkPodpisz(APlikWej: PWideChar; ACertyfikat: Integer; ATestowa: LongBool; ACertSerialNo: PWideChar): Integer; stdcall;
function jpkPodpisz2(APlikWej: PWideChar; ACertyfikat: Integer; ATestowa, ADoraznie: LongBool; ACertSerialNo: PWideChar): Integer; stdcall;
function jpkPodpiszAut(APlikWej: PWideChar; ATestowa, ADoraznie: LongBool; ADANip, ADAImie, ADANazwisko, ADAData, ADAKwota: PWideChar): Integer; stdcall;
function jpkWyslij(APlik: PWideChar; ATestowa: LongBool; var ANrRef: PWideChar): Integer; stdcall;
function jpkWyslij2(APlik: PWideChar; ATestowa, AWeryfPodpis: LongBool; var ANrRef: PWideChar): Integer; stdcall;
function jpkPobierzUPO(ANrRef: PWideChar; APlikWyj: PWideChar; ATestowa: LongBool): Integer; stdcall;

function edekWeryfikuj(APlik: PWideChar): Integer; stdcall;

function jpkMicroPodpisz(APlikWej, APlikWyj, ANIP, AImie, ANazwisko, ADataUr, AKwota, AEmail: PWideChar): Integer; stdcall; deprecated;
function jpkMicroWyslij(APlikJPK: PWideChar; ABramkaTestowa: LongBool; var ARefID: PWideChar; var AStatusNo: Integer; var AStatusOpis: PWideChar): Integer; stdcall; deprecated;
function jpkMicroPobierzUPO(APlikWyj: PWideChar; ARefID: PWideChar; ABramkaTestowa: LongBool; var AStatusNo: Integer; var AStatusOpis: PWideChar): Integer; stdcall; deprecated;
function mfSprawdzVAT(ANIP: PWideChar): LongWord; stdcall; deprecated;

implementation

uses
  lgBackend, lgWinHTTP, lgFPC, lgWSTProtocol, lgXAdES, lgEDeklaracja, lgJPK,
  lgCNG, lgLibXML2, lgMSXML, lgWSTEDekGate, ActiveX, lgUtils, Windows;

{$R rsakeys.rc}

var
  KomunikatBledu: UnicodeString = '';
  AppHWnd: THandle;
  HTClient: TlgHTTPClient = nil;
  CertSigner: TlgCertificateSigner = nil;
  Certyfikaty: TlgCertificates = nil;
  XAdES: TlgXAdES = nil;
  EDek: TlgEDeklaracja = nil;
  JPK: TlgJPK = nil;
  JPKKeyProd: TlgRSAPublicKey = nil;
  JPKKeyTest: TlgRSAPublicKey = nil;

const
  TAB_BRAMKA: array[Boolean] of TlgEDekGateType = (egtProduction, egtTest);
  TAB_PODPIS: array[Boolean] of TlgEDekSignType = (estAuthData, estCertificate);

{ ATransport: 1 - WINHTTP, 2 - OpenSSL
  ARodzajSHA: 1 - SHA1, 2 - SHA256 }

function edekInicjuj(AWinHandle: THandle; ATransport: LongWord; ARodzajSHA: LongWord): LongWord; stdcall;
var
  RS: TResourceStream;
begin
  try
    // Inicjacja modelu COM
    Coinitialize(nil);
    Randomize;
    if ATransport = 2 then
      // Transport przez OpenSSL
      HTClient := TlgFPCHTTPClient.Create(nil)
    else
      // Transport przez WinHTTP
      HTClient := TlgWinHTTPClient.Create(nil);
    HTClient.IgnoreSSLErrors := True;
    // Wczytanie konfiguracji - debug
    //WczytajKonfig;
    // Uchwyt aplikacji lub okna glownego. Wymagane do okna informacji o certyfikacie i komunikatu demo
    AppHWnd := AWinHandle;
    // Wybor transportu dla Web Service Toolkit

    CertSigner := TlgCNGCertificateSigner.Create(nil);
    TlgCNGCertificateSigner(CertSigner).HWnd := AWinHandle;
    Certyfikaty := CertSigner.List;

    XAdES := TlgXAdES.Create(nil);
    with XAdES do
    begin
      SHA1HashClass := TlgCNGSHA1Hash;
      SHA256HashClass := TlgCNGSHA256Hash;
      Base64EncoderClass := TlgCNGBase64Encoder;
      Signer := CertSigner;
      if ARodzajSHA = 1 then
        SignType := shtSHA1
      else
        SignType := shtSHA256;
    end;

    EDek := TlgEDeklaracja.Create(nil);
    with EDek do
    begin
      EDekGate := TlgWSTEDekGate;
      XMLCanonizator := TlgLibXML2Canonizator;
      Canonization := True;
    end;
    EDek.XAdES := XAdES;
    LGPL4_RegisterHTTP_Transport;
    SetLGHTTPClient(HTClient);

    RS := TResourceStream.Create(HINSTANCE(), 'RSAJPKPROD', RT_RCDATA);
    JPKKeyProd := TlgCNGRSAPublicKey.Create(nil, RS);
    RS.Free;
    RS := TResourceStream.Create(HINSTANCE(), 'RSAJPKTEST', RT_RCDATA);
    JPKKeyTest := TlgCNGRSAPublicKey.Create(nil, RS);
    RS.Free;

    JPK := TlgJPK.Create(nil);
    with JPK do
    begin
      Base64EncoderClass := TlgCNGBase64Encoder;
      AES256EncryptClass := TlgCNGAES256Encrypt;
      MD5HashClass := TlgCNGMD5Hash;
      SHA256HashClass := TlgCNGSHA256Hash;
      ZipperClass := TlgFPCZipper;
      //RSAEncryptClass := TlgCNGRSAEncrypt;
      RandomGeneratorClass := TlgCNGRandomGenerator;
      XMLReaderClass := TlgMSXMLReader;
      HTTPClient := HTClient;
      RSAKeyProd := JPKKeyProd;
      RSAKeyTest := JPKKeyTest;
    end;
    JPK.XAdES := XAdES;

    Result := 1;
  except
    on E: Exception do
    begin
      KomunikatBledu := E.Message;
      Result := 0;
    end;
  end;
end;

function edekOstatniBladTekst: PWideChar; stdcall;
begin
  Result := PWideChar(KomunikatBledu);
end;

procedure edekZwolnijTekst(ATekst: PWideChar); stdcall;
begin
  StrDispose(ATekst);
end;

function edekCertyfikatIlosc: Integer; stdcall;
begin
  try
    if (not Assigned(Certyfikaty)) or (Certyfikaty.Count = 0) then
      Certyfikaty := CertSigner.List;
    Result := Certyfikaty.Count;
  except
    Result := 0;
  end;
end;

function edekCertyfikatDane(AIndex: Integer; ADane:Integer; var ARes: PWideChar): Integer; stdcall;
const
  DATEFMT = 'yyyy-mm-dd';
var
  S: UnicodeString = '';
begin
  ARes := nil;
  Result := 0;
  try
    if (AIndex >= 0) and (AIndex < Certyfikaty.Count) then
      case ADane of
        1: S := Certyfikaty[AIndex].DisplayName;
        2: S := FormatDateTime(DATEFMT, Certyfikaty[AIndex].ValidFrom);
        3: S := FormatDateTime(DATEFMT, Certyfikaty[AIndex].ValidTo);
        4: S := Certyfikaty[AIndex].SerialNoDec;
      end;
    ARes := strnew(PWideChar(S));
    Result := Length(S);
  except
  end;
end;

procedure edekCertyfikatPokaz(AIndex: Integer); stdcall;
begin
  try
    if (AIndex >= 0) and (AIndex < Certyfikaty.Count) then
      TlgCNGCertificate(Certyfikaty[AIndex]).ShowCertificateInfo(AppHWnd);
  except
  end;
end;

function QuickLoad(AFileName: UnicodeString): String;
begin
  with TFileStream.Create(AFileName, fmOpenRead) do
    try
      SetLength(Result, Size);
      Read(Result[1], Size);
    finally
      Free;
    end;
end;

procedure QuickSave(AFileName: UnicodeString; AData: String);
begin
  with TFileStream.Create(AFileName, fmCreate) do
    try
      Write(AData[1], Length(AData));
    finally
      Free;
    end;
end;

function edekPodpisz(APlikWej, APlikWyj: PWideChar; ACertIdx: Integer; ACertSerialNo: PWideChar): Integer; stdcall;
var
  DaneWej, DaneWyj: String;
  Cert: TlgCertificate;
begin
  if not FileExists(APlikWej) then
  begin
    KomunikatBledu := 'Nie znaleziono pliku wejsciowego';
    Exit(1);
  end;
  if (Certyfikaty = nil) or (((ACertIdx < 0) or (ACertIdx >= Certyfikaty.Count)) and (ACertSerialNo = '')) then
  begin
    KomunikatBledu := 'Nie znaleziono certyfikatu';
    Exit(1);
  end;

  if ACertSerialNo <> '' then
    Cert := Certyfikaty.FindBySerialNo(ACertSerialNo)
  else
    Cert := Certyfikaty[ACertIdx];

  if Cert = nil then
  begin
    KomunikatBledu := 'Nie znaleziono certyfikatu';
    Exit(1);
  end;

  try
    DaneWej := QuickLoad(APlikWej);
    EDek.PodpiszCertyfikatem(DaneWej, Cert, DaneWyj);
    QuickSave(APlikWyj, DaneWyj);
    Result := 0;
  except
    on E: Exception do
    begin
      Result := 1;
      KomunikatBledu := E.Message;
    end;
  end;
end;

function edekPodpiszAut(APlikWej, APlikWyj, ANIP, AImie, ANazwisko, ADataUr, AKwota: PWideChar): Integer; stdcall;
var
  DaneWej, DaneWyj: String;
  Kwota: Currency;
  DataUr: TDate;
  Imie, Nazwisko, Nip: UnicodeString;
begin
  if not FileExists(APlikWej) then
  begin
    KomunikatBledu := 'Nie znaleziono pliku wejsciowego';
    Exit(1);
  end;
  try
    DaneWej := QuickLoad(APlikWej);
    Nip := ANIP;
    Imie := AImie;
    Nazwisko := ANazwisko;
    DataUr := ParseRFC3339Date(ADataUr);
    Kwota := Kwota2ToCurrency(AKwota);
    EDek.PodpiszDanymiAut(DaneWej, Imie, Nazwisko, Nip, DataUr, Kwota, DaneWyj);
    QuickSave(APlikWyj, DaneWyj);
    Result := 0;
  except
    on E: EAbort do
    begin
      Result := 2;
      KomunikatBledu := 'Anulowano';
    end;
    on E: Exception do
    begin
      Result := 1;
      KomunikatBledu := E.Message;
    end;
  end;
end;

function edekWyslij(APlikDek: PWideChar; ABramkaTestowa: LongBool; APodpis: LongBool; var ArefID: PWideChar; var AStatus: Integer; var AStatusOpis: PWideChar): Integer; stdcall;
var
  RefID, Opis: String;
  URefID, UOpis: UnicodeString;
  Dane: String;
begin
  ArefID := nil;
  AStatusOpis := nil;
  if not FileExists(APlikDek) then
  begin
    KomunikatBledu := 'Nie znaleziono pliku wejsciowego';
    Exit(1);
  end;
  try
    Dane := QuickLoad(APlikDek);
    EDek.Wyslij(Dane, TAB_BRAMKA[ABramkaTestowa], TAB_PODPIS[APodpis], RefID, AStatus, Opis);
    URefID := RefID;
    ArefID := strnew(PWideChar(URefID));
    UOpis := Opis;
    AStatusOpis := strnew(PWideChar(UOpis));
    Result := 0;
  except
    on E: Exception do
    begin
      KomunikatBledu := E.Message;
      Result := 3;
    end;
  end;
end;

function edekPobierzUPO(ARefId: PWideChar; ABramkaTestowa: LongBool; APlikWyj: PWideChar; var AStatus: Integer; var AStatusOpis: PWideChar): Integer; stdcall;
var
  RefID: UnicodeString;
  Opis: String;
  UOpis: UnicodeString;
  UPO: String = '';
begin
  RefID := ARefId;
  AStatusOpis := nil;
  try
    EDek.PobierzUPO(RefID, TAB_BRAMKA[ABramkaTestowa], AStatus, Opis, UPO);
    if UPO <> '' then
      QuickSave(APlikWyj, UPO);
    UOpis := Opis;
    AStatusOpis := strnew(PWideChar(UOpis));
    Result := 0;
  except
    on E: Exception do
    begin
      KomunikatBledu := E.Message;
      Result := 3;
    end;
  end;
end;

function jpkPodpisz(APlikWej: PWideChar; ACertyfikat: Integer;
  ATestowa: LongBool; ACertSerialNo: PWideChar): Integer; stdcall;
begin
  Result := jpkPodpisz2(APlikWej, ACertyfikat, ATestowa, False, ACertSerialNo);
end;

function jpkPodpisz2(APlikWej: PWideChar; ACertyfikat: Integer; ATestowa,
  ADoraznie: LongBool; ACertSerialNo: PWideChar): Integer; stdcall;
var
  JI: TlgJPKItem;
  Plik: String;
begin
  if (Certyfikaty = nil) or (((ACertyfikat < 0) or (ACertyfikat >= Certyfikaty.Count)) and (ACertSerialNo = '')) then
  begin
    KomunikatBledu := 'Nie znaleziono certyfikatu';
    Exit(1);
  end;

  JI.Clear;
  if ACertSerialNo <> '' then
    JI.Certificate := Certyfikaty.FindBySerialNo(ACertSerialNo)
  else
    JI.Certificate := Certyfikaty[ACertyfikat];

  if JI.Certificate = nil then
  begin
    KomunikatBledu := 'Nie znaleziono certyfikatu';
    Exit(1);
  end;
  try
    try
      Plik := APlikWej;
      JI.InputStream := TFileStream.Create(APlikWej, fmOpenRead);
      JI.EncryptedStream := TMemoryStream.Create;
      JI.AdHoc := ADoraznie;
      JI.GateType := TAB_BRAMKA[ATestowa];
      JI.ArchFileName := ExtractFileName(Plik);
      JI.AzureFileName := ExtractFileName(Plik) + '.00.zip.aes';
      JPK.Sign(JI);
      TMemoryStream(JI.EncryptedStream).SaveToFile(Plik + '.00.zip.aes');
      QuickSave(Plik + '.env.sig', JI.InitUploadSigned);
      Result := 0;
    except
      on E: EAbort do
      begin
        Result := 2;
        KomunikatBledu := 'Anulowano';
      end;
      on E: Exception do
      begin
        Result := 1;
        KomunikatBledu := E.Message;
      end;
    end;
  finally
    if Assigned(JI.InputStream) then
      JI.InputStream.Free;
    if Assigned(JI.EncryptedStream) then
      JI.EncryptedStream.Free;
  end;
end;

function jpkPodpiszAut(APlikWej: PWideChar; ATestowa, ADoraznie: LongBool;
  ADANip, ADAImie, ADANazwisko, ADAData, ADAKwota: PWideChar): Integer; stdcall;
var
  JI: TlgJPKItem;
  Plik: String;
begin
  try
    try
      Plik := APlikWej;
      JI.InputStream := TFileStream.Create(APlikWej, fmOpenRead);
      JI.EncryptedStream := TMemoryStream.Create;
      JI.AdHoc := ADoraznie;
      JI.NIP := ADANip;
      JI.ImiePierwsze := ADAImie;
      JI.Nazwisko := ADANazwisko;
      JI.DataUrodzenia := ParseRFC3339Date(ADAData);
      JI.Kwota := Kwota2ToCurrency(ADAKwota);
      JI.ArchFileName := ExtractFileName(Plik);
      JI.AzureFileName := ExtractFileName(Plik) + '.00.zip.aes';
      JPK.Sign(JI);
      TMemoryStream(JI.EncryptedStream).SaveToFile(Plik + '.00.zip.aes');
      QuickSave(Plik + '.env.sig', JI.InitUploadSigned);
      Result := 0;
    except
      on E: EAbort do
      begin
        Result := 2;
        KomunikatBledu := 'Anulowano';
      end;
      on E: Exception do
      begin
        Result := 1;
        KomunikatBledu := E.Message;
      end;
    end;
  finally
    if Assigned(JI.InputStream) then
      JI.InputStream.Free;
    if Assigned(JI.EncryptedStream) then
      JI.InputStream.Free;
  end;
end;

function jpkWyslij(APlik: PWideChar; ATestowa: LongBool; var ANrRef: PWideChar
  ): Integer; stdcall;
begin
  Result := jpkWyslij2(APlik, ATestowa, True, ANrRef);
end;

function jpkWyslij2(APlik: PWideChar; ATestowa, AWeryfPodpis: LongBool;
  var ANrRef: PWideChar): Integer; stdcall;
var
  InitUpload, RefNo: String;
  URefNo, UPlik: UnicodeString;
  EncFile: TFileStream = nil;
begin
  ANrRef := nil;
  try
    try
      UPlik := APlik;
      InitUpload := QuickLoad(UPlik);
      EncFile := TFileStream.Create(StringReplace(UPlik, '.env.sig', '.00.zip.aes', [rfIgnoreCase]), fmOpenRead);
      JPK.Send(InitUpload, EncFile, RefNo, TAB_BRAMKA[ATestowa], AWeryfPodpis);
      URefNo := RefNo;
      ANrRef := strnew(PWideChar(URefNo));
      Result := 200;
    except
      on E: Exception do
      begin
        if E is ElgJPKError then
          Result := ElgJPKError(E).Code
        else
          Result := 3;
        KomunikatBledu := E.Message;
      end;
    end;
  finally
    if Assigned(EncFile) then
      EncFile.Free;
  end;
end;

function jpkPobierzUPO(ANrRef: PWideChar; APlikWyj: PWideChar;
  ATestowa: LongBool): Integer; stdcall;
var
  Opis, Szczegoly, UPO, Timestamp: String;
begin
  UPO := '';
  try
    Result := JPK.RequestUPO(ANrRef, TAB_BRAMKA[ATestowa], Opis, Szczegoly, UPO, Timestamp);
    if UPO <> '' then
      QuickSave(APlikWyj, UPO);
    KomunikatBledu := Opis;
  except
    on E: Exception do
    begin
      if E is ElgJPKError then
        Result := ElgJPKError(E).Code
      else
        Result := 3;
      KomunikatBledu := E.Message;
    end;
  end;
end;

function edekWeryfikuj(APlik: PWideChar): Integer; stdcall;
begin
  KomunikatBledu := 'Nie zaimplementowano';
  Result := 3;
end;

function jpkMicroPodpisz(APlikWej, APlikWyj, ANIP, AImie, ANazwisko, ADataUr,
  AKwota, AEmail: PWideChar): Integer; stdcall;
begin
  KomunikatBledu := 'Nie zaimplementowano';
  Result := 3;
end;

function jpkMicroWyslij(APlikJPK: PWideChar; ABramkaTestowa: LongBool;
  var ARefID: PWideChar; var AStatusNo: Integer; var AStatusOpis: PWideChar
  ): Integer; stdcall;
begin
  KomunikatBledu := 'Nie zaimplementowano';
  Result := 3;
end;

function jpkMicroPobierzUPO(APlikWyj: PWideChar; ARefID: PWideChar;
  ABramkaTestowa: LongBool; var AStatusNo: Integer; var AStatusOpis: PWideChar
  ): Integer; stdcall;
begin
  KomunikatBledu := 'Nie zaimplementowano';
  Result := 3;
end;

function mfSprawdzVAT(ANIP: PWideChar): LongWord; stdcall;
begin
  KomunikatBledu := 'Nie zaimplementowano';
  Result := 3;
end;

procedure ZwolnijKlasy;
begin
  if Assigned(HTClient) then
    HTClient.Free;
  if Assigned(CertSigner) then
    CertSigner.Free;
  if Assigned(Certyfikaty) then
    Certyfikaty.Free;
  if Assigned(XAdES) then
    XAdES.Free;
  if Assigned(EDek) then
    EDek.Free;
  if Assigned(JPK) then
    JPK.Free;
  if Assigned(JPKKeyProd) then
    JPKKeyProd.Free;
  if Assigned(JPKKeyTest) then
    JPKKeyTest.Free;
end;

finalization
  ZwolnijKlasy;

end.

