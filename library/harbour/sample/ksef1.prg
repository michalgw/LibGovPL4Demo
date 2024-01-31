#include "hlibgovpl4.ch"
#include "xhb.ch"

REQUEST HB_LANG_PL
REQUEST HB_CODEPAGE_PL852

FUNCTION Main()

   LOCAL nI, nC, cInput

   PRIVATE aHTTPClientClasses, aCertificateSignerClasses, aRSAEncClasses
   PRIVATE oHTTPClient, oCertSigner, oCertList, oCert, oXAdES, oRSAKey
   PRIVATE oFileStream, oKSeF, oResponse, oException

   HB_LANGSELECT( 'PL' )
   hb_cdpSelect( 'PL852' )

#ifdef LGP_DEBUG
   SetMode( 25, 80 )
   AltD(1)
   AltD()
#endif

   lgpLoadLib()
   lgplInit()
   ? "Wersja biblioteki: " + DecToHexa( lgplVersion() )

   aHTTPClientClasses := lgoListDrivers( LGP_CLSTYPE_HTTP_CLIENT )
   aCertificateSignerClasses := lgoListDrivers( LGP_CLSTYPE_CERT_SIGNER )
   aRSAEncClasses := lgoListDrivers( LGP_CLSTYPE_RSA_ENC )

   oHTTPClient := TlgoHTTPClient():New( aHTTPClientClasses[ 1 ] )
   oHTTPClient:IgnoreSSLErrors := .T.

   oCertSigner := TlgoCertificateSigner():New( aCertificateSignerClasses[ 1 ] )
   oCertList := oCertSigner:List()

   oXAdES := TlgoXAdES():New()
   oXAdES:Signer := oCertSigner

   oFileStream := TlgoFileStream():New( "kseftest.pem", LGP_FM_OPEN_READ )
   oRSAKey := TlgoRSAEncrypt_CreateKey( aRSAEncClasses[ 1 ], oFileStream )
   oFileStream := NIL

   oKSeF := TlgoKSeF():New()
   oKSeF:XAdES := oXAdES
   oKSeF:RSAKeyTest := oRSAKey
   oKSeF:HTTPClient := oHTTPClient
   oKSeF:GateType := LGP_KSEF_GATETYPE_TEST
   oKSeF:FormCode := LGP_KSEF_FORM_CODE_FA2

   cInput := __Accept( "Wprowad« NIP:" )
   IF cInput == ""
      __Quit()
   ENDIF
   oKSeF:NIP := cInput

   ? "Certyfikaty: " + Str( oCertList:Count() )
   nC := oCertList:Count()
   FOR nI := 1 TO nC
      oCert := oCertList:GetItem( nI )
      ? Str( nI ) + " - " + oCert:DisplayName + " (" + DToC( oCert:ValidFrom ) + " - " + DToC( oCert:ValidTo ) + ")"
   NEXT

   cInput := __Accept( "Wybierz certyfikat (1,2,3...):" )
   IF cInput == ""
      __Quit()
   ENDIF
   oKSeF:Certificate := oCertList:GetItem( Val( cInput ) )

   TRY
      oResponse := oKSeF:SessionInitSigned()
      ? "Nr referencyjny sesji: " + oResponse:ReferenceNumber
      ? "JSON: " + oResponse:RawResponse
      oResponse := NIL

      ? "Sprawd« status sesji"
      oResponse := oKSeF:SessionStatus( "", 10, 0, .T. )
      ? "Status przetwarzania: (" + Str( oResponse:ProcessingCode ) + ") " + oResponse:ProcessingDescription
      ? "JSON: " + oResponse:RawResponse
      oResponse := NIL

      ? "Zamykanie sesji"
      oResponse := oKSeF:SessionTerminate( .T. )
      IF ! Empty( oResponse )
         ? "JSON: " + oResponse:RawResponse
      ENDIF
   CATCH oException
      IF HB_ISCHAR( oException:subsystem ) .AND. Upper( oException:subsystem ) == 'EABORD'
         ? "Anulowano"
      ELSE
         Throw( oException )
      ENDIF
   END

   oHTTPClient := NIL
   oCertSigner := NIL
   oCertList := NIL
   oCert := NIL
   oXAdES := NIL
   oRSAKey := NIL
   oFileStream := NIL
   oKSeF := NIL
   oResponse := NIL

   lgplExit()

   RETURN NIL

/*----------------------------------------------------------------------*/
