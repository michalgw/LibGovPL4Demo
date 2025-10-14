unit uFormMainBase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  StdCtrls, CheckLst, EditBtn, Menus, lgBackend, lgPKCS11, Generics.Collections;

type

  { TFormMainBase }

  TFormMainBase = class(TForm)
    ButtonCertLoadFromFile: TButton;
    ButtonCertReload: TButton;
    ButtonCertWybierz: TButton;
    ButtonPKCS11Info: TButton;
    ButtonPKCS11SesClose: TButton;
    ButtonPKCS11SesInfo: TButton;
    ButtonPKCS11SesLogin: TButton;
    ButtonPKCS11SesLogout: TButton;
    ButtonPKCS11SesStart: TButton;
    ButtonPKCS11Slots: TButton;
    ButtonSetup: TButton;
    ButtonShowCert: TButton;
    CheckListBoxSigners: TCheckListBox;
    ComboBoxPKCS11Cert: TComboBox;
    ComboBoxPKCS11UserType: TComboBox;
    EditPKCS11PIN: TEdit;
    FileNameEditLibPKCS11: TFileNameEdit;
    GroupBoxSetupCertSign: TGroupBox;
    GroupBox23: TGroupBox;
    GroupBox24: TGroupBox;
    Label1: TLabel;
    Label124: TLabel;
    Label125: TLabel;
    Label126: TLabel;
    ListViewCert: TListView;
    MemoLog: TMemo;
    PageControlMain: TPageControl;
    Panel3: TPanel;
    PanelSetup: TPanel;
    PanelBottom: TPanel;
    PopupMenuSigners: TPopupMenu;
    ScrollBox1: TScrollBox;
    SplitterBottom: TSplitter;
    TabSheetPKCS11: TTabSheet;
    TabSheetCert: TTabSheet;
    TabSheetSetup: TTabSheet;
    procedure ButtonCertLoadFromFileClick(Sender: TObject);
    procedure ButtonCertReloadClick(Sender: TObject);
    procedure ButtonCertWybierzClick(Sender: TObject);
    procedure ButtonPKCS11InfoClick(Sender: TObject);
    procedure ButtonPKCS11SesCloseClick(Sender: TObject);
    procedure ButtonPKCS11SesInfoClick(Sender: TObject);
    procedure ButtonPKCS11SesLoginClick(Sender: TObject);
    procedure ButtonPKCS11SesLogoutClick(Sender: TObject);
    procedure ButtonPKCS11SesStartClick(Sender: TObject);
    procedure ButtonPKCS11SlotsClick(Sender: TObject);
    procedure ButtonSetupClick(Sender: TObject); virtual;
    procedure ButtonShowCertClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction); virtual;
    procedure FormShow(Sender: TObject); virtual;
  private
    PopupSignerMode: (mUISelect, mLoad);
    procedure PopupMenuSignerClick(Sender: TObject);
    procedure CertUISelect(ASigner: TlgCertificateSigner);
    procedure CertLoadFromFile(ASigner: TlgCertificateSigner);
  public
    Signers: specialize TObjectList<TlgCertificateSigner>;
    PKCS11Signer: TlgPKCS11CertificateSigner;
    Certificates: TlgCertificates;
    CertCombos: specialize TList<TComboBox>;

    procedure Debug(ATekst: String; ALinia: Boolean = False);
    procedure Debug(ATekst: String; ADane: array of const);
    procedure DebugCert(ACertyfikat: TlgCertificate);

    procedure ReloadCerificates;
    procedure ListCertificates;
  end;

var
  FormMainBase: TFormMainBase;

implementation

uses
  TypInfo, lgCNG, uFormCertLoad;

{$R *.lfm}

{ TFormMainBase }

procedure TFormMainBase.FormShow(Sender: TObject);
var
  C: TlgCertificateSignerClass;
begin
  PageControlMain.ActivePage := TabSheetSetup;
  CertCombos := specialize TList<TComboBox>.Create;
  for C in CertSignerClasses do
    CheckListBoxSigners.Checked[CheckListBoxSigners.Items.AddObject(C.ClassName, TObject(C))] := C <> TlgPKCS11CertificateSigner;
end;

procedure TFormMainBase.PopupMenuSignerClick(Sender: TObject);
begin
  case PopupSignerMode of
    mUISelect: CertUISelect(TlgCertificateSigner(TMenuItem(Sender).Tag));
    mLoad: CertLoadFromFile(TlgCertificateSigner(TMenuItem(Sender).Tag));
  end;
end;

procedure TFormMainBase.CertUISelect(ASigner: TlgCertificateSigner);
var
  Cert: TlgCertificate;
