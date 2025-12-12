#require "hbwin"
#require "xhb"

#include "libgovpl4com.ch"
#include "hbcompat.ch"

FUNCTION Main()

   LOCAL oBackend, oKSeF, oReponse

   // Tworzenie obiektu zaplecza
   oBackend := win_oleCreateObject( "LibGovPl.lgcBackend" )

   // Napisz wersje biblioteki
   ? "Wersja biblioteki: " + oBackend:GetLibVersion()

   // Tworzenie obiektu komunikacji KSeF
   oKSeF := oBackend:CreateKSeF()

   TRY

      // Tworzenie obiektu klienta HTTP
      oKSeF:HTTPClient := oBackend:CreateHTTPClient( "" )

      // Tworzenie klucza RSA ze wskazanego pliku
      oKSeF:RSAKeyTest := oBackend:CreateRSAKey( "", "kseftest.pem" )

      // Ustawiamy parametry polaczenia
      oKSeF:Nip := "1111111111"
      oKSeF:Token := "1111111111222222222233333333333344444444444445555555555555666666"
      oKSeF:GateType := LGC_KTG_TEST // Rodzaj serwera KSeF: 0 - produkcja, 1 - demo, 2 - test
      oKSeF:FormCode := 2 // Wersja struktury wysylanych plikow FA: 1 - FA(1), 2 - FA(2). 0 - wlasny, wymaga wypelnienia FormCodeSystemCode, FormCodeSchemaVersion, FormCodeTargetNamespace, FormCodeValue

      // Nawiazywanie sesji interaktywnej tokenem
      oResponse := oKSeF:SessionInitToken()

      // Napisz token sesji
      ? "Token sesji: " + oResponse:SessionToken:Token
      // Napisz odpowiedz w postaci surowego JSON
      ? "Surowa odpowiedz JSON: " + oResponse:GetRawResponse()

      // Odczekaj pare sekund po nawiazaniu sesji bo inaczej serwer odrzuci zadanie
      ? "Odczekaj 10 sekund i nacisnij dowolny klawisz..."
      __Wait()

      // Pobierz fakture i zapisz do pliku
      oKSeF:InvoiceGet( "1111111111-20241120-333333333333-QQ", "fa.xml" )
      ? "Pobrano fakture"

   CATCH oError

      ? "Blad: " + oError:description
      IF oBackend:LastError != NIL
         ? "oBackend:LastError:"
         ? "   komunikat: " + oBackend:LastError:Message
         ? "   klasa wyjatku: " + oBackend:LastError:ExceptionClass
      ENDIF

   END

   IF oKSeF:SessionActive
      oKSeF:SessionTerminate( .F. )
   ENDIF

   RETURN NIL