# LibGovPL - Backend - informacje o sterownikach

. "$PSScriptRoot\LibGovPLDef.ps1"

$classTypes = @('Klient HTTP', 'Podpis certyfikatem', 'Generator liczb losowych', 
    'Koder Base64', 'Funkcja skrotu MD5', 'Funkcja skrotu SHA1', 'Funkcja skrotu SHA256',
    'Szyfrowanie AES256', 'Szyfrowanie RSA', 'Zipper', 'Czytnik XML', 'Funkcja XML C14N',
    'Bramka e-deklaracji')

$backend = New-Object -ComObject LibGovPL.lgcBackend

Write-Host 'Wersja biblioteki:' $backend.GetLibVersion()
Write-Host '-----------------'

Write-Host 'Lista sterownikow przy pomocy GetClassCount, GetClassName'
Write-Host '-----------------'

for ($i = [lgcClassType]::lgcCTHTTPClient; $i -le [lgcClassType]::lgcCTEdekGate; $i++) {
    Write-Host $i '-' $classTypes[$i] ':'
    for ($j = 0; $j -lt $backend.GetClassCount($i); $j++) {
        Write-Host '   ' $backend.GetClassName($i, $j)
    }
    Write-Host '-----------------'
}


Write-Host 'Lista sterownikow przy pomocy GetClassNames'
Write-Host '-----------------'

for ($i = [lgcClassType]::lgcCTHTTPClient; $i -le [lgcClassType]::lgcCTEdekGate; $i++) {
    Write-Host $i '-' $classTypes[$i] ':'
    $names = $backend.GetClassNames($i)
    for ($j = 0; $j -lt $names.Count; $j++) {
        Write-Host '   ' $names[$j]
    }
    Write-Host '-----------------'
}

