#include "hbclass.ch"
#include "hlibgovpl4.ch"

CREATE CLASS TlgoKSeF INHERIT TlgoObject

   HIDDEN:
   VAR oCertificate INIT NIL
   VAR aRSAKeys INIT { NIL, NIL, NIL }
   VAR oXAdES INIT NIL
   VAR oHTTPClient INIT NIL

   VISIBLE:
   METHOD New() CONSTRUCTOR
   METHOD GenerateAESKey()
   METHOD SessionInitSigned()
   METHOD SessionInitToken()
   METHOD SessionChalangePZ()
   METHOD SessionInitPZ( cSignedInit )
   METHOD SessionStatus( cReferenceNumber, nPageSize, nPageOffset, lIncludeDetails )
   METHOD SessionTerminate( lForce )
   METHOD SessionGenerateInternalIdentifier( cInputDigitsSequence )
   METHOD InvoiceGet( cKSeFReferenceNumber, oOutputStream )
   METHOD InvoiceSend( oDataStream )
   METHOD InvoiceStatus( cInvoiceElementReferenceNumber )
   METHOD InvoiceVisibilityHide( cKsefReferenceNumber, cHidingReason )
   METHOD InvoiceVisibilityShow( cKsefReferenceNumber, cHidingCancelationReason )
   METHOD CredentialsContextGrant( oGrantContextCredentialsRequest )
   METHOD CredentialsContextRevoke( oRevokeContextCredentialsRequest )
   METHOD CredentialsGenerateToken( oGenerateTokenRequest )
   METHOD CredentialsGrant( oGrantCredentialsRequest )
   METHOD CredentialsRevoke( oRevokeCredentialsRequest )
   METHOD CredentialsRevokeToken( oRevokeTokenRequest )
   METHOD CredentialsStatus( cCredentialsElementReferenceNumber )
   METHOD QueryCredentialContextSync( cContextNip, cSourceIdentifier, cTargetIdentifier )
   METHOD QueryCredentialSync( oQuerySyncCredentialsRequest )
   METHOD QueryInvoiceSync( oQueryCriteria, nPageSize, nPageOffset )
   METHOD QueryInvoiceAsyncInit( oQueryCriteria )
   METHOD QueryInvoiceAsyncStatus( cQueryElementReferenceNumber )
   METHOD QueryInvoiceAsyncFetch( cQueryElementReferenceNumber, cPartElementReferenceNumber, oOutStream )
   //METHOD QueryInvoiceAsyncFetch( oStatusResponse, nPartIndex, oOutStream )
   METHOD PaymentIdentifierGetReferenceNumbers( cPaymentIdentifier )
   METHOD PaymentIdentifierRequest( aKsefReferenceNumberList )
   METHOD CommonInvoiceKSeF( oInvoiceRequest, oOutStream, nGateType )
   METHOD CommonDownload( cKsefReferenceNumber, oDownloadRequest, oOutStream, nGateType )
   METHOD CommonStatus( cReferenceNumber, nGateType )
   METHOD CommonVerification( cKsefReferenceNumber, oVerificationRequest, nGateType )
   METHOD BatchSign( oZIPDataStream, lPZ, oEncryptedStream, cInitUpload, cZIPFileName, cPartFileName )
   METHOD BatchSend( oPartStream, cInitUpload )

   ACCESS RSAEncryptClass METHOD GetRSAEncryptClass()
   ASSIGN RSAEncryptClass METHOD SetRSAEncryptClass( cClassName )
   ACCESS Base64EncoderClass METHOD GetBase64EncoderClass()
   ASSIGN Base64EncoderClass METHOD SetBase64EncoderClass( cClassName )
   ACCESS AES256EncryptClass METHOD GetAES256EncryptClass()
   ASSIGN AES256EncryptClass METHOD SetAES256EncryptClass( cClassName )
   ACCESS SHA256HashClass METHOD GetSHA256HashClass()
   ASSIGN SHA256HashClass METHOD SetSHA256HashClass( cClassName )
   ACCESS RandomGeneratorClass METHOD GetRandomGeneratorClass()
   ASSIGN RandomGeneratorClass METHOD SetRandomGeneratorClass( cClassName )

   ACCESS XAdES INLINE ( ::oXAdES )
   ASSIGN XAdES METHOD SetXAdES( oValue )
   ACCESS HTTPClient INLINE ( ::oHTTPClient )
   ASSIGN HTTPClient METHOD SetHTTPClient( oValue )

   ACCESS RSAKeyProd INLINE ( ::aRSAKeys[ 1 ] )
   ASSIGN RSAKeyProd METHOD SetRSAKeyProd( oValue )
   ACCESS RSAKeyDemo INLINE ( ::aRSAKeys[ 2 ] )
   ASSIGN RSAKeyDemo METHOD SetRSAKeyDemo( oValue )
   ACCESS RSAKeyTest INLINE ( ::aRSAKeys[ 3 ] )
   ASSIGN RSAKeyTest METHOD SetRSAKeyTest( oValue )

   ACCESS GateType METHOD GetGateType()
   ASSIGN GateType METHOD SetGateType( nValue )
   ACCESS NIP METHOD GetNIP()
   ASSIGN NIP METHOD SetNIP( cValue )

   ACCESS FormCode METHOD GetFormCode()
   ASSIGN FormCode METHOD SetFormCode( nValue )
   ACCESS FormCodeSystemCode METHOD GetFormCodeSystemCode()
   ASSIGN FormCodeSystemCode METHOD SetFormCodeSystemCode( cValue )
   ACCESS FormCodeSchemaVersion METHOD GetFormCodeSchemaVersion()
   ASSIGN FormCodeSchemaVersion METHOD SetFormCodeSchemaVersion( cValue )
   ACCESS FormCodeTargetNamespace METHOD GetFormCodeTargetNamespace()
   ASSIGN FormCodeTargetNamespace METHOD SetFormCodeTargetNamespace( cValue )
   ACCESS FormCodeValue METHOD GetFormCodeValue()
   ASSIGN FormCodeValue METHOD SetFormCodeValue( cValue )

   ACCESS Certificate INLINE ( ::oCertificate )
   ASSIGN Certificate METHOD SetCertificate( oValue )
   ACCESS CertificateAuthType METHOD GetCertificateAuthType()
   ASSIGN CertificateAuthType METHOD SetCertificateAuthType( nValue )

   ACCESS Token METHOD GetToken()
   ASSIGN Token METHOD SetToken( cValue )

   ACCESS Encryption METHOD GetEncryption()
   ASSIGN Encryption METHOD SetEncryption( lValue )

   ACCESS SessionToken METHOD GetSessionToken()
   ACCESS SessionActive METHOD GetSessionActive()

ENDCLASS

METHOD New() CLASS TlgoKSeF

   LOCAL pExtObj

   lgoCheckResult( lgpKSeF_Create( @pExtObj ) )
   ::pExtObject := pExtObj

   RETURN Self

METHOD GenerateAESKey() CLASS TlgoKSeF

   lgoCheckResult( lgpKSeF_GenerateAESKey( ::pExtObject ) )

   RETURN NIL

METHOD SessionInitSigned() CLASS TlgoKSeF

   LOCAL pResp

   lgoCheckResult( lgpKSeF_SessionInitSigned( ::pExtObject, @pResp ) )

   RETURN lgoCreateObject( pResp )

METHOD SessionInitToken() CLASS TlgoKSeF

   LOCAL pResp

   lgoCheckResult( lgpKSeF_SessionInitToken( ::pExtObject, @pResp ) )

   RETURN lgoCreateObject( pResp )

METHOD SessionChalangePZ() CLASS TlgoKSeF

   LOCAL pResp

   lgoCheckResult( lgpKSeF_SessionChalangePZ( ::pExtObject, @pResp ) )

   RETURN lgoGetString( pResp )

METHOD SessionInitPZ( cSignedInit ) CLASS TlgoKSeF

   LOCAL pResp

   lgoCheckResult( lgpKSeF_SessionInitPZ( ::pExtObject, cSignedInit, @pResp ) )

   RETURN lgoCreateObject( pResp )

METHOD SessionStatus( cReferenceNumber, nPageSize, nPageOffset, lIncludeDetails ) CLASS TlgoKSeF

   LOCAL pResp

   lgoCheckResult( lgpKSeF_SessionStatus( ::pExtObject, cReferenceNumber, nPageSize, nPageOffset, lIncludeDetails, @pResp ) )

   RETURN lgoCreateObject( pResp )

METHOD SessionTerminate( lForce ) CLASS TlgoKSeF

   LOCAL pResp

   lgoCheckResult( lgpKSeF_SessionTerminate( ::pExtObject, lForce, @pResp ) )

   RETURN lgoCreateObject( pResp )

METHOD SessionGenerateInternalIdentifier( cInputDigitsSequence ) CLASS TlgoKSeF

   LOCAL pResp

   lgoCheckResult( lgpKSeF_SessionGenerateInternalIdentifier( ::pExtObject, cInputDigitsSequence, @pResp ) )

   RETURN lgoCreateObject( pResp )

METHOD InvoiceGet( cKSeFReferenceNumber, oOutputStream ) CLASS TlgoKSeF

   lgoCheckResult( lgpKSeF_InvoiceGet( ::pExtObject, cKSeFReferenceNumber, oOutputStream:ExtObject ) )

   RETURN NIL

METHOD InvoiceSend( oDataStream ) CLASS TlgoKSeF

   LOCAL pResp

   lgoCheckResult( lgpKSeF_InvoiceGet( ::pExtObject, oDataStream:ExtObject, @pResp ) )

   RETURN lgoCreateObject( pResp )

METHOD InvoiceStatus( cInvoiceElementReferenceNumber ) CLASS TlgoKSeF

   LOCAL pResp

   lgoCheckResult( lgpKSeF_InvoiceStatus( ::pExtObject, cInvoiceElementReferenceNumber, @pResp ) )

   RETURN lgoCreateObject( pResp )

METHOD InvoiceVisibilityHide( cKsefReferenceNumber, cHidingReason ) CLASS TlgoKSeF

   LOCAL pResp

   lgoCheckResult( lgpKSeF_InvoiceVisibilityHide( ::pExtObject, cKsefReferenceNumber, cHidingReason, @pResp ) )

   RETURN lgoCreateObject( pResp )

METHOD InvoiceVisibilityShow( cKsefReferenceNumber, cHidingCancelationReason ) CLASS TlgoKSeF

   LOCAL pResp

   lgoCheckResult( lgpKSeF_InvoiceVisibilityShow( ::pExtObject, cKsefReferenceNumber, cHidingCancelationReason, @pResp ) )

   RETURN lgoCreateObject( pResp )

METHOD CredentialsContextGrant( oGrantContextCredentialsRequest ) CLASS TlgoKSeF

   LOCAL pResp

   lgoCheckResult( lgpKSeF_CredentialsContextGrant( ::pExtObject, oGrantContextCredentialsRequest:ExtObject, @pResp ) )

   RETURN lgoCreateObject( pResp )

METHOD CredentialsContextRevoke( oRevokeContextCredentialsRequest ) CLASS TlgoKSeF

   LOCAL pResp

   lgoCheckResult( lgpKSeF_CredentialsContextRevoke( ::pExtObject, oRevokeContextCredentialsRequest:ExtObject, @pResp ) )

   RETURN lgoCreateObject( pResp )

METHOD CredentialsGenerateToken( oGenerateTokenRequest ) CLASS TlgoKSeF

   LOCAL pResp

   lgoCheckResult( lgpKSeF_CredentialsGenerateToken( ::pExtObject, oGenerateTokenRequest:ExtObject, @pResp ) )

   RETURN lgoCreateObject( pResp )

METHOD CredentialsGrant( oGrantCredentialsRequest ) CLASS TlgoKSeF

   LOCAL pResp

   lgoCheckResult( lgpKSeF_CredentialsGrant( ::pExtObject, oGrantCredentialsRequest:ExtObject, @pResp ) )

   RETURN lgoCreateObject( pResp )

METHOD CredentialsRevoke( oRevokeCredentialsRequest ) CLASS TlgoKSeF

   LOCAL pResp

   lgoCheckResult( lgpKSeF_CredentialsRevoke( ::pExtObject, oRevokeCredentialsRequest:ExtObject, @pResp ) )

   RETURN lgoCreateObject( pResp )

METHOD CredentialsRevokeToken( oRevokeTokenRequest ) CLASS TlgoKSeF

   LOCAL pResp

   lgoCheckResult( lgpKSeF_CredentialsRevokeToken( ::pExtObject, oRevokeTokenRequest:ExtObject, @pResp ) )

   RETURN lgoCreateObject( pResp )

METHOD CredentialsStatus( cCredentialsElementReferenceNumber ) CLASS TlgoKSeF

   LOCAL pResp

   lgoCheckResult( lgpKSeF_CredentialsStatus( ::pExtObject, cCredentialsElementReferenceNumber:ExtObject, @pResp ) )

   RETURN lgoCreateObject( pResp )

METHOD QueryCredentialContextSync( cContextNip, cSourceIdentifier, cTargetIdentifier ) CLASS TlgoKSeF

   LOCAL pResp

   lgoCheckResult( lgpKSeF_QueryCredentialContextSync( ::pExtObject, cContextNip, cSourceIdentifier, cTargetIdentifier, @pResp ) )

   RETURN lgoCreateObject( pResp )

METHOD QueryCredentialSync( oQuerySyncCredentialsRequest ) CLASS TlgoKSeF

   LOCAL pResp

   lgoCheckResult( lgpKSeF_QueryCredentialSync( ::pExtObject, oQuerySyncCredentialsRequest:ExtObject, @pResp ) )

   RETURN lgoCreateObject( pResp )

METHOD QueryInvoiceSync( oQueryCriteria, nPageSize, nPageOffset ) CLASS TlgoKSeF

   LOCAL pResp

   lgoCheckResult( lgpKSeF_QueryInvoiceSync( ::pExtObject, oQueryCriteria:ExtObject, nPageSize, nPageOffset, @pResp ) )

   RETURN lgoCreateObject( pResp )

METHOD QueryInvoiceAsyncInit( oQueryCriteria ) CLASS TlgoKSeF

   LOCAL pResp

   lgoCheckResult( lgpKSeF_QueryInvoiceAsyncInit( ::pExtObject, oQueryCriteria:ExtObject, @pResp ) )

   RETURN lgoCreateObject( pResp )

METHOD QueryInvoiceAsyncStatus( cQueryElementReferenceNumber ) CLASS TlgoKSeF

   LOCAL pResp

   lgoCheckResult( lgpKSeF_QueryInvoiceAsyncStatus( ::pExtObject, cQueryElementReferenceNumber, @pResp ) )

   RETURN lgoCreateObject( pResp )

METHOD QueryInvoiceAsyncFetch( cQueryElementReferenceNumber, cPartElementReferenceNumber, oOutStream ) CLASS TlgoKSeF

   lgoCheckResult( lgpKSeF_QueryInvoiceAsyncFetch( ::pExtObject, cQueryElementReferenceNumber, cPartElementReferenceNumber, oOutStream:ExtObject ) )

   RETURN NIL

/* METHOD TlgoKSeF:QueryInvoiceAsyncFetch( oStatusResponse, nPartIndex, oOutStream )

   lgoCheckResult( lgpKSeF_QueryInvoiceAsyncFetch( ::pExtObject, oStatusResponse:ExtObject, nPartIndex, oOutStream:ExtObject ) )

   RETURN NIL
*/
METHOD PaymentIdentifierGetReferenceNumbers( cPaymentIdentifier ) CLASS TlgoKSeF

   LOCAL pResp

   lgoCheckResult( lgpKSeF_PaymentIdentifierGetReferenceNumbers( ::pExtObject, cPaymentIdentifier, @pResp ) )

   RETURN lgoCreateObject( pResp )

METHOD PaymentIdentifierRequest( aKsefReferenceNumberList ) CLASS TlgoKSeF

   LOCAL pResp, cList := ""

   IF HB_ISCHAR( aKsefReferenceNumberList )
      cList := aKsefReferenceNumberList
   ELSE
      AEval( aKsefReferenceNumberList, { | cEl |
         IF Len( cList ) > 0
            cList := cList + ";"
         ENDIF
         cList := cList + cEl
         RETURN NIL
      } )
   ENDIF

   lgoCheckResult( lgpKSeF_PaymentIdentifierGetReferenceNumbers( ::pExtObject, cList, @pResp ) )

   RETURN lgoCreateObject( pResp )

