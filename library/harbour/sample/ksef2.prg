/*

  LibGovPL 4

  KSeF - inicjowanie sesji interaktywnej za pomoca tokena, wysylanie faktury,
  sprawdzenie statusu faktury

*/

#include "hlibgovpl4.ch"
#include "xhb.ch"

#define LGP_DEBUG 1

REQUEST HB_LANG_PL
REQUEST HB_CODEPAGE_PL852

FUNCTION Main()

   LOCAL cInput
   // Listy klas sterownikow
   LOCAL aHTTPClientClasses, aRSAEncClasses
   // Klient HTTPS
   LOCAL oHTTPClient
   // Klucz publiczny RSA szyfrowania dokumentow przesylanych do KSeF
   LOCAL oRSAKey
   // Strumien plikowy
   LOCAL oFileStream
   // Obiekt klinta KSeF
   LOCAL oKSeF
   LOCAL oResponse, oStatusResp, oException

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
   aRSAEncClasses := lgoListDrivers( LGP_CLSTYPE_RSA_ENC )

   // Utworz obiekt klienta HTTPS uzywajac pierwszej klasy strownika
   oHTTPClient := TlgoHTTPClient():New( aHTTPClientClasses[ 1 ] )

   // Wczytanie klucza publicznego RSA ze wskazanego pliku uzywajac pierwszego na liscie sterownika
   oFileStream := TlgoFileStream():New( "kseftest.pem", LGP_FM_OPEN_READ )
   oRSAKey := TlgoRSAEncrypt_CreateKey( aRSAEncClasses[ 1 ], oFileStream )
   oFileStream := NIL

   // Utworz obiekt klienta KSeF
   oKSeF := TlgoKSeF():New()
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
   cInput := __Accept( "Wprowad« NIP:" )
   IF cInput == ""
      __Quit()
   ENDIF
   oKSeF:NIP := cInput

   // Wybierz token do nawiazania sesji KSeF
   cInput := __Accept( "Wprowad« token autoryzuj¥cy:" )
   IF cInput == ""
      __Quit()
   ENDIF
   oKSeF:Token := cInput

   // Wprowadz nazwe pliku do wyslania
   cInput := __Accept( "Wprowadz nazwe pliku FA do wyslania:" )
   IF cInput == ""
      __Quit()
   ENDIF

   TRY
      ? "Inicjuj sesje"
      oResponse := oKSeF:SessionInitToken()
      ? "Nr referencyjny sesji: " + oResponse:ReferenceNumber
      ? "JSON: " + oResponse:RawResponse
      oResponse := NIL

      ? "Wysylanie pliku " + cInput
      oFileStream := TlgoFileStream():New( cInput, LGP_FM_OPEN_READ )
      oResponse := oKSeF:InvoiceSend( oFileStream )
      oFileStream := NIL

      ? "Nr referencyjny przetwarzania wyslanej faktury: " + oResponse:ElementReferenceNumber

      DO WHILE .T.
         ? "Sprawdzanie statusu wyslanej faktury"
         oStatusResp := oKSeF:InvoiceStatus( oResponse:ElementReferenceNumber )
         ? "Status: " + Str( oStatusResp:ProcessingCode )
         ? "Opis: " + oStatusResp:ProcessingDescription

         cInput := __Accept( "Czy sprawdzicz ponownie? (T/N)" )
         IF Upper( cInput ) == "N"
            EXIT
         ENDIF
      ENDDO

      ? "Zamykanie sesji"
      oResponse := oKSeF:SessionTerminate( .T. )
      IF ! Empty( oResponse )
         ? "JSON: " + oResponse:RawResponse
      ENDIF
   CATCH oException
      Throw( oException )
   END

   // Zwolnij obiety przed wywolaniem lgpExit()
   oHTTPClient := NIL
   oRSAKey := NIL
   oFileStream := NIL
   oKSeF := NIL
   oResponse := NIL
   oStatusResp := NIL

   // Zakoncz biblioteke
   lgplExit()

   RETURN NIL

/*----------------------------------------------------------------------*/
