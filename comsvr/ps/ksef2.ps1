# LibGovPL - KSeF - Nawiazywanie sesji interaktywnej certyfikatem i wyszukiwanie synchronicznie

. "$PSScriptRoot\LibGovPLDef.ps1"

try {
    # Tworzenie obiektu zaplecza
    $backend = New-Object -ComObject LibGovPL.lgcBackend
    
    # Tworzenie obiektu podpisu certyfikatem kwalifikowanym lub pieczecia
    $certSigner = $backend.CreateCertificateSigner('')

    # Wybierz certyfikat przez systemowe okienko wyboru certyfikatu
    $cert = $certSigner.UISelect()

    if ($cert -ne $null) {

        # Tworzymy obiekt obslugi podpisu XAdES
        $xades = $backend.CreateXAdES()
        # Ustawiamy obiekt obslugi podpisu certyfikatem
        $xades.Signer = $certSigner

        # Tworzenie obiektu komunikacji KSeF
        $ksef = $backend.CreateKSeF()

        # Tworzenie obiektu klienta HTTP
        $ksef.HTTPClient = $backend.CreateHTTPClient('')
        # Tworzenie klucza RSA ze wskazanego pliku bo uzyjemy dodatkowego szyfrowania AES
        $ksef.RSAKeyDemo = $backend.CreateRSAKey('', 'ksefdemo.pem')
        # Ustawiamy obiekt sygnatury XAdES
        $ksef.XAdES = $xades
        # Uzywamy wybranego certyfikatu
        $ksef.Certificate = $cert

        # Ustawiamy parametry polaczenia
        $ksef.Nip = '1111111111'
        $ksef.GateType = [lgcKSeFGateType]::lgcKTGDemo # Rodzaj serwera KSeF: 0 - produkcja, 1 - demo, 2 - test
        $ksef.Encryption = $true # Wlacz dodatkowe szyfrowanie dokumentow algorytmem AES
        $ksef.FormCode = 1 # Wersja struktury wysylanych plikow FA: 0 - FA(1), 1 - FA(2)

        # Czyscimy informacje o ostatnim bledzie
        $backend.ClearLastError()
        $aborted = $false
        try {
            # Nawiazywanie sesji interaktywnej wybranym certyfikatem
            $response = $ksef.SessionInitSigned()
        }
        catch {
            $aborted = $true
            # Sprawdz, czy anulowano wprowadzanie PIN
            if (($backend.LastError -ne $null) -And ($backend.LastError.ExceptionClass -eq 'EAbort')) {
                Write-Host -f Yellow 'Anulowano wprowadzanie nr PIN'
            }
            else {
                Write-Host -f Red "Blad: $_"
            }
        }

        if ($aborted -eq $false) {

            # Napisz token sesji
            Write-Host 'Token sesji: ' $response.SessionToken().Token()
            # Napisz odpowiedz w postaci surowego JSON
            Write-Host 'Surowa odpowiedz JSON: ' $response.GetRawResponse()

            # Odczekaj pare sekund po nawiazaniu sesji bo inaczej serwer odrzuci zadanie
            Write-Host 'Momencik...'
            Start-Sleep -Seconds 10

            # Tworzenie obiektu kryteriow zapytania
            $criteria = $ksef.CreateKSeFObject('TKSeFQueryCriteriaInvoiceDetail')
            # Wyszukaj faktury sprzedazowe (gdzie w fa wystepujamy jako "Podmiot1")
            $criteria.SubjectType = 0 # 0 - subject1, 1 - subject2, 2 - subject3, ...
            # Okres wystawienia wysukiwanych faktur
            $criteria.InvoicingDateFrom = (Get-Date).AddDays(-30)
            $criteria.InvoicingDateTo = Get-Date
            # Tylko wystawione w walucie PLN i EUR
            $criteria.CurrencyCodesStr = 'PLN,EUR'

            # Tworzymy obiekt zapytania o faktury
            $request = $ksef.CreateKSeFObject('TKSeFQueryInvoiceRequest')
            # Ustawiamy obiekt kryteriow
            $request.QueryCriteria = $criteria
            Write-Host 'Surowe zadanie: ' $request.GetAsJSON()

            # Zapytaj o faktury synchronicznie (10 na stronie, offset 0)
            $response = $ksef.QueryInvoiceSync($request, 10, 0)
            Write-Host 'Surowe odpowiedz: ' $response.GetRawResponse()
            Write-Host 'Ilosc faktur: ' $response.InvoiceHeaderList().Count()

            for ($i = 0; $i -lt $response.InvoiceHeaderList().Count(); $i++) {
                # Wypisz numery znalezionych faktur
                Write-Host $response.InvoiceHeaderList().Item($i).InvoiceReferenceNumber()
            }
        }
    }
    else {
        Write-Host -f Yellow 'Anulowano wybor certyfikatu'
    }
}
catch {
    Write-Host -f Red "Blad: $_"
}

if ((Get-Variable -Name ksef -ErrorAction SilentlyContinue) -And ($ksef -ne $null)) {
    if ($ksef.SessionActive) {

        # Konczenie sesji KSeF
        $ksef.SessionTerminate(0)        

    }
    $ksef = $null
}

$xades = $null
$cert = $null
$certSigner = $null
$backend = $null