METHOD CommonInvoiceKSeF( oInvoiceRequest, oOutStream, nGateType ) CLASS TlgoKSeF

   lgoCheckResult( lgpKSeF_CommonInvoiceKSeF( ::pExtObject, oInvoiceRequest:ExtObject, oOutStream:ExtObject, nGateType ) )

   RETURN NIL

METHOD CommonDownload( cKsefReferenceNumber, oDownloadRequest, oOutStream, nGateType ) CLASS TlgoKSeF

   lgoCheckResult( lgpKSeF_CommonDownload( ::pExtObject, cKsefReferenceNumber, oDownloadRequest:ExtObject, oOutStream:ExtObject, nGateType ) )

   RETURN NIL

METHOD CommonStatus( cReferenceNumber, nGateType ) CLASS TlgoKSeF

   LOCAL pResp

   lgoCheckResult( lgpKSeF_CommonStatus( ::pExtObject, cReferenceNumber, nGateType, @pResp ) )

   RETURN lgoCreateObject( pResp )

METHOD CommonVerification( cKsefReferenceNumber, oVerificationRequest, nGateType ) CLASS TlgoKSeF

   LOCAL pResp

   lgoCheckResult( lgpKSeF_CommonVerification( ::pExtObject, cKsefReferenceNumber, oVerificationRequest:ExtObject, nGateType, @pResp ) )

   RETURN lgoCreateObject( pResp )

METHOD BatchSign( oZIPDataStream, lPZ, oEncryptedStream, cInitUpload, cZIPFileName, cPartFileName ) CLASS TlgoKSeF

   lgoCheckResult( lgpKSeF_BatchSign( ::pExtObject, oZIPDataStream, lPZ, oEncryptedStream, @cInitUpload, cZIPFileName, cPartFileName ) )

   RETURN NIL

METHOD BatchSend( oPartStream, cInitUpload ) CLASS TlgoKSeF

   LOCAL pResp

   lgoCheckResult( lgpKSeF_BatchSend( ::pExtObject, oPartStream:ExtObject, cInitUpload, @pResp ) )

   RETURN lgoGetString( pResp )

METHOD GetRSAEncryptClass() CLASS TlgoKSeF

   LOCAL cClassName

   lgoCheckResult( lgpKSeF_GetRSAEncryptClass( ::pExtObject, @cClassName ) )

   RETURN cClassName

METHOD SetRSAEncryptClass( cClassName ) CLASS TlgoKSeF

   lgoCheckResult( lgpKSeF_SetRSAEncryptClass( ::pExtObject, cClassName ) )

   RETURN NIL

METHOD GetBase64EncoderClass() CLASS TlgoKSeF

   LOCAL cClassName

   lgoCheckResult( lgpKSeF_GetBase64EncoderClass( ::pExtObject, @cClassName ) )

   RETURN cClassName

METHOD SetBase64EncoderClass( cClassName ) CLASS TlgoKSeF

   lgoCheckResult( lgpKSeF_SetBase64EncoderClass( ::pExtObject, cClassName ) )

   RETURN NIL

METHOD GetAES256EncryptClass() CLASS TlgoKSeF

   LOCAL cClassName

   lgoCheckResult( lgpKSeF_GetAES256EncryptClass( ::pExtObject, @cClassName ) )

   RETURN cClassName

METHOD SetAES256EncryptClass( cClassName ) CLASS TlgoKSeF

   lgoCheckResult( lgpKSeF_SetAES256EncryptClass( ::pExtObject, cClassName ) )

   RETURN NIL

METHOD GetSHA256HashClass() CLASS TlgoKSeF

   LOCAL cClassName

   lgoCheckResult( lgpKSeF_GetSHA256HashClass( ::pExtObject, @cClassName ) )

   RETURN cClassName

METHOD SetSHA256HashClass( cClassName ) CLASS TlgoKSeF

   lgoCheckResult( lgpKSeF_SetSHA256HashClass( ::pExtObject, cClassName ) )

   RETURN NIL

METHOD GetRandomGeneratorClass() CLASS TlgoKSeF

   LOCAL cClassName

   lgoCheckResult( lgpKSeF_GetRandomGeneratorClass( ::pExtObject, @cClassName ) )

   RETURN cClassName

METHOD SetRandomGeneratorClass( cClassName ) CLASS TlgoKSeF

   lgoCheckResult( lgpKSeF_SetRandomGeneratorClass( ::pExtObject, cClassName ) )

   RETURN NIL

METHOD SetXAdES( oValue ) CLASS TlgoKSeF

   LOCAL o

   ::oXAdES := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   lgoCheckResult( lgpKSeF_SetXAdES( ::pExtObject, o ) )

   RETURN NIL

METHOD SetHTTPClient( oValue ) CLASS TlgoKSeF

   LOCAL o

   ::oXAdES := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   lgoCheckResult( lgpKSeF_SetHTTPClient( ::pExtObject, o ) )

   RETURN NIL

METHOD SetRSAKeyProd( oValue ) CLASS TlgoKSeF

   LOCAL o

   ::aRSAKeys[ 1 ] := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   lgoCheckResult( lgpKSeF_SetRSAKey( ::pExtObject, LGP_KSEF_GATETYPE_PROD, o ) )

   RETURN NIL

METHOD SetRSAKeyDemo( oValue ) CLASS TlgoKSeF

   LOCAL o

   ::aRSAKeys[ 2 ] := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   lgoCheckResult( lgpKSeF_SetRSAKey( ::pExtObject, LGP_KSEF_GATETYPE_DEMO, o ) )

   RETURN NIL

METHOD SetRSAKeyTest( oValue ) CLASS TlgoKSeF

   LOCAL o

   ::aRSAKeys[ 3 ] := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   lgoCheckResult( lgpKSeF_SetRSAKey( ::pExtObject, LGP_KSEF_GATETYPE_TEST, o ) )

   RETURN NIL

METHOD GetGateType() CLASS TlgoKSeF

   LOCAL n

   lgoCheckResult( lgpKSeF_GetGateType( ::pExtObject, @n ) )

   RETURN n

METHOD SetGateType( nValue ) CLASS TlgoKSeF

   lgoCheckResult( lgpKSeF_SetGateType( ::pExtObject, nValue ) )

   RETURN NIL

METHOD GetNIP() CLASS TlgoKSeF

   LOCAL p

   lgoCheckResult( lgpKSeF_GetNIP( ::pExtObject, @p ) )

   RETURN lgoGetString( p )

METHOD SetNIP( cValue ) CLASS TlgoKSeF

   lgoCheckResult( lgpKSeF_SetNIP( ::pExtObject, cValue ) )

   RETURN NIL

METHOD GetFormCode() CLASS TlgoKSeF

   LOCAL n

   lgoCheckResult( lgpKSeF_GetFormCode( ::pExtObject, @n ) )

   RETURN n

METHOD SetFormCode( nValue ) CLASS TlgoKSeF

   lgoCheckResult( lgpKSeF_SetFormCode( ::pExtObject, nValue ) )

   RETURN NIL

METHOD GetFormCodeSystemCode() CLASS TlgoKSeF

   LOCAL p

   lgoCheckResult( lgpKSeF_GetFormCodeSystemCode( ::pExtObject, @p ) )

   RETURN lgoGetString( p )

METHOD SetFormCodeSystemCode( cValue ) CLASS TlgoKSeF

   lgoCheckResult( lgpKSeF_SetFormCodeSystemCode( ::pExtObject, cValue ) )

   RETURN NIL

METHOD GetFormCodeSchemaVersion() CLASS TlgoKSeF

   LOCAL p

   lgoCheckResult( lgpKSeF_GetFormCodeSchemaVersion( ::pExtObject, @p ) )

   RETURN lgoGetString( p )

METHOD SetFormCodeSchemaVersion( cValue ) CLASS TlgoKSeF

   lgoCheckResult( lgpKSeF_SetFormCodeSchemaVersion( ::pExtObject, cValue ) )

   RETURN NIL

METHOD GetFormCodeTargetNamespace() CLASS TlgoKSeF

   LOCAL p

   lgoCheckResult( lgpKSeF_GetFormCodeTargetNamespace( ::pExtObject, @p ) )

   RETURN lgoGetString( p )

METHOD SetFormCodeTargetNamespace( cValue ) CLASS TlgoKSeF

   lgoCheckResult( lgpKSeF_SetFormCodeTargetNamespace( ::pExtObject, cValue ) )

   RETURN NIL

METHOD GetFormCodeValue() CLASS TlgoKSeF

   LOCAL p

   lgoCheckResult( lgpKSeF_GetFormCodeValue( ::pExtObject, @p ) )

   RETURN lgoGetString( p )

METHOD SetFormCodeValue( cValue ) CLASS TlgoKSeF

   lgoCheckResult( lgpKSeF_SetFormCodeValue( ::pExtObject, cValue ) )

   RETURN NIL

METHOD SetCertificate( oValue ) CLASS TlgoKSeF

   LOCAL o

   ::oCertificate := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   lgoCheckResult( lgpKSeF_SetCertificate( ::pExtObject, o ) )

   RETURN NIL

METHOD GetCertificateAuthType() CLASS TlgoKSeF

   LOCAL n

   lgoCheckResult( lgpKSeF_GetCertificateAuthType( ::pExtObject, @n ) )

   RETURN n

METHOD SetCertificateAuthType( nValue ) CLASS TlgoKSeF

   lgoCheckResult( lgpKSeF_SetCertificateAuthType( ::pExtObject, nValue ) )

   RETURN NIL


METHOD GetToken() CLASS TlgoKSeF

   LOCAL p

   lgoCheckResult( lgpKSeF_GetToken( ::pExtObject, @p ) )

   RETURN lgoGetString( p )

METHOD SetToken( cValue ) CLASS TlgoKSeF

   lgoCheckResult( lgpKSeF_SetToken( ::pExtObject, cValue ) )

   RETURN NIL

METHOD GetEncryption() CLASS TlgoKSeF

   LOCAL n

   lgoCheckResult( lgpKSeF_GetEncryption( ::pExtObject, @n ) )

   RETURN n <> 0

METHOD SetEncryption( lValue ) CLASS TlgoKSeF

   lgoCheckResult( lgpKSeF_SetEncryption( ::pExtObject, iif( lValue, 1, 0 ) ) )

   RETURN NIL

METHOD GetSessionToken() CLASS TlgoKSeF

   LOCAL p

   lgoCheckResult( lgpKSeF_GetSessionToken( ::pExtObject, @p ) )

   RETURN lgoGetString( p )

METHOD GetSessionActive() CLASS TlgoKSeF

   LOCAL n

   lgoCheckResult( lgpKSeF_GetSessionActive( ::pExtObject, @n ) )

   RETURN n <> 0

/*----------------------------------------------------------------------*/


CREATE CLASS TKSeFObject INHERIT TlgoObject

   VISIBLE:
   METHOD New( xClass ) CONSTRUCTOR

   METHOD CreateExtObject( cClassName )

ENDCLASS


METHOD New( xClass ) CLASS TKSeFObject

   IF HB_ISPOINTER( xClass )
      ::pExtObject := xClass
   ELSE
      IF ! HB_ISCHAR( xClass )
         xClass := ::ClassName()
      ENDif
      ::CreateExtObject( xClass )
   ENDIF

   RETURN Self

METHOD CreateExtObject( cClassName ) CLASS TKSeFObject

   ::pExtObject := lgpKSeF_CreateKSeFClass( cClassName )

   RETURN ::pExtObject

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFArray INHERIT TKSeFObject

   HIDDEN:
   VAR aItems INIT {}

   VISIBLE:
   METHOD New( xClass ) CONSTRUCTOR
   DESTRUCTOR Free()

   METHOD Count()
   METHOD Delete( nIndex )

   METHOD Items( nIndex )

   ACCESS OwnObjects METHOD GetOwnObjects()
   ASSIGN OwnObjects METHOD SetOwnObjects( lValue )

ENDCLASS


METHOD New( xClass ) CLASS TKSeFArray

   ::Super:New( xClass )

   RETURN Self

DESTRUCTOR Free() CLASS TKSeFArray

   LOCAL i, o

   ::OwnObjects := .F.

   FOR i := 0 TO ::Count() - 1
      IF i < Len( ::aItems ) .AND. ! Empty( ::aItems[ i + 1 ] )
         ::aItems[ i + 1 ] := NIL
      ELSE
         lgoCheckResult( lgpListObject_GetItem( ::ExtObject, i, @o ) )
         IF HB_ISPOINTER( o ) .AND. ! Empty( o )
            lgoCheckResult( lgpObject_Free( o ) )
         ENDiF
      ENDIF
   NEXT

   RETURN

METHOD Count() CLASS TKSeFArray

   LOCAL nCount

   lgoCheckResult( lgpListObject_GetCount( ::ExtObject, @nCount ) )

   RETURN nCount

METHOD Delete( nIndex ) CLASS TKSeFArray

   lgoCheckResult( lgpListObject_Delete( ::ExtObject, nIndex ) )

   RETURN NIL

METHOD Items( nIndex ) CLASS TKSeFArray

   LOCAL o, r

   IF ( nIndex < Len( ::aItems ) .AND. ! Empty( ::aItems[ nIndex + 1 ] ) ) .OR. Len( ::aItems ) <= nIndex
      lgoCheckResult( lgpListObject_GetItem( ::ExtObject, nIndex, @o ) )
      IF HB_ISPOINTER( o ) .AND. ! Empty( o )
         r := lgoCreateObject( o )
         IF Len( ::aItems ) < nIndex
            ASize( ::aItems, nIndex + 1 )
         ENDIF
         ::aItems[ nIndex + 1 ] := r
      ELSE
         r := NIL
      ENDIF
   ELSE
      r := ::aItems[ nIndex + 1 ]
   ENDIF

   RETURN r

METHOD GetOwnObjects() CLASS TKSeFArray

   LOCAL nRes

   lgoCheckResult( lgpListObject_GetOwnsObjects( ::ExtObject, @nRes ) )

   RETURN nRes <> 0

METHOD SetOwnObjects( lValue ) CLASS TKSeFArray

   lgoCheckResult( lgpListObject_SetOwnsObjects( ::ExtObject, iif( lValue, 1, 0 ) ) )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFRequest INHERIT TKSeFObject

   ACCESS AsJSONString INLINE ( ::GetStringProp( "AsJSONString" ) )

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFResponse INHERIT TKSeFObject

   ACCESS RawResponse INLINE ( ::GetStringProp( "RawResponse" ) )

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSubjectIdentifierBy INHERIT TKSeFObject

   ACCESS Type INLINE ( ::GetStringProp( "Type" ) )

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSubjectIdentifierByCompany INHERIT TKSeFSubjectIdentifierBy

   ACCESS Identifier INLINE ( ::GetStringProp( "Identifier" ) )
   ASSIGN Identifier METHOD SetIdentifier( cValue )

ENDCLASS

METHOD SetIdentifier( cValue ) CLASS TKSeFSubjectIdentifierByCompany

   ::SetStringProp( "Identifier", cValue )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSubjectIdentifierInternal INHERIT TKSeFSubjectIdentifierBy

   ACCESS Identifier INLINE ( ::GetStringProp( "Identifier" ) )
   ASSIGN Identifier METHOD SetIdentifier( cValue )

ENDCLASS

METHOD SetIdentifier( cValue ) CLASS TKSeFSubjectIdentifierInternal

   ::SetStringProp( "Identifier", cValue )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSubjectCompleteName INHERIT TKSeFObject

   ACCESS FullName INLINE ( ::GetStringProp( "FullName" ) )

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSubjectName INHERIT TKSeFObject

   ACCESS Type INLINE ( ::GetStringProp( "Type" ) )
   ACCESS TradeName INLINE ( ::GetStringProp( "TradeName" ) )
   ASSIGN TradeName METHOD SetTradeName( cValue )

ENDCLASS

METHOD SetTradeName( cValue ) CLASS TKSeFSubjectName

   ::SetStringProp( "TradeName", cValue )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSubjectFullName INHERIT TKSeFSubjectName

   ACCESS FullName INLINE ( ::GetStringProp( "FullName" ) )
   ASSIGN FullName METHOD SetFullName( cValue )

ENDCLASS

METHOD SetFullName( cValue ) CLASS TKSeFSubjectFullName

   ::SetStringProp( "FullName", cValue )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSubjectPersonName INHERIT TKSeFSubjectName

   ACCESS FirstName INLINE ( ::GetStringProp( "FirstName" ) )
   ASSIGN FirstName METHOD SetFirstName( cValue )
   ACCESS Surname INLINE ( ::GetStringProp( "Surname" ) )
   ASSIGN Surname METHOD SetSurname( cValue )

ENDCLASS

METHOD SetFirstName( cValue ) CLASS TKSeFSubjectPersonName

   ::SetStringProp( "FirstName", cValue )

   RETURN NIL

METHOD SetSurname( cValue ) CLASS TKSeFSubjectPersonName

   ::SetStringProp( "Surname", cValue )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSubjectNone INHERIT TKSeFSubjectName

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFCredentialsIdentifierResponse INHERIT TKSeFObject

   ACCESS Identifier INLINE ( ::GetStringProp( "Identifier" ) )
   ACCESS Type INLINE ( ::GetStringProp( "Type" ) )

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFCredentialsRoleResponseBase INHERIT TKSeFObject

   ACCESS RoleDescription INLINE ( ::GetStringProp( "RoleDescription" ) )
   ACCESS StartTimestamp INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "StartTimestamp" ) ) )
   ACCESS StartTimestampRaw INLINE ( ::GetStringProp( "StartTimestampRaw" ) )
   ACCESS Type INLINE ( ::GetStringProp( "Type" ) )
   ACCESS RoleType INLINE ( ::GetIntegerProp( "RoleType" ) )
   ACCESS RoleTypeRaw INLINE ( ::GetStringProp( "RoleTypeRaw" ) )

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFCredentialsRoleResponseGrantedForInstitution INHERIT TKSeFCredentialsRoleResponseBase

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFCredentialsRoleResponseStandardDetails INHERIT TKSeFCredentialsRoleResponseBase

   HIDDEN:
   VAR oRoleAssigningAuthorIdentifier INIT NIL

   VISIBLE:
   METHOD New( xClass ) CONSTRUCTOR
   DESTRUCTOR Free()

   ACCESS CredentialsAssignmentTypeRaw INLINE ( ::GetStringProp( "CredentialsAssignmentTypeRaw" ) )
   ACCESS RoleAssigningAuthorIdentifier INLINE ( ::oRoleAssigningAuthorIdentifier )

ENDCLASS

METHOD New( xClass ) CLASS TKSeFCredentialsRoleResponseStandardDetails

   LOCAL o

   ::Super:New( xClass )

   o := ::GetObjectProp( "RoleAssigningAuthorIdentifier" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oRoleAssigningAuthorIdentifier := TKSeFCredentialsIdentifierResponse():New( o )
   ENDIF

   RETURN Self

DESTRUCTOR Free() CLASS TKSeFCredentialsRoleResponseStandardDetails

   IF ! Empty( ::oRoleAssigningAuthorIdentifier )
      ::oRoleAssigningAuthorIdentifier := NIL
      ::SetObjectProp( "RoleAssigningAuthorIdentifier", NIL )
   ENDIF

   RETURN

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFCredentialsRoleResponseStandardPlain INHERIT TKSeFCredentialsRoleResponseBase

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFCredentialsRoleResponseToken INHERIT TKSeFCredentialsRoleResponseBase

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFCredentialsRoleResponseStandardContextDetails INHERIT TKSeFCredentialsRoleResponseBase

   HIDDEN:
   VAR oContextIdentifier INIT NIL
   VAR oSourceIdentifier INIT NIL
   VAR oTargetIdentifier INIT NIL

   VISIBLE:
   METHOD New( xClass ) CONSTRUCTOR
   DESTRUCTOR Free()

   ACCESS ContextIdentifier INLINE ( ::oContextIdentifier )
   ASSIGN ContextIdentifier METHOD SetContextIdentifier( oValue )
   ACCESS CredentialsAssignmentTypeRaw INLINE ( ::GetStringProp( "CredentialsAssignmentTypeRaw" ) )
   ASSIGN CredentialsAssignmentTypeRaw METHOD SetCredentialsAssignmentTypeRaw( cValue )
   ACCESS SourceIdentifier INLINE ( ::oSourceIdentifier )
   ASSIGN SourceIdentifier METHOD SetSourceIdentifier( oValue )
   ACCESS TargetIdentifier INLINE ( ::oTargetIdentifier )
   ASSIGN TargetIdentifier METHOD SetTargetIdentifier( oValue )

ENDCLASS

METHOD New( xClass ) CLASS TKSeFCredentialsRoleResponseStandardContextDetails

   LOCAL o

   ::Super:New( xClass )

   o := ::GetObjectProp( "ContextIdentifier" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oContextIdentifier := TKSeFCredentialsIdentifierResponse():New( o )
   ENDIF
   o := ::GetObjectProp( "SourceIdentifier" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oSourceIdentifier := TKSeFCredentialsIdentifierResponse():New( o )
   ENDIF
   o := ::GetObjectProp( "TargetIdentifier" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oTargetIdentifier := TKSeFCredentialsIdentifierResponse():New( o )
   ENDIF

   RETURN Self

DESTRUCTOR Free() CLASS TKSeFCredentialsRoleResponseStandardContextDetails

   IF ! Empty( ::oContextIdentifier )
      ::oContextIdentifier := NIL
      ::SetObjectProp( "ContextIdentifier", NIL )
   ENDIF
   IF ! Empty( ::oSourceIdentifier )
      ::oSourceIdentifier := NIL
      ::SetObjectProp( "SourceIdentifier", NIL )
   ENDIF
   IF ! Empty( ::oTargetIdentifier )
      ::oTargetIdentifier := NIL
      ::SetObjectProp( "TargetIdentifier", NIL )
   ENDIF

   RETURN

METHOD SetContextIdentifier( oValue ) CLASS TKSeFCredentialsRoleResponseStandardContextDetails

   LOCAL o

   ::oContextIdentifie := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "ContextIdentifier", o )

   RETURN NIL

METHOD SetCredentialsAssignmentTypeRaw( cValue ) CLASS TKSeFCredentialsRoleResponseStandardContextDetails

   ::SetStringProp( "CredentialsAssignmentTypeRaw", cValue )

   RETURN NIL

METHOD SetSourceIdentifier( oValue ) CLASS TKSeFCredentialsRoleResponseStandardContextDetails

   LOCAL o

   ::oSourceIdentifier := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "SourceIdentifier", o )

   RETURN NIL

METHOD SetTargetIdentifier( oValue ) CLASS TKSeFCredentialsRoleResponseStandardContextDetails

   LOCAL o

   ::oTargetIdentifier := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "TargetIdentifier", o )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFCredentialsRoleResponseBaseArray INHERIT TKSeFArray

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSessionContext INHERIT TKSeFObject

   HIDDEN:
   VAR oContextIdentifier INIT NIL
   VAR oContextName INIT NIL
   VAR oCredentialsRoleList INIT NIL

   VISIBLE:
   METHOD New( xClass ) CONSTRUCTOR
   DESTRUCTOR Free()

   ACCESS ContextIdentifier INLINE ( ::oContextIdentifier )
   ACCESS ContextName INLINE ( ::oContextName )
   ACCESS CredentialsRoleList INLINE ( ::oCredentialsRoleList )

ENDCLASS

METHOD New( xClass ) CLASS TKSeFSessionContext

   LOCAL o

   ::Super:New( xClass )

   o := ::GetObjectProp( "ContextIdentifier" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oContextIdentifier := lgoCreateObject( o )
   ENDIF
   o := ::GetObjectProp( "ContextName" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oContextName := TKSeFSubjectCompleteName():New( o )
   ENDIF
   o := ::GetObjectProp( "CredentialsRoleList" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oCredentialsRoleList := TKSeFCredentialsRoleResponseBaseArray():New( o )
   ENDIF

   RETURN Self

DESTRUCTOR Free() CLASS TKSeFSessionContext

   IF ! Empty( ::oContextIdentifier )
      ::oContextIdentifier := NIL
      ::SetObjectProp( "ContextIdentifier", NIL )
   ENDIF
   IF ! Empty( ::oContextName )
      ::oContextName := NIL
      ::SetObjectProp( "ContextName", NIL )
   ENDIF
   IF ! Empty( ::oCredentialsRoleList )
      ::oCredentialsRoleList := NIL
      ::SetObjectProp( "CredentialsRoleList", NIL )
   ENDIF

   RETURN

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFInitialisedSession INHERIT TKSeFObject

   HIDDEN:
   VAR oContext INIT NIL

   VISIBLE:
   METHOD New( xClass ) CONSTRUCTOR
   DESTRUCTOR Free()

   ACCESS Token INLINE ( ::GetStringProp( "Token" ) )
   ACCESS Context INLINE ( ::oContext )

ENDCLASS

METHOD New( xClass ) CLASS TKSeFInitialisedSession

   LOCAL o

   ::Super:New( xClass )

   o := ::GetObjectProp( "Context" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oContext := TKSeFSessionContext():New( o )
   ENDIF

   RETURN Self

DESTRUCTOR Free() CLASS TKSeFInitialisedSession

   IF ! Empty( ::oContext )
      ::oContext := NIL
      ::SetObjectProp( "Context", NIL )
   ENDIF

   RETURN

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFInitSessionResponse INHERIT TKSeFResponse

   HIDDEN:
   VAR oSessionToken INIT NIL

   VISIBLE:
   METHOD New( xClass ) CONSTRUCTOR
   DESTRUCTOR Free()

   ACCESS ReferenceNumber INLINE ( ::GetStringProp( "ReferenceNumber" ) )
   ACCESS Timestamp INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "Timestamp" ) ) )
   ACCESS TimestampRaw INLINE ( ::GetStringProp( "TimestampRaw" ) )
   ACCESS SessionToken INLINE ( ::oSessionToken )

ENDCLASS

METHOD New( xClass ) CLASS TKSeFInitSessionResponse

   LOCAL o

   ::Super:New( xClass )

   o := ::GetObjectProp( "SessionToken" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oSessionToken := TKSeFInitialisedSession():New( o )
   ENDIF

   RETURN Self

DESTRUCTOR Free() CLASS TKSeFInitSessionResponse

   IF ! Empty( ::oSessionToken )
      ::oSessionToken := NIL
      ::SetObjectProp( "SessionToken", NIL )
   ENDIF

   RETURN

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSessionInvoiceStatus INHERIT TKSeFObject

   ACCESS AcquisitionTimestampRaw INLINE ( ::GetStringProp( "AcquisitionTimestampRaw" ) )
   ACCESS AcquisitionTimestamp INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "AcquisitionTimestamp" ) ) )
   ACCESS ElementReferenceNumber INLINE ( ::GetStringProp( "ElementReferenceNumber" ) )
   ACCESS InvoiceNumber INLINE ( ::GetStringProp( "InvoiceNumber" ) )
   ACCESS KsefReferenceNumber INLINE ( ::GetStringProp( "KsefReferenceNumber" ) )
   ACCESS ProcessingCode INLINE ( ::GetIntegerProp( "ProcessingCode" ) )
   ACCESS ProcessingDescription INLINE ( ::GetStringProp( "ProcessingDescription" ) )

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSessionInvoiceStatusArray INHERIT TKSeFArray

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSessionStatusResponse INHERIT TKSeFResponse

   HIDDEN:
   VAR oInvoiceStatusList INIT NIL

   VISIBLE:
   METHOD New( xClass ) CONSTRUCTOR
   DESTRUCTOR Free()

   ACCESS CreationTimestamp INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "CreationTimestamp" ) ) )
   ACCESS CreationTimestampRaw INLINE ( ::GetStringProp( "CreationTimestampRaw" ) )
   ACCESS EntityType INLINE ( ::GetStringProp( "EntityType" ) )
   ACCESS InvoiceStatusList INLINE ( ::oInvoiceStatusList )
   ACCESS LastUpdateTimestamp INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "LastUpdateTimestamp" ) ) )
   ACCESS LastUpdateTimestampRaw INLINE ( ::GetStringProp( "LastUpdateTimestampRaw" ) )
   ACCESS NumberOfElements INLINE ( ::GetIntegerProp( "NumberOfElements" ) )
   ACCESS PageOffset INLINE ( ::GetIntegerProp( "PageOffset" ) )
   ACCESS PageSize INLINE ( ::GetIntegerProp( "PageSize" ) )
   ACCESS ProcessingCode INLINE ( ::GetIntegerProp( "ProcessingCode" ) )
   ACCESS ProcessingDescription INLINE ( ::GetStringProp( "ProcessingDescription" ) )
   ACCESS ReferenceNumber INLINE ( ::GetStringProp( "ReferenceNumber" ) )
   ACCESS TimestampRaw INLINE ( ::GetStringProp( "TimestampRaw" ) )
   ACCESS Timestamp INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "Timestamp" ) ) )

ENDCLASS

METHOD New( xClass ) CLASS TKSeFSessionStatusResponse

   LOCAL o

   ::Super:New( xClass )

   o := ::GetObjectProp( "InvoiceStatusList" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oInvoiceStatusList := TKSeFSessionInvoiceStatusArray():New( o )
   ENDIF

   RETURN Self

DESTRUCTOR Free() CLASS TKSeFSessionStatusResponse

   IF ! Empty( ::oInvoiceStatusList )
      ::oInvoiceStatusList := NIL
      ::SetObjectProp( "InvoiceStatusList", NIL )
   ENDIF

   RETURN

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFTerminateSessionResponse INHERIT TKSeFResponse

   ACCESS ProcessingCode INLINE ( ::GetIntegerProp( "ProcessingCode" ) )
   ACCESS ProcessingDescription INLINE ( ::GetStringProp( "ProcessingDescription" ) )
   ACCESS ReferenceNumber INLINE ( ::GetStringProp( "ReferenceNumber" ) )
   ACCESS TimestampRaw INLINE ( ::GetStringProp( "TimestampRaw" ) )
   ACCESS Timestamp INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "Timestamp" ) ) )

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFInternalIdentifierGeneratedResponse INHERIT TKSeFResponse

   ACCESS InternalIdentifier INLINE ( ::GetStringProp( "InternalIdentifier" ) )
   ACCESS TimestampRaw INLINE ( ::GetStringProp( "TimestampRaw" ) )
   ACCESS Timestamp INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "Timestamp" ) ) )

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFCredentialsIdentifierRequest INHERIT TKSeFObject

   ACCESS Type INLINE ( ::GetStringProp( "Type" ) )
   ASSIGN Type METHOD SetType( cValue )
   ACCESS Identifier INLINE ( ::GetStringProp( "Identifier" ) )
   ASSIGN Identifier METHOD SetIdentifier( cValue )

ENDCLASS

METHOD SetType( cValue ) CLASS TKSeFCredentialsIdentifierRequest

   ::SetStringProp( "Type", cValue )

   RETURN NIL

METHOD SetIdentifier( cValue ) CLASS TKSeFCredentialsIdentifierRequest

   ::SetStringProp( "Identifier", cValue )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFQueryCriteriaCredentials INHERIT TKSeFObject

   ACCESS Type INLINE ( ::GetStringProp( "Type" ) )
   ASSIGN Type METHOD SetType( cValue )

ENDCLASS

METHOD SetType( cValue ) CLASS TKSeFQueryCriteriaCredentials

   ::SetStringProp( "Type", cValue )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFQueryCriteriaCredentialsAll INHERIT TKSeFQueryCriteriaCredentials

   ACCESS QueryCredentialsScopeResultTypeRaw INLINE ( ::GetStringProp( "QueryCredentialsScopeResultTypeRaw" ) )
   ASSIGN QueryCredentialsScopeResultTypeRaw METHOD SetQueryCredentialsScopeResultTypeRaw( cValue )
   ACCESS QueryCredentialsTypeResultTypeRaw INLINE ( ::GetStringProp( "QueryCredentialsTypeResultTypeRaw" ) )
   ASSIGN QueryCredentialsTypeResultTypeRaw METHOD SetQueryCredentialsTypeResultTypeRaw( cValue )

ENDCLASS

