{ **************************************************************************** }
{                                                                              }
{ LibGovPl4                                                                    }
{                                                                              }
{ Copyright (c) 2016 - 2023 GM Systems Michał Gawrycki                         }
{                                                                              }
{ **************************************************************************** }

unit LibGovPl4Vies;

{$I libgovpl4def.inc}

interface

uses
  LibGovPl4Intf, LibGovPl4Obj, LibGovPl4Backend, Classes;

type
  TlgoViesMatchType = (vmtValid, vmtInvalid, vmtNot_Processed);

  { TlgoViesCheckVatResponse }

  TlgoViesCheckVatResponse = class(TlgoObject)
  private
    function GetAddress: UTF8String;
    function GetCountryCode: UTF8String;
    function GetName: UTF8String;
    function GetRawResponse: UTF8String;
    function GetRequestDate: TDateTime;
    function GetRequestIdentifier: UTF8String;
    function GetTraderCity: UTF8String;
    function GetTraderCityMatch: TlgoViesMatchType;
    function GetTraderCompanyType: UTF8String;
    function GetTraderCompanyTypeMatch: TlgoViesMatchType;
    function GetTraderName: UTF8String;
    function GetTraderNameMatch: TlgoViesMatchType;
    function GetTraderPostalCode: UTF8String;
    function GetTraderPostalCodeMatch: TlgoViesMatchType;
    function GetTraderStreet: UTF8String;
    function GetTraderStreetMatch: TlgoViesMatchType;
    function GetValid: Boolean;
    function GetVatNumber: UTF8String;
  published
    property CountryCode: UTF8String read GetCountryCode;
    property VatNumber: UTF8String read GetVatNumber;
    property RequestDate: TDateTime read GetRequestDate;
    property Valid: Boolean read GetValid;
    property RequestIdentifier: UTF8String read GetRequestIdentifier;
    property Name: UTF8String read GetName;
    property Address: UTF8String read GetAddress;
    property TraderName: UTF8String read GetTraderName;
    property TraderStreet: UTF8String read GetTraderStreet;
    property TraderPostalCode: UTF8String read GetTraderPostalCode;
    property TraderCity: UTF8String read GetTraderCity;
    property TraderCompanyType: UTF8String read GetTraderCompanyType;
    property TraderNameMatch: TlgoViesMatchType read GetTraderNameMatch;
    property TraderStreetMatch: TlgoViesMatchType read GetTraderStreetMatch;
    property TraderPostalCodeMatch: TlgoViesMatchType read GetTraderPostalCodeMatch;
    property TraderCityMatch: TlgoViesMatchType read GetTraderCityMatch;
    property TraderCompanyTypeMatch: TlgoViesMatchType read GetTraderCompanyTypeMatch;
    property RawResponse: UTF8String read GetRawResponse;
  end;

  TlgoViesAvailabilityStatus = (vasAvailable, vasUnavailable, vasMonitoringDisabled);

  { TlgoViesCountryStatus }

  TlgoViesCountryStatus = class(TlgoObject)
  private
    function GetAvailability: TlgoViesAvailabilityStatus;
    function GetCountryCode: UTF8String;
  public
    destructor Destroy; override;
  published
    property CountryCode: UTF8String read GetCountryCode;
    property Availability: TlgoViesAvailabilityStatus read GetAvailability;
  end;

  { TlgoViesCountryStatuses }

  TlgoViesCountryStatuses = class(TlgoObject)
  private
    FList: TList;
  public
    constructor Create(AObject: LGP_OBJECT); overload; override;
    destructor Destroy; override;
    function Count: Integer;
    function GetItem(AIndex: Integer): TlgoViesCountryStatus;
  //published
    property Items[AIndex: Integer]: TlgoViesCountryStatus read GetItem;
  end;

  { TlgoViesStatusInformationResponse }

  TlgoViesStatusInformationResponse = class(TlgoObject)
  private
    FCountries: TlgoViesCountryStatuses;
    function GetVowAvaiable: Boolean;
  public
    constructor Create(AObject: LGP_OBJECT); overload; override;
    destructor Destroy; override;
  published
    property VowAvaiable: Boolean read GetVowAvaiable;
    property Countries: TlgoViesCountryStatuses read FCountries;
  end;

  { TlgoViesService }

  TlgoViesService = class
  public
    class function CheckVatNumber(AHTTPClient: TlgoHTTPClient; const ACountryCode, AVatNumber: UTF8String;
      const ARequesterMemberStateCode: UTF8String = ''; const ARequesterNumber: UTF8String = '';
      const ATraderName: UTF8String = ''; const ATraderStreet: UTF8String = '';
      const ATraderPostalCode: UTF8String = ''; const ATraderCity: UTF8String = '';
      const ATraderCompanyType: UTF8String = ''): TlgoViesCheckVatResponse; overload;
    class function CheckVatTestService(AHTTPClient: TlgoHTTPClient; const ACountryCode, AVatNumber: UTF8String;
      const ARequesterMemberStateCode: UTF8String = ''; const ARequesterNumber: UTF8String = '';
      const ATraderName: UTF8String = ''; const ATraderStreet: UTF8String = '';
      const ATraderPostalCode: UTF8String = ''; const ATraderCity: UTF8String = '';
      const ATraderCompanyType: UTF8String = ''): TlgoViesCheckVatResponse; overload;
    class function CheckStatus(AHTTPClient: TlgoHTTPClient): TlgoViesStatusInformationResponse;
  end;