begin
  Debug('Wybierz certyfikat', True);
  Cert := ASigner.UISelect;
  if Assigned(Cert) then
  begin
    DebugCert(Cert);
    {$IFDEF WINDOWS}
    if Cert is TlgCNGCertificate then
      TlgCNGCertificate(Cert).ShowCertificateInfo(Self.Handle);
    {$ENDIF}
    Cert.Free;
  end
  else
    Debug('Anulowano');
end;

procedure TFormMainBase.CertLoadFromFile(ASigner: TlgCertificateSigner);
var
  CertFileName, PrivKeyFileName, Password: String;
  CertFormat, KeyFormat: TlgEncodingType;
  CertStream: TFileStream = nil;
  PrivKeyStream: TFileStream = nil;
  Cert: TlgCertificate;
begin
  CertFormat := letPEM;
  KeyFormat := letPEM;
  CertFileName := '';
  PrivKeyFileName := '';
  Password := '';
  if TFormCertLoad.Execute(CertFileName, PrivKeyFileName, Password, CertFormat, KeyFormat) then
  begin
    try
      CertStream := TFileStream.Create(CertFileName, fmOpenRead);
      if PrivKeyFileName <> '' then
        PrivKeyStream := TFileStream.Create(PrivKeyFileName, fmOpenRead);
      Cert := ASigner.LoadFromStream(CertStream, CertFormat, PrivKeyStream, KeyFormat, Password);
      if not Assigned(Certificates) then
        Certificates := TlgCertificates.Create(True);
      Certificates.Add(Cert);
      ListCertificates;
    finally
      if CertStream <> nil then
        CertStream.Free;
      if PrivKeyStream <> nil then
        PrivKeyStream.Free;
    end;
  end;
end;

procedure TFormMainBase.Debug(ATekst: String; ALinia: Boolean);
begin
  if ALinia then
    MemoLog.Append('-------------------------------');
  MemoLog.Append(ATekst);
end;

procedure TFormMainBase.Debug(ATekst: String; ADane: array of const);
begin
  MemoLog.Append(Format(ATekst, ADane));
end;

procedure TFormMainBase.DebugCert(ACertyfikat: TlgCertificate);
var
  K: TlgCertificateKeyUsage;
begin
  MemoLog.Append('Certyfikat (' + ACertyfikat.ClassName + ')');
  MemoLog.Append('  Nr seryjny: ' + ACertyfikat.SerialNoDec + ' (' + ACertyfikat.SerialNoHex + ')');
  MemoLog.Append('  Nazwa: ' + ACertyfikat.DisplayName);
  MemoLog.Append('  Ważny od ' + DateTimeToStr(ACertyfikat.ValidFrom) + ' do ' + DateTimeToStr(ACertyfikat.ValidTo));
  MemoLog.Append('  Podmiot: ' + ACertyfikat.Subject);
  MemoLog.Append('  Wydawca: ' + ACertyfikat.Issuer);
  MemoLog.Append('  Rodzaj podpisu: ' + ACertyfikat.Signature);
  K := ACertyfikat.KeyUsage;
  MemoLog.Append('  Użycie: ' + SetToString(PTypeInfo(TypeInfo(TlgCertificateKeyUsage)), @K));
  MemoLog.Append('  Algorytm klucza publicznego: ' + ACertyfikat.PublicKeyAlgorithm);
end;

procedure TFormMainBase.ReloadCerificates;
var
  Signer: TlgCertificateSigner;
  Certs: TlgCertificates;
begin
  if Assigned(Certificates) then
    Certificates.Clear
  else
    Certificates := TlgCertificates.Create(True);
  for Signer in Signers do
  begin
    Certs := Signer.List;
    Certificates.AddRange(Certs);
    Certs.OwnsObjects := False;
    Certs.Free;
  end;
  ListCertificates;
end;

procedure TFormMainBase.ListCertificates;
var
  Combo: TComboBox;
  Cert: TlgCertificate;
  LI: TListItem;
  S: String;
  I: Integer = 0;
  K: TlgCertificateKeyUsage;
