#require "hbwin"
#require "xhb"

#include "libgovpl4com.ch"
#include "hbcompat.ch"
#include "inkey.ch"

/*

   KSeF 2.0
   Autoryzacja tokenem KSeF,
   wyslanie faktury, sprawdzenie statusu przetwarzania, poranie UPO

*/

FUNCTION Main()

   LOCAL oBackend, oKSeF, oResponse, cSessionRefNo, cFaRefNo
   LOCAL lPrzerwij := .F., oFiltr, oRequest, oEl, nKey

   AltD(1)
   AltD()

   // Tworzenie obiektu zaplecza
   oBackend := win_oleCreateObject( "LibGovPl.lgcBackend" )

   // Napisz wersje biblioteki
   ? "Wersja biblioteki: " + oBackend:GetLibVersion()

   TRY

      // Tworzenie obiektu komunikacji KSeF 2.0
      oKSeF := oBackend:CreateKSeF2()

      // Tworzenie obiektu klienta HTTP
      oKSeF:HTTPClient := oBackend:CreateHTTPClient( "" )

      // Token KSeF do autoryzacji
      oKSeF:KsefToken := "20251106-EC-298F018000-362E31E156-A6|nip-8821850488|01f8636a693c486ab8021fa4ab4a85d6f299560547d943b3be6f643422b1b9d2"

      // Ustawiamy parametry podmiotu
      // Rodzaj identyfikatora - NIP
      oKSeF:IdentifierType := LGC_IT_NIP
      // Wartosc identyfikatora, tutaj NIP
      //oKSeF:Identifier := "1111111111"
      oKSeF:Identifier := "8821850488"
      // Rodzaj serwera KSeF: 0 - produkcja, 1 - demo, 2 - test
      oKSeF:GateType := LGC_KTG_TEST

      // Autoryzacja wybranym certyfikatem
      oResponse := oKSeF:AuthKsefToken()

      // Napisz nr referencyjny sesji
      ? "Nr referencyjny sesji: " + oResponse:ReferenceNumber
      // Napisz token autoryzacji i date waznosci
      ? "Token autoryzacyjny: " + oResponse:AuthenticationToken:Token
      ? "Token wazny do: ", oResponse:AuthenticationToken:ValidUntil
      // Napisz odpowiedz w postaci surowego JSON
      ? "Surowa odpowiedz JSON: " + oResponse:RawResponse

      DO WHILE ! lPrzerwij

         // Sprawdz status autoryzacji (dla aktualnie nawiazywanej sesji i tokena)
         oResponse := oKSeF:AuthStatus( "", "" )

         // Wyswietl otrzymany status
         ? "Status: ", oResponse:Status:Code
         ? "Opis statusu: ", oResponse:Status:Description
         ? "Surowa odpowiedz JSON: ", oResponse:RawResponse

         // Jesli autoryzowano (status = 200) lub
         // jesli autoryzacja sie nie powiodla (status >= 300)
         // to zakoncz
         lPrzerwij := oResponse:Status:Code == 200 .OR. oResponse:Status:Code >= 300

         IF ! lPrzerwij
            ? "dowolny klawisz - sprawdz ponownie, ESC - przerwij"
            nKey := Inkey( 0 )
            lPrzerwij := nKey == K_ESC
         ENDIF

      ENDDO

      // Jesli autoryzowano (status = 200)
      IF oResponse:Status:Code == 200

         // Pobierz tokeny Access Token i Refresh Token
         oResponse := oKSeF:AuthTokenRedem( "" )
         ? "Pobrano tokeny:"
         ? "AccessToken:Token: ", oResponse:AccessToken:Token
         ? "AccessToken:ValidUntil: ", oResponse:AccessToken:ValidUntil
         ? "RefreshToken:Token: ", oResponse:RefreshToken:Token
         ? "RefreshToken:ValidUntil: ", oResponse:RefreshToken:ValidUntil

         // Otworz sesje interaktywna i zwroc jej numer referencyjny
         cSessionRefNo := oKSeF:InteractiveOpenSimple()
         ? "Otwarto sesje interaktywna nr: ", cSessionRefNo

         // Wyslij plik faktury w otwartej sesji i pobierz nr referencyjny
         cFaRefNo := oKSeF:InteractiveSend( ;
            "PlikFA.xml", ;   // Plik xml z faktura do wyslania
            .F., ;            // Czy wysylamy w trybie offline
            "" )              // Skrot dokumentu pierwotnego w trybie offline w przypadku korekty technicznej
         ? "Wyslano fakture, nr ref: ", cFaRefNo

         // Zamykamy aktualna sesje interaktywna
         oKSeF:InteractiveClose( "", "" )
         ? "Zamknieto sesje interaktywna"

         lPrzerwij := .F.
         DO WHILE ! lPrzerwij

            // Sprawdz status przetwarzania faktury
            oResponse := oKSeF:StatusSessionInvoice( cSessionRefNo, cFaRefNo, "" )

            // Wyswietl otrzymany status
            ? "Status: ", oResponse:Status:Code
            ? "Opis statusu: ", oResponse:Status:Description
            ? "Surowa odpowiedz JSON: ", oResponse:RawResponse

            // Jesli autoryzowano (status = 200) lub
            // jesli autoryzacja sie nie powiodla (status >= 300)
            // to zakoncz
            lPrzerwij := oResponse:Status:Code == 200 .OR. oResponse:Status:Code >= 300

            IF ! lPrzerwij
               ? "dowolny klawisz - sprawdz ponownie, ESC - przerwij"
               nKey := Inkey( 0 )
               lPrzerwij := nKey == K_ESC
            ENDIF

         ENDDO

         // Jesli zatwierdzono to pobierz UPO dla wyslanej faktury
         IF oResponse:Status:Code == 200

            ? "Faktura zatwierdzona, nr KSeF: ", oResponse:KsefNumber
            ? "Surowa odpowiedz JSON: ", oResponse:RawResponse

            ? "Pobieram UPO dla faktury z sesji"
            oKSeF:StatusUpoSessionInvoice( cSessionRefNo, cFaRefNo, "PobranyPlikUPO.xml", "" )

         ENDIF

         // Zamykamy sesje
         oKSeF:AuthSessionTerminateCurrent( "" )
         ? "Sesja zamknieta"

      ENDIF

   CATCH oError

      ? "Blad: " + oError:description
      IF oBackend:LastError != NIL
         ? "oBackend:LastError:"
         ? "   komunikat: " + oBackend:LastError:Message
         ? "   klasa wyjatku: " + oBackend:LastError:ExceptionClass
         ? "   szczegoly:"
         oEl := oBackend:LastError:ExtraInfo
      ENDIF

   END

   RETURN NIL
