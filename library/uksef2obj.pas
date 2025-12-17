unit uKSeF2Obj;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, lgBackend, lgKSeFTypes, uObject, uTypes, uException,
  lgKSeF2Objects, TypInfo;

procedure lgpInitKSeF2Classes;
procedure lgpFreeKSeF2Classes;
function lgpKSeF2_CreateKSeFClass(AClassName: LGP_PCHAR): LGP_OBJECT; stdcall;
function lgpKSeF2_KSeFClassSetExt(AObject: LGP_OBJECT; AExtObj: LGP_POINTER): LGP_OBJECT; stdcall;

implementation

type
  TKSeFClasses = class(specialize TlgClassList<TKSeF2ObjectClass>);

var
  KSeFClsList: TKSeFClasses = nil;

procedure lgpInitKSeF2Classes;
begin
  if KSeFClsList = nil then
  begin
    KSeFClsList := TKSeFClasses.Create;
    KSeFClsList.AddRange([
      TKSeF2AuthenticationChallengeResponse,
      TKSeF2TokenInfo,
      TKSeF2AuthenticationInitResponse,
      TKSeF2StatusInfo,
      TKSeF2AuthenticationOperationStatusResponse,
      TKSeF2AuthenticationTokensResponse,
      TKSeF2AuthenticationTokenRefreshResponse,
      TKSeF2AuthenticationListItem,
      TKSeF2AuthenticationList,
      TKSeF2AuthenticationListResponse,
      TKSeF2PublicKeyCertificate,
      TKSeF2PublicKeyCertificateArray,
      TKSeF2PublicKeyCertificateResponse,
      TKSeF2FormCode,
      TKSeF2EncryptionInfo,
      TKSeF2OpenOnlineSessionRequest,
      TKSeF2OpenOnlineSessionResponse,
      TKSeF2SendInvoiceRequest,
      TKSeF2SendInvoiceResponse,
      TKSeF2BatchFilePartInfo,
      TKSeF2BatchFilePartInfoArray,
      TKSeF2BatchFileInfo,
      TKSeF2OpenBatchSessionRequest,
      TKSeF2KeyValuePair,
      TKSeF2KeyValuePairs,
      TKSeF2PartUploadRequest,
      TKSeF2PartUploadRequestArray,
      TKSeF2OpenBatchSessionResponse,
      TKSeF2SessionsQueryResponseItem,
      TKSeF2SessionsQueryResponseArray,
      TKSeF2SessionsQueryResponse,
      TKSeF2UpoPageResponse,
      TKSeF2UpoPageResponseArray,
      TKSeF2UpoResponse,
      TKSeF2SessionStatusResponse,
      TKSeF2InvoiceStatusInfo,
      TKSeF2SessionInvoiceStatusResponse,
      TKSeF2SessionInvoiceStatusResponseArray,
      TKSeF2SessionInvoicesResponse,
      TKSeF2InvoiceQueryDateRange,
      TKSeF2InvoiceQueryAmount,
      TKSeF2InvoiceQueryBuyerIdentifier,
      TKSeF2InvoiceQueryFilters,
      TKSeF2InvoiceMetadataSeller,
      TKSeF2InvoiceMetadataBuyerIdentifier,
      TKSeF2InvoiceMetadataBuyer,
      TKSeF2InvoiceMetadataThirdSubjectIdentifier,
      TKSeF2InvoiceMetadataThirdSubject,
      TKSeF2InvoiceMetadataThirdSubjectArray,
      TKSeF2InvoiceMetadataAuthorizedSubject,
      TKSeF2InvoiceMetadata,
      TKSeF2InvoiceMetadataArray,
      TKSeF2QueryInvoicesMetadataResponse,
      TKSeF2InvoiceExportRequest,
      TKSeF2ExportInvoicesResponse,
      TKSeF2InvoicePackagePart,
      TKSeF2InvoicePackagePartArray,
      TKSeF2InvoicePackage,
      TKSeF2InvoiceExportStatusResponse,
      TKSeF2GenerateTokenRequest,
      TKSeF2GenerateTokenResponse,
      TKSeF2TokenAuthorIdentifierTypeIdentifier,
      TKSeF2TokenContextIdentifierTypeIdentifier,
      TKSeF2QueryTokensResponseItem,
      TKSeF2QueryTokensResponseArray,
      TKSeF2QueryTokensResponse,
      TKSeF2TokenStatusResponse,
      TKSeF2Subunit,
      TKSeF2SubunitArray,
      TKSeF2SubjectCreateRequest,
      TKSeF2PersonCreateRequest
      ]);
  end;
end;

procedure lgpFreeKSeF2Classes;
begin
  if Assigned(KSeFClsList) then
    FreeAndNil(KSeFClsList);
end;

function lgpKSeF2_CreateKSeFClass(AClassName: LGP_PCHAR): LGP_OBJECT; stdcall;
var
  C: TKSeF2ObjectClass;
begin
  Result := nil;
  if not Assigned(KSeFClsList) then
    lgpInitKSeF2Classes;
  if Assigned(KSeFClsList) then
  begin
    C := TKSeF2ObjectClass(KSeFClsList.FindByClassName(AClassName));
    if C <> nil then
      Result := C.Create(nil);
  end;
end;

function lgpKSeF2_KSeFClassSetExt(AObject: LGP_OBJECT; AExtObj: LGP_POINTER
  ): LGP_OBJECT; stdcall;
begin
  Result := nil;
  try
    CheckObject(AObject, TKSeF2Object);
    with TKSeF2Object(AObject) do
    begin
      ExternalObject := AExtObj;
      if Assigned(Owner) then
        Owner.RemoveObject(TKSeF2Object(AObject));
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

{$ifdef LGP_DEBUG_OBJ}
initialization
  KSeFObjectDbgCreate := @lgpDbgAddObject;
  KSeFObjectDbgDestroy := @lgpDbgRemoveObject;
{$endif}

end.