function lgoViesAvailabilityToStr(AValue: TlgoViesAvailabilityStatus): String;

implementation

function lgoViesAvailabilityToStr(AValue: TlgoViesAvailabilityStatus): String;
const
  AVSTR: array[TlgoViesAvailabilityStatus] of String = ('Available', 'Unavailable',
    'Monitoring Disabled');
begin
  Result := AVSTR[AValue];
end;

{ TlgoViesCheckVatResponse }

function TlgoViesCheckVatResponse.GetAddress: UTF8String;
begin
  Result := GetStringProp('Address');
end;

function TlgoViesCheckVatResponse.GetCountryCode: UTF8String;
begin
  Result := GetStringProp('CountryCode');
end;

function TlgoViesCheckVatResponse.GetName: UTF8String;
begin
  Result := GetStringProp('Name');
end;

function TlgoViesCheckVatResponse.GetRawResponse: UTF8String;
begin
  Result := GetStringProp('RawResponse');
end;

function TlgoViesCheckVatResponse.GetRequestDate: TDateTime;
begin
  Result := GetDoubleProp('RequestDate');
end;

function TlgoViesCheckVatResponse.GetRequestIdentifier: UTF8String;
begin
  Result := GetStringProp('RequestIdentifier');
end;

function TlgoViesCheckVatResponse.GetTraderCity: UTF8String;
begin
  Result := GetStringProp('TraderCity');
end;

function TlgoViesCheckVatResponse.GetTraderCityMatch: TlgoViesMatchType;
begin
  Result := TlgoViesMatchType(GetIntegerProp('TraderCityMatch'));
end;

function TlgoViesCheckVatResponse.GetTraderCompanyType: UTF8String;
begin
  Result := GetStringProp('TraderCompanyType');
end;

function TlgoViesCheckVatResponse.GetTraderCompanyTypeMatch: TlgoViesMatchType;
begin
  Result := TlgoViesMatchType(GetIntegerProp('TraderCompanyTypeMatch'));
end;

function TlgoViesCheckVatResponse.GetTraderName: UTF8String;
begin
  Result := GetStringProp('TraderName');
end;

function TlgoViesCheckVatResponse.GetTraderNameMatch: TlgoViesMatchType;
begin
  Result := TlgoViesMatchType(GetIntegerProp('TraderNameMatch'));
end;

function TlgoViesCheckVatResponse.GetTraderPostalCode: UTF8String;
begin
  Result := GetStringProp('TraderPostalCode');
end;

function TlgoViesCheckVatResponse.GetTraderPostalCodeMatch: TlgoViesMatchType;
begin
  Result := TlgoViesMatchType(GetIntegerProp('TraderPostalCodeMatch'));
end;

function TlgoViesCheckVatResponse.GetTraderStreet: UTF8String;
begin
  Result := GetStringProp('TraderStreet');
end;

function TlgoViesCheckVatResponse.GetTraderStreetMatch: TlgoViesMatchType;
begin
  Result := TlgoViesMatchType(GetIntegerProp('TraderStreetMatch'));
end;

function TlgoViesCheckVatResponse.GetValid: Boolean;
begin
  Result := GetBooleanProp('Valid');
end;

function TlgoViesCheckVatResponse.GetVatNumber: UTF8String;
begin
  Result := GetStringProp('VatNumber');
end;

{ TlgoViesCountryStatus }

function TlgoViesCountryStatus.GetAvailability: TlgoViesAvailabilityStatus;
begin
  Result := TlgoViesAvailabilityStatus(GetIntegerProp('Availability'));
end;

function TlgoViesCountryStatus.GetCountryCode: UTF8String;
begin
  Result := GetStringProp('CountryCode');
end;

destructor TlgoViesCountryStatus.Destroy;
begin
  ExtObject := nil;
  inherited Destroy;
end;

{ TlgoViesCountryStatuses }

constructor TlgoViesCountryStatuses.Create(AObject: LGP_OBJECT);
begin
  inherited Create(AObject);
  FList := TList.Create;
end;

