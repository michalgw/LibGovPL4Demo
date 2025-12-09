unit uFormMainBase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  StdCtrls, CheckLst, EditBtn, Menus, Generics.Collections, LibGovPL_1_0_TLB;

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
    procedure CertUISelect(ASigner: IlgcCertificateSigner);
    procedure CertLoadFromFile(ASigner: IlgcCertificateSigner);
  public
    Backend: IlgcBackend;
    Signers: specialize TList<IlgcCertificateSigner>;
    PKCS11Signer: IlgcPKCS11CertificateSigner;
    Certificates: specialize TList<IlgcCertificate>;
    CertCombos: specialize TList<TComboBox>;

    procedure Debug(ATekst: String; ALinia: Boolean = False);
    procedure Debug(ATekst: String; ADane: array of const);
    procedure DebugCert(ACertyfikat: IlgcCertificate);
    procedure DebugErrorInfo(AError: IlgcErrorInfo);

    procedure ReloadCerificates;
    procedure ListCertificates;
  end;

var
  FormMainBase: TFormMainBase;

implementation

uses
  TypInfo, uFormCertLoad, StrUtils, Variants;

{$R *.lfm}

{ TFormMainBase }

procedure TFormMainBase.FormShow(Sender: TObject);
var
  I: Integer;
  SL: TStringList;
begin
  Backend := ColgcBackend.Create;
  PageControlMain.ActivePage := TabSheetSetup;
  CertCombos := specialize TList<TComboBox>.Create;
  SL := TStringList.Create;
  SL.Delimiter := ';';
  SL.DelimitedText := Backend.GetClassNamesStr(lgcCTCertSigner);
  for I := 0 to SL.Count - 1 do
    CheckListBoxSigners.Checked[CheckListBoxSigners.Items.Add(SL[I])] := not SameText(SL[I], 'TlgPKCS11CertificateSigner');
  SL.Free;
end;

procedure TFormMainBase.PopupMenuSignerClick(Sender: TObject);
begin
  case PopupSignerMode of
    mUISelect: CertUISelect(IlgcCertificateSigner(TMenuItem(Sender).Tag));
    mLoad: CertLoadFromFile(IlgcCertificateSigner(TMenuItem(Sender).Tag));
  end;
end;

procedure TFormMainBase.CertUISelect(ASigner: IlgcCertificateSigner);
var
  Cert: IlgcCertificate;
begin
  Debug('Wybierz certyfikat', True);
  Cert := ASigner.UISelect as IlgcCertificate;
  if Assigned(Cert) then
  begin
    DebugCert(Cert);
    //{$IFDEF WINDOWS}
    //if SameText(Cert.ObjClassName, 'TlgCNGCertificate') then
    //  TlgoCNGCertificate(Cert).ShowCertificateInfo(Self.Handle);
    //{$ENDIF}
    //Cert.Free;
  end
  else
    Debug('Anulowano');
end;

procedure TFormMainBase.CertLoadFromFile(ASigner: IlgcCertificateSigner);
var
  CertFileName, PrivKeyFileName, Password: String;
  CertFormat, KeyFormat: Integer;
  CertStream: IDispatch = nil;
  Cert: IlgcCertificate;
begin
  CertFormat := lgcETPEM;
  KeyFormat := lgcETPEM;
  CertFileName := '';
  PrivKeyFileName := '';
  Password := '';
  if TFormCertLoad.Execute(CertFileName, PrivKeyFileName, Password, CertFormat, KeyFormat) then
  begin
    CertStream := Backend.CreateFileStream(CertFileName, fmOpenRead);
    Cert := ASigner.LoadFromStream(CertStream, CertFormat, PrivKeyFileName, KeyFormat, Password) as IlgcCertificate;
    if not Assigned(Certificates) then
      Certificates := specialize TList<IlgcCertificate>.Create;
    Certificates.Add(Cert);
    ListCertificates;
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

procedure TFormMainBase.DebugCert(ACertyfikat: IlgcCertificate);
begin
  MemoLog.Append('Certyfikat (' + ACertyfikat.GetObjClassName + ')');
  MemoLog.Append('  Nr seryjny: ' + ACertyfikat.SerialNoDec + ' (' + ACertyfikat.SerialNoHex + ')');
  MemoLog.Append('  Nazwa: ' + ACertyfikat.DisplayName);
  MemoLog.Append('  Ważny od ' + DateTimeToStr(ACertyfikat.ValidFrom) + ' do ' + DateTimeToStr(ACertyfikat.ValidTo));
  MemoLog.Append('  Podmiot: ' + ACertyfikat.Subject);
  MemoLog.Append('  Wydawca: ' + ACertyfikat.Issuer);
  MemoLog.Append('  Rodzaj podpisu: ' + ACertyfikat.Signature);
  MemoLog.Append('  Użycie: ' + IntToBin(ACertyfikat.KeyUsage, 9));
  MemoLog.Append('  Algorytm klucza publicznego: ' + ACertyfikat.PublicKeyAlgorithm);