METHOD SetQueryCredentialsScopeResultTypeRaw( cValue ) CLASS TKSeFQueryCriteriaCredentialsAll

   ::SetStringProp( "QueryCredentialsScopeResultTypeRaw", cValue )

   RETURN NIL

METHOD SetQueryCredentialsTypeResultTypeRaw( cValue ) CLASS TKSeFQueryCriteriaCredentialsAll

   ::SetStringProp( "QueryCredentialsTypeResultTypeRaw", cValue )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFQueryCriteriaCredentialsId INHERIT TKSeFQueryCriteriaCredentials

   HIDDEN:
   VAR oCredentialsIdentifier INIT NIL

   VISIBLE:
   METHOD New( xClass ) CONSTRUCTOR
   DESTRUCTOR Free()

   ACCESS CredentialsIdentifier INLINE ( ::oCredentialsIdentifier )
   ASSIGN CredentialsIdentifier METHOD SetCredentialsIdentifier( oValue )
   ACCESS QueryCredentialsScopeResultTypeRaw INLINE ( ::GetStringProp( "QueryCredentialsScopeResultTypeRaw" ) )
   ASSIGN QueryCredentialsScopeResultTypeRaw METHOD SetQueryCredentialsScopeResultTypeRaw( cValue )
   ACCESS QueryCredentialsTypeResultTypeRaw INLINE ( ::GetStringProp( "QueryCredentialsTypeResultTypeRaw" ) )
   ASSIGN QueryCredentialsTypeResultTypeRaw METHOD SetQueryCredentialsTypeResultTypeRaw( cValue )

ENDCLASS

METHOD New( xClass ) CLASS TKSeFQueryCriteriaCredentialsId

   LOCAL o

   ::Super:New( xClass )

   o := ::GetObjectProp( "CredentialsIdentifier" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oCredentialsIdentifier := TKSeFCredentialsIdentifierRequest():New( o )
   ENDIF

   RETURN Self

DESTRUCTOR Free() CLASS TKSeFQueryCriteriaCredentialsId

   IF ! Empty( ::oCredentialsIdentifier )
      ::oCredentialsIdentifier := NIL
      ::SetObjectProp( "CredentialsIdentifier", NIL )
   ENDIF

   RETURN

METHOD SetCredentialsIdentifier( oValue ) CLASS TKSeFQueryCriteriaCredentialsId

   LOCAL o

   ::oCredentialsIdentifier := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "CredentialsIdentifier", o )

   RETURN NIL

METHOD SetQueryCredentialsScopeResultTypeRaw( cValue ) CLASS TKSeFQueryCriteriaCredentialsId

   ::SetStringProp( "QueryCredentialsScopeResultTypeRaw", cValue )

   RETURN NIL

METHOD SetQueryCredentialsTypeResultTypeRaw( cValue ) CLASS TKSeFQueryCriteriaCredentialsId

   ::SetStringProp( "QueryCredentialsTypeResultTypeRaw", cValue )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFQuerySyncCredentialsRequest INHERIT TKSeFRequest

   HIDDEN:
   VAR oQueryCriteria INIT NIL

   VISIBLE:
   METHOD New( xClass ) CONSTRUCTOR
   DESTRUCTOR Free()

   ACCESS QueryCriteria INLINE ( ::oQueryCriteria )
   ASSIGN QueryCriteria METHOD SetQueryCriteria( oValue )

ENDCLASS

METHOD New( xClass ) CLASS TKSeFQuerySyncCredentialsRequest

   LOCAL o

   ::Super:New( xClass )

   o := ::GetObjectProp( "QueryCriteria" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oQueryCriteria := TKSeFQueryCriteriaCredentials():New( o )
   ENDIF

   RETURN Self

DESTRUCTOR Free() CLASS TKSeFQuerySyncCredentialsRequest

   IF ! Empty( ::oQueryCriteria )
      ::oQueryCriteria := NIL
      ::SetObjectProp( "QueryCriteria", NIL )
   ENDIF

   RETURN

METHOD SetQueryCriteria( oValue ) CLASS TKSeFQuerySyncCredentialsRequest

   LOCAL o

   ::oQueryCriteria := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "QueryCriteria", o )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFCredentialsBaseTypeObject INHERIT TKSeFObject

   HIDDEN:
   VAR oCredentialsRoleList INIT NIL
   VAR oIdentifier INIT NIL

   VISIBLE:
   METHOD New( xClass ) CONSTRUCTOR
   DESTRUCTOR Free()

   ACCESS Type INLINE ( ::GetStringProp( "Type" ) )
   ACCESS CredentialsRoleList INLINE ( ::oCredentialsRoleList )
   ASSIGN CredentialsRoleList METHOD SetCredentialsRoleList( oValue )
   ACCESS Identifier INLINE ( ::oIdentifier )
   ASSIGN Identifier METHOD SetIdentifier( oValue )

ENDCLASS

METHOD New( xClass ) CLASS TKSeFCredentialsBaseTypeObject

   LOCAL o

   ::Super:New( xClass )

   o := ::GetObjectProp( "CredentialsRoleList" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oCredentialsRoleList := TKSeFCredentialsRoleResponseBaseArray():New( o )
   ENDIF
   o := ::GetObjectProp( "Identifier" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oIdentifier := TKSeFCredentialsIdentifierResponse():New( o )
   ENDIF

   RETURN Self

DESTRUCTOR Free() CLASS TKSeFCredentialsBaseTypeObject

   IF ! Empty( ::oCredentialsRoleList )
      ::oCredentialsRoleList := NIL
      ::SetObjectProp( "CredentialsRoleList", NIL )
   ENDIF
   IF ! Empty( ::oIdentifier )
      ::oIdentifier := NIL
      ::SetObjectProp( "Identifier", NIL )
   ENDIF

   RETURN

METHOD SetCredentialsRoleList( oValue ) CLASS TKSeFCredentialsBaseTypeObject

   LOCAL o

   ::oCredentialsRoleList := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "CredentialsRoleList", o )

   RETURN NIL

METHOD SetIdentifier( oValue ) CLASS TKSeFCredentialsBaseTypeObject

   LOCAL o

   ::oIdentifier := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "Identifier", o )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFCredentialsContext INHERIT TKSeFCredentialsBaseTypeObject

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFCredentialsPlain INHERIT TKSeFCredentialsBaseTypeObject

   HIDDEN:
   VAR oCredentialsRole INIT NIL

   VISIBLE:
   METHOD New( xClass ) CONSTRUCTOR
   DESTRUCTOR Free()

   ACCESS CredentialsRole INLINE ( ::oCredentialsRole )

ENDCLASS

METHOD New( xClass ) CLASS TKSeFCredentialsPlain

   LOCAL o

   ::Super:New( xClass )

   o := ::GetObjectProp( "CredentialsRole" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oCredentialsRole := TKSeFCredentialsRoleResponseStandardPlain():New( o )
   ENDIF

   RETURN Self

DESTRUCTOR Free() CLASS TKSeFCredentialsPlain

   IF ! Empty( ::oCredentialsRole )
      ::oCredentialsRole := NIL
      ::SetObjectProp( "CredentialsRole", NIL )
   ENDIF

   RETURN

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFCredentialsToken INHERIT TKSeFCredentialsBaseTypeObject

   HIDDEN:
   VAR oParent INIT NIL

   VISIBLE:
   METHOD New( xClass ) CONSTRUCTOR
   DESTRUCTOR Free()

   ACCESS Description INLINE ( ::GetStringProp( "Description" ) )
   ACCESS LastUseTimestamp INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "LastUseTimestamp" ) ) )
   ACCESS LastUseTimestampRaw INLINE ( ::GetStringProp( "LastUseTimestampRaw" ) )
   ACCESS Parent INLINE ( ::oParent )
   ACCESS RegistrationTimestamp INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "RegistrationTimestamp" ) ) )
   ACCESS RegistrationTimestampRaw INLINE ( ::GetStringProp( "RegistrationTimestampRaw" ) )
   ACCESS Status INLINE ( ::GetIntegerProp( "Status" ) )

ENDCLASS

METHOD New( xClass ) CLASS TKSeFCredentialsToken

   LOCAL o

   ::Super:New( xClass )

   o := ::GetObjectProp( "Parent" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oParent := TKSeFCredentialsPlain():New( o )
   ENDIF

   RETURN Self

DESTRUCTOR Free() CLASS TKSeFCredentialsToken

   IF ! Empty( ::oParent )
      ::oParent := NIL
      ::SetObjectProp( "Parent", NIL )
   ENDIF

   RETURN

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFCredentialsParent INHERIT TKSeFCredentialsBaseTypeObject

   HIDDEN:
   VAR oCredentialsRole INIT NIL

   VISIBLE:
   METHOD New( xClass ) CONSTRUCTOR
   DESTRUCTOR Free()

   ACCESS CredentialsRole INLINE ( ::oCredentialsRole )

ENDCLASS

METHOD New( xClass ) CLASS TKSeFCredentialsParent

   LOCAL o

   ::Super:New( xClass )

   o := ::GetObjectProp( "CredentialsRole" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oCredentialsRole := TKSeFCredentialsRoleResponseStandardPlain():New( o )
   ENDIF

   RETURN Self

DESTRUCTOR Free() CLASS TKSeFCredentialsParent

   IF ! Empty( ::oCredentialsRole )
      ::oCredentialsRole := NIL
      ::SetObjectProp( "CredentialsRole", NIL )
   ENDIF

   RETURN

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFCredentialsBaseTypeObjectArray INHERIT TKSeFArray

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFQuerySyncCredentialsResponse INHERIT TKSeFResponse

   HIDDEN:
   VAR oCredentialsList INIT NIL

   VISIBLE:
   METHOD New( xClass )
   DESTRUCTOR Free()

   ACCESS CredentialsList INLINE ( ::oCredentialsList )
   ACCESS ReferenceNumber INLINE ( ::GetStringProp( "ReferenceNumber" ) )
   ACCESS Timestamp INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "Timestamp" ) ) )
   ACCESS TimestampRaw INLINE ( ::GetStringProp( "TimestampRaw" ) )

ENDCLASS

METHOD New( xClass ) CLASS TKSeFQuerySyncCredentialsResponse

   LOCAL o

   ::Super:New( xClass )

   o := ::GetObjectProp( "CredentialsList" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oCredentialsList := TKSeFCredentialsBaseTypeObjectArray():New( o )
   ENDIF

   RETURN Self

DESTRUCTOR Free() CLASS TKSeFQuerySyncCredentialsResponse

   IF ! Empty( ::oCredentialsList )
      ::oCredentialsList := NIL
      ::SetObjectProp( "CredentialsList", NIL )
   ENDIF

   RETURN

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSendInvoiceResponse INHERIT TKSeFResponse

   ACCESS ElementReferenceNumber INLINE ( ::GetStringProp( "ElementReferenceNumber" ) )
   ACCESS ProcessingCode INLINE ( ::GetIntegerProp( "ProcessingCode" ) )
   ACCESS ProcessingDescription INLINE ( ::GetStringProp( "ProcessingDescription" ) )
   ACCESS ReferenceNumber INLINE ( ::GetStringProp( "ReferenceNumber" ) )
   ACCESS TimestampRaw INLINE ( ::GetStringProp( "TimestampRaw" ) )
   ACCESS Timestamp INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "Timestamp" ) ) )

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFInvoiceStatus INHERIT TKSeFObject

   ACCESS AcquisitionTimestampRaw INLINE ( ::GetStringProp( "AcquisitionTimestampRaw" ) )
   ACCESS AcquisitionTimestamp INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "AcquisitionTimestamp" ) ) )
   ACCESS InvoiceNumber INLINE ( ::GetStringProp( "InvoiceNumber" ) )
   ACCESS KsefReferenceNumber INLINE ( ::GetStringProp( "KsefReferenceNumber" ) )

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFStatusInvoiceResponse INHERIT TKSeFResponse

   HIDDEN:
   VAR oInvoiceStatus INIT NIL

   VISIBLE:
   METHOD New( xClass )
   DESTRUCTOR Free()

   ACCESS ElementReferenceNumber INLINE ( ::GetStringProp( "ElementReferenceNumber" ) )
   ACCESS InvoiceStatus INLINE ( ::oInvoiceStatus )
   ACCESS ProcessingCode INLINE ( ::GetIntegerProp( "ProcessingCode" ) )
   ACCESS ProcessingDescription INLINE ( ::GetStringProp( "ProcessingDescription" ) )
   ACCESS ReferenceNumber INLINE ( ::GetStringProp( "ReferenceNumber" ) )
   ACCESS TimestampRaw INLINE ( ::GetStringProp( "TimestampRaw" ) )
   ACCESS Timestamp INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "Timestamp" ) ) )

ENDCLASS

METHOD New( xClass ) CLASS TKSeFStatusInvoiceResponse

   LOCAL o

   ::Super:New( xClass )

   o := ::GetObjectProp( "InvoiceStatus" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oInvoiceStatus := TKSeFInvoiceStatus():New( o )
   ENDIF

   RETURN Self

DESTRUCTOR Free() CLASS TKSeFStatusInvoiceResponse

   IF ! Empty( ::oInvoiceStatus )
      ::oInvoiceStatus := NIL
      ::SetObjectProp( "InvoiceStatus", NIL )
   ENDIF

   RETURN

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFHideInvoiceRequestType INHERIT TKSeFObject

   ACCESS HidingReason INLINE ( ::GetStringProp( "HidingReason" ) )
   ASSIGN HidingReason METHOD SetHidingReason( cValue )
   ACCESS KsefReferenceNumber INLINE ( ::GetStringProp( "KsefReferenceNumber" ) )
   ASSIGN KsefReferenceNumber METHOD SetKsefReferenceNumber( cValue )

ENDCLASS

METHOD SetHidingReason( cValue ) CLASS TKSeFHideInvoiceRequestType

   ::SetStringProp( "HidingReason", cValue )

   RETURN NIL

METHOD SetKsefReferenceNumber( cValue ) CLASS TKSeFHideInvoiceRequestType

   ::SetStringProp( "KsefReferenceNumber", cValue )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFHideInvoiceRequest INHERIT TKSeFRequest

   HIDDEN:
   VAR oInvoiceHideRequest INIT NIL

   VISIBLE:
   DESTRUCTOR Free()

   ACCESS InvoiceHideRequest INLINE ( ::oInvoiceHideRequest )
   ASSIGN InvoiceHideRequest METHOD SetInvoiceHideRequest( oValue )

ENDCLASS

DESTRUCTOR Free() CLASS TKSeFHideInvoiceRequest

   IF ! Empty( ::oInvoiceHideRequest )
      ::oInvoiceHideRequest := NIL
      ::SetObjectProp( "InvoiceHideRequest", NIL )
   ENDIF

   RETURN

METHOD SetInvoiceHideRequest( oValue ) CLASS TKSeFHideInvoiceRequest

   LOCAL o

   ::oInvoiceHideRequest := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "InvoiceHideRequest", o )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFShowInvoiceRequestType INHERIT TKSeFObject

   ACCESS HidingCancelationReason INLINE ( ::GetStringProp( "HidingCancelationReason" ) )
   ASSIGN HidingCancelationReason METHOD SetHidingCancelationReason( cValue )
   ACCESS KsefReferenceNumber INLINE ( ::GetStringProp( "KsefReferenceNumber" ) )
   ASSIGN KsefReferenceNumber METHOD SetKsefReferenceNumber( cValue )

ENDCLASS

METHOD SetHidingCancelationReason( cValue ) CLASS TKSeFShowInvoiceRequestType

   ::SetStringProp( "HidingCancelationReason", cValue )

   RETURN NIL

METHOD SetKsefReferenceNumber( cValue ) CLASS TKSeFShowInvoiceRequestType

   ::SetStringProp( "KsefReferenceNumber", cValue )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFShowInvoiceRequest INHERIT TKSeFRequest

   HIDDEN:
   VAR oInvoiceHideCancelationRequest INIT NIL

   VISIBLE:
   DESTRUCTOR Free()

   ACCESS InvoiceHideCancelationRequest INLINE ( ::oInvoiceHideCancelationRequest )
   ASSIGN InvoiceHideCancelationRequest METHOD SetInvoiceHideCancelationRequest( oValue )

ENDCLASS

