# LibGovPL - KSeF - Nawiazywanie sesji interaktywnej tokenem i pobranie faktury

. "$PSScriptRoot\LibGovPLDef.ps1"

try {
    # Tworzenie obiektu zaplecza
    $backend = New-Object -ComObject LibGovPL.lgcBackend

    # Tworzenie obiektu komunikacji KSeF
    $ksef = $backend.CreateKSeF()

    # Tworzenie obiektu klienta HTTP
    $ksef.HTTPClient = $backend.CreateHTTPClient('')

    # Tworzenie klucza RSA ze wskazanego pliku
    $ksef.RSAKeyTest = $backend.CreateRSAKey('', 'kseftest.pem')

    # Ustawiamy parametry polaczenia
    $ksef.Nip = '1111111111'
    $ksef.Token = '1111111111222222222223333333333344444444445555555555666666666677'
    $ksef.GateType = [lgcKSeFGateType]::lgcKTGTest # Rodzaj serwera KSeF: 0 - produkcja, 1 - demo, 2 - test
    $ksef.FormCode = 1 # Wersja struktury wysylanych plikow FA: 0 - FA(1), 1 - FA(2)

    # Nawiazywanie sesji interaktywnej tokenem
    $response = $ksef.SessionInitToken()

    # Napisz token sesji
    Write-Host 'Token sesji: ' $response.SessionToken().Token()
    # Napisz odpowiedz w postaci surowego JSON
    Write-Host 'Surowa odpowiedz JSON: ' $response.GetRawResponse()
    $response = $null

    # Odczekaj pare sekund po nawiazaniu sesji bo inaczej serwer odrzuci zadanie
    Write-Host 'Momencik...'
    Start-Sleep -Seconds 10

    # Pobierz fakture i zapisz do pliku
    $ksef.InvoiceGet('1111111111-20241120-333333333333-QQ', 'fa.xml')
    Write-Host 'Pobrano fakture'
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

$backend = $null