end;

procedure TFormMainBase.DebugErrorInfo(AError: IlgcErrorInfo);
var
  I: Integer;
begin
  if Assigned(AError) then
  begin
    Debug('ErrorInfo:');
    Debug('   Exception class: ' + AError.ExceptionClass);
    Debug('   Message: ' + AError.Message);
    Debug('   Handler class: ' + AError.HandlerClass);
    if VarIsArray(AError.ExtraInfo) then
    begin
      Debug('   ExtraInfo:');
      for I := VarArrayLowBound(AError.ExtraInfo, 1) to VarArrayHighBound(AError.ExtraInfo, 1) do
        Debug(Format('   %d - %s', [I, VarToStr(AError.ExtraInfo[I])]));
    end
    else
      Debug('   (brak dodakowych informacji)');
  end
  else
    Debug('ErrorInfo is empty');
end;

procedure TFormMainBase.ReloadCerificates;
var
  Signer: IlgcCertificateSigner;
  Certs: IlgcList;
  Cert: IlgcCertificate;
  I: Integer;
begin
  if Assigned(Certificates) then
    Certificates.Clear
  else
    Certificates := specialize TList<IlgcCertificate>.Create;
  for Signer in Signers do
  begin
    Certs := Signer.List as IlgcList;
    for I := 0 to Certs.Count - 1 do
      if Supports(Certs.Item[I], IlgcCertificate, Cert) then
        Certificates.Add(Cert);
  end;
  ListCertificates;
end;

procedure TFormMainBase.ListCertificates;
var
  Combo: TComboBox;
  Cert: IlgcCertificate;
  LI: TListItem;
  S: String;
  I: Integer = 0;
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
      LI.SubItems.Add(GetObjClassName);
      LI.SubItems.Add(DisplayName);
      LI.SubItems.Add(DateToStr(ValidFrom));
      LI.SubItems.Add(DateToStr(ValidTo));
      LI.SubItems.Add(SerialNoDec);
      LI.SubItems.Add(Issuer);
      LI.SubItems.Add(Subject);
      LI.SubItems.Add(IntToBin(KeyUsage, 9));

      S := DisplayName + ' (' + DateToStr(ValidFrom) + ' - ' + DateToStr(ValidTo) + ') [' + GetObjClassName + ']';
      for Combo in CertCombos do
        Combo.Items.AddObject(S, TObject(Pointer(Cert)));
      if SameText(Cert.GetObjClassName, 'TlgoPKCS11Certificate') then
        ComboBoxPKCS11Cert.Items.AddObject(S, TObject(Pointer(Cert)));

      DebugCert(Cert);
      Inc(I);
    end;
end;

procedure TFormMainBase.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
  IloscObiektowCOM, IloscObiektowKSeF: Integer;
begin
  if Assigned(Signers) then
    Signers.Free;
  if Assigned(Certificates) then
    Certificates.Free;
  CertCombos.Free;
  // Czy pozostaly jakies obiekty (poza Backend)?
  IloscObiektowCOM := Backend.GetDebugInfo(1);
  IloscObiektowKSeF := Backend.GetDebugInfo(2);
  if (IloscObiektowCOM > 1) or (IloscObiektowKSeF > 0) then
    MessageDlg(Format('Ilosc obiektow COM: %d' + LineEnding
      + 'Ilosc obiektow KSeF: %d', [IloscObiektowCOM, IloscObiektowKSeF]),
      mtWarning, [mbOK], 0);
end;

procedure TFormMainBase.ButtonSetupClick(Sender: TObject);
var
  I: Integer;
  Signer: IlgcCertificateSigner;
  MI: TMenuItem;
