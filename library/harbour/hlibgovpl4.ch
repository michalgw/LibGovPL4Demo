// Rodzaje klas sterownikow
#define LGP_CLSTYPE_HTTP_CLIENT      0
#define LGP_CLSTYPE_CERT_SIGNER      1
#define LGP_CLSTYPE_RAND_GENERATOR   2
#define LGP_CLSTYPE_BASE64_ENCODER   3
#define LGP_CLSTYPE_MD5_HASH         4
#define LGP_CLSTYPE_SHA1_HASH        5
#define LGP_CLSTYPE_SHA256_HASH      6
#define LGP_CLSTYPE_AES256_ENC       7
#define LGP_CLSTYPE_RSA_ENC          8
#define LGP_CLSTYPE_ZIPPRE           9
#define LGP_CLSTYPE_XML_READER       10
#define LGP_CLSTYPE_XML_C14N         11
#define LGP_CLSTYPE_EDEK_GATE        12

#define LGP_CLSTYPE_MAX   LGP_CLSTYPE_EDEK_GATE

#define LGP_XADES_SHA1     1
#define LGP_XADES_SHA256   2

// Stream
#define LGP_SEEKORIGIN_BEGINNING   0
#define LGP_SEEKORIGIN_CURRENT     1
#define LGP_SEEKORIGIN_END         2

#define LGP_FM_CREATE            0xff00
#define LGP_FM_OPEN_READ         0x0000
#define LGP_FM_OPEN_WRITE        0x0001
#define LGP_FM_OPEN_READ_WRITE   0x0002

#define LGP_FM_SHARE_COMPAT      0x0000
#define LGP_FM_SHARE_EXCLUSIVE   0x0010
#define LGP_FM_SHARE_DENY_WRITE  0x0020
#define LGP_FM_SHARE_DENY_READ   0x0030
#define LGP_FM_SHARE_DENY_NONE   0x0040

// XAdES
#define LGP_XADES_SiGNTYPE_SHA1     0
#define LGP_XADES_SiGNTYPE_SHA256   1
#define LGP_XADES_SERIALNOFMT_DEC   0
#define LGP_XADES_SERIALNOFMT_HEX   1

// EDek
#define LGP_EDEK_GATE_PRODUCTION    0
#define LGP_EDEK_GATE_TEST          1
#define LGP_EDEK_SIGN_CERTIFICATE   0
#define LGP_EDEK_SIGN_AUTHDATA      1

// KSeF
#define LGP_KSEF_GATETYPE_PROD   0
#define LGP_KSEF_GATETYPE_DEMO   1
#define LGP_KSEF_GATETYPE_TEST   2

#define LGP_KSEF_CERTAUTHTYPE_SERIALNUMBER   0
#define LGP_KSEF_CERTAUTHTYPE_FINGERPRINT    1

#define LGP_KSEF_FORM_CODE_CUSTOM   0
#define LGP_KSEF_FORM_CODE_FA1      1
#define LGP_KSEF_FORM_CODE_FA2      2

#define LGP_KSEF_SUBJECTTYPE_SUBJECT1            0
#define LGP_KSEF_SUBJECTTYPE_SUBJECT2            1
#define LGP_KSEF_SUBJECTTYPE_SUBJECT3            2
#define LGP_KSEF_SUBJECTTYPE_SUBJECTAUTHORIZED   3

#define LGP_KSEF_KRT_OWNER                       0
#define LGP_KSEF_KRT_INTROSPECTION               1
#define LGP_KSEF_KRT_INVOICE_READ                2
#define LGP_KSEF_KRT_INVOICE_WRITE               3
#define LGP_KSEF_KRT_PAYMENT_CONFIRMATION_WRITE  4
#define LGP_KSEF_KRT_CREDENTIALS_READ            5
#define LGP_KSEF_KRT_CREDENTIALS_MANAGE          6
#define LGP_KSEF_KRT_SELF_INVOICING              7
#define LGP_KSEF_KRT_TAX_REPRESENTATIVE          8
#define LGP_KSEF_KRT_ENFORCEMENT_OPERATIONS      9
#define LGP_KSEF_KRT_COURT_BAILIFF               10
#define LGP_KSEF_KRT_ENFORCEMENT_AUTHORITY       11
#define LGP_KSEF_KRT_SUBUNIT_MANAGE              12
#define LGP_KSEF_KRT_LOCAL_GOVERNMENT_UNIT       13
#define LGP_KSEF_KRT_LOCAL_GOVERNMENT_SUB_UNIT   14
#define LGP_KSEF_KRT_VAT_GROUP_UNIT              15
#define LGP_KSEF_KRT_VAT_GROUP_SUB_UNIT          16

#define LGP_KSEF_KCA_SYSTEM   0
#define LGP_KSEF_KCA_USER     1

#define LGP_KSEF_ST_SUBJECT1            0
#define LGP_KSEF_ST_SUBJECT2            1
#define LGP_KSEF_ST_SUBJECT3            2
#define LGP_KSEF_ST_SUBJECTAUTHORIZED   3

#define LGP_KSEF_IT_VAT      0
#define LGP_KSEF_IT_KOR      1
#define LGP_KSEF_IT_ZAL      2
#define LGP_KSEF_IT_ROZ      3
#define LGP_KSEF_IT_UPR      4
#define LGP_KSEF_IT_KOR_ZAL  5
#define LGP_KSEF_IT_KOR_ROZ  6

#define LGP_KSEF_KAT_NONE   0
#define LGP_KSEF_KAT_BRUTTO 1
#define LGP_KSEF_KAT_NETTO  2
#define LGP_KSEF_KAT_VAT    3

