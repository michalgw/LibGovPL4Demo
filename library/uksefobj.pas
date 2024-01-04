{ **************************************************************************** }
{                                                                              }
{ LibGovPl4                                                                    }
{                                                                              }
{ Copyright (c) 2016 - 2023 GM Systems Michał Gawrycki                         }
{                                                                              }
{ **************************************************************************** }

unit uKSeFObj;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, lgBackend, lgKSeFTypes, uObject, uTypes, uException;

procedure lgpInitKSeFClasses;
procedure lgpFreeKSeFClasses;
function lgpKSeF_CreateKSeFClass(AClassName: LGP_PCHAR): LGP_OBJECT; stdcall;

implementation

type
  TKSeFClasses = class(specialize TlgClassList<TClass>);

var
  KSeFClsList: TKSeFClasses = nil;

procedure lgpInitKSeFClasses;
begin
  if KSeFClsList = nil then
  begin
    KSeFClsList := TKSeFClasses.Create;
    KSeFClsList.AddRange([
      TKSeFSubjectIdentifierBy,
      TKSeFSubjectIdentifierByCompany,
      TKSeFSubjectIdentifierInternal,
      TKSeFSubjectCompleteName,
      TKSeFSubjectName,
      TKSeFSubjectFullName,
      TKSeFSubjectPersonName,
      TKSeFSubjectNone,
      TKSeFCredentialsIdentifierResponse,
      TKSeFCredentialsRoleResponseBase,
      TKSeFCredentialsRoleResponseGrantedForInstitution,
      TKSeFCredentialsRoleResponseStandardDetails,
      TKSeFCredentialsRoleResponseStandardPlain,
      TKSeFCredentialsRoleResponseToken,
      TKSeFCredentialsRoleResponseStandardContextDetails,
      TKSeFCredentialsRoleResponseBaseArray,
      TKSeFSessionContext,
      TKSeFInitialisedSession,
      TKSeFInitSessionResponse,
      TKSeFSessionInvoiceStatus,
      TKSeFSessionInvoiceStatusArray,
      TKSeFSessionStatusResponse,
      TKSeFTerminateSessionResponse,
      TKSeFSendInvoiceResponse,
      TKSeFInvoiceStatus,
      TKSeFHideInvoiceRequestType,
      TKSeFHideInvoiceRequest,
      TKSeFStatusInvoiceResponse,
      TKSeFShowInvoiceRequestType,
      TKSeFShowInvoiceRequest,
      TKSeFVisibilityInvoiceResponse,
      TKSeFSubjectBy,
      TKSeFSubjectIdentifierTo,
      TKSeFSubjectIdentifierToNone,
      TKSeFSubjectIdentifierToCompany,
      TKSeFSubjectIdentifierToOther,
      TKSeFSubjectIdentifierToVatUe,
      TKSeFSubjectTo,
      TKSeFQueryCriteriaInvoice,
      TKSeFQueryCriteriaInvoiceDetail,
      TKSeFQueryCriteriaInvoiceIncremental,
      TKSeFQueryCriteriaInvoiceRange,
      TKSeFQueryInvoiceRequest,
      TKSeFHashSHA,
      TKSeFFileUnlimitedHash,
      TKSeFSubjectToArray,
      TKSeFSubjectAuthorized,
      TKSeFSubjectAuthorizedArray,
      TKSeFSubjectIdentifierOtherTo,
      TKSeFSubjectIdentifierOtherToInternal,
      TKSeFSubjectIdentifierOtherToNone,
      TKSeFSubjectIdentifierOtherToNrId,
      TKSeFSubjectIdentifierOtherToCompany,
      TKSeFSubjectIdentifierOtherToVatUe,
      TKSeFSubjectOther,
      TKSeFSubjectOtherArray,
      TKSeFInvoiceHeader,
      TKSeFInvoiceHeaderArray,
      TKSeFQueryInvoiceSyncResponse,
      TKSeFQueryInvoiceAsyncInitResponse,
      TKSeFInvoiceDivisionPlainPart,
      TKSeFInvoiceDivisionPlainPartArray,
      TKSeFQueryInvoiceAsyncStatusResponse,
      TKSeFInternalIdentifierGeneratedResponse,
      TKSeFCredentialsIdentifierRequest,
      TKSeFQueryCriteriaCredentials,
      TKSeFQueryCriteriaCredentialsAll,
      TKSeFQueryCriteriaCredentialsId,
      TKSeFQuerySyncCredentialsRequest,
      TKSeFCredentialsBaseTypeObject,
      TKSeFQuerySyncCredentialsResponse,
      TKSeFGetPaymentIdentifierReferenceNumbersResponse,
      TKSeFRequestPaymentIdentifierResponse,
      TKSeFInvoiceQueryDetails,
      TKSeFInvoiceRequestKSeF,
      TKSeFStatusResponse,
      TKSeFAnonymousSubjectIdentifierTo,
      TKSeFAnonymousSubjectIdentifierToNone,
      TKSeFAnonymousSubjectIdentifierToCompany,
      TKSeFAnonymousSubjectIdentifierToOtherTax,
      TKSeFInvoiceDownloadRequest,
      TKSeFInvoiceVerificationRequest,
      TKSeFInvoiceVerificationResponse,
      TKSeFCredentialsContext,
      TKSeFCredentialsPlain,
      TKSeFCredentialsToken,
      TKSeFCredentialsParent,
      TKSeFCredentialsBaseTypeObjectArray,
      TKSeFQuerySyncCredentialsResponse,
      TKSeFRevokeTokenRequestType,
      TKSeFRevokeTokenRequest,
      TKSeFCredentialsIdentifierRequestInstitutional,
      TKSeFCredentialsIdentifierRequestInternal,
      TKSeFCredentialsIdentifierRequestInstitutionalNip,
      TKSeFCredentialsIdentifierRequestIndividual,
      TKSeFCredentialsIdentifierRequestIndividualCertificateFingerprint,
      TKSeFCredentialsIdentifierRequestIndividualNip,
      TKSeFCredentialsIdentifierRequestIndividualPesel,
      TKSeFCredentialsRoleRequestContextDescribed,
      TKSeFGrantContextCredentialsRequestType,
      TKSeFGrantContextCredentialsRequest,
      TKSeFStatusCredentialsResponse,
      TKSeFCredentialsRoleRequestContextBase,
      TKSeFRevokeContextCredentialsRequestType,
      TKSeFRevokeContextCredentialsRequest,
      TKSeFCredentialsRoleRequestToken,
      TKSeFCredentialsRoleRequestTokenArray,
      TKSeFGenerateTokenRequestType,
      TKSeFGenerateTokenRequest,
      TKSeFGenerateTokenResponse,
      TKSeFCredentialsRoleRequestStandardDescribed,
      TKSeFCredentialsRoleRequestStandardDescribedArray,
      TKSeFGrantCredentialsRequestType,
      TKSeFGrantCredentialsRequest,
      TKSeFCredentialsRoleRequestStandardBase,
      TKSeFCredentialsRoleRequestStandardBaseArray,
      TKSeFRevokeCredentialsRequestType,
      TKSeFRevokeCredentialsRequest
      ]);
  end;
end;

procedure lgpFreeKSeFClasses;
begin
  if Assigned(KSeFClsList) then
    FreeAndNil(KSeFClsList);
end;

function lgpKSeF_CreateKSeFClass(AClassName: LGP_PCHAR): LGP_OBJECT; stdcall;
var
  C: TClass;
begin
  Result := nil;
  if Assigned(KSeFClsList) then
  begin
    C := KSeFClsList.FindByClassName(AClassName);
    if C <> nil then
      Result := C.Create;
  end;
end;


end.