destructor TlgoViesCountryStatuses.Destroy;
begin
  while FList.Count > 0 do
  begin
    TlgoViesCountryStatus(FList[0]).Free;
    FList.Delete(0);
  end;
  FList.Free;
  ExtObject := nil;
  inherited Destroy;
end;

function TlgoViesCountryStatuses.Count: Integer;
begin
  lgoCheckResult(lgpListObject_GetCount(ExtObject, Result));
end;

function TlgoViesCountryStatuses.GetItem(AIndex: Integer
  ): TlgoViesCountryStatus;
var
  Item: LGP_OBJECT;
begin
  if (FList.Count > AIndex) and (FList.Items[AIndex] <> nil) then
    Result := TlgoViesCountryStatus(FList[AIndex])
  else
  begin
    lgoCheckResult(lgpListObject_GetItem(ExtObject, AIndex, Item));
    if Item <> nil then
    begin
      Result := TlgoViesCountryStatus.Create(Item);
      if AIndex >= FList.Count then
        FList.Count := AIndex + 1;
      FList[AIndex] := Result;
    end
    else
      Result := nil;
  end;
end;

{ TlgoViesStatusInformationResponse }

function TlgoViesStatusInformationResponse.GetVowAvaiable: Boolean;
begin
  Result := GetBooleanProp('VowAvaiable');
end;

constructor TlgoViesStatusInformationResponse.Create(AObject: LGP_OBJECT);
var
  O: LGP_OBJECT;
begin
  inherited Create(AObject);
  O := GetObjectProp('Countries');
  if O <> nil then
    FCountries := TlgoViesCountryStatuses.Create(O);
end;

destructor TlgoViesStatusInformationResponse.Destroy;
begin
  if Assigned(FCountries) then
    FCountries.Free;
  inherited Destroy;
end;

{ TlgoViesService }

class function TlgoViesService.CheckVatNumber(AHTTPClient: TlgoHTTPClient;
  const ACountryCode, AVatNumber: UTF8String;
  const ARequesterMemberStateCode: UTF8String;
  const ARequesterNumber: UTF8String; const ATraderName: UTF8String;
  const ATraderStreet: UTF8String; const ATraderPostalCode: UTF8String;
  const ATraderCity: UTF8String; const ATraderCompanyType: UTF8String
  ): TlgoViesCheckVatResponse;
var
  Resp: LGP_OBJECT;
begin
  lgoCheckResult(lgpViesService_CheckVatNumber(LGP_PCHAR(ACountryCode),
    LGP_PCHAR(AVatNumber), LGP_PCHAR(ARequesterMemberStateCode),
    LGP_PCHAR(ARequesterNumber), LGP_PCHAR(ATraderName), LGP_PCHAR(ATraderStreet),
    LGP_PCHAR(ATraderPostalCode), LGP_PCHAR(ATraderCity), LGP_PCHAR(ATraderCompanyType),
    AHTTPClient.ExtObject, Resp));
  if Resp <> nil then
    Result := TlgoViesCheckVatResponse.Create(Resp)
  else
    Result := nil;
end;

class function TlgoViesService.CheckVatTestService(AHTTPClient: TlgoHTTPClient;
  const ACountryCode, AVatNumber: UTF8String;
  const ARequesterMemberStateCode: UTF8String;
  const ARequesterNumber: UTF8String; const ATraderName: UTF8String;
  const ATraderStreet: UTF8String; const ATraderPostalCode: UTF8String;
  const ATraderCity: UTF8String; const ATraderCompanyType: UTF8String
  ): TlgoViesCheckVatResponse;
var
  Resp: LGP_OBJECT;
begin
  lgoCheckResult(lgpViesService_CheckVatTestService(LGP_PCHAR(ACountryCode),
    LGP_PCHAR(AVatNumber), LGP_PCHAR(ARequesterMemberStateCode),
    LGP_PCHAR(ARequesterNumber), LGP_PCHAR(ATraderName), LGP_PCHAR(ATraderStreet),
    LGP_PCHAR(ATraderPostalCode), LGP_PCHAR(ATraderCity), LGP_PCHAR(ATraderCompanyType),
    AHTTPClient.ExtObject, Resp));
  if Resp <> nil then
    Result := TlgoViesCheckVatResponse.Create(Resp)
  else
    Result := nil;
end;

class function TlgoViesService.CheckStatus(AHTTPClient: TlgoHTTPClient
  ): TlgoViesStatusInformationResponse;
var
  Resp: LGP_OBJECT;
begin
  lgoCheckResult(lgpViesService_CheckStatus(AHTTPClient.ExtObject, Resp));
  if Resp <> nil then
    Result := TlgoViesStatusInformationResponse.Create(Resp)
  else
    Result := nil;
end;

end.