begin
  ListViewCert.Clear;
  ComboBoxPKCS11Cert.Clear;
  for Combo in CertCombos do
    Combo.Clear;
  for Cert in Certificates do
    with Cert do
    begin
      LI := ListViewCert.Items.Add;
      LI.Caption := IntToStr(I);
      LI.SubItems.Add(ClassName);
      LI.SubItems.Add(DisplayName);
      LI.SubItems.Add(DateToStr(ValidFrom));
      LI.SubItems.Add(DateToStr(ValidTo));
      LI.SubItems.Add(SerialNoDec);
      LI.SubItems.Add(Issuer);
      LI.SubItems.Add(Subject);
      K := KeyUsage;
      LI.SubItems.Add(SetToString(PTypeInfo(TypeInfo(TlgCertificateKeyUsage)), @K));

      S := DisplayName + ' (' + DateToStr(ValidFrom) + ' - ' + DateToStr(ValidTo) + ') [' + ClassName + ']';
      for Combo in CertCombos do
        Combo.Items.AddObject(S, Cert);
      if Cert is TlgPKCS11Certificate then
        ComboBoxPKCS11Cert.Items.AddObject(S, Cert);

      DebugCert(Cert);
      Inc(I);
    end;
end;

procedure TFormMainBase.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if Assigned(Signers) then
    Signers.Free;
  if Assigned(Certificates) then
    Certificates.Free;
  CertCombos.Free;
end;

procedure TFormMainBase.ButtonSetupClick(Sender: TObject);
var
  I: Integer;
  Signer: TlgCertificateSigner;
  MI: TMenuItem;
begin
  if not Assigned(Signers) then
    Signers := specialize TObjectList<TlgCertificateSigner>.Create(True);
  for I := 0 to CheckListBoxSigners.Count - 1 do
    if CheckListBoxSigners.Checked[I] then
    begin
      Signer := TlgCertificateSignerClass(CheckListBoxSigners.Items.Objects[I]).Create(nil);
      if Signer is TlgPKCS11CertificateSigner then
      try
        TlgPKCS11CertificateSigner(Signer).LoadLibrary(FileNameEditLibPKCS11.FileName);
        TabSheetPKCS11.TabVisible := True;
        PKCS11Signer := TlgPKCS11CertificateSigner(Signer);
      except
        on E: Exception do
        begin
          MessageDlg('Błąd podczas ładowania biblioteki PKCS11: ' + LineEnding + E.Message,
            mtError, [mbOK], 0);
          Signer.Free;
          Signer := nil;
        end;
      end;
      if Signer <> nil then
      begin
        Signers.Add(Signer);
        Debug('Załadowano klasę podpisu: ' + Signer.ClassName);
        MI := TMenuItem.Create(PopupMenuSigners);
        MI.Caption := Signer.ClassName;
        MI.OnClick := @PopupMenuSignerClick;
        MI.Tag := PtrInt(Signer);
        PopupMenuSigners.Items.Add(MI);
      end;
    end;

  ReloadCerificates;

  TabSheetCert.TabVisible := True;
  TabSheetSetup.Enabled := False;
end;

procedure TFormMainBase.ButtonCertWybierzClick(Sender: TObject);
begin
  PopupSignerMode := mUISelect;
  PopupMenuSigners.PopupComponent := ButtonCertWybierz;
  PopupMenuSigners.PopUp;
end;