begin
  //lgplInit;
  //lgplSetDebugLevel(1);
  Debug('Wersja biblioteki: ' + Backend.GetLibVersion);
  if not Assigned(Signers) then
    Signers := specialize TList<IlgcCertificateSigner>.Create;
  for I := 0 to CheckListBoxSigners.Count - 1 do
    if CheckListBoxSigners.Checked[I] then
    begin
      Signer := Backend.CreateCertificateSigner(CheckListBoxSigners.Items[I]) as IlgcCertificateSigner;
      if SameText(Signer.GetObjClassName, 'TlgPKCS11CertificateSigner') then
      try
        (Signer as IlgcPKCS11CertificateSigner).LoadLibrary(FileNameEditLibPKCS11.FileName);
        TabSheetPKCS11.TabVisible := True;
        PKCS11Signer := Signer as IlgcPKCS11CertificateSigner;
      except
        on E: Exception do
        begin
          MessageDlg('Błąd podczas ładowania biblioteki PKCS11: ' + LineEnding + E.Message,
            mtError, [mbOK], 0);
          Signer := nil;
        end;
      end;
      if Signer <> nil then
      begin
        Signers.Add(Signer);
        Debug('Załadowano klasę podpisu: ' + Signer.GetObjClassName);
        MI := TMenuItem.Create(PopupMenuSigners);
        MI.Caption := Signer.GetObjClassName;
        MI.OnClick := @PopupMenuSignerClick;
        MI.Tag := PtrInt(Pointer(Signer));
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
    with PKCS11Signer.GetInfo as IlgcPKCS11Info do
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
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('Błąd podczas pobierania informacji o bibliotece PKCS11: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TFormMainBase.ButtonPKCS11SesCloseClick(Sender: TObject);
var
  PCert: IlgcPKCS11Certificate;
begin
  if ComboBoxPKCS11Cert.ItemIndex < 0 then
  begin
    MessageDlg('Wybierz certyfikat', mtInformation, [mbOK], 0);
    Exit;
  end;
  PCert := IlgcPKCS11Certificate(Pointer(ComboBoxPKCS11Cert.Items.Objects[ComboBoxPKCS11Cert.ItemIndex]));
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
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('Błąd podczas próby zamknięcia sesji: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TFormMainBase.ButtonPKCS11SesInfoClick(Sender: TObject);
var
  PCert: IlgcPKCS11Certificate;
  S: String;
begin
  if ComboBoxPKCS11Cert.ItemIndex < 0 then
  begin
    MessageDlg('Wybierz certyfikat', mtInformation, [mbOK], 0);
    Exit;
  end;
  PCert := IlgcPKCS11Certificate(Pointer(ComboBoxPKCS11Cert.Items.Objects[ComboBoxPKCS11Cert.ItemIndex]));
  Debug('PKCS11: Info o sesji ' + PCert.DisplayName, True);
  if PCert.Session = nil then
  begin
    Debug('Sesja nie została rozpoczęta');
    MessageDlg('Sesja nie została rozpoczęta', mtInformation, [mbOK], 0);
    Exit;
  end;
  try
    with PCert.Session as IlgcPKCS11Session do
    begin
      Debug('State: ' + IntToBin(State, 32));
      Debug('Flags: ' + IntToBin(Flags, 32));
    end;
  except
    on E: Exception do
    begin
      Debug('Błąd podczas próby pobrania informacji o sesji: ' + E.Message);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('Błąd podczas próby pobrania informacji o sesji: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TFormMainBase.ButtonPKCS11SesLoginClick(Sender: TObject);
var
  PCert: IlgcPKCS11Certificate;
begin
  if ComboBoxPKCS11Cert.ItemIndex < 0 then
  begin
    MessageDlg('Wybierz certyfikat', mtInformation, [mbOK], 0);
    Exit;
  end;
  PCert := IlgcPKCS11Certificate(Pointer(ComboBoxPKCS11Cert.Items.Objects[ComboBoxPKCS11Cert.ItemIndex]));
  Debug('PKCS11: Zaloguj ' + PCert.DisplayName, True);
  try
    if PCert.Session = nil then
    begin
      Debug('Sesja nie została rozpoczęta');
      MessageDlg('Sesja nie została rozpoczęta', mtInformation, [mbOK], 0);
      Exit;
    end;
    (PCert.Session as IlgcPKCS11Session).Login(EditPKCS11PIN.Text, ComboBoxPKCS11UserType.ItemIndex);
    Debug('Zalogowano');
  except
    on E: Exception do
    begin
      Debug('Błąd podczas próby zalogowania: ' + E.Message);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('Błąd podczas próby zalogowania: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TFormMainBase.ButtonPKCS11SesLogoutClick(Sender: TObject);
var
  PCert: IlgcPKCS11Certificate;
begin
  if ComboBoxPKCS11Cert.ItemIndex < 0 then
  begin
    MessageDlg('Wybierz certyfikat', mtInformation, [mbOK], 0);
    Exit;
  end;
  PCert := IlgcPKCS11Certificate(Pointer(ComboBoxPKCS11Cert.Items.Objects[ComboBoxPKCS11Cert.ItemIndex]));
  Debug('PKCS11: Wyloguj ' + PCert.DisplayName, True);
  try
    if PCert.Session = nil then
    begin
      Debug('Sesja nie została rozpoczęta');
      MessageDlg('Sesja nie została rozpoczęta', mtInformation, [mbOK], 0);
      Exit;
    end;
    (PCert.Session as IlgcPKCS11Session).Logout;
    Debug('Wylogowano');
  except
    on E: Exception do
    begin
      Debug('Błąd podczas próby wylogowania: ' + E.Message);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('Błąd podczas próby wylogowania: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TFormMainBase.ButtonPKCS11SesStartClick(Sender: TObject);
var
  PCert: IlgcPKCS11Certificate;
begin
  if ComboBoxPKCS11Cert.ItemIndex < 0 then
  begin
    MessageDlg('Wybierz certyfikat', mtInformation, [mbOK], 0);
    Exit;
  end;
  PCert := IlgcPKCS11Certificate(Pointer(ComboBoxPKCS11Cert.Items.Objects[ComboBoxPKCS11Cert.ItemIndex]));
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
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('Błąd podczas próby rozpoczęcia sesji: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TFormMainBase.ButtonPKCS11SlotsClick(Sender: TObject);
var
  Slots: IlgcList;
  Info: IlgcPKCS11SlotInfo;
  I: Integer;
begin
  Debug('Lista slotów PKCS11', True);
  try
    Slots := PKCS11Signer.GetSlots(False) as IlgcList;
    Debug('Lista slotĂłw: ' + IntToStr(Slots.Count));
    for I := 0 to Slots.Count - 1 do
    begin
      if not Supports(Slots.Item[I], IlgcPKCS11SlotInfo, Info) then
        Continue;
      Debug('Slot ' + IntToStr(I));
      Debug('  SlotDescription: ' + Info.SlotDescription);
      Debug('  ManufacturerID: ' + Info.ManufacturerID);
      Debug('  Flags: ' + IntToHex(Info.Flags));
      Debug('  HardwareVersion: ' + Info.HardwareVersionStr);
      Debug('  FirmwareVersion: ' + Info.FirmwareVersionStr);
      Debug('  TokenPresent: ' + BoolToStr(Info.TokenPresent));
      if Info.TokenInfo <> nil then
        with Info.TokenInfo as IlgcPKCS11TokenInfo do
        begin
          Debug('  TokenInfo:');
          Debug('    TokenLabel:' + TokenLabel);
          Debug('    ManufacturerID:' + ManufacturerID);
          Debug('    Model:' + Model);
          Debug('    SerialNumber:' + SerialNumber);
          Debug('    Flags:' + IntToHex(Flags));
          Debug('    MaxSessionCount:' + IntToStr(MaxSessionCount));
          Debug('    SessionCount:' + IntToStr(SessionCount));
          Debug('    MaxRwSessionCount:' + IntToStr(MaxRwSessionCount));
          Debug('    RwSessionCount:' + IntToStr(RwSessionCount));
          Debug('    MaxPinLen:' + IntToStr(MaxPinLen));
          Debug('    MinPinLen:' + IntToStr(MinPinLen));
          Debug('    TotalPublicMemory:' + IntToStr(TotalPublicMemory));
          Debug('    FreePublicMemory:' + IntToStr(FreePublicMemory));
          Debug('    TotalPrivateMemory:' + IntToStr(TotalPrivateMemory));
          Debug('    FreePrivateMemory:' + IntToStr(FreePrivateMemory));
          Debug('    HardwareVersion:' + HardwareVersionStr);
          Debug('    FirmwareVersion:' + FirmwareVersionStr);
          Debug('    UtcTime:' + UtcTime);
        end;
    end;
  except
    on E: Exception do
    begin
      Debug('Błąd podczas próby pobrania listy slotów: ' + E.Message);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
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
    //if (Certificates[ListViewCert.ItemIndex] is TlgCNGCertificate) then
    //  TlgCNGCertificate(Certificates[ListViewCert.ItemIndex]).ShowCertificateInfo(Self.Handle)
    //else if (Certificates[ListViewCert.ItemIndex] is TlgPKCS11Certificate) then
    //  TlgPKCS11Certificate(Certificates[ListViewCert.ItemIndex]).ShowCertificateInfo(Self.Handle)
  end;
  {$ENDIF}
end;

end.

