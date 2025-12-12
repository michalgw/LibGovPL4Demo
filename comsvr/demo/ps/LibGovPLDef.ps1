# LibGovPL - definicje

# Rodzaje klas sterownikow
enum lgcClassType {
  lgcCTHTTPClient = 0
  lgcCTCertSigner = 1
  lgcCTRandGenerator = 2
  lgcCTBase64Encoder = 3
  lgcCTMD5Hash = 4
  lgcCTSHA1Hash = 5
  lgcCTSHA256Hash = 6
  lgcCTAES256Encrypt = 7
  lgcCTRSAEncrypt = 8
  lgcCTZipper = 9
  lgcCTXMLReader = 10
  lgcCTXMLC14N = 11
  lgcCTEdekGate = 12
}

# Rodzaj uzytkownika PKCS#11
enum lgcPKCS11UserType {
  lgcP11UTSO = 0
  lgcP11UTUser = 1
  lgcP11UTContextSpecific = 2
}

# Status sesji PKCS#11
enum lgcPKCS11SessionState {
  lgcP11SSROPublicSession = 0
  lgcP11SSROUserFunctions = 1
  lgcP11SSRWPublicSession = 2
  lgcP11SSRWUserFunctions = 3
  lgcP11SSRWSOFunctions = 4
}

# Rodzaj bramki (produkcyjna/demo)
enum lgcEDekGateType {
  lgcEGTProduction = 0
  lgcEGTTest = 1
}

# Rodzaj autoryzacji e-deklaracji (podpis kwalifikowany/dane autoryzujące)
enum lgcEDekSignType {
  lgcESTCertificate = 0
  lgcESTAuthData = 1
}

# Wariant funkcji mieszającej SHA (SHA1/SHA256)
enum lgcSignHashType {
  lgcSHTSHA1 = 0
  lgcSHTSHA256 = 1
}

# Wariant numeru seryjnego certyfikatu w podpisie XAdES (dziesiętnie/szesnastkowo)
enum lgcXAdESSerialNoFormat {
  lgcXSFDecimal = 0
  lgcXSFHex = 1
}

# Rodzaj bramki KSeF (produkcyjna/demo/testowa
enum  lgcKSeFGateType {
  lgcKTGProd = 0
  lgcKTGDemo = 1
  lgcKTGTest = 2
}

# Rodzaj autoryzacji certyfikatu (nr seryjny/odcisk palca)
enum  lgcKSeFCertificateAuthType {
  lgcCATSerialNumber = 0
  lgcCATFingerprint = 1
}

# Wariant numeru referencyjnego KSeF (nieokreslony/35 znakow/36 znakow)
enum lgcKSeFNumberVariant {
  lgcKNVDefault = 0
  lgcKNV35 = 1
  lgcKNV36 = 2
}

# Rodzaj wlasciwosci obiektu
enum lgcPropertyType {
  lgcPTUnknown = 0
  lgcPTString = 1
  lgcPTInt32 = 2
  lgcPTInt64 = 3
  lgcPTDouble = 4
  lgcPTCurrency = 5
  lgcPTBoolean = 6
  lgcPTDateTime = 7
  lgcPTObject = 8
  lgcPTObjectList = 9
}

# Tryb otwarcia pliku
enum lgcFileMode {
  lgcFMOpenRead       = 0x0000
  lgcFMOpenWrite      = 0x0001
  lgcFMOpenReadWrite  = 0x0002

  lgcFMShareCompat    = 0x0000
  lgcFMShareExclusive = 0x0010
  lgcFMShareDenyWrite = 0x0020
  lgcFMShareDenyRead  = 0x0030
  lgcFMShareDenyNone  = 0x0040
  
  lgcFMCreate         = 0xff00
}