procedure TFormMainBase.ButtonPKCS11InfoClick(Sender: TObject);
begin
  Debug('Info o bibliotece PKCS11:', True);
  try
    with PKCS11Signer.GetInfo do
    begin
      Debug('Wersja Cryptokit: ' + CryptokitVersionStr);
      Debug('ID producenta: ' + ManufacturerID);
      Debug('Wersja biblioteki: ' + LibraryVersionStr);
      Debug('Opis biblioteki: ' + LibraryDescription);
    end;
  except
    on E: Exception do
    begin
      Debug('Błąd podczas pobierania informacji o bibliotece PKCS11: ' + E.Message);
      MessageDlg('Błąd podczas pobierania informacji o bibliotece PKCS11: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TFormMainBase.ButtonPKCS11SesCloseClick(Sender: TObject);
var
  PCert: TlgPKCS11Certificate;
begin
  if ComboBoxPKCS11Cert.ItemIndex < 0 then
  begin
    MessageDlg('Wybierz certyfikat', mtInformation, [mbOK], 0);
    Exit;
  end;
  PCert := TlgPKCS11Certificate(ComboBoxPKCS11Cert.Items.Objects[ComboBoxPKCS11Cert.ItemIndex]);
  Debug('PKCS11: Zakończ sesję ' + PCert.DisplayName, True);
  try
    if PCert.Session = nil then
    begin
      Debug('Sesja nie została rozpoczęta');
      MessageDlg('Sesja nie została rozpoczęta', mtInformation, [mbOK], 0);
      Exit;
    end;
    PKCS11Signer.SessionClose(PCert.Session);
    Debug('Sesja zakończona');
  except
    on E: Exception do
    begin
      Debug('Błąd podczas próby zamknięcia sesji: ' + E.Message);
      MessageDlg('Błąd podczas próby zamknięcia sesji: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TFormMainBase.ButtonPKCS11SesInfoClick(Sender: TObject);
var
  PCert: TlgPKCS11Certificate;
  S: String;
  F: TlgPKCS11SessionFlags;
begin
  if ComboBoxPKCS11Cert.ItemIndex < 0 then
  begin
    MessageDlg('Wybierz certyfikat', mtInformation, [mbOK], 0);
    Exit;
  end;
  PCert := TlgPKCS11Certificate(ComboBoxPKCS11Cert.Items.Objects[ComboBoxPKCS11Cert.ItemIndex]);
  Debug('PKCS11: Info o sesji ' + PCert.DisplayName, True);
  if PCert.Session = nil then
  begin
    Debug('Sesja nie została rozpoczęta');
    MessageDlg('Sesja nie została rozpoczęta', mtInformation, [mbOK], 0);
    Exit;
  end;
  try
    with PCert.Session do
    begin
      WriteStr(S, State);
      Debug('State: ' + S);
      F := Flags;
      Debug('Flags: ' + SetToString(PTypeInfo(TypeInfo(TlgPKCS11SessionFlags)), @F));
    end;
  except
    on E: Exception do
    begin
      Debug('Błąd podczas próby pobrania informacji o sesji: ' + E.Message);
      MessageDlg('Błąd podczas próby pobrania informacji o sesji: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TFormMainBase.ButtonPKCS11SesLoginClick(Sender: TObject);
var
  PCert: TlgPKCS11Certificate;
begin
  if ComboBoxPKCS11Cert.ItemIndex < 0 then
  begin
    MessageDlg('Wybierz certyfikat', mtInformation, [mbOK], 0);
    Exit;
  end;
  PCert := TlgPKCS11Certificate(ComboBoxPKCS11Cert.Items.Objects[ComboBoxPKCS11Cert.ItemIndex]);
  Debug('PKCS11: Zaloguj ' + PCert.DisplayName, True);
  try
    if PCert.Session = nil then
    begin
      Debug('Sesja nie została rozpoczęta');
      MessageDlg('Sesja nie została rozpoczęta', mtInformation, [mbOK], 0);
      Exit;
    end;
    PCert.Session.Login(EditPKCS11PIN.Text, TlgPKCS11UserType(ComboBoxPKCS11UserType.ItemIndex));
    Debug('Zalogowano');
  except
    on E: Exception do
    begin
      Debug('Błąd podczas próby zalogowania: ' + E.Message);
      MessageDlg('Błąd podczas próby zalogowania: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TFormMainBase.ButtonPKCS11SesLogoutClick(Sender: TObject);
var
  PCert: TlgPKCS11Certificate;
begin
  if ComboBoxPKCS11Cert.ItemIndex < 0 then
  begin
    MessageDlg('Wybierz certyfikat', mtInformation, [mbOK], 0);
    Exit;
  end;
  PCert := TlgPKCS11Certificate(ComboBoxPKCS11Cert.Items.Objects[ComboBoxPKCS11Cert.ItemIndex]);
  Debug('PKCS11: Wyloguj ' + PCert.DisplayName, True);
  try
    if PCert.Session = nil then
    begin
      Debug('Sesja nie została rozpoczęta');
      MessageDlg('Sesja nie została rozpoczęta', mtInformation, [mbOK], 0);
      Exit;
    end;
    PCert.Session.Logout;
    Debug('Wylogowano');
  except
    on E: Exception do
    begin
      Debug('Błąd podczas próby wylogowania: ' + E.Message);
      MessageDlg('Błąd podczas próby wylogowania: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TFormMainBase.ButtonPKCS11SesStartClick(Sender: TObject);
var
  PCert: TlgPKCS11Certificate;
begin
  if ComboBoxPKCS11Cert.ItemIndex < 0 then
  begin
    MessageDlg('Wybierz certyfikat', mtInformation, [mbOK], 0);
    Exit;
  end;
  PCert := TlgPKCS11Certificate(ComboBoxPKCS11Cert.Items.Objects[ComboBoxPKCS11Cert.ItemIndex]);
  Debug('PKCS11: Rozpocznij sesję dla certyfikatu ' + PCert.DisplayName, True);
  try
    if Assigned(PCert.Session) then
    begin
      Debug('Sesja już została rozpoczęta');
      MessageDlg('Sesja już została rozpoczęta', mtInformation, [mbOK], 0);
      Exit;
    end;
    PKCS11Signer.SessionStart(PCert);
    Debug('Nowa sesja rozpoczęta');
  except
    on E: Exception do
    begin
      Debug('Błąd podczas próby rozpoczęcia sesji: ' + E.Message);
      MessageDlg('Błąd podczas próby rozpoczęcia sesji: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TFormMainBase.ButtonPKCS11SlotsClick(Sender: TObject);
var
  Slots: TlgPKCS11SlotInfoList;
  I: Integer;
begin
  Debug('Lista slotów PKCS11', True);
  try
    Slots := PKCS11Signer.GetSlots(False);
    Debug('Lista slotów: ' + IntToStr(Length(Slots)));
    for I := 0 to Length(Slots) - 1 do
    begin
      Debug('Slot ' + IntToStr(I));
      Debug('  SlotDescription: ' + Slots[I].SlotDescription);
      Debug('  ManufacturerID: ' + Slots[I].ManufacturerID);
      Debug('  Flags: ' + SetToString(PTypeInfo(TypeInfo(TlgPKCS11SlotFlags)), @Slots[I].Flags));
      Debug('  HardwareVersion: ' + Slots[I].HardwareVersionStr);
      Debug('  FirmwareVersion: ' + Slots[I].FirmwareVersionStr);
      Debug('  TokenPresent: ' + BoolToStr(Slots[I].TokenPresent));
      if Slots[I].TokenPresent then
      begin
        Debug('  TokenInfo:');
        Debug('    TokenLabel:' + Slots[I].TokenInfo.TokenLabel);
        Debug('    ManufacturerID:' + Slots[I].TokenInfo.ManufacturerID);
        Debug('    Model:' + Slots[I].TokenInfo.Model);
        Debug('    SerialNumber:' + Slots[I].TokenInfo.SerialNumber);
        Debug('    Flags:' + SetToString(PTypeInfo(TypeInfo(TlgPKCS11TokenFlags)), @Slots[I].TokenInfo.Flags));
        Debug('    MaxSessionCount:' + IntToStr(Slots[I].TokenInfo.MaxSessionCount));
        Debug('    SessionCount:' + IntToStr(Slots[I].TokenInfo.SessionCount));
        Debug('    MaxRwSessionCount:' + IntToStr(Slots[I].TokenInfo.MaxRwSessionCount));
        Debug('    RwSessionCount:' + IntToStr(Slots[I].TokenInfo.RwSessionCount));
        Debug('    MaxPinLen:' + IntToStr(Slots[I].TokenInfo.MaxPinLen));
        Debug('    MinPinLen:' + IntToStr(Slots[I].TokenInfo.MinPinLen));
        Debug('    TotalPublicMemory:' + IntToStr(Slots[I].TokenInfo.TotalPublicMemory));
        Debug('    FreePublicMemory:' + IntToStr(Slots[I].TokenInfo.FreePublicMemory));
        Debug('    TotalPrivateMemory:' + IntToStr(Slots[I].TokenInfo.TotalPrivateMemory));
        Debug('    FreePrivateMemory:' + IntToStr(Slots[I].TokenInfo.FreePrivateMemory));
        Debug('    HardwareVersion:' + Slots[I].TokenInfo.HardwareVersionStr);
        Debug('    FirmwareVersion:' + Slots[I].TokenInfo.FirmwareVersionStr);
        Debug('    UtcTime:' + Slots[I].TokenInfo.UtcTime);
      end;
    end;
  except
    on E: Exception do
    begin
      Debug('Błąd podczas próby pobrania listy slotów: ' + E.Message);
      MessageDlg('Błąd podczas próby pobrania listy slotów: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TFormMainBase.ButtonCertReloadClick(Sender: TObject);
begin
  ReloadCerificates;
end;

procedure TFormMainBase.ButtonCertLoadFromFileClick(Sender: TObject);
begin
  PopupSignerMode := mLoad;
  PopupMenuSigners.PopupComponent := ButtonCertWybierz;
  PopupMenuSigners.PopUp;
end;

procedure TFormMainBase.ButtonShowCertClick(Sender: TObject);
begin
  Debug('Pokaz info o certyfikacie', True);
  {$IFDEF WINDOWS}
  if (ListViewCert.ItemIndex >= 0) then
  begin
    DebugCert(Certificates[ListViewCert.ItemIndex]);
    if (Certificates[ListViewCert.ItemIndex] is TlgCNGCertificate) then
      TlgCNGCertificate(Certificates[ListViewCert.ItemIndex]).ShowCertificateInfo(Self.Handle)
    else if (Certificates[ListViewCert.ItemIndex] is TlgPKCS11Certificate) then
      TlgPKCS11Certificate(Certificates[ListViewCert.ItemIndex]).ShowCertificateInfo(Self.Handle)
  end;
  {$ENDIF}
end;

end.