DESTRUCTOR Free() CLASS TKSeFShowInvoiceRequest

   IF ! Empty( ::oInvoiceHideCancelationRequest )
      ::oInvoiceHideCancelationRequest := NIL
      ::SetObjectProp( "InvoiceHideCancelationRequest", NIL )
   ENDIF

   RETURN

METHOD SetInvoiceHideCancelationRequest( oValue ) CLASS TKSeFShowInvoiceRequest

   LOCAL o

   ::oInvoiceHideCancelationRequest := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "InvoiceHideCancelationRequest", o )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFVisibilityInvoiceResponse INHERIT TKSeFResponse

   ACCESS CancelationReason INLINE ( ::GetStringProp( "CancelationReason" ) )
   ACCESS CancelationTimestamp INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "CancelationTimestamp" ) ) )
   ACCESS CancelationTimestampRaw INLINE ( ::GetStringProp( "CancelationTimestampRaw" ) )
   ACCESS Canceled INLINE ( ::GetBooleanProp( "Canceled" ) )
   ACCESS HidingReason INLINE ( ::GetStringProp( "HidingReason" ) )
   ACCESS HidingTimestamp INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "HidingTimestamp" ) ) )
   ACCESS HidingTimestampRaw INLINE ( ::GetStringProp( "HidingTimestampRaw" ) )
   ACCESS KsefReferenceNumber INLINE ( ::GetStringProp( "KsefReferenceNumber" ) )

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSubjectBy INHERIT TKSeFObject

   HIDDEN:
   VAR oIssuedByIdentifier INIT NIL
   VAR oFIssuedByIdentifier INIT NIL

   VISIBLE:
   METHOD New( xClass ) CONSTRUCTOR
   DESTRUCTOR Free()

   ACCESS IssuedByIdentifier INLINE ( ::oIssuedByIdentifier )
   ASSIGN IssuedByIdentifier METHOD SetIssuedByIdentifier( oValue )
   ACCESS IssuedByName INLINE ( ::oIssuedByName )
   ASSIGN IssuedByName METHOD SetIssuedByName( oValue )

ENDCLASS

METHOD New( xClass ) CLASS TKSeFSubjectBy

   LOCAL o

   ::Super:New( xClass )

   o := ::GetObjectProp( "IssuedByIdentifier" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oIssuedByIdentifier := lgoCreateObject( o )
   ENDIF
   o := ::GetObjectProp( "IssuedByName" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oIssuedByName := lgoCreateObject( o )
   ENDIF

   RETURN Self

DESTRUCTOR Free() CLASS TKSeFSubjectBy

   IF ! Empty( ::oIssuedByIdentifier )
      ::oIssuedByIdentifier := NIL
      ::SetObjectProp( "IssuedByIdentifier", NIL )
   ENDIF
   IF ! Empty( ::oIssuedByName )
      ::oIssuedByName := NIL
      ::SetObjectProp( "IssuedByName", NIL )
   ENDIF

   RETURN

METHOD SetIssuedByIdentifier( oValue ) CLASS TKSeFSubjectBy

   LOCAL o

   ::oIssuedByIdentifier := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "IssuedByIdentifier", o )

   RETURN NIL


METHOD SetIssuedByName( oValue ) CLASS TKSeFSubjectBy

   LOCAL o

   ::oIssuedByName := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "IssuedByName", o )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSubjectIdentifierTo INHERIT TKSeFObject

   ACCESS Type INLINE ( ::GetStringProp( "Type" ) )
   ASSIGN Type METHOD SetType( cValue )

ENDCLASS

METHOD SetType( cValue ) CLASS TKSeFSubjectIdentifierTo

   ::SetStringProp( "Type", cValue )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSubjectIdentifierToNone INHERIT TKSeFSubjectIdentifierTo

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSubjectIdentifierToCompany INHERIT TKSeFSubjectIdentifierTo

   ACCESS Identifier INLINE ( ::GetStringProp( "Identifier" ) )
   ASSIGN Identifier METHOD SetIdentifier( cValue )

ENDCLASS

METHOD SetIdentifier( cValue ) CLASS TKSeFSubjectIdentifierToCompany

   ::SetStringProp( "Identifier", cValue )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSubjectIdentifierToOther INHERIT TKSeFSubjectIdentifierTo

   ACCESS Identifier INLINE ( ::GetStringProp( "Identifier" ) )
   ASSIGN Identifier METHOD SetIdentifier( cValue )

ENDCLASS

METHOD SetIdentifier( cValue ) CLASS TKSeFSubjectIdentifierToOther

   ::SetStringProp( "Identifier", cValue )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSubjectIdentifierToVatUe INHERIT TKSeFSubjectIdentifierTo

   ACCESS Identifier INLINE ( ::GetStringProp( "Identifier" ) )
   ASSIGN Identifier METHOD SetIdentifier( cValue )

ENDCLASS

METHOD SetIdentifier( cValue ) CLASS TKSeFSubjectIdentifierToVatUe

   ::SetStringProp( "Identifier", cValue )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSubjectTo INHERIT TKSeFObject

   HIDDEN:
   VAR oIssuedToIdentifier INIT NIL
   VAR oIssuedToName INIT NIL

   VISIBLE:
   METHOD New( xClass ) CONSTRUCTOR
   DESTRUCTOR Free()

   ACCESS IssuedToIdentifier INLINE ( ::oIssuedToIdentifier )
   ASSIGN IssuedToIdentifier METHOD SetIssuedToIdentifier( oValue )
   ACCESS IssuedToName INLINE ( ::oIssuedToName )
   ASSIGN IssuedToName METHOD SetIssuedToName( oValue )

ENDCLASS

METHOD New( xClass ) CLASS TKSeFSubjectTo

   LOCAL o

   ::Super:New( xClass )

   o := ::GetObjectProp( "IssuedToIdentifier" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oIssuedToIdentifier := lgoCreateObject( o )
   ENDIF
   o := ::GetObjectProp( "IssuedToName" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oIssuedToName := lgoCreateObject( o )
   ENDIF

   RETURN Self

DESTRUCTOR Free() CLASS TKSeFSubjectTo

   IF ! Empty( ::oIssuedToIdentifier )
      ::oIssuedToIdentifier := NIL
      ::SetObjectProp( "IssuedToIdentifier", NIL )
   ENDIF
   IF ! Empty( ::oIssuedToName )
      ::oIssuedToName := NIL
      ::SetObjectProp( "IssuedToName", NIL )
   ENDIF

   RETURN

METHOD SetIssuedToIdentifier( oValue ) CLASS TKSeFSubjectTo

   LOCAL o

   ::oIssuedToIdentifier := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "IssuedToIdentifier", o )

   RETURN NIL

METHOD SetIssuedToName( oValue ) CLASS TKSeFSubjectTo

   LOCAL o

   ::oIssuedToName := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "IssuedToName", o )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFQueryCriteriaInvoice INHERIT TKSeFRequest

   ACCESS SubjectType INLINE ( ::GetIntegerProp( "SubjectType" ) )
   ASSIGN SubjectType METHOD SetSubjectType( nValue )
   ACCESS HidingDateFrom INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "HidingDateFrom" ) ) )
   ASSIGN HidingDateFrom METHOD SetHidingDateFrom( dValue )
   ACCESS HidingDateTo INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "HidingDateTo" ) ) )
   ASSIGN HidingDateTo METHOD SetHidingDateTo( dValue )
   ACCESS IsHidden INLINE ( ::GetBooleanProp( "IsHidden" ) )
   ASSIGN IsHidden METHOD SetIsHidden( lValue )

ENDCLASS

METHOD SetSubjectType( nValue ) CLASS TKSeFQueryCriteriaInvoice

   ::SetIntegerProp( "SubjectType", nValue )

   RETURN NIL

METHOD SetHidingDateFrom( dValue ) CLASS TKSeFQueryCriteriaInvoice

   ::SetDoubleProp( "HidingDateFrom", lgoTimestampToDateTime( dValue ) )

   RETURN NIL

METHOD SetHidingDateTo( dValue ) CLASS TKSeFQueryCriteriaInvoice

   ::SetDoubleProp( "HidingDateTo", lgoTimestampToDateTime( dValue ) )

   RETURN NIL

METHOD SetIsHidden( lValue ) CLASS TKSeFQueryCriteriaInvoice

   ::SetBooleanProp( "IsHidden", lValue )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFQueryCriteriaInvoiceDetail INHERIT TKSeFQueryCriteriaInvoice

   HIDDEN:
   VAR oSubjectBy INIT NIL
   VAR oSubjectTo INIT NIL

   VISIBLE:
   DESTRUCTOR Free()

   ACCESS AmountFrom INLINE ( ::GetDoubleProp( "AmountFrom" ) )
   ASSIGN AmountFrom METHOD SetAmountFrom( nValue )
   ACCESS AmountTo INLINE ( ::GetDoubleProp( "AmountTo" ) )
   ASSIGN AmountTo METHOD SetAmountTo( nValue )
   ACCESS AmountType INLINE ( ::GetIntegerProp( "AmountType" ) )
   ASSIGN AmountType METHOD SetAmountType( nValue )
   ACCESS CurrencyCodesStr INLINE ( ::GetStringProp( "CurrencyCodesStr" ) )
   ASSIGN CurrencyCodesStr METHOD SetCurrencyCodesStr( cValue )
   ACCESS FaP17Annotation INLINE ( ::GetBooleanProp( "FaP17Annotation" ) )
   ASSIGN FaP17Annotation METHOD SetFaP17Annotation( lValue )
   ACCESS InvoiceNumber INLINE ( ::GetStringProp( "InvoiceNumber" ) )
   ASSIGN InvoiceNumbermethod METHOD SetInvoiceNumber( cValue )
   ACCESS InvoiceTypesStr INLINE ( ::GetStringProp( "InvoiceTypesStr" ) )
   ASSIGN InvoiceTypesStr METHOD SetInvoiceTypesStr( cValue )
   ACCESS InvoicingDateFrom INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "InvoicingDateFrom" ) ) )
   ASSIGN InvoicingDateFrom METHOD SetInvoicingDateFrom( dValue )
   ACCESS InvoicingDateTo INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "InvoicingDateTo" ) ) )
   ASSIGN InvoicingDateTo METHOD SetInvoicingDateTo( dValue )
   ACCESS KsefReferenceNumber INLINE ( ::GetStringProp( "KsefReferenceNumber" ) )
   ASSIGN KsefReferenceNumber METHOD SetKsefReferenceNumber( cValue )
   ACCESS SubjectBy INLINE ( ::oSubjectBy )
   ASSIGN SubjectBy METHOD SetSubjectBy( oValue )
   ACCESS SubjectTo INLINE ( ::oSubjectTo )
   ASSIGN SubjectTo METHOD SetSubjectTo( oValue )

ENDCLASS

DESTRUCTOR Free() CLASS TKSeFQueryCriteriaInvoiceDetail

   IF ! Empty( ::oSubjectBy )
      ::oSubjectBy := NIL
      ::SetObjectProp( "SubjectBy", NIL )
   ENDIF
   IF ! Empty( ::oSubjectTo )
      ::oSubjectTo := NIL
      ::SetObjectProp( "SubjectTo", NIL )
   ENDIF

   RETURN


METHOD SetAmountFrom( nValue ) CLASS TKSeFQueryCriteriaInvoiceDetail

   ::SetDoubleProp( "AmountFrom", nValue )

   RETURN NIL

METHOD SetAmountTo( nValue ) CLASS TKSeFQueryCriteriaInvoiceDetail

   ::SetDoubleProp( "AmountTo", nValue )

   RETURN NIL

METHOD SetAmountType( nValue ) CLASS TKSeFQueryCriteriaInvoiceDetail

   ::SetIntegerProp( "AmountType", nValue )

   RETURN NIL

METHOD SetCurrencyCodesStr( cValue ) CLASS TKSeFQueryCriteriaInvoiceDetail

   ::SetStringProp( "CurrencyCodesStr", cValue )

   RETURN NIL

METHOD SetFaP17Annotation( lValue ) CLASS TKSeFQueryCriteriaInvoiceDetail

   ::SetBooleanProp( "FaP17Annotation", lValue )

   RETURN NIL

METHOD SetInvoiceNumber( cValue ) CLASS TKSeFQueryCriteriaInvoiceDetail

   ::SetStringProp( "InvoiceNumber", cValue )

   RETURN NIL

METHOD SetInvoiceTypesStr( cValue ) CLASS TKSeFQueryCriteriaInvoiceDetail

   ::SetStringProp( "InvoiceTypesStr", cValue )

   RETURN NIL

METHOD SetInvoicingDateFrom( dValue ) CLASS TKSeFQueryCriteriaInvoiceDetail

   ::SetDoubleProp( "InvoicingDateFrom", lgoTimestampToDateTime( dValue ) )

   RETURN NIL

METHOD SetInvoicingDateTo( dValue ) CLASS TKSeFQueryCriteriaInvoiceDetail

   ::SetDoubleProp( "InvoicingDateTo", lgoTimestampToDateTime( dValue ) )

   RETURN NIL

METHOD SetKsefReferenceNumber( cValue ) CLASS TKSeFQueryCriteriaInvoiceDetail

   ::SetStringProp( "KsefReferenceNumber", cValue )

   RETURN NIL

METHOD SetSubjectBy( oValue ) CLASS TKSeFQueryCriteriaInvoiceDetail

   LOCAL o

   ::oSubjectBy := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "SubjectBy", o )

   RETURN NIL

METHOD SetSubjectTo( oValue ) CLASS TKSeFQueryCriteriaInvoiceDetail

   LOCAL o

   ::oSubjectTo := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "SubjectTo", o )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFQueryCriteriaInvoiceIncremental INHERIT TKSeFQueryCriteriaInvoice

   ACCESS AcquisitionTimestampThresholdFrom INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "AcquisitionTimestampThresholdFrom" ) ) )
   ASSIGN AcquisitionTimestampThresholdFrom METHOD SetAcqTsThresholdFrom( dValue )
   ACCESS AcquisitionTimestampThresholdTo INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "AcquisitionTimestampThresholdTo" ) ) )
   ASSIGN AcquisitionTimestampThresholdTo METHOD SetAcqTsThresholdTo( dValue )

ENDCLASS

METHOD SetAcqTsThresholdFrom( dValue ) CLASS TKSeFQueryCriteriaInvoiceIncremental

   ::SetDoubleProp( "AcquisitionTimestampThresholdFrom", lgoTimestampToDateTime( dValue ) )

   RETURN NIL

METHOD SetAcqTsThresholdTo( dValue ) CLASS TKSeFQueryCriteriaInvoiceIncremental

   ::SetDoubleProp( "AcquisitionTimestampThresholdTo", lgoTimestampToDateTime( dValue ) )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFQueryCriteriaInvoiceRange INHERIT TKSeFQueryCriteriaInvoice

   ACCESS InvoicingDateFrom INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "InvoicingDateFrom" ) ) )
   ASSIGN InvoicingDateFrom METHOD SetInvoicingDateFrom( dValue )
   ACCESS InvoicingDateTo INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "InvoicingDateTo" ) ) )
   ASSIGN InvoicingDateTo METHOD SetInvoicingDateTo( dValue )

ENDCLASS

METHOD SetInvoicingDateFrom( dValue ) CLASS TKSeFQueryCriteriaInvoiceRange

   ::SetDoubleProp( "InvoicingDateFrom", lgoTimestampToDateTime( dValue ) )

   RETURN NIL

METHOD SetInvoicingDateTo( dValue ) CLASS TKSeFQueryCriteriaInvoiceRange

   ::SetDoubleProp( "InvoicingDateTo", lgoTimestampToDateTime( dValue ) )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFQueryInvoiceRequest INHERIT TKSeFRequest

   HIDDEN:
   VAR oQueryCriteria INIT NIL

   VISIBLE:
   DESTRUCTOR Free()

   ACCESS QueryCriteria INLINE ( ::oQueryCriteria )
   ASSIGN QueryCriteria METHOD SetQueryCriteria( oValue )

ENDCLASS

DESTRUCTOR Free() CLASS TKSeFQueryInvoiceRequest

   IF ! Empty( ::oQueryCriteria )
      ::oQueryCriteria := NIL
      ::SetObjectProp( "QueryCriteria", NIL )
   ENDIF

   RETURN

