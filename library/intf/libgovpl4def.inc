{$ifdef fpc}
{$mode Delphi}
{$endif}

// W Delphi 7 nie mozna uzywac slowa kluczowego jako identyfikator
{$ifdef VER150}
{$define LGP_ESCPASKEYWORDS}
{$endif}

// Czy jest obsluga rozszerzonych/zaawansowanych rekordów
{$IFNDEF FPC}
  {$IF CompilerVersion >= 18.0}
    {$DEFINE LGP_HAVE_EXTRECORDS}
  {$IFEND}
  {$IF CompilerVersion >= 17.0}
    {$DEFINE LGP_HAVE_CLASS_FIELDS}
  {$IFEND}
{$ELSE}
  {$DEFINE LGP_HAVE_EXTRECORDS}
  {$DEFINE LGP_HAVE_CLASS_FIELDS}
{$ENDIF}

// Wersja dynamicznie ladowana.
// Przed uzyciem biblioteki nalezy wywolac LoadLibGovPl.
{.$DEFINE LIBGOVPL_DYNAMIC}

// Obsluga PKCS#11
{$IFNDEF FPC}
  {$DEFINE LGP_ENABLE_PKCS11}
{$ENDIF}

