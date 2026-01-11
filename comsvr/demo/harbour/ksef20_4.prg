#require "hbwin"
#require "xhb"

#include "libgovpl4com.ch"
#include "hbcompat.ch"
#include "inkey.ch"

/*

   KSeF 2.0
   Generowanie linkow weryfikacyjnych dla kodow QR

*/

FUNCTION Main()

   LOCAL oBackend, oKSeFVerSvc, cFaHash, oHash, cKodI, cKodII

   // Tworzenie obiektu zaplecza
   oBackend := win_oleCreateObject( "LibGovPl.lgcBackend" )

   // Napisz wersje biblioteki
   ? "Wersja biblioteki: " + oBackend:GetLibVersion()

   TRY

      // Tworzymy obiekt hash SHA256
      oHash := oBackend:CreateHash( oBackend:GetClassName( LGC_CT_SHA256HASH, 0 ) )

      // Obliczamy hash SHA256 pliku faktury zakodowany w Base64
      cFaHash := oHash:HashFile( "PlikFA.xml", "" )

      // Tworzymy obiekt uslugi tworzenia linkow weryfikacyjnych
      oKSeFVerSvc := oBackend:CreateKSeF2VerLinkSvc()

      // Generujemy link dla kodu I
      cKodI := oKSeFVerSvc:BuildInvoiceVerificationUrl( ;
         "1111111111", ;           // NIP sprzedawcy
         0d20260111, ;             // data wystawienia (pole P_1 faktury)
         cFaHash, ;                // skrot SHA256 faktury zakodowany w Base64
         LGC_KTG_TEST )            // rodzaj bramki (o - produkcja, 1 - demo, 2 - test)

      ? "Link weryfikacyjny: ", cKodI




      // Tworzenie obiektu podpisu certyfikatem kwalifikowanym lub pieczecia
      oCertSigner := oBackend:CreateCertificateSigner( "" )

      // Wczytaj certyfikat offline i klucz prywatny ze wskazanych plikow
      oCert := oCertSigner:LoadFromStream( ;
         "PlikCertyfikatuOffline.crt", ;       // Plik certyfikatu klucza publicznego
         LGC_ET_PEM, ;                         // Plik certyfikatu w formacie PEM
         "PlikKluczaPrywatnegoOffline.key", ;  // Plik klucza prywatnego
         LGC_ET_PEM, ;                         // Plik klucza w formacie PEM
         "HasloDoKluczaOffline" )              // Haslo, ktorym zabezpieczono klucz prywatny

      // Napisz info o certyfikacie
      ? "Nazwa certyfikatu: ", oCert:DisplayName
      ? "Wazny od: ", oCert:ValidFrom
      ? "Wazny do: ", oCert:ValidTo

      cKodII := oKSeFVerSvc:BuildCertificateVerificationUrl( ;
         "1111111111", ;            // Identyfikator sprzedawcy (NIP podmiotu 1)
         LGC_IT_NIP, ;              // Rodzaj identyfikatora kontekstu (2 - NIP)
         "1111111111", ;            // Wartosc identyfikatora kontekstu
         cFaHash, ;                 // Skrot SHA256 faktury
         oCert, ;                   // Certyfikat offline do podpisu
         LGC_KTG_TEST, ;            // Rodzaj bramki (o - produkcja, 1 - demo, 2 - test)
         "" )                       // Klasa kodera Base64 (puste - domyslna klasa)

      ? "Link trybu Offline (weryfikacja certyfikatu): ", cKodII

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