METHOD SetQueryCriteria( oValue ) CLASS TKSeFQueryInvoiceRequest

   LOCAL o

   ::oQueryCriteria := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "QueryCriteria", o )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSubjectIdentifierOtherTo INHERIT TKSeFObject

   ACCESS Type INLINE ( ::GetStringProp( "Type" ) )

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSubjectIdentifierOtherToInternal INHERIT TKSeFSubjectIdentifierOtherTo

   ACCESS Identifier INLINE ( ::GetStringProp( "Identifier" ) )

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSubjectIdentifierOtherToNone INHERIT TKSeFSubjectIdentifierOtherTo

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSubjectIdentifierOtherToNrId INHERIT TKSeFSubjectIdentifierOtherTo

   ACCESS Identifier INLINE ( ::GetStringProp( "Identifier" ) )

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSubjectIdentifierOtherToCompany INHERIT TKSeFSubjectIdentifierOtherTo

   ACCESS Identifier INLINE ( ::GetStringProp( "Identifier" ) )

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSubjectIdentifierOtherToVatUe INHERIT TKSeFSubjectIdentifierOtherTo

   ACCESS Identifier INLINE ( ::GetStringProp( "Identifier" ) )

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSubjectOther INHERIT TKSeFObject

   HIDDEN:
   VAR oIssuedToIdentifier INIT NIL
   VAR oIssuedToName INIT NIL

   VISIBLE:
   METHOD New( xClass ) CONSTRUCTOR
   DESTRUCTOR Free()

   ACCESS IssuedToIdentifier INLINE ( ::oIssuedToIdentifier )
   ACCESS IssuedToName INLINE ( ::oIssuedToName )
   ACCESS SubjectOtherTypeRaw INLINE ( ::GetStringProp( "SubjectOtherTypeRaw" ) )

ENDCLASS

METHOD New( xClass ) CLASS TKSeFSubjectOther

   LOCAL o

   ::Super:New( xClass )

   o := ::GetObjectProp( "IssuedToIdentifier" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oIssuedToIdentifier := lgoCreateObject( o )
   ENDIF
   o := ::GetObjectProp( "IssuedToName" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oIssuedToName := lgoCreateObject( o )
   ENDIF

   RETURN Self

DESTRUCTOR Free() CLASS TKSeFSubjectOther

   IF ! Empty( ::oIssuedToIdentifier )
      ::oIssuedToIdentifier := NIL
      ::SetObjectProp( "IssuedToIdentifier", NIL )
   ENDIF
   IF ! Empty( ::oIssuedToName )
      ::oIssuedToName := NIL
      ::SetObjectProp( "IssuedToName", NIL )
   ENDIF

   RETURN

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSubjectOtherArray INHERIT TKSeFArray

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSubjectAuthorized INHERIT TKSeFObject

   HIDDEN:
   VAR oIssuedToIdentifier INIT NIL
   VAR oIssuedToName INIT NIL

   VISIBLE:
   METHOD New( xClass ) CONSTRUCTOR
   DESTRUCTOR Free()

   ACCESS IssuedToIdentifier INLINE ( ::oIssuedToIdentifier )
   ACCESS IssuedToName INLINE ( ::oIssuedToName )
   ACCESS SubjectAuthorizedTypeRaw INLINE ( ::GetStringProp( "SubjectAuthorizedTypeRaw" ) )

ENDCLASS

METHOD New( xClass ) CLASS TKSeFSubjectAuthorized

   LOCAL o

   ::Super:New( xClass )

   o := ::GetObjectProp( "IssuedToIdentifier" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oIssuedToIdentifier := lgoCreateObject( o )
   ENDIF
   o := ::GetObjectProp( "IssuedToName" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oIssuedToName := lgoCreateObject( o )
   ENDIF

   RETURN Self

DESTRUCTOR Free() CLASS TKSeFSubjectAuthorized

   IF ! Empty( ::oIssuedToIdentifier )
      ::oIssuedToIdentifier := NIL
      ::SetObjectProp( "IssuedToIdentifier", NIL )
   ENDIF
   IF ! Empty( ::oIssuedToName )
      ::oIssuedToName := NIL
      ::SetObjectProp( "IssuedToName", NIL )
   ENDIF

   RETURN

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSubjectAuthorizedArray INHERIT TKSeFArray

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFSubjectToArray INHERIT TKSeFArray

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFHashSHA INHERIT TKSeFObject

   ACCESS Algorithm INLINE ( ::GetStringProp( "Algorithm" ) )
   ASSIGN Algorithm METHOD SetAlgorithm( cValue )
   ACCESS Encoding INLINE ( ::GetStringProp( "Encoding" ) )
   ASSIGN Encoding METHOD SetEncoding( cValue )
   ACCESS Value INLINE ( ::GetStringProp( "Value" ) )
   ASSIGN Value METHOD SetValue( cValue )

ENDCLASS

METHOD SetAlgorithm( cValue ) CLASS TKSeFHashSHA

   ::SetStringProp( "Algorithm", cValue )

   RETURN NIL

METHOD SetEncoding( cValue ) CLASS TKSeFHashSHA

   ::SetStringProp( "Encoding", cValue )

   RETURN NIL

METHOD SetValue( cValue ) CLASS TKSeFHashSHA

   ::SetStringProp( "Value", cValue )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFFileUnlimitedHash INHERIT TKSeFObject

   HIDDEN:
   VAR oHashSHA INIT NIL

   VISiBLE:
   METHOD New( xClass ) CONSTRUCTOR
   DESTRUCTOR Free()

   ACCESS FileSize INLINE ( ::GetIntegerProp( "FileSize" ) )
   ACCESS HashSHA INLINE ( ::oHashSHA )

ENDCLASS

METHOD New( xClass ) CLASS TKSeFFileUnlimitedHash

   LOCAL o

   ::Super:New( xClass )

   o := ::GetObjectProp( "HashSHA" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oHashSHA := lgoCreateObject( o )
   ENDIF

   RETURN Self

DESTRUCTOR Free() CLASS TKSeFFileUnlimitedHash

   IF ! Empty( ::oHashSHA )
      ::oHashSHA := NIL
      ::SetObjectProp( "HashSHA", NIL )
   ENDIF

   RETURN

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFInvoiceHeader INHERIT TKSeFObject

   HIDDEN:
   VAR oInvoiceHash INIT NIL
   VAR oSubjectBy INIT NIL
   VAR oSubjectByK INIT NIL
   VAR oSubjectsAuthorizedList INIT NIL
   VAR oSubjectsOtherList INIT NIL
   VAR oSubjectTo INIT NIL
   VAR oSubjectToKList INIT NIL

   VISIBLE:
   METHOD New( xClass ) CONSTRUCTOR
   DESTRUCTOR Free()

   ACCESS AcquisitionTimestamp INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "AcquisitionTimestamp" ) ) )
   ACCESS AcquisitionTimestampRaw INLINE ( ::GetStringProp( "AcquisitionTimestampRaw" ) )
   ACCESS Currency INLINE ( ::GetStringProp( "Currency" ) )
   ACCESS FaP17Annotation INLINE ( ::GetBooleanProp( "FaP17Annotation" ) )
   ACCESS Gross INLINE ( ::GetStringProp( "Gross" ) )
   ACCESS Hidden INLINE ( ::GetBooleanProp( "Hidden" ) )
   ACCESS HidingTime INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "HidingTime" ) ) )
   ACCESS HidingTimeRaw INLINE ( ::GetStringProp( "HidingTimeRaw" ) )
   ACCESS InvoiceHash INLINE ( ::oInvoiceHash )
   ACCESS InvoiceReferenceNumber INLINE ( ::GetStringProp( "InvoiceReferenceNumber" ) )
   ACCESS InvoiceTypeRaw INLINE ( ::GetStringProp( "InvoiceTypeRaw" ) )
   ACCESS InvoiceType INLINE ( ::GetIntegerProp( "InvoiceType" ) )
   ACCESS InvoicingDate INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "InvoicingDate" ) ) )
   ACCESS InvoicingDateRaw INLINE ( ::GetStringProp( "InvoicingDateRaw" ) )
   ACCESS KsefReferenceNumber INLINE ( ::GetStringProp( "KsefReferenceNumber" ) )
   ACCESS Net INLINE ( ::GetStringProp( "Net" ) )
   ACCESS SchemaVersion INLINE ( ::GetStringProp( "SchemaVersion" ) )
   ACCESS SubjectBy INLINE ( ::oSubjectBy )
   ACCESS SubjectByK INLINE ( ::oSubjectByK )
   ACCESS SubjectTo INLINE ( ::oSubjectTo )
   ACCESS SubjectToKList INLINE ( ::oSubjectToKList )
   ACCESS SubjectsAuthorizedList INLINE ( ::oSubjectsAuthorizedList )
   ACCESS SubjectsOtherList INLINE ( ::oSubjectsOtherList )
   ACCESS Vat INLINE ( ::GetStringProp( "Vat" ) )

ENDCLASS

METHOD New( xClass ) CLASS TKSeFInvoiceHeader

   LOCAL o

   ::Super:New( xClass )

   o := ::GetObjectProp( "InvoiceHash" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oInvoiceHash := lgoCreateObject( o )
   ENDIF
   o := ::GetObjectProp( "SubjectBy" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oSubjectBy := lgoCreateObject( o )
   ENDIF
   o := ::GetObjectProp( "SubjectByK" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oSubjectByK := lgoCreateObject( o )
   ENDIF
   o := ::GetObjectProp( "SubjectTo" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oSubjectTo := lgoCreateObject( o )
   ENDIF
   o := ::GetObjectProp( "SubjectToKList" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oSubjectToKList := lgoCreateObject( o )
   ENDIF
   o := ::GetObjectProp( "SubjectsAuthorizedList" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oSubjectsAuthorizedList := lgoCreateObject( o )
   ENDIF
   o := ::GetObjectProp( "SubjectsOtherList" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oSubjectsOtherList := lgoCreateObject( o )
   ENDIF

   RETURN Self

DESTRUCTOR Free() CLASS TKSeFInvoiceHeader

   IF ! Empty( ::oInvoiceHash )
      ::oInvoiceHash := NIL
      ::SetObjectProp( "InvoiceHash", NIL )
   ENDIF
   IF ! Empty( ::oSubjectBy )
      ::oSubjectBy := NIL
      ::SetObjectProp( "SubjectBy", NIL )
   ENDIF
   IF ! Empty( ::oSubjectByK )
      ::oSubjectByK := NIL
      ::SetObjectProp( "SubjectByK", NIL )
   ENDIF
   IF ! Empty( ::oSubjectTo )
      ::oSubjectTo := NIL
      ::SetObjectProp( "SubjectTo", NIL )
   ENDIF
   IF ! Empty( ::oSubjectToKList )
      ::oSubjectToKList := NIL
      ::SetObjectProp( "SubjectToKList", NIL )
   ENDIF
   IF ! Empty( ::oSubjectsAuthorizedList )
      ::oSubjectsAuthorizedList := NIL
      ::SetObjectProp( "SubjectsAuthorizedList", NIL )
   ENDIF
   IF ! Empty( ::oSubjectsOtherList )
      ::oSubjectsOtherList := NIL
      ::SetObjectProp( "SubjectsOtherList", NIL )
   ENDIF

   RETURN

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFInvoiceHeaderArray INHERIT TKSeFArray

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFQueryInvoiceSyncResponse INHERIT TKSeFResponse

   HIDDEN:
   VAR oInvoiceHeaderList INIT NIL

   VISIBLE:
   METHOD New( xClass ) CONSTRUCTOR
   DESTRUCTOR Free()

   ACCESS InvoiceHeaderList INLINE ( ::oInvoiceHeaderList )
   ACCESS NumberOfElements INLINE ( ::GetIntegerProp( "NumberOfElements" ) )
   ACCESS PageOffset INLINE ( ::GetIntegerProp( "PageOffset" ) )
   ACCESS PageSize INLINE ( ::GetIntegerProp( "PageSize" ) )
   ACCESS ReferenceNumber INLINE ( ::GetStringProp( "ReferenceNumber" ) )
   ACCESS TimestampRaw INLINE ( ::GetStringProp( "TimestampRaw" ) )
   ACCESS Timestamp INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "Timestamp" ) ) )

ENDCLASS

METHOD New( xClass ) CLASS TKSeFQueryInvoiceSyncResponse

   LOCAL o

   ::Super:New( xClass )

   o := ::GetObjectProp( "InvoiceHeaderList" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oInvoiceHeaderList := lgoCreateObject( o )
   ENDIF

   RETURN Self

DESTRUCTOR Free() CLASS TKSeFQueryInvoiceSyncResponse

   IF ! Empty( ::oInvoiceHeaderList )
      ::oInvoiceHeaderList := NIL
      ::SetObjectProp( "InvoiceHeaderList", NIL )
   ENDIF

   RETURN

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFQueryInvoiceAsyncInitResponse INHERIT TKSeFResponse

   ACCESS ElementReferenceNumber INLINE ( ::GetStringProp( "ElementReferenceNumber" ) )
   ACCESS ProcessingCode INLINE ( ::GetIntegerProp( "ProcessingCode" ) )
   ACCESS ProcessingDescription INLINE ( ::GetStringProp( "ProcessingDescription" ) )
   ACCESS ReferenceNumber INLINE ( ::GetStringProp( "ReferenceNumber" ) )
   ACCESS TimestampRaw INLINE ( ::GetStringProp( "TimestampRaw" ) )
   ACCESS Timestamp INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "Timestamp" ) ) )

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFInvoiceDivisionPlainPart INHERIT TKSeFObject

   HIDDEN:
   VAR oPlainPartHash INIT NIL

   VISIBLE:
   METHOD New( xClass ) CONSTRUCTOR
   DESTRUCTOR Free()

   ACCESS PartExpirationRaw INLINE ( ::GetStringProp( "PartExpirationRaw" ) )
   ACCESS PartExpiration INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "PartExpiration" ) ) )
   ACCESS PartName INLINE ( ::GetStringProp( "PartName" ) )
   ACCESS PartNumber INLINE ( ::GetIntegerProp( "PartNumber" ) )
   ACCESS PartRangeFromRaw INLINE ( ::GetStringProp( "PartRangeFromRaw" ) )
   ACCESS PartRangeFrom INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "PartRangeFrom" ) ) )
   ACCESS PartRangeToRaw INLINE ( ::GetStringProp( "PartRangeToRaw" ) )
   ACCESS PartRangeTo INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "PartRangeTo" ) ) )
   ACCESS PartReferenceNumber INLINE ( ::GetStringProp( "PartReferenceNumber" ) )
   ACCESS PlainPartHash INLINE ( ::oPlainPartHash )

ENDCLASS

METHOD New( xClass ) CLASS TKSeFInvoiceDivisionPlainPart

   LOCAL o

   ::Super:New( xClass )

   o := ::GetObjectProp( "PlainPartHash" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oPlainPartHash := lgoCreateObject( o )
   ENDIF

   RETURN Self

DESTRUCTOR Free() CLASS TKSeFInvoiceDivisionPlainPart

   IF ! Empty( ::oPlainPartHash )
      ::oPlainPartHash := NIL
      ::SetObjectProp( "PlainPartHash", NIL )
   ENDIF

   RETURN

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFInvoiceDivisionPlainPartArray INHERIT TKSeFArray

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFQueryInvoiceAsyncStatusResponse INHERIT TKSeFResponse

   HIDDEN:
   VAR oPartList INIT NIL

   VISIBLE:
   METHOD New( xClass ) CONSTRUCTOR
   DESTRUCTOR Free()

   ACCESS ElementReferenceNumber INLINE ( ::GetStringProp( "ElementReferenceNumber" ) )
   ACCESS NumberOfElements INLINE ( ::GetInt64Prop( "NumberOfElements" ) )
   ACCESS NumberOfParts INLINE ( ::GetIntegerProp( "NumberOfParts" ) )
   ACCESS PartList INLINE ( ::oPartList )
   ACCESS ProcessingCode INLINE ( ::GetIntegerProp( "ProcessingCode" ) )
   ACCESS ProcessingDescription INLINE ( ::GetStringProp( "ProcessingDescription" ) )
   ACCESS ReferenceNumber INLINE ( ::GetStringProp( "ReferenceNumber" ) )
   ACCESS TimestampRaw INLINE ( ::GetStringProp( "TimestampRaw" ) )
   ACCESS Timestamp INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "Timestamp" ) ) )

