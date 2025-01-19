#require "hbwin"
#require "xhb"

#include "libgovpl4com.ch"
#include "hbcompat.ch"

FUNCTION Main()

   LOCAL oBackend, oKSeF, oResponse, oCertSigner, oCert, oXAdES
   LOCAL lAborted := .F., oCriteria, oRequest, oEl

   // Tworzenie obiektu zaplecza
   oBackend := win_oleCreateObject( "LibGovPl.lgcBackend" )

   // Napisz wersje biblioteki
   ? "Wersja biblioteki: " + oBackend:GetLibVersion()

   // Tworzenie obiektu podpisu certyfikatem kwalifikowanym lub pieczecia
   oCertSigner := oBackend:CreateCertificateSigner( "" )

   // Wybierz certyfikat przez systemowe okienko wyboru certyfikatu
   oCert := oCertSigner:UISelect()

   IF oCert != NIL

      // Napisz info o certyfikacie
      ? "Wybrano certyfikat: ", oCert:DisplayName

      // Tworzymy obiekt obslugi podpisu XAdES
      oXAdES := oBackend:CreateXAdES()
      // Ustawiamy obiekt obslugi podpisu certyfikatem
      oXAdES:Signer := oCertSigner

      // Tworzenie obiektu komunikacji KSeF
      oKSeF := oBackend:CreateKSeF()

      // Tworzenie obiektu klienta HTTP
      oKSeF:HTTPClient := oBackend:CreateHTTPClient( "" )

      // Tworzenie klucza RSA ze wskazanego pliku
      oKSeF:RSAKeyDemo := oBackend:CreateRSAKey( "", "ksefdemo.pem" )

      // Ustawiamy obiekt sygnatury XAdES
      oKSeF:XAdES := oXAdES
      // Uzywamy wybranego certyfikatu
      oKSeF:Certificate := oCert

      // Ustawiamy parametry polaczenia
      oKSeF:Nip := "1111111111"
      oKSeF:GateType := LGC_KTG_DEMO // Rodzaj serwera KSeF: 0 - produkcja, 1 - demo, 2 - test
      oKSeF:Encryption := .T. // Wlacz dodatkowe szyfrowanie dokumentow algorytmem AES
      oKSeF:FormCode := 1 // Wersja struktury wysylanych plikow FA: 0 - FA(1), 1 - FA(2)

      // Czyscimy informacje o ostatnim bledzie
      oBackend:ClearLastError()

      TRY

         // Nawiazywanie sesji interaktywnej wybranym certyfikatem
         oResponse := oKSeF:SessionInitSigned()

      CATCH oError

         // Sprawdz, czy anulowano wprowadzanie PIN
         IF oBackend:LastError != NIL .AND. oBackend:LastError:ExceptionClass == "EAbort"
            ? "Anulowano wprowadzanie PIN"
         ELSE
            ? "Blad: " + oError:description
            IF oBackend:LastError != NIL
               ? "oBackend:LastError:"
               ? "   komunikat: " + oBackend:LastError:Message
               ? "   klasa wyjatku: " + oBackend:LastError:ExceptionClass
            ENDIF
         ENDIF
         lAborted := .T.

      END

      IF ! lAborted .AND. HB_ISOBJECT( oResponse )

         // Napisz token sesji
         ? "Token sesji: " + oResponse:SessionToken:Token
         // Napisz odpowiedz w postaci surowego JSON
         ? "Surowa odpowiedz JSON: " + oResponse:GetRawResponse()

         // Odczekaj pare sekund po nawiazaniu sesji bo inaczej serwer odrzuci zadanie
         ? "Odczekaj 10 sekund i nacisnij dowolny klawisz..."
         __Wait()

         // Tworzenie obiektu kryteriow zapytania
         oCriteria := oKSeF:CreateKSeFObject( "TKSeFQueryCriteriaInvoiceDetail" )
         // Wyszukaj faktury sprzedazowe (gdzie w fa wystepujamy jako "Podmiot1")
         oCriteria:SubjectType := 0 // 0 - subject1, 1 - subject2, 2 - subject3, ...
         // Okres wystawienia wysukiwanych faktur
         oCriteria:InvoicingDateFrom := Date() - 30
         oCriteria:InvoicingDateTo := Date()
         // Tylko wystawione w walucie PLN i EUR
         oCriteria:CurrencyCodesStr := "PLN,EUR"

         // Tworzymy obiekt zapytania o faktury
         oRequest := oKSeF:CreateKSeFObject( "TKSeFQueryInvoiceRequest" )
         // Ustawiamy obiekt kryteriow
         oRequest:QueryCriteria := oCriteria
         ? "Surowe zadanie: " + oRequest:GetAsJSON()

         // Zapytaj o faktury synchronicznie (10 na stronie, offset 0)
         oResponse := oKSeF:QueryInvoiceSync( oRequest, 10, 0 )
         ? "Surowa odpowiedz: " + oResponse:GetRawResponse()
         ? "Ilosc faktur: " + Str( oResponse:InvoiceHeaderList:Count() )

         FOR EACH oEl IN oResponse:InvoiceHeaderList
            // Wypisz numery znalezionych faktur
            ? "Nr fa: " + oEl:InvoiceReferenceNumber + ",  Nr KSeF: " + oEl:KsefReferenceNumber
         NEXT

      ENDIF

      // Zamykanie sesji KSeF
      IF oKSeF:SessionActive
         oKSeF:SessionTerminate( .F. )
      ENDIF

   ENDIF

   RETURN NIL
