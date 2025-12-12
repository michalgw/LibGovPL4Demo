// LibGovPL COM


// Rodzaje sterownikow

#define LGC_CT_HTTPCLIENT      0
#define LGC_CT_CERTSIGNER      1
#define LGC_CT_RANDGENERATOR   2
#define LGC_CT_BASE64ENCODER   3
#define LGC_CT_MD5HASH         4
#define LGC_CT_SHA1HASH        5
#define LGC_CT_SHA256HASH      6
#define LGC_CT_AES256ENCRYPT   7
#define LGC_CT_RSAENCRYPT      8
#define LGC_CT_ZIPPER          9
#define LGC_CT_XMLREADER       10
#define LGC_CT_XMLC14N         11
#define LGC_CT_EDEKGATE        12


// Rodzaj uzytkownika PKCS#11

#define LGC_P11UT_SO                0
#define LGC_P11UT_USER              1
#define LGC_P11UT_CONTEXTSPECIFIC   2


// Status sesji PKCS#11

#define LGC_P11SS_ROPUBLICSESSION   0
#define LGC_P11SS_ROUSERFUNCTIONS   1
#define LGC_P11SS_RWPUBLICSESSION   2
#define LGC_P11SS_RWUSERFUNCTIONS   3
#define LGC_P11SS_RWSOFUNCTIONS     4


// Rodzaj bramki e-deklaracji i JPK

#define LGC_EGT_PRODUCTION   0
#define LGC_EGT_TEST         1


// Rodzaj podpisu (certyfikat/dane autoryzujace)

#define LGC_EST_CERTIFICATE   0
#define LGC_EST_AUTHDATA      1


// Rodzaj skrotu SHA dla podpisu

#define LGC_SHT_SHA1     0
#define LGC_SHT_SHA256   1


// Format nr seryjnego w podpisie XAdES

#define LGC_XSF_DECIMAL   0
#define LGC_XSF_HEX       1


// Rodzaj serwera KSeF (produkcyjny/demo/testowy)

#define LGC_KTG_PROD   0
#define LGC_KTG_DEMO   1
#define LGC_KTG_TEST   2


// Rodzaj autoryzacji certyfikatu (nr seryjny/odcisk palca)

#define LGC_CAT_SERIALNUMBER   0
#define LGC_CAT_FINGERPRINT    1


// Wariant numeru ident. KSeF

#define LGC_KNV_Default   0
#define LGC_KNV_35        1
#define LGC_KNV_36        2


// Typ wlasciwosci obiektu

#define LGC_PT_UNKNOWN      0
#define LGC_PT_STRING       1
#define LGC_PT_INT32        2
#define LGC_PT_INT64        3
#define LGC_PT_DOUBLE       4
#define LGC_PT_CURRENCY     5
#define LGC_PT_BOOLEAN      6
#define LGC_PT_DATETIME     7
#define LGC_PT_OBJECT       8
#define LGC_PT_OBJECTLIST   9


// Tryb otwarcia pliku

#define LGC_FM_OPENREAD         0x0000
#define LGC_FM_OPENWRITE        0x0001
#define LGC_FM_OPENREADWRITE    0x0002
#define LGC_FM_SHARECOMPAT      0x0000
#define LGC_FM_SHAREEXCLUSIVE   0x0010
#define LGC_FM_SHAREDENYWRITE   0x0020
#define LGC_FM_SHAREDENYREAD    0x0030
#define LGC_FM_SHAREDENYNONE    0x0040

