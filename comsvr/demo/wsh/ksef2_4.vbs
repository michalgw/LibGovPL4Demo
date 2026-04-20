'
'   KSeF 2.0
'   Generowanie linkow weryfikacyjnych dla kodow QR
'

Dim Backend
Dim KSeFVerSvc
Dim FaHash
Dim Hash
Dim KodI
Dim KodII

' Tworzenie obiektu zaplecza
Set Backend = CreateObject("LibGovPl.lgcBackend")

' Napisz wersje biblioteki
WSH.echo "Wersja biblioteki: " & Backend.GetLibVersion

' Tworzymy obiekt hash SHA256
Set Hash = Backend.CreateHash(Backend.GetClassName(6, 0))

' Obliczamy hash SHA256 pliku faktury zakodowany w Base64
FaHash = Hash.HashFile("PlikFA.xml", "")

' Tworzymy obiekt uslugi tworzenia linkow weryfikacyjnych
Set KSeFVerSvc = Backend.CreateKSeF2VerLinkSvc

' Generujemy link dla kodu I
'   NIP sprzedawcy
'   data wystawienia (pole P_1 faktury)
'   skrot SHA256 faktury zakodowany w Base64
'   rodzaj bramki (o - produkcja, 1 - demo, 2 - test)
KodI = KSeFVerSvc.BuildInvoiceVerificationUrl("1111111111", Now, FaHash, 2)

WSH.echo "Link weryfikacyjny: ", KodI


' Tworzenie obiektu podpisu certyfikatem kwalifikowanym lub pieczecia
Set CertSigner = Backend.CreateCertificateSigner("")

' Wczytaj certyfikat offline i klucz prywatny ze wskazanych plikow
'   Plik certyfikatu klucza publicznego
'   Plik certyfikatu w formacie PEM
'   Plik klucza prywatnego
'   Plik klucza w formacie PEM
'   Haslo, ktorym zabezpieczono klucz prywatny
Set Cert = CertSigner.LoadFromStream("PlikCertyfikatuOffline.crt", 0, "PlikKluczaPrywatnegoOffline.key", 0, "HasloDoKluczaOffline" )

' Napisz info o certyfikacie
WSH.echo "Nazwa certyfikatu: ", Cert.DisplayName
WSH.echo "Wazny od: ", Cert.ValidFrom
WSH.echo "Wazny do: ", Cert.ValidTo

' Generujemy link dla kodu II
'   Identyfikator sprzedawcy (NIP podmiotu 1)
'   Rodzaj identyfikatora kontekstu (2 - NIP)
'   Wartosc identyfikatora kontekstu
'   Skrot SHA256 faktury
'   Certyfikat offline do podpisu
'   Rodzaj bramki (o - produkcja, 1 - demo, 2 - test)
'   Klasa kodera Base64 (puste - domyslna klasa)
KodII = KSeFVerSvc.BuildCertificateVerificationUrl("1111111111", 2, "1111111111", FaHash, Cert, 2, "")

WSH.echo "Link trybu Offline (weryfikacja certyfikatu): ", KodII
