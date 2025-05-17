unit uVies;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, lgBackend, lgVies, Contnrs, uTypes;

type
  TlgpViesCheckVatResponse = class(TlgBaseClass)
  private
    FResponse: TlgViesCheckVatResponse;
  published
    property CountryCode: String read FResponse.CountryCode;
    property VatNumber: String read FResponse.VatNumber;
    property RequestDate: TDateTime read FResponse.RequestDate;
    property Valid: Boolean read FResponse.Valid;
    property RequestIdentifier: String read FResponse.RequestIdentifier;
    property Name: String read FResponse.Name;
    property Address: String read FResponse.Address;
    property TraderName: String read FResponse.TraderName;
    property TraderStreet: String read FResponse.TraderStreet;
    property TraderPostalCode: String read FResponse.TraderPostalCode;
    property TraderCity: String read FResponse.TraderCity;
    property TraderCompanyType: String read FResponse.TraderCompanyType;
    property TraderNameMatch: TlgViesMatchType read FResponse.TraderNameMatch;
    property TraderStreetMatch: TlgViesMatchType read FResponse.TraderStreetMatch;
    property TraderPostalCodeMatch: TlgViesMatchType read FResponse.TraderPostalCodeMatch;
    property TraderCityMatch: TlgViesMatchType read FResponse.TraderCityMatch;
    property TraderCompanyTypeMatch: TlgViesMatchType read FResponse.TraderCompanyTypeMatch;
    property RawResponse: String read FResponse.RawResponse;
  end;

  TlgpViesCountryStatus = class(TlgBaseClass)
  private
    FStatus: TlgViesCountryStatus;
  published
    property CountryCode: String read FStatus.CountryCode;
    property Availability: TlgViesAvailabilityStatus read FStatus.Availability;
  end;

  TlgpViesCountryStatuses = class(TObjectList);

  { TlgViesStatusInformationResponse }

  TlgpViesStatusInformationResponse = class(TlgBaseClass)
  private
    FVowAvaiable: Boolean;
    FCountries: TlgpViesCountryStatuses;
  public
    constructor Create(AResponse: TlgViesStatusInformationResponse);
    destructor Destroy; override;
  published
    property VowAvaiable: Boolean read FVowAvaiable;
    property Countries: TlgpViesCountryStatuses read FCountries;
  end;

function lgpViesService_CheckVatNumber(ACountryCode, AVatNumber,
  ARequesterMemberStateCode, ARequesterNumber, ATraderName, ATraderStreet,
  ATraderPostalCode, ATraderCity, ATraderCompanyType: LGP_PCHAR;
  AHTTPClient: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpViesService_CheckVatTestService(ACountryCode, AVatNumber,
  ARequesterMemberStateCode, ARequesterNumber, ATraderName, ATraderStreet,
  ATraderPostalCode, ATraderCity, ATraderCompanyType: LGP_PCHAR;
  AHTTPClient: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpViesService_CheckStatus(AHTTPClient: LGP_OBJECT;
  var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;

implementation

uses
  uException, uObject;

function lgpViesService_CheckVatNumber(ACountryCode, AVatNumber,
  ARequesterMemberStateCode, ARequesterNumber, ATraderName, ATraderStreet,
  ATraderPostalCode, ATraderCity, ATraderCompanyType: LGP_PCHAR;
  AHTTPClient: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  Resp: TlgViesCheckVatResponse;
begin
  Result := nil;
  try
    CheckObject(AHTTPClient, TlgHTTPClient);
    Resp := TlgViesService.CheckVatNumber(ACountryCode, AVatNumber,
      ARequesterMemberStateCode, ARequesterNumber, ATraderName, ATraderStreet,
      ATraderPostalCode, ATraderCity, ATraderCompanyType, TlgHTTPClient(AHTTPClient));
    AResponse := TlgpViesCheckVatResponse.Create;
    TlgpViesCheckVatResponse(AResponse).FResponse := Resp;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpViesService_CheckVatTestService(ACountryCode, AVatNumber,
  ARequesterMemberStateCode, ARequesterNumber, ATraderName, ATraderStreet,
  ATraderPostalCode, ATraderCity, ATraderCompanyType: LGP_PCHAR;
  AHTTPClient: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  Resp: TlgViesCheckVatResponse;
begin
  Result := nil;
  try
    CheckObject(AHTTPClient, TlgHTTPClient);
    Resp := TlgViesService.CheckVatTestService(ACountryCode, AVatNumber,
      ARequesterMemberStateCode, ARequesterNumber, ATraderName, ATraderStreet,
      ATraderPostalCode, ATraderCity, ATraderCompanyType, TlgHTTPClient(AHTTPClient));
    AResponse := TlgpViesCheckVatResponse.Create;
    TlgpViesCheckVatResponse(AResponse).FResponse := Resp;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpViesService_CheckStatus(AHTTPClient: LGP_OBJECT;
  var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  Resp: TlgViesStatusInformationResponse;
begin
  Result := nil;
  try
    CheckObject(AHTTPClient, TlgHTTPClient);
    Resp := TlgViesService.CheckStatus(TlgHTTPClient(AHTTPClient));
    AResponse := TlgpViesStatusInformationResponse.Create(Resp);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

{ TlgViesStatusInformationResponse }

constructor TlgpViesStatusInformationResponse.Create(
  AResponse: TlgViesStatusInformationResponse);
var
  CS: TlgViesCountryStatus;
  PCS: TlgpViesCountryStatus;
begin
  FVowAvaiable := AResponse.VowAvaiable;
  FCountries := TlgpViesCountryStatuses.Create(True);
  for CS in AResponse.Countries do
  begin
    PCS := TlgpViesCountryStatus.Create;
    PCS.FStatus := CS;
    FCountries.Add(PCS);
  end;
end;

destructor TlgpViesStatusInformationResponse.Destroy;
begin
  if Assigned(FCountries) then
    FCountries.Free;
  inherited Destroy;
end;

end.