ENDCLASS

METHOD New( xClass ) CLASS TKSeFQueryInvoiceAsyncStatusResponse

   LOCAL o

   ::Super:New( xClass )

   o := ::GetObjectProp( "PartList" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oPartList := lgoCreateObject( o )
   ENDIF

   RETURN Self

DESTRUCTOR Free() CLASS TKSeFQueryInvoiceAsyncStatusResponse

   IF ! Empty( ::oPartList )
      ::oPartList := NIL
      ::SetObjectProp( "PartList", NIL )
   ENDIF

   RETURN

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFGetPaymentIdentifierReferenceNumbersResponse INHERIT TKSeFResponse

   ACCESS KsefReferenceNumberList INLINE ( ::GetStringProp( "KsefReferenceNumberListStr" ) )
   ACCESS NumberOfElements INLINE ( ::GetIntegerProp( "NumberOfElements" ) )
   ACCESS PageOffset INLINE ( ::GetIntegerProp( "PageOffset" ) )
   ACCESS PageSize INLINE ( ::GetIntegerProp( "PageSize" ) )
   ACCESS ReferenceNumber INLINE ( ::GetStringProp( "ReferenceNumber" ) )
   ACCESS TimestampRaw INLINE ( ::GetStringProp( "TimestampRaw" ) )
   ACCESS Timestamp INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "Timestamp" ) ) )

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFRequestPaymentIdentifierResponse INHERIT TKSeFResponse

   ACCESS PaymentIdentifier INLINE ( ::GetStringProp( "PaymentIdentifier" ) )
   ACCESS ReferenceNumber INLINE ( ::GetStringProp( "ReferenceNumber" ) )
   ACCESS TimestampRaw INLINE ( ::GetStringProp( "TimestampRaw" ) )
   ACCESS Timestamp INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "Timestamp" ) ) )

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFInvoiceQueryDetails INHERIT TKSeFObject

   HIDDEN:
   VAR oSubjectTo INIT NIL

   VISIBLE:
   DESTRUCTOR Free()

   ACCESS DueValue INLINE ( ::GetDoubleProp( "DueValue" ) )
   ASSIGN DueValue METHOD SetDueValue( nValue )
   ACCESS InvoiceOryginalNumber INLINE ( ::GetStringProp( "InvoiceOryginalNumber" ) )
   ASSIGN InvoiceOryginalNumber METHOD SetInvoiceOryginalNumber( cValue )
   ACCESS SubjectTo INLINE ( ::oSubjectTo )
   ASSIGN SubjectTo METHOD SetSubjectTo( oValue )

ENDCLASS

DESTRUCTOR Free() CLASS TKSeFInvoiceQueryDetails

   IF ! Empty( ::oSubjectTo )
      ::oSubjectTo := NIL
      ::SetObjectProp( "SubjectTo", NIL )
   ENDIF

   RETURN

METHOD SetDueValue( nValue ) CLASS TKSeFInvoiceQueryDetails

   ::SetDoubleProp( "DueValue", nValue )

   RETURN NIL

METHOD SetInvoiceOryginalNumber( cValue ) CLASS TKSeFInvoiceQueryDetails

   ::SetStringProp( "InvoiceOryginalNumber", cValue )

   RETURN NIL

METHOD SetSubjectTo( oValue ) CLASS TKSeFInvoiceQueryDetails

   LOCAL o

   ::oSubjectTo := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "SubjectTo", o )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFInvoiceRequestKSeF INHERIT TKSeFRequest

   HIDDEN:
   VAR oInvoiceDetails INIT NIL

   VISIBLE:
   DESTRUCTOR Free()

   ACCESS InvoiceDetails INLINE ( ::oInvoiceDetails )
   ASSIGN InvoiceDetails METHOD SetInvoiceDetails( oValue )
   ACCESS KsefReferenceNumber INLINE ( ::GetStringProp( "KsefReferenceNumber" ) )
   ASSIGN KsefReferenceNumber METHOD SetKsefReferenceNumber( cValue )

ENDCLASS

DESTRUCTOR Free() CLASS TKSeFInvoiceRequestKSeF

   IF ! Empty( ::oInvoiceDetails )
      ::oInvoiceDetails := NIL
      ::SetObjectProp( "InvoiceDetails", NIL )
   ENDIF

   RETURN

METHOD SetInvoiceDetails( oValue ) CLASS TKSeFInvoiceRequestKSeF

   LOCAL o

   ::oInvoiceDetails := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "InvoiceDetails", o )

   RETURN NIL

METHOD SetKsefReferenceNumber( cValue ) CLASS TKSeFInvoiceRequestKSeF

   ::SetStringProp( "KsefReferenceNumber", cValue )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFStatusResponse INHERIT TKSeFResponse

   ACCESS ProcessingCode INLINE ( ::GetIntegerProp( "ProcessingCode" ) )
   ACCESS ProcessingDescription INLINE ( ::GetStringProp( "ProcessingDescription" ) )
   ACCESS ReferenceNumber INLINE ( ::GetStringProp( "ReferenceNumber" ) )
   ACCESS TimestampRaw INLINE ( ::GetStringProp( "TimestampRaw" ) )
   ACCESS Timestamp INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "Timestamp" ) ) )
   ACCESS Upo INLINE ( ::GetStringProp( "Upo" ) )

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFAnonymousSubjectIdentifierTo INHERIT TKSeFObject

   ACCESS Type INLINE ( ::GetStringProp( "Type" ) )

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFAnonymousSubjectIdentifierToNone INHERIT TKSeFAnonymousSubjectIdentifierTo

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFAnonymousSubjectIdentifierToCompany INHERIT TKSeFAnonymousSubjectIdentifierTo

   ACCESS Identifier INLINE ( ::GetStringProp( "Identifier" ) )
   ASSIGN Identifier METHOD SetIdentifier( cValue )

ENDCLASS

METHOD SetIdentifier( cValue ) CLASS TKSeFAnonymousSubjectIdentifierToCompany

   ::SetStringProp( "Identifier", cValue )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFAnonymousSubjectIdentifierToOtherTax INHERIT TKSeFAnonymousSubjectIdentifierTo

   ACCESS Identifier INLINE ( ::GetStringProp( "Identifier" ) )
   ASSIGN Identifier METHOD SetIdentifier( cValue )

ENDCLASS

METHOD SetIdentifier( cValue ) CLASS TKSeFAnonymousSubjectIdentifierToOtherTax

   ::SetStringProp( "Identifier", cValue )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFInvoiceDownloadRequest INHERIT TKSeFRequest

   HIDDEN:
   VAR oHashSHA INIT NIL
   VAR oSubjectTo INIT NIL

   VISIBLE:
   DESTRUCTOR Free()

   ACCESS DueValue INLINE ( ::GetDoubleProp( "DueValue" ) )
   ASSIGN DueValue METHOD SetDueValue( nValue )
   ACCESS HashSHA INLINE ( ::oHashSHA )
   ASSIGN HashSHA METHOD SetHashSHA( oValue )
   ACCESS InvoiceNumber INLINE ( ::GetStringProp( "InvoiceNumber" ) )
   ASSIGN InvoiceNumber METHOD SetInvoiceNumber( cValue )
   ACCESS SubjectTo INLINE ( ::oSubjectTo )
   ASSIGN SubjectTo METHOD SetSubjectTo( oValue )

ENDCLASS

DESTRUCTOR Free() CLASS TKSeFInvoiceDownloadRequest

   IF ! Empty( ::oHashSHA )
      ::oHashSHA := NIL
      ::SetObjectProp( "HashSHA", NIL )
   ENDIF
   IF ! Empty( ::oSubjectTo )
      ::oSubjectTo := NIL
      ::SetObjectProp( "SubjectTo", NIL )
   ENDIF

   RETURN

METHOD SetDueValue( nValue ) CLASS TKSeFInvoiceDownloadRequest

   ::SetDoubleProp( "DueValue", nValue )

   RETURN NIL

METHOD SetHashSHA( oValue ) CLASS TKSeFInvoiceDownloadRequest

   LOCAL o

   ::oHashSHA := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "HashSHA", o )

   RETURN NIL

METHOD SetInvoiceNumber( cValue ) CLASS TKSeFInvoiceDownloadRequest

   ::SetStringProp( "InvoiceNumber", cValue )

   RETURN NIL

METHOD SetSubjectTo( oValue ) CLASS TKSeFInvoiceDownloadRequest

   LOCAL o

   ::oSubjectTo := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "SubjectTo", o )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFInvoiceVerificationRequest INHERIT TKSeFRequest

   HIDDEN:
   VAR oHashSHA INIT NIL

   VISIBLE:
   DESTRUCTOR Free()

   ACCESS HashSHA INLINE ( ::oHashSHA )
   ASSIGN HashSHA METHOD SetHashSHA( oValue )

ENDCLASS

DESTRUCTOR Free() CLASS TKSeFInvoiceVerificationRequest

   IF ! Empty( ::oHashSHA )
      ::oHashSHA := NIL
      ::SetObjectProp( "HashSHA", NIL )
   ENDIF

   RETURN

METHOD SetHashSHA( oValue ) CLASS TKSeFInvoiceVerificationRequest

   LOCAL o

   ::oHashSHA := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "HashSHA", o )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFInvoiceVerificationResponse INHERIT TKSeFResponse

   HIDDEN:
   VAR oSubjectBy INIT NIL

   VISIBLE:
   METHOD New( xClass ) CONSTRUCTOR
   DESTRUCTOR Free()

   ACCESS AcquisitionTimestamp INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "AcquisitionTimestamp" ) ) )
   ACCESS AcquisitionTimestampRaw INLINE ( ::GetStringProp( "AcquisitionTimestampRaw" ) )
   ACCESS Hash INLINE ( ::GetStringProp( "Hash" ) )
   ACCESS InvoiceType INLINE ( ::GetIntegerProp( "InvoiceType" ) )
   ACCESS KsefReferenceNumber INLINE ( ::GetStringProp( "KsefReferenceNumber" ) )
   ACCESS SchemaVersion INLINE ( ::GetStringProp( "SchemaVersion" ) )
   ACCESS SubjectBy INLINE ( ::oSubjectBy )

ENDCLASS

METHOD New( xClass ) CLASS TKSeFInvoiceVerificationResponse

   LOCAL o

   ::Super:New( xClass )

   o := ::GetObjectProp( "SubjectBy" )
   IF HB_ISPOINTER( o ) .AND. ! Empty( o )
      ::oSubjectBy := lgoCreateObject( o )
   ENDIF

   RETURN Self

DESTRUCTOR Free() CLASS TKSeFInvoiceVerificationResponse

   IF ! Empty( ::oSubjectBy )
      ::oSubjectBy := NIL
      ::SetObjectProp( "SubjectBy", NIL )
   ENDIF

   RETURN

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFCredentialsIdentifierRequestInstitutional INHERIT TKSeFObject

   ACCESS Identifier INLINE ( ::GetStringProp( "Identifier" ) )
   ASSIGN Identifier METHOD SetIdentifier( cValue )
   ACCESS Type INLINE ( ::GetStringProp( "Type" ) )
   ASSIGN Type METHOD SetType( cValue )

ENDCLASS

METHOD SetIdentifier( cValue ) CLASS TKSeFCredentialsIdentifierRequestInstitutional

   ::SetStringProp( "Identifier", cValue )

   RETURN NIL

METHOD SetType( cValue ) CLASS TKSeFCredentialsIdentifierRequestInstitutional

   ::SetStringProp( "Type", cValue )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFCredentialsIdentifierRequestInternal INHERIT TKSeFCredentialsIdentifierRequestInstitutional

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFCredentialsIdentifierRequestInstitutionalNip INHERIT TKSeFCredentialsIdentifierRequestInstitutional

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFCredentialsIdentifierRequestIndividual INHERIT TKSeFObject

   ACCESS Identifier INLINE ( ::GetStringProp( "Identifier" ) )
   ASSIGN Identifier METHOD SetIdentifier( cValue )
   ACCESS Type INLINE ( ::GetStringProp( "Type" ) )
   ASSIGN Type METHOD SetType( cValue )

ENDCLASS

METHOD SetIdentifier( cValue ) CLASS TKSeFCredentialsIdentifierRequestIndividual

   ::SetStringProp( "Identifier", cValue )

   RETURN NIL

METHOD SetType( cValue ) CLASS TKSeFCredentialsIdentifierRequestIndividual

   ::SetStringProp( "Type", cValue )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFCredentialsIdentifierRequestIndividualCertificateFingerprint INHERIT TKSeFCredentialsIdentifierRequestIndividual

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFCredentialsIdentifierRequestIndividualNip INHERIT TKSeFCredentialsIdentifierRequestIndividual

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFCredentialsIdentifierRequestIndividualPesel INHERIT TKSeFCredentialsIdentifierRequestIndividual

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFCredentialsRoleRequestContextDescribed INHERIT TKSeFObject

   ACCESS RoleDescription INLINE ( ::GetStringProp( "RoleDescription" ) )
   ASSIGN RoleDescription METHOD SetRoleDescription( cValue )
   ACCESS RoleType INLINE ( ::GetStringProp( "RoleType" ) )
   ASSIGN RoleType METHOD SetRoleType( cValue )

ENDCLASS

METHOD SetRoleDescription( cValue ) CLASS TKSeFCredentialsRoleRequestContextDescribed

   ::SetStringProp( "RoleDescription", cValue )

   RETURN NIL

METHOD SetRoleType( cValue ) CLASS TKSeFCredentialsRoleRequestContextDescribed

   ::SetStringProp( "RoleType", cValue )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFGrantContextCredentialsRequestType INHERIT TKSeFObject

   HIDDEN:
   VAR oContextIdentifier INIT NIL
   VAR oCredentialsIdentifier INIT NIL
   VAR oCredentialsRole INIT NIL

   VISIBLE:
   DESTRUCTOR Free()

   ACCESS ContextIdentifier INLINE ( ::oContextIdentifier )
   ASSIGN ContextIdentifier METHOD SetContextIdentifier( oValue )
   ACCESS CredentialsIdentifier INLINE ( ::oCredentialsIdentifier )
   ASSIGN CredentialsIdentifier METHOD SetCredentialsIdentifier( oValue )
   ACCESS CredentialsRole INLINE ( ::oCredentialsRole )
   ASSIGN CredentialsRole METHOD SetCredentialsRole( oValue )

ENDCLASS

DESTRUCTOR Free() CLASS TKSeFGrantContextCredentialsRequestType

   IF ! Empty( ::oContextIdentifier )
      ::oContextIdentifier := NIL
      ::SetObjectProp( "ContextIdentifier", NIL )
   ENDIF
   IF ! Empty( ::oCredentialsIdentifier )
      ::oCredentialsIdentifier := NIL
      ::SetObjectProp( "CredentialsIdentifier", NIL )
   ENDIF
   IF ! Empty( ::oCredentialsRole )
      ::oCredentialsRole := NIL
      ::SetObjectProp( "CredentialsRole", NIL )
   ENDIF

   RETURN

METHOD SetContextIdentifier( oValue ) CLASS TKSeFGrantContextCredentialsRequestType

   LOCAL o

   ::oContextIdentifier := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "ContextIdentifier", o )

   RETURN NIL

METHOD SetCredentialsIdentifier( oValue ) CLASS TKSeFGrantContextCredentialsRequestType

   LOCAL o

   ::oCredentialsIdentifier := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "CredentialsIdentifier", o )

   RETURN NIL

METHOD SetCredentialsRole( oValue ) CLASS TKSeFGrantContextCredentialsRequestType

   LOCAL o

   ::oCredentialsRole := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "CredentialsRole", o )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFGrantContextCredentialsRequest INHERIT TKSeFRequest

   HIDDEN:
   VAR oGrantContextCredentials INIT NIL

   VISIBLE:
   DESTRUCTOR Free()

   ACCESS GrantContextCredentials INLINE ( ::oGrantContextCredentials )
   ASSIGN GrantContextCredentials METHOD SetGrantContextCredentials( oValue )

ENDCLASS

DESTRUCTOR Free() CLASS TKSeFGrantContextCredentialsRequest

   IF ! Empty( ::oGrantContextCredentials )
      ::oGrantContextCredentials := NIL
      ::SetObjectProp( "GrantContextCredentials", NIL )
   ENDIF

   RETURN

