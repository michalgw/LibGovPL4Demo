/*

  LibGovPL 4

  KSeF - inicjowanie sesji interaktywnej za pomoca certyfikatu kwalifikowanego

*/

#include "hlibgovpl4.ch"
#include "xhb.ch"

REQUEST HB_LANG_PL
REQUEST HB_CODEPAGE_PL852

FUNCTION Main()

   LOCAL nI, nC, cInput
   // Listy klas sterownikow
   LOCAL aHTTPClientClasses, aCertificateSignerClasses, aRSAEncClasses
   // Klient HTTPS
   LOCAL oHTTPClient
   // Obiekt sterownika podpisu kwalifikowanego
   LOCAL oCertSigner
   // Lista certyfikatow
   LOCAL oCertList
   // Certyfikat
   LOCAL oCert
   // Obiekt sygnatury XAdES
   LOCAL oXAdES
   // Klucz publiczny RSA szyfrowania dokumentow przesylanych do KSeF
   LOCAL oRSAKey
   // Strumien plikowy
   LOCAL oFileStream
   // Obiekt klinta KSeF
   LOCAL oKSeF
   LOCAL oResponse, oException

   HB_LANGSELECT( 'PL' )
   hb_cdpSelect( 'PL852' )

#ifdef LGP_DEBUG
   SetMode( 25, 80 )
   AltD(1)
   AltD()
#endif

   // Ladowanie biblioteki
   IF Empty( lgpLoadLib() )
      ? "Nie mozna zaladowac bibloteki."
      __Quit()
   ENDIF
   // Inicjacja biblioteki
   lgplInit()
   // Napisz wersje
   ? "Wersja biblioteki: " + DecToHexa( lgplVersion() )

   // Pobierz liste klas sterownikow
   aHTTPClientClasses := lgoListDrivers( LGP_CLSTYPE_HTTP_CLIENT )
   aCertificateSignerClasses := lgoListDrivers( LGP_CLSTYPE_CERT_SIGNER )
   aRSAEncClasses := lgoListDrivers( LGP_CLSTYPE_RSA_ENC )

   // Utworz obiekt klienta HTTPS uzywajac pierwszej klasy strownika
   oHTTPClient := TlgoHTTPClient():New( aHTTPClientClasses[ 1 ] )
   oHTTPClient:IgnoreSSLErrors := .T.

   // Utworz klase sterownika podpisu kwalifikowanego
   oCertSigner := TlgoCertificateSigner():New( aCertificateSignerClasses[ 1 ] )
   // Pobierz liste certyfikatow
   oCertList := oCertSigner:List()

   // Utworz obiekt sygnatury XAdES
   oXAdES := TlgoXAdES():New()
   // Ustaw obiekt podpisu kwalifikowanego
   oXAdES:Signer := oCertSigner

   // Wczytanie klucza publicznego RSA ze wskazanego pliku uzywajac pierwszego na liscie sterownika
   oFileStream := TlgoFileStream():New( "kseftest.pem", LGP_FM_OPEN_READ )
   oRSAKey := TlgoRSAEncrypt_CreateKey( aRSAEncClasses[ 1 ], oFileStream )
   oFileStream := NIL

   // Utworz obiekt klienta KSeF
   oKSeF := TlgoKSeF():New()
   // Podlacz obiekt sygnatury XAdES
   oKSeF:XAdES := oXAdES
   // Podlacz klucz RSA
   oKSeF:RSAKeyTest := oRSAKey
   // Podlacz klienta HTTPS
   oKSeF:HTTPClient := oHTTPClient
   // Ustaw bramke testowa
   oKSeF:GateType := LGP_KSEF_GATETYPE_TEST
   // Ustaw kod przesylanych faktur - FA(2)
   oKSeF:FormCode := LGP_KSEF_FORM_CODE_FA2
   // Wlacz dodatkowe szyfrowanie AES przesylanych dokumentow
   oKSeF:Encryption := .T.

   // Pobierz i przypisz nr NIP dla klienta KSeF
   cInput := __Accept( "Wprowad� NIP:" )
   IF cInput == ""
      __Quit()
   ENDIF
   oKSeF:NIP := cInput

   // Wyswietl liste certyfikatow
   ? "Certyfikaty: " + Str( oCertList:Count() )
   nC := oCertList:Count()
   FOR nI := 1 TO nC
      oCert := oCertList:GetItem( nI )
      ? Str( nI ) + " - " + oCert:DisplayName + " (" + DToC( oCert:ValidFrom ) + " - " + DToC( oCert:ValidTo ) + ")"
   NEXT

   // Wybierz certyfikat do nawiazania sesji KSeF
   cInput := __Accept( "Wybierz certyfikat (1,2,3...):" )
   IF cInput == ""
      __Quit()
   ENDIF
   oKSeF:Certificate := oCertList:GetItem( Val( cInput ) )

   TRY
      ? "Inicjuj sesje"
      oResponse := oKSeF:SessionInitSigned()
      ? "Nr referencyjny sesji: " + oResponse:ReferenceNumber
      ? "JSON: " + oResponse:RawResponse
      oResponse := NIL

      ? "Sprawd� status sesji"
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
      IF HB_ISCHAR( oException:subsystem ) .AND. Upper( oException:subsystem ) == 'EABORT'
         // Anulowano wprowadzanie nr PIN - kliknieto przycisk "Anuluj" w oknie wprowadzanie nr PIN
         ? "Anulowano"
      ELSE
         Throw( oException )
      ENDIF
   END

   // Zwolnij obiety przed wywolaniem lgpExit()
   oHTTPClient := NIL
   oCertSigner := NIL
   oCertList := NIL
   oCert := NIL
   oXAdES := NIL
   oRSAKey := NIL
   oFileStream := NIL
   oKSeF := NIL
   oResponse := NIL

   // Zakoncz biblioteke
   lgplExit()

   RETURN NIL

/*----------------------------------------------------------------------*/
