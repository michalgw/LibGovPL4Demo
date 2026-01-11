#require "hbwin"
#require "xhb"

#include "libgovpl4com.ch"
#include "hbcompat.ch"
#include "inkey.ch"

/*

   KSeF 2.0
   Autoryzacja certyfikatem i kluczem prywatnym wygenerowanym w KSeF (XAdES),
   szyfrowanie packi i wysylka wsadowa

*/

FUNCTION Main()

   LOCAL oBackend, oKSeF, oResponse, oCertSigner, oCert, oXAdES
   LOCAL lPrzerwij := .F., oBatchReq, oBatchRes, oEl

   // Tworzenie obiektu zaplecza
   oBackend := win_oleCreateObject( "LibGovPl.lgcBackend" )

   // Napisz wersje biblioteki
   ? "Wersja biblioteki: " + oBackend:GetLibVersion()

   TRY

      // Tworzenie obiektu podpisu certyfikatem kwalifikowanym lub pieczecia
      oCertSigner := oBackend:CreateCertificateSigner( "" )

      // Wczytaj certyfikat i klucz prywatny ze wskazanych plikow
      oCert := oCertSigner:LoadFromStream( ;
         "PlikCertyfikatuKSeF.crt", ;       // Plik certyfikatu klucza publicznego
         LGC_ET_PEM, ;                      // Plik certyfikatu w formacie PEM
         "PlikKluczaPrywatnegoKSeF.key", ;  // Plik klucza prywatnego
         LGC_ET_PEM, ;                      // Plik klucza w formacie PEM
         "HasloDoKluczaPrywatnego" )        // Haslo, ktorym zabezpieczono klucz prywatny

      // Napisz info o certyfikacie
      ? "Nazwa certyfikatu: ", oCert:DisplayName
      ? "Wazny od: ", oCert:ValidFrom
      ? "Wazny do: ", oCert:ValidTo

      // Tworzymy obiekt obslugi podpisu XAdES
      oXAdES := oBackend:CreateXAdES()

      // Tworzenie obiektu komunikacji KSeF 2.0
      oKSeF := oBackend:CreateKSeF2()

      // Tworzenie obiektu klienta HTTP
      oKSeF:HTTPClient := oBackend:CreateHTTPClient( "" )

      // Ustawiamy obiekt sygnatury XAdES
      oKSeF:XAdES := oXAdES

      // Uzywamy wybranego certyfikatu do autoryzacji
      oKSeF:AuthCertificate := oCert

      // Ustawiamy parametry podmiotu
      // Rodzaj identyfikatora - NIP
      oKSeF:IdentifierType := LGC_IT_NIP
      // Wartosc identyfikatora, tutaj NIP
      oKSeF:Identifier := "1111111111"
      // Rodzaj serwera KSeF: 0 - produkcja, 1 - demo, 2 - test
      oKSeF:GateType := LGC_KTG_TEST

      // Autoryzacja wybranym certyfikatem
      oResponse := oKSeF:AuthXadesSignature()

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

         ? "Przygotowanie paczki"
         // Szyfrowanie paczki i przygotowanie zadania dla wyslania paczki (paczka max. 100MB)
         oBatchReq := oKSeF:BatchPrepare( "PlikPaczki.zip", "ZaszyfrowanaPaczka.enc", 0 )
         ? "Otwieranie sesji wsadowaej"
         // Otwieramy sesje wsadowa dla przygotowanej paczki, otrzymujemy informacje dla wysylki paczki
         oBatchRes := oKSeF:BatchOpen( oBatchReq, "" )
         ? "Otwarto sesje, nr ref.: ", oBatchRes:ReferenceNumber
         ? "Wysylam paczke na adres: ", oBatchRes:PartUploadRequests:Item(0):Url
         // Wysylamy paczke na podstawie danych odpowiedzi.
         // Paczka jednoczesciowa (tylko jeden element do wyslania)
         oKSeF:BatchSendPart(oBatchRes:PartUploadRequests:Item(0), "ZaszyfrowanaPaczka.enc" )
         ? "Paczka wyslana, zamykamy sesje wsadowa"
         oKSeF:BatchClose( "", "" )
         ? "Sesja zamknieta"

         lPrzerwij := .F.
         DO WHILE ! lPrzerwij

            // Sprawdz status przetwarzania paczki
            oResponse := oKSeF:StatusSession( oBatchRes:ReferenceNumber, "" )

            // Wyswietl otrzymany status
            ? "Status: ", oResponse:Status:Code
            ? "Opis statusu: ", oResponse:Status:Description
            ? "Surowa odpowiedz JSON: ", oResponse:RawResponse

            // Jesli zakonczono poprawnie (status = 200) lub
            // jesli przetwarzanie sie nie powiodlo (status >= 300)
            // to zakoncz
            lPrzerwij := oResponse:Status:Code == 200 .OR. oResponse:Status:Code >= 300

            IF ! lPrzerwij
               ? "dowolny klawisz - sprawdz ponownie, ESC - przerwij"
               nKey := Inkey( 0 )
               lPrzerwij := nKey == K_ESC
            ENDIF

         ENDDO

         // Jesli zatwierdzono to pobierz UPO dla wyslanej faktury
         IF oResponse:Status:Code == 200 .AND. ! Empty( oResponse:Upo )

            FOR EACH oEl IN oResponse:Upo:Pages
               ? "Nr ref. UPO: ", oEl:ReferenceNumber
               ? "UPO pobrania z adresu: ", oEl:DownloadUrl
               // Pobierz UPO po nr ref. sesji i UPO.
               oKSeF:StatusUpoSession( oBatchRes:ReferenceNumber, oEl:ReferenceNumber, oEl:ReferenceNumber + ".xml", '' )
            NEXT

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
