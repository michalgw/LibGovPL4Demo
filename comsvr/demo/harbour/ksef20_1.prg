#require "hbwin"
#require "xhb"

#include "libgovpl4com.ch"
#include "hbcompat.ch"
#include "inkey.ch"

/*

   KSeF 2.0
   Autoryzacja certyfikatem i kluczem prywatnym wygenerowanym w KSeF (XAdES),
   pobranie metadanych faktur, pobranie faktury

*/

FUNCTION Main()

   LOCAL oBackend, oKSeF, oResponse, oCertSigner, oCert, oXAdES
   LOCAL lPrzerwij := .F., oFiltr, oRequest, oEl, nKey

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

         // Tworzenie obiektu filtra dla zapytania o metadane
         oFiltr := oKSeF:CreateKSeFObject( "TKSeF2InvoiceQueryFilters" )
         // Wyszukaj faktury sprzedazowe (gdzie w fa wystepujamy jako "Podmiot1")
         oFiltr:SubjectType := 0 // 0 - subject1, 1 - subject2, 2 - subject3, ...
         // Okres wystawienia wysukiwanych faktur
         // Rodzaj daty 0 - Issue, 1 - Invoicing, 2 - PermanentStorage
         oFiltr:DateRange:DateType := 0
         // Data od
         oFiltr:DateRange:From := Date() - 30
         // Data do
         oFiltr:DateRange:To := Date()
         // Tylko wystawione w walucie PLN i EUR
         oFiltr:CurrencyCodesStr := "PLN,EUR"

         ? "Wyszukiwanie..."
         // Pobieramy strone metadanych wg filtra
         oResponse := oKSeF:InvoicesQueryMetadata( ;
            oFiltr, ; // Obiekt z kryteriami filtra
            0, ;      // Od strony (0 - pierwsza strona)
            10, ;     // Ilosc elementow na strone
            0, ;      // Sortowanie (0 - nie podano / domyslnie, 1 - narastajaco, 2 - malejaco
            "" )      // Token dostepowy (puste - uzyj aktualnego tokena)

         // Wypisz znalezione metadane faktur
         FOR EACH oEl IN oResponse:Invoices
            // Wypisz numery znalezionych faktur
            ? "Nr fa: ", oEl:InvoiceNumber
            ? "Nr KSeF: ", oEl:KsefNumber
            ? "------------"
         NEXT

         // Jesli istnieje faktura to pobierz pierwsza do pliku
         IF oResponse:Invoices:Count > 0
            ? "Pobieram FA nr ", oResponse:Invoices:Item(0):InvoiceNumber
            oKSeF:InvoicesKsef( oResponse:Invoices:Item(0):KsefNumber, "DocelowyPlikFA.xml", "" )
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