METHOD SetGrantContextCredentials( oValue ) CLASS TKSeFGrantContextCredentialsRequest

   LOCAL o

   ::oGrantContextCredentials := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "GrantContextCredentials", o )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFStatusCredentialsResponse INHERIT TKSeFResponse

   ACCESS ElementReferenceNumber INLINE ( ::GetStringProp( "ElementReferenceNumber" ) )
   ACCESS ProcessingCode INLINE ( ::GetIntegerProp( "ProcessingCode" ) )
   ACCESS ProcessingDescription INLINE ( ::GetStringProp( "ProcessingDescription" ) )
   ACCESS ReferenceNumber INLINE ( ::GetStringProp( "ReferenceNumber" ) )
   ACCESS Timestamp INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "Timestamp" ) ) )
   ACCESS TimestampRaw INLINE ( ::GetStringProp( "TimestampRaw" ) )

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFCredentialsRoleRequestContextBase INHERIT TKSeFObject

   ACCESS RoleType INLINE ( ::GetStringProp( "RoleType" ) )
   ASSIGN RoleType METHOD SetRoleType( cValue )

ENDCLASS

METHOD SetRoleType( cValue ) CLASS TKSeFCredentialsRoleRequestContextBase

   ::SetStringProp( "RoleType", cValue )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFRevokeContextCredentialsRequestType INHERIT TKSeFObject

   HIDDEN:
   VAR oContextIdentifier INIT NIL
   VAR oCredentialsIdentifier INIT NIL
   VAR oCredentialsRole INIT NIL

   VISIBLE:
   DESTRUCTOR Free()

   ACCESS ContextIdentifier INLINE ( ::oContextIdentifier )
   ASSIGN ContextIdentifier METHOD SetContextIdentifier( oValue )
   ACCESS CredentialsIdentifier INLINE ( ::oCredentialsIdentifier )
   ASSIGN CredentialsIdentifier METHOD SetCredentialsIdentifier( oValue )
   ACCESS CredentialsRole INLINE ( ::oCredentialsRole )
   ASSIGN CredentialsRole METHOD SetCredentialsRole( oValue )

ENDCLASS

DESTRUCTOR Free() CLASS TKSeFRevokeContextCredentialsRequestType

   IF ! Empty( ::oContextIdentifier )
      ::oContextIdentifier := NIL
      ::SetObjectProp( "ContextIdentifier", NIL )
   ENDIF
   IF ! Empty( ::oCredentialsIdentifier )
      ::oCredentialsIdentifier := NIL
      ::SetObjectProp( "CredentialsIdentifier", NIL )
   ENDIF
   IF ! Empty( ::oCredentialsRole )
      ::oCredentialsRole := NIL
      ::SetObjectProp( "CredentialsRole", NIL )
   ENDIF

   RETURN

METHOD SetContextIdentifier( oValue ) CLASS TKSeFRevokeContextCredentialsRequestType

   LOCAL o

   ::oContextIdentifier := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "ContextIdentifier", o )

   RETURN NIL

METHOD SetCredentialsIdentifier( oValue ) CLASS TKSeFRevokeContextCredentialsRequestType

   LOCAL o

   ::oCredentialsIdentifier := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "CredentialsIdentifier", o )

   RETURN NIL

METHOD SetCredentialsRole( oValue ) CLASS TKSeFRevokeContextCredentialsRequestType

   LOCAL o

   ::oCredentialsRole := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "CredentialsRole", o )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFRevokeContextCredentialsRequest INHERIT TKSeFRequest

   HIDDEN:
   VAR oRevokeContextCredentials INIT NIL

   VISIBLE:
   DESTRUCTOR Free()

   ACCESS RevokeContextCredentials INLINE ( ::oRevokeContextCredentials )
   ASSIGN RevokeContextCredentials METHOD SetRevokeContextCredentials( oValue )

ENDCLASS

DESTRUCTOR Free() CLASS TKSeFRevokeContextCredentialsRequest

   IF ! Empty( ::oRevokeContextCredentials )
      ::oRevokeContextCredentials := NIL
      ::SetObjectProp( "RevokeContextCredentials", NIL )
   ENDIF

   RETURN

METHOD SetRevokeContextCredentials( oValue ) CLASS TKSeFRevokeContextCredentialsRequest

   LOCAL o

   ::oRevokeContextCredentials := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "RevokeContextCredentials", o )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFCredentialsRoleRequestToken INHERIT TKSeFObject

   ACCESS RoleDescription INLINE ( ::GetStringProp( "RoleDescription" ) )
   ASSIGN RoleDescription METHOD SetRoleDescription( cValue )
   ACCESS RoleType INLINE ( ::GetStringProp( "RoleType" ) )
   ASSIGN RoleType METHOD SetRoleType( cValue )

ENDCLASS

METHOD SetRoleDescription( cValue ) CLASS TKSeFCredentialsRoleRequestToken

   ::SetStringProp( "RoleDescription", cValue )

   RETURN NIL

METHOD SetRoleType( cValue ) CLASS TKSeFCredentialsRoleRequestToken

   ::SetStringProp( "RoleType", cValue )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFCredentialsRoleRequestTokenArray INHERIT TKSeFArray

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFGenerateTokenRequestType INHERIT TKSeFObject

   HIDDEN:
   VAR oCredentialsRoleList INIT NIL

   VISIBLE:
   DESTRUCTOR Free()

   ACCESS CredentialsRoleList INLINE ( ::oCredentialsRoleList )
   ASSIGN CredentialsRoleList METHOD SetCredentialsRoleList( oValue )
   ACCESS Description INLINE ( ::GetStringProp( "Description" ) )
   ASSIGN Description METHOD SetDescription( cValue )

ENDCLASS

DESTRUCTOR Free() CLASS TKSeFGenerateTokenRequestType

   IF ! Empty( ::oCredentialsRoleList )
      ::oCredentialsRoleList := NIL
      ::SetObjectProp( "CredentialsRoleList", NIL )
   ENDIF

   RETURN

METHOD SetCredentialsRoleList( oValue ) CLASS TKSeFGenerateTokenRequestType

   LOCAL o

   ::oCredentialsRoleList := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "CredentialsRoleList", o )

   RETURN NIL

METHOD SetDescription( cValue ) CLASS TKSeFGenerateTokenRequestType

   ::SetStringProp( "Description", cValue )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFGenerateTokenRequest INHERIT TKSeFRequest

   HIDDEN:
   VAR oGenerateToken INIT NIL

   VISIBLE:
   DESTRUCTOR Free()

   ACCESS GenerateToken INLINE ( ::oGenerateToken )
   ASSIGN GenerateToken METHOD SetGenerateToken( oValue )

ENDCLASS

DESTRUCTOR Free() CLASS TKSeFGenerateTokenRequest

   IF ! Empty( ::oGenerateToken )
      ::oGenerateToken := NIL
      ::SetObjectProp( "GenerateToken", NIL )
   ENDIF

   RETURN

METHOD SetGenerateToken( oValue ) CLASS TKSeFGenerateTokenRequest

   LOCAL o

   ::oGenerateToken := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "GenerateToken", o )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFGenerateTokenResponse INHERIT TKSeFResponse

   ACCESS AuthorisationToken INLINE ( ::GetStringProp( "AuthorisationToken" ) )
   ACCESS ElementReferenceNumber INLINE ( ::GetStringProp( "ElementReferenceNumber" ) )
   ACCESS ProcessingCode INLINE ( ::GetIntegerProp( "ProcessingCode" ) )
   ACCESS ProcessingDescription INLINE ( ::GetStringProp( "ProcessingDescription" ) )
   ACCESS ReferenceNumber INLINE ( ::GetStringProp( "ReferenceNumber" ) )
   ACCESS Timestamp INLINE ( lgoDateTimeToTimestamp( ::GetDoubleProp( "Timestamp" ) ) )
   ACCESS TimestampRaw INLINE ( ::GetStringProp( "TimestampRaw" ) )

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFCredentialsRoleRequestStandardDescribed INHERIT TKSeFObject

   ACCESS RoleDescription INLINE ( ::GetStringProp( "RoleDescription" ) )
   ASSIGN RoleDescription METHOD SetRoleDescription( cValue )
   ACCESS RoleType INLINE ( ::GetStringProp( "RoleType" ) )
   ASSIGN RoleType METHOD SetRoleType( cValue )

ENDCLASS

METHOD SetRoleDescription( cValue ) CLASS TKSeFCredentialsRoleRequestStandardDescribed

   ::SetStringProp( "RoleDescription", cValue )

   RETURN NIL

METHOD SetRoleType( cValue ) CLASS TKSeFCredentialsRoleRequestStandardDescribed

   ::SetStringProp( "RoleType", cValue )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFCredentialsRoleRequestStandardDescribedArray INHERIT TKSeFArray

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFGrantCredentialsRequestType INHERIT TKSeFObject

   HIDDEN:
   VAR oCredentialsIdentifier INIT NIL
   VAR oCredentialsRoleList INIT NIL

   VISIBLE:
   DESTRUCTOR Free()

   ACCESS CredentialsIdentifier INLINE ( ::oCredentialsIdentifier )
   ASSIGN CredentialsIdentifier METHOD SetCredentialsIdentifier( oValue )
   ACCESS CredentialsRoleList INLINE ( ::oCredentialsRoleList )
   ASSIGN CredentialsRoleList METHOD SetCredentialsRoleList( oValue )

ENDCLASS

DESTRUCTOR Free() CLASS TKSeFGrantCredentialsRequestType

   IF ! Empty( ::oCredentialsIdentifier )
      ::oCredentialsIdentifier := NIL
      ::SetObjectProp( "CredentialsIdentifier", NIL )
   ENDIF
   IF ! Empty( ::oCredentialsRoleList )
      ::oCredentialsRoleList := NIL
      ::SetObjectProp( "CredentialsRoleList", NIL )
   ENDIF

   RETURN

METHOD SetCredentialsIdentifier( oValue ) CLASS TKSeFGrantCredentialsRequestType

   LOCAL o

   ::oCredentialsIdentifier := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "CredentialsIdentifier", o )

   RETURN NIL

METHOD SetCredentialsRoleList( oValue ) CLASS TKSeFGrantCredentialsRequestType

   LOCAL o

   ::oCredentialsRoleList := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "CredentialsRoleList", o )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFGrantCredentialsRequest INHERIT TKSeFRequest

   HIDDEN:
   VAR oGrantCredentials INIT NIL

   VISIBLE:
   DESTRUCTOR Free()

   ACCESS GrantCredentials INLINE ( ::oGrantCredentials )
   ASSIGN GrantCredentials METHOD SetGrantCredentials( oValue )

ENDCLASS

DESTRUCTOR Free() CLASS TKSeFGrantCredentialsRequest

   IF ! Empty( ::oGrantCredentials )
      ::oGrantCredentials := NIL
      ::SetObjectProp( "GrantCredentials", NIL )
   ENDIF

   RETURN

METHOD SetGrantCredentials( oValue ) CLASS TKSeFGrantCredentialsRequest

   LOCAL o

   ::oGrantCredentials := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "GrantCredentials", o )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFCredentialsRoleRequestStandardBase INHERIT TKSeFObject

   ACCESS RoleType INLINE ( ::GetStringProp( "RoleType" ) )
   ASSIGN RoleType METHOD SetRoleType( cValue )

ENDCLASS

METHOD SetRoleType( cValue ) CLASS TKSeFCredentialsRoleRequestStandardBase

   ::SetStringProp( "RoleType", cValue )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFCredentialsRoleRequestStandardBaseArray INHERIT TKSeFArray

ENDCLASS

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFRevokeCredentialsRequestType INHERIT TKSeFObject

   HIDDEN:
   VAR oCredentialsIdentifier INIT NIL
   VAR oCredentialsRoleList INIT NIL

   VISIBLE:
   DESTRUCTOR Free()

   ACCESS CredentialsIdentifier INLINE ( ::oCredentialsIdentifier )
   ASSIGN CredentialsIdentifier METHOD SetCredentialsIdentifier( oValue )
   ACCESS CredentialsRoleList INLINE ( ::oCredentialsRoleList )
   ASSIGN CredentialsRoleList METHOD SetCredentialsRoleList( oValue )

ENDCLASS

DESTRUCTOR Free() CLASS TKSeFRevokeCredentialsRequestType

   IF ! Empty( ::oCredentialsIdentifier )
      ::oCredentialsIdentifier := NIL
      ::SetObjectProp( "CredentialsIdentifier", NIL )
   ENDIF
   IF ! Empty( ::oCredentialsRoleList )
      ::oCredentialsRoleList := NIL
      ::SetObjectProp( "CredentialsRoleList", NIL )
   ENDIF

   RETURN

METHOD SetCredentialsIdentifier( oValue ) CLASS TKSeFRevokeCredentialsRequestType

   LOCAL o

   ::oCredentialsIdentifier := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "CredentialsIdentifier", o )

   RETURN NIL

METHOD SetCredentialsRoleList( oValue ) CLASS TKSeFRevokeCredentialsRequestType

   LOCAL o

   ::oCredentialsRoleList := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "CredentialsRoleList", o )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFRevokeCredentialsRequest INHERIT TKSeFRequest

   HIDDEN:
   VAR oRevokeCredentials INIT NIL

   VISIBLE:
   DESTRUCTOR Free()

   ACCESS RevokeCredentials INLINE ( ::oRevokeCredentials )
   ASSIGN RevokeCredentials METHOD SetRevokeCredentials( oValue )

ENDCLASS

DESTRUCTOR Free() CLASS TKSeFRevokeCredentialsRequest

   IF ! Empty( ::oRevokeCredentials )
      ::oRevokeCredentials := NIL
      ::SetObjectProp( "RevokeCredentials", NIL )
   ENDIF

   RETURN

METHOD SetRevokeCredentials( oValue ) CLASS TKSeFRevokeCredentialsRequest

   LOCAL o

   ::oRevokeCredentials := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "RevokeCredentials", o )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFRevokeTokenRequestType INHERIT TKSeFObject

   HIDDEN:
   VAR oSourceTokenIdentifier INIT NIL

   VISIBLE:
   DESTRUCTOR Free()

   ACCESS SourceTokenIdentifier INLINE ( ::oSourceTokenIdentifier )
   ASSIGN SourceTokenIdentifier METHOD SetSourceTokenIdentifier( oValue )
   ACCESS TokenNumber INLINE ( ::GetStringProp( "TokenNumber" ) )
   ASSIGN TokenNumber METHOD SetTokenNumber( cValue )

ENDCLASS

DESTRUCTOR Free() CLASS TKSeFRevokeTokenRequestType

   IF ! Empty( ::oSourceTokenIdentifier )
      ::oSourceTokenIdentifier := NIL
      ::SetObjectProp( "SourceTokenIdentifier", NIL )
   ENDIF

   RETURN

METHOD SetSourceTokenIdentifier( oValue ) CLASS TKSeFRevokeTokenRequestType

   LOCAL o

   ::oSourceTokenIdentifier := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "SourceTokenIdentifier", o )

   RETURN NIL

METHOD SetTokenNumber( cValue ) CLASS TKSeFRevokeTokenRequestType

   ::SetStringProp( "TokenNumber", cValue )

   RETURN NIL

/*----------------------------------------------------------------------*/

CREATE CLASS TKSeFRevokeTokenRequest INHERIT TKSeFRequest

   HIDDEN:
   VAR oRevokeToken INIT NIL

   VISIBLE:
   DESTRUCTOR Free()

   ACCESS RevokeToken INLINE ( ::oRevokeToken )
   ASSIGN RevokeToken METHOD SetRevokeToken( oValue )

ENDCLASS

DESTRUCTOR Free() CLASS TKSeFRevokeTokenRequest

   IF ! Empty( ::oRevokeToken )
      ::oRevokeToken := NIL
      ::SetObjectProp( "RevokeToken", NIL )
   ENDIF

   RETURN

METHOD SetRevokeToken( oValue ) CLASS TKSeFRevokeTokenRequest

   LOCAL o

   ::oRevokeToken := oValue
   o := iif( ! Empty( oValue ), oValue:ExtObject, NIL )
   ::SetObjectProp( "RevokeToken", o )

   RETURN NIL

/*----------------------------------------------------------------------*/
