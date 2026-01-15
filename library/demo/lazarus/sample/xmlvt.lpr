program xmlvt;

{
  LibGovPL 4.
  XML - Weryfikacja i transformacja.
}

uses
  Classes, SysUtils, LibGovPl4Intf, LibGovPl4XML;

var
  // Nazwy plikow
  InputFileName, OutputFileName: String;
  // Dokument XML
  InputDoc: TlgoXMLReader = nil;
  // Walidator XML w oparciu o schemat XSD
  XMLValidator: TlgoXMLValidator = nil;
  // Lista bledow walidacji
  ValidationErrors: TlgoXMLValidationErrors = nil;
  // Transformacja XSLT
  XSLTransformation: TlgoXMLXSLTransformation = nil;
  // Plik wyjsciowy HTML
  OutputStream: TFileStream = nil;
  I: Integer;

begin
  lgplInit;
  WriteLn('LibGovPL 4, wersja: ', lgplVersion);

  // Pierwszy parametr - plik wejsciowy
  if ParamCount >= 1 then
    InputFileName := ParamStr(1)
  else
  begin
    WriteLn('Podaj plik XML jako parametr');
    Halt(1);
  end;
  // Drugi parametr - plik wyjciowy html, jesli nie podano uzyj nazwy pliku wej.
  if ParamCount >= 2 then
    OutputFileName := ParamStr(2)
  else
    OutputFileName := InputFileName + '.html';

  try
    WriteLn('Otwieram plik wejsciowy: ', InputFileName);
    // Wczytujemy dokument XML (pierwszy parametr to nazwa klasy sterownika,
    // puste - domyslny sterownik)
    InputDoc := TlgoXMLReader.CreateFromFile('', InputFileName);
    // Tworzymy obiekt walidatora XSD (domyslny sterownik)
    XMLValidator := TlgoXMLValidator.Create('');

    // Weryfikujemy dokument, potrzebne schematy zostana wczytane z serwerow crd.gov.pl
    // (oczywiscie tylko te dokumenty, ktore posiadaja odpowiedni schemat i szablon
    // w repozytorium crd.gov.pl)
    if XMLValidator.Validate(InputDoc, ValidationErrors) then
    begin
      WriteLn('Dokument jest zgodny ze schema.');

      // Dokument jest zgodny ze schematem, dokonaj transformacji do html
      WriteLn('Transformacja do pliku: ', OutputFileName);

      // Tworzymy plik wyjsciowy
      OutputStream := TFileStream.Create(OutputFileName, fmCreate);
      // Tworzymy obiekt transformacji (domyslny sterownik)
      XSLTransformation := TlgoXMLXSLTransformation.Create('');
      // Dokonaj transformacji dokumentu xml do wskazanego strumienia
      XSLTransformation.Transform(InputDoc, OutputStream);

      WriteLn('Zrobiono.');
    end
    else
    begin
      // Weryfikacja nie powiodla sie, dokument nie jest zgodny za schematem
      WriteLn('Dokument NIE jest poprawny.');
      WriteLn('Bledy:');
      // Wypisz liste bledow
      for I := 0 to ValidationErrors.Count - 1 do
      begin
        WriteLn('Komunikat: ', ValidationErrors.Items[I].Message);
        WriteLn('Element: ', ValidationErrors.Items[I].Path);
        WriteLn('-----------------');
      end;
      ErrorCode := 1;
    end;
  finally
    if Assigned(OutputStream) then
      OutputStream.Free;
    if Assigned(InputDoc) then
      InputDoc.Free;
    if Assigned(XMLValidator) then
      XMLValidator.Free;
    if Assigned(XSLTransformation) then
      XSLTransformation.Free;
    if Assigned(ValidationErrors) then
      ValidationErrors.Free;
  end;
end.

