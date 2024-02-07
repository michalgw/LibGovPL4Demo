/*

  LibGovPL 4

  KSeF - inicjowanie sesji interaktywnej za pomoca tokena, wysylanie faktury,
  sprawdzenie statusu faktury

*/

#include "hlibgovpl4.ch"
#include "xhb.ch"

REQUEST HB_LANG_PL
REQUEST HB_CODEPAGE_PL852

FUNCTION Main()

   LOCAL cInput, i
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
   LOCAL oQueryRequest, oQueryCriteria, oElement
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

   TRY
      ? "Inicjuj sesje"
      oResponse := oKSeF:SessionInitToken()
      ? "Nr referencyjny sesji: " + oResponse:ReferenceNumber
      ? "JSON: " + oResponse:RawResponse
      oResponse := NIL

      // Odczekaj moment aby uniknacz bledu braku autoryzacji
      __Accept( "Wcisnij Enter aby kontynuowac" )

      oQueryCriteria := TKSeFQueryCriteriaInvoiceRange():New()
      // Wyszukaj faktury sprzedazy
      oQueryCriteria:SubjectType := LGP_KSEF_SUBJECTTYPE_SUBJECT1
      // Wyszukaj faktury wystawione w przeciagu ostatnich 30 dni
      oQueryCriteria:InvoicingDateFrom := AddMonth( hb_DateTime(), -1 )
      oQueryCriteria:InvoicingDateTo := hb_DateTime()
      ?? "Zakres daty wystawienia: "
      ?? oQueryCriteria:InvoicingDateFrom
      ?? " = "
      ? oQueryCriteria:InvoicingDateTo

      // Utworz obiekt zadania i przypisz kryteria.
      oQueryRequest := TKSeFQueryInvoiceRequest():New()
      oQueryRequest:QueryCriteria := oQueryCriteria

      // Wyszukaj synchronicznie po zadanych kryteriach,
      // pobierz 10 pierwszych wynikow
      ? "Wyszukiwanie"
      oResponse := oKSeF:QueryInvoiceSync( oQueryRequest, 10, 0 )

      // Wyswietl wyniki
      ? "Licba wynikow: " + Str( oResponse:NumberOfElements )

      // Listy obiektow KSeF sa numerowane od zera ( 0 )
      FOR i := 0 TO oResponse:NumberOfElements - 1
         oElement := oResponse:InvoiceHeaderList:Items( i )
         ? "Nr elementu: " + Str( i )
         ? "Rodzaj: " + Str( oElement:InvoiceType )
         ? "Nr fa: " + oElement:InvoiceReferenceNumber
         ?? "Data: "
         ? oElement:InvoicingDate
         ? "Nr KSeF: " + oElement:KsefReferenceNumber
         ? "-------"
      NEXT

      IF oResponse:InvoiceHeaderList:Count() > 0
         oElement := oResponse:InvoiceHeaderList:Items( 0 )
         ? "Pobieranie faktury nr: " + oElement:InvoiceReferenceNumber
         oFileStream := TlgoFileStream():New( oElement:KsefReferenceNumber + ".xml", LGP_FM_CREATE )
         oKSeF:InvoiceGet( oElement:KsefReferenceNumber, oFileStream )
         oFileStream := NIL
         ? "Zapisano do pliku " + oElement:KsefReferenceNumber + ".xml"
      ENDIF

      ? "Zamykanie sesji"
      oResponse := oKSeF:SessionTerminate( .T. )
      IF ! Empty( oResponse )
         ? "JSON: " + oResponse:RawResponse
      ENDIF
   CATCH oException
      Throw( oException )
   END

   // Zwolnij obiety przed wywolaniem lgpExit()
   oQueryRequest := NIL
   oQueryCriteria := NIL
   oElement := NIL
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
