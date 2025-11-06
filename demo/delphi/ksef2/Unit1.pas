unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, CheckLst, lgBackend, lgCNG, lgWinHTTP,
  Menus, Contnrs, lgCompat, lgXAdES, lgKSeF2, lgKSeF2Objects, lgKSeFTypes, lgUtils,
  Spin, Grids;

type
  TForm1 = class(TForm)
    Splitter1: TSplitter;
    Panel5: TPanel;
    Splitter2: TSplitter;
    Panel6: TPanel;
    ListViewObj: TListView;
    ButtonObjShow: TButton;
    ButtonObjClea: TButton;
    ButtonObjCount: TButton;
    MemoLog: TMemo;
    PageControlMain: TPageControl;
    TabSheetSetup: TTabSheet;
    Panel2: TPanel;
    ButtonSetup: TButton;
    GroupBoxSetupCertSign: TGroupBox;
    CheckListBoxSigners: TCheckListBox;
    Label1: TLabel;
    FileNameEditLibPKCS11: TEdit;
    ButtonLibPKCS11Sel: TButton;
    GroupBoxKSeFSetup: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ComboBoxHTTPCli: TComboBox;
    ComboBoxRandGen: TComboBox;
    ComboBoxBase64: TComboBox;
    ComboBoxSHA256: TComboBox;
    ComboBoxAES256: TComboBox;
    ComboBoxRSAEnc: TComboBox;
    TabSheetCert: TTabSheet;
    Panel3: TPanel;
    ButtonShowCert: TButton;
    ButtonCertWybierz: TButton;
    ButtonCertReload: TButton;
    ListViewCert: TListView;
    TabSheetPKCS11: TTabSheet;
    GroupBox23: TGroupBox;
    ButtonPKCS11Info: TButton;
    ButtonPKCS11Slots: TButton;
    GroupBox24: TGroupBox;
    Label124: TLabel;
    Label125: TLabel;
    Label126: TLabel;
    ComboBoxPKCS11Cert: TComboBox;
    EditPKCS11PIN: TEdit;
    ButtonPKCS11SesStart: TButton;
    ButtonPKCS11SesLogin: TButton;
    ButtonPKCS11SesLogout: TButton;
    ButtonPKCS11SesClose: TButton;
    ButtonPKCS11SesInfo: TButton;
    ComboBoxPKCS11UserType: TComboBox;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    PopupMenuSigners: TPopupMenu;
    PopupMenuKeys: TPopupMenu;
    OpenDialogKey: TOpenDialog;
    ButtonCertLoadFromFile: TButton;
    TabSheetKSeF2Auth: TTabSheet;
    ScrollBox1: TScrollBox;
    GroupBoxKSeFA1: TGroupBox;
    Label60: TLabel;
    ComboBoxKSeFABramka: TComboBox;
    Label18: TLabel;
    EditKSeFAIdentifier: TEdit;
    Label19: TLabel;
    ComboBoxKSeFAIdentifierType: TComboBox;
    GroupBox21: TGroupBox;
    Label69: TLabel;
    EditKSeFAAccessToken: TEdit;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    ButtonKSeFASessionSet: TButton;
    EditKSeFARefreshToken: TEdit;
    DateTimePickerKSeFAAccessTokenValidUntil: TDateTimePicker;
    DateTimePickerKSeFARefreshTokenValidUntil: TDateTimePicker;
    GroupBoxKSeFA2: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    ComboBoxACertificate: TComboBox;
    ComboBoxKSeFASubjectType: TComboBox;
    ButtonKSeFAXAdES: TButton;
    GroupBoxKSeFA3: TGroupBox;
    GroupBox12: TGroupBox;
    Label23: TLabel;
    ComboBoxKSeFASubjectTypeExt: TComboBox;
    Label24: TLabel;
    FileNameEditKSeFAOutXades: TEdit;
    ButtonKSeFAXAdESSave: TButton;
    GroupBox13: TGroupBox;
    Label25: TLabel;
    FileNameEditKSeFAInXades: TEdit;
    ButtonKSeFAXAdESExt: TButton;
    GroupBoxKSeFA5: TGroupBox;
    ButtonKSeFAStatus: TButton;
    ButtonKSeFATokenRedem: TButton;
    ButtonKSeFATokenRefresh: TButton;
    GroupBoxKSeFA6: TGroupBox;
    ButtonKSeFASessions: TButton;
    ButtonKSeFASessionTermCur: TButton;
    Label26: TLabel;
    EditKSeFASessionRefNo: TEdit;
    ButtonKSeFASessionTerm: TButton;
    GroupBoxKSeFA4: TGroupBox;
    Label22: TLabel;
    EditKSeFATokenKsef: TEdit;
    ButtonKSeFATokenKsef: TButton;
    TabSheetKSeFInteractive: TTabSheet;
    ScrollBox4: TScrollBox;
    GroupBox9: TGroupBox;
    ButtonKSeFIClose: TButton;
    GroupBox8: TGroupBox;
    Label31: TLabel;
    FileNameEditKSeFIDoc: TEdit;
    CheckBoxKSeFIOffline: TCheckBox;
    Label32: TLabel;
    EditKSeFIHashOfCorrectedInvoice: TEdit;
    ButtonKSeFISend: TButton;
    GroupBox7: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    ComboBoxIFormCode: TComboBox;
    EditKSeFIFormCodeSystemCode: TEdit;
    EditKSeFIFormCodeSchemaVersion: TEdit;
    EditKSeFIFormCodeValue: TEdit;
    ButtonKSeFIOpen: TButton;
    ButtonFileNameEditKSeFIDoc: TButton;
    TabSheetKSeFBatch: TTabSheet;
    ScrollBox7: TScrollBox;
    GroupBoxKSeFB1: TGroupBox;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    ComboBoxBFormCode: TComboBox;
    EditKSeFBFormCodeSystemCode: TEdit;
    EditKSeFBFormCodeSchemaVersion: TEdit;
    EditKSeFBFormCodeValue: TEdit;
    ButtonKSeFBPrepare: TButton;
    FileNameEditKSeFBZIPIn: TEdit;
    Label67: TLabel;
    GroupBox20: TGroupBox;
    StringGridKSeFBEncOutFiles: TStringGrid;
    Label68: TLabel;
    SpinEditKSeFBPartSize: TSpinEdit;
    GroupBoxKSeFB2: TGroupBox;
    ButtonKSeFBOpen: TButton;
    GroupBoxKSeFB3: TGroupBox;
    ButtonKSeFBSend: TButton;
    Label70: TLabel;
    SpinEditKSeFBPartNumber: TSpinEdit;
    GroupBoxKSeFB4: TGroupBox;
    Button2: TButton;
    ButtonFileNameEditKSeFBZIPIn: TButton;
    TabSheetKSeFStatus: TTabSheet;
    ScrollBox5: TScrollBox;
    GroupBox10: TGroupBox;
    Label33: TLabel;
    ComboBoxKSeFSSessionType: TComboBox;
    SpinEditKSeFSPageSize1: TSpinEdit;
    Label34: TLabel;
    Label35: TLabel;
    EditKSeFSReferenceNumber: TEdit;
    Label36: TLabel;
    DateTimePickerKSeFSCreatedFrom: TDateTimePicker;
    DateTimePickerKSeFSCreatedTo: TDateTimePicker;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    DateTimePickerKSeFSClosedFrom: TDateTimePicker;
    DateTimePickerKSeFSClosedTo: TDateTimePicker;
    Label40: TLabel;
    Label41: TLabel;
    DateTimePickerKSeFSModifiedFrom: TDateTimePicker;
    DateTimePickerKSeFSModifiedTo: TDateTimePicker;
    CheckGroupKSeFSSesionStatuses: TCheckListBox;
    Label42: TLabel;
    EditKSeFSContinuationToken: TEdit;
    ButtonKSeFSessions: TButton;
    GroupBox11: TGroupBox;
    Label43: TLabel;
    EditKSeFSReferenceNumber2: TEdit;
    ButtonKSeFSession: TButton;
    GroupBox14: TGroupBox;
    ButtonKSeFSessionsInvoice: TButton;
    Label44: TLabel;
    EditKSeFSContinuationToken1: TEdit;
    Label45: TLabel;
    EditKSeFSReferenceNumber1: TEdit;
    Label46: TLabel;
    SpinEditKSeFS1PageSize1: TSpinEdit;
    GroupBox15: TGroupBox;
    Label47: TLabel;
    EditKSeFSReferenceNumber3: TEdit;
    ButtonKSeFSessionInvoice: TButton;
    EditKSeFSInvoiceReferenceNumber: TEdit;
    Label48: TLabel;
    GroupBox16: TGroupBox;
    ButtonKSeFSessionsInvoiceFailed: TButton;
    Label49: TLabel;
    EditKSeFSContinuationToken2: TEdit;
    Label50: TLabel;
    EditKSeFSReferenceNumber4: TEdit;
    Label51: TLabel;
    SpinEditKSeFS1PageSize2: TSpinEdit;
    Label8: TLabel;
    TabSheetKSeFUpo: TTabSheet;
    ScrollBox6: TScrollBox;
    GroupBox18: TGroupBox;
    Label55: TLabel;
    EditKSeFUReferenceNumber1: TEdit;
    Label56: TLabel;
    EditKSeFUInvoiceReferenceNumber: TEdit;
    ButtonKSeFUPobierz1: TButton;
    FileNameEditKSeFUFile1: TEdit;
    Label57: TLabel;
    GroupBox17: TGroupBox;
    Label52: TLabel;
    EditKSeFUReferenceNumber: TEdit;
    Label53: TLabel;
    EditKSeFUKSefNumber: TEdit;
    ButtonKSeFUPobierz: TButton;
    FileNameEditKSeFUFile: TEdit;
    Label54: TLabel;
    GroupBox19: TGroupBox;
    Label58: TLabel;
    EditKSeFUReferenceNumber2: TEdit;
    Label61: TLabel;
    EditKSeFUUpoReferenceNumber2: TEdit;
    ButtonKSeFUPobierz2: TButton;
    FileNameEditKSeFUFile2: TEdit;
    Label62: TLabel;
    ButtonFileNameEditKSeFUFile: TButton;
    ButtonFileNameEditKSeFUFile1: TButton;
    ButtonFileNameEditKSeFUFile2: TButton;
    TabSheetKSeFDownload: TTabSheet;
    ScrollBox8: TScrollBox;
    GroupBox22: TGroupBox;
    Label74: TLabel;
    EditKSeFDKsefNumber: TEdit;
    Label75: TLabel;
    FileNameEditKSeFDOutFile: TEdit;
    ButtonKSeFDDownload: TButton;
    GroupBox25: TGroupBox;
    Label76: TLabel;
    ComboBoxKSeFDFSubjectType: TComboBox;
    GroupBox26: TGroupBox;
    Label77: TLabel;
    ComboBoxKSeFDFDateType: TComboBox;
    Label78: TLabel;
    Label79: TLabel;
    DateTimePickerKSeFDFFrom: TDateTimePicker;
    DateTimePickerKSeFDFTo: TDateTimePicker;
    Label80: TLabel;
    EditKSeFDFKsefNumber: TEdit;
    GroupBox27: TGroupBox;
    Label81: TLabel;
    ComboBoxKSeFDFAmountType: TComboBox;
    Label82: TLabel;
    FloatSpinEditKSeFDFFrom: TSpinEdit;
    FloatSpinEditKSeFDFTo: TSpinEdit;
    Label83: TLabel;
    Panel1: TPanel;
    Panel4: TPanel;
    Label84: TLabel;
    EditKSeFDFSellerNip: TEdit;
    Label85: TLabel;
    EditKSeFDFBuyerIdentifierValue: TEdit;
    Label86: TLabel;
    EditKSeFDFCurrencyCodes: TEdit;
    ComboBoxKSeFDFBuyerIdentifierType: TComboBox;
    Panel7: TPanel;
    Label88: TLabel;
    ComboBoxKSeFDFIsSelfInvoicing: TComboBox;
    ComboBoxKSeFDFInvoicingMode: TComboBox;
    Label87: TLabel;
    Label89: TLabel;
    ComboBoxKSeFDFFormType: TComboBox;
    CheckGroupKSeFDFInvoiceType: TCheckListBox;
    Label90: TLabel;
    ComboBoxKSeFDFHasAttachment: TComboBox;
    ButtonKSeFDFClear: TButton;
    Label95: TLabel;
    EditKSeFDFInvoiceNumber: TEdit;
    GroupBox28: TGroupBox;
    Label91: TLabel;
    SpinEditKSeFDPageOffset: TSpinEdit;
    SpinEditKSeFDPageSize: TSpinEdit;
    Label92: TLabel;
    ButtonKSeFDMetadata: TButton;
    GroupBox29: TGroupBox;
    ButtonKSeFDExport: TButton;
    GroupBox30: TGroupBox;
    ButtonKSeFDStatus: TButton;
    Label93: TLabel;
    EditKSeFDEOperationReferenceNumber: TEdit;
    GroupBoxKSeFD1: TGroupBox;
    Label94: TLabel;
    FileNameEditKSeFDEFileName: TEdit;
    ButtonKSeFDEDownload: TButton;
    Label9: TLabel;
    ButtonFileNameEditKSeFDOutFile: TButton;
    ButtonFileNameEditKSeFDEFileName: TButton;
    TabSheetKSeFToken: TTabSheet;
    ScrollBox9: TScrollBox;
    GroupBox31: TGroupBox;
    CheckGroupKSeFTKPermisions: TCheckListBox;
    Label96: TLabel;
    EditKSeFTKDescription: TEdit;
    ButtonKSeFTKGenerate: TButton;
    GroupBox32: TGroupBox;
    CheckGroupKSeFTKStatus: TCheckListBox;
    Label97: TLabel;
    EditKSeFTKDescrFlt: TEdit;
    Label98: TLabel;
    EditKSeFTKAuthorIdentifier: TEdit;
    Label99: TLabel;
    ComboBoxKSeFTKAuthorIdentifierType: TComboBox;
    Label100: TLabel;
    SpinEditKSeFTKPageSize: TSpinEdit;
    Label101: TLabel;
    EditKSeFTKContinuationToken: TEdit;
    ButtonKSeFTKList: TButton;
    GroupBox33: TGroupBox;
    Label102: TLabel;
    EditKSeFTKSReferenceNumber: TEdit;
    ButtonKSeFTKStatus: TButton;
    GroupBox34: TGroupBox;
    Label103: TLabel;
    EditKSeFTKDReferenceNumber: TEdit;
    ButtonKSeFTKDelete: TButton;
    Label10: TLabel;
    Label11: TLabel;
    TabSheetKSeF2TestData: TTabSheet;
    ScrollBox2: TScrollBox;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    GroupBox2: TGroupBox;
    StringGridDTUPSubunits: TStringGrid;
    EditKSeFDTUPSubjectNip: TEdit;
    ComboBoxKSeFDTUPSubjectType: TComboBox;
    EditKSeFDTUPDescription: TEdit;
    DateTimePickerKSeFDTUPCreationDate: TDateTimePicker;
    ButtonKSeFDTUtworzPodmiot: TButton;
    GroupBox3: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label59: TLabel;
    Label104: TLabel;
    EditKSeFDTUONip: TEdit;
    EditKSeFDTUODescription: TEdit;
    DateTimePickerKSeFDTUOCreationDate: TDateTimePicker;
    ButtonKSeFDTUtworzOsobe: TButton;
    EditKSeFDTUOPesel: TEdit;
    CheckBoxKSeFTDUOIsBailiff: TCheckBox;
    GroupBox4: TGroupBox;
    Label105: TLabel;
    EditKSeFDTUsPSubjectNip: TEdit;
    ButtonKSeFDTUsunPodmiot: TButton;
    GroupBox5: TGroupBox;
    Label106: TLabel;
    EditKSeFDTUsONip: TEdit;
    ButtonKSeFDTUsunOsobe: TButton;
    Button1: TButton;
    TabSheetKSeF2PublicKeys: TTabSheet;
    GroupBox6: TGroupBox;
    ButtonKSeFGetPublicKeyCertificates: TButton;
    ComboBoxKSeFPKCertBramka: TComboBox;
    Label107: TLabel;
    ButtonKSeFLoadKeyToken: TButton;
    ButtonKSeFLoadKeyKeyEx: TButton;
    CheckBoxKSeFAutoRefresh: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonSetupClick(Sender: TObject);
    procedure ButtonShowCertClick(Sender: TObject);
    procedure ButtonCertWybierzClick(Sender: TObject);
    procedure ButtonCertReloadClick(Sender: TObject);
    procedure ButtonCertLoadFromFileClick(Sender: TObject);
    procedure ButtonKSeFASessionSetClick(Sender: TObject);
    procedure ButtonKSeFAXAdESClick(Sender: TObject);
    procedure ButtonKSeFAXAdESSaveClick(Sender: TObject);
    procedure ButtonKSeFAXAdESExtClick(Sender: TObject);
    procedure ButtonKSeFATokenKsefClick(Sender: TObject);
    procedure ButtonKSeFAStatusClick(Sender: TObject);
    procedure ButtonKSeFATokenRedemClick(Sender: TObject);
    procedure ButtonKSeFATokenRefreshClick(Sender: TObject);
    procedure ButtonKSeFASessionsClick(Sender: TObject);
    procedure ButtonKSeFASessionTermCurClick(Sender: TObject);
    procedure ButtonKSeFASessionTermClick(Sender: TObject);
    procedure ButtonKSeFIOpenClick(Sender: TObject);
    procedure ButtonKSeFISendClick(Sender: TObject);
    procedure ButtonKSeFICloseClick(Sender: TObject);
    procedure ButtonObjShowClick(Sender: TObject);
    procedure ButtonObjCleaClick(Sender: TObject);
    procedure ButtonObjCountClick(Sender: TObject);
    procedure ListViewObjDblClick(Sender: TObject);
    procedure ButtonFileNameEditKSeFBZIPInClick(Sender: TObject);
    procedure ButtonKSeFBPrepareClick(Sender: TObject);
    procedure ButtonKSeFBOpenClick(Sender: TObject);
    procedure ButtonKSeFBSendClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ButtonKSeFSessionsClick(Sender: TObject);
    procedure ButtonKSeFSessionClick(Sender: TObject);
    procedure ButtonKSeFSessionsInvoiceClick(Sender: TObject);
    procedure ButtonKSeFSessionInvoiceClick(Sender: TObject);
    procedure ButtonKSeFSessionsInvoiceFailedClick(Sender: TObject);
    procedure ButtonFileNameEditKSeFUFileClick(Sender: TObject);
    procedure ButtonFileNameEditKSeFUFile1Click(Sender: TObject);
    procedure ButtonFileNameEditKSeFUFile2Click(Sender: TObject);
    procedure ButtonKSeFUPobierzClick(Sender: TObject);
    procedure ButtonKSeFUPobierz1Click(Sender: TObject);
    procedure ButtonKSeFUPobierz2Click(Sender: TObject);
    procedure ButtonFileNameEditKSeFDOutFileClick(Sender: TObject);
    procedure ButtonFileNameEditKSeFDEFileNameClick(Sender: TObject);
    procedure ButtonKSeFDDownloadClick(Sender: TObject);
    procedure ButtonKSeFDFClearClick(Sender: TObject);
    procedure ButtonKSeFDMetadataClick(Sender: TObject);
    procedure ButtonKSeFDExportClick(Sender: TObject);
    procedure ButtonKSeFDStatusClick(Sender: TObject);
    procedure ButtonKSeFDEDownloadClick(Sender: TObject);
    procedure ButtonKSeFTKGenerateClick(Sender: TObject);
    procedure ButtonKSeFTKListClick(Sender: TObject);
    procedure ButtonKSeFTKStatusClick(Sender: TObject);
    procedure ButtonKSeFTKDeleteClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ButtonKSeFDTUtworzPodmiotClick(Sender: TObject);
    procedure ButtonKSeFDTUsunPodmiotClick(Sender: TObject);
    procedure ButtonKSeFDTUtworzOsobeClick(Sender: TObject);
    procedure ButtonKSeFDTUsunOsobeClick(Sender: TObject);
    procedure ButtonKSeFGetPublicKeyCertificatesClick(Sender: TObject);
    procedure ButtonKSeFLoadKeyTokenClick(Sender: TObject);
    procedure ButtonKSeFLoadKeyKeyExClick(Sender: TObject);
    procedure ButtonFileNameEditKSeFIDocClick(Sender: TObject);
  private
    { Private declarations }
    PopupSignerMode: (mUISelect, mLoad);
    procedure PopupMenuSignerClick(Sender: TObject);
    procedure CertUISelect(ASigner: TlgCertificateSigner);
    procedure CertLoadFromFile(ASigner: TlgCertificateSigner);
    procedure SetKSeFPagesVisible(AValue: Boolean);
    procedure PopupMenuKeysClick(Sender: TObject);
  public
    { Public declarations }
    CertCombos: TList;
    Signers: TObjectList;
    Certificates: TlgCertificates;

    HTTPClient: TlgHTTPClient;
    XAdES: TlgXAdES;
    KSeF: TlgKSeF2;

    BatchRequest: TKSeF2OpenBatchSessionRequest;
    BatchResponse: TKSeF2OpenBatchSessionResponse;
    CurrentPartStream: TStream;

    ExportResponse: TKSeF2InvoiceExportStatusResponse;

    procedure KSeFRequestPartStream(Sender: TObject; APartNumber: Integer; var APartStream: TStream);

    procedure Debug(ATekst: String; ALinia: Boolean = False); overload;
    procedure Debug(ATekst: String; ADane: array of const); overload;
    procedure DebugCert(ACertyfikat: TlgCertificate);

    procedure ReloadCerificates;
    procedure ListCertificates;

    function GenerateFilter: TKSeF2InvoiceQueryFilters;

    procedure AddObject(AObject: TObject);
    procedure DebugException(AException: Exception);
  end;

var
  Form1: TForm1;

implementation

uses
  uFormCertLoad, TypInfo, IniFiles, Unit2;

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
var
  I: Integer;
begin
  PageControlMain.ActivePage := TabSheetSetup;
  StringGridKSeFBEncOutFiles.Cells[0,0] := 'Nazwa pliku czê¹ci';
  StringGridDTUPSubunits.Cells[0,0] := 'subjectNip';
  StringGridDTUPSubunits.Cells[1,0] := 'description';
  CertCombos := TList.Create;
  for I := 0 to CertSignerClasses.Count - 1 do
    CheckListBoxSigners.Checked[CheckListBoxSigners.Items.AddObject(CertSignerClasses[I].ClassName, TObject(CertSignerClasses[I]))] := not SameText(CertSignerClasses[I].ClassName, 'TlgPKCS11CertificateSigner');
  for I := 0 to HTTPClientClasses.Count - 1 do
    ComboBoxHTTPCli.Items.Add(HTTPClientClasses[I].ClassDescription);
  for I := 0 to RandomGeneratorClasses.Count - 1 do
    ComboBoxRandGen.Items.Add(RandomGeneratorClasses[I].ClassDescription);
  for I := 0 to Base64EncoderClasses.Count - 1 do
    ComboBoxBase64.Items.Add(Base64EncoderClasses[I].ClassDescription);
  for I := 0 to SHA256HashClasses.Count - 1 do
    ComboBoxSHA256.Items.Add(SHA256HashClasses[I].ClassDescription);
  for I := 0 to AES256EncryptClasses.Count - 1 do
    ComboBoxAES256.Items.Add(AES256EncryptClasses[I].ClassDescription);
  for I := 0 to RSAPublicKeyClasses.Count - 1 do
    ComboBoxRSAEnc.Items.Add(RSAPublicKeyClasses[I].ClassDescription);
  if ComboBoxHTTPCli.Items.Count > 0 then
    ComboBoxHTTPCli.ItemIndex := 0;
  if ComboBoxRandGen.Items.Count > 0 then
    ComboBoxRandGen.ItemIndex := 0;
  if ComboBoxBase64.Items.Count > 0 then
    ComboBoxBase64.ItemIndex := 0;
  if ComboBoxSHA256.Items.Count > 0 then
    ComboBoxSHA256.ItemIndex := 0;
  if ComboBoxAES256.Items.Count > 0 then
    ComboBoxAES256.ItemIndex := 0;
  if ComboBoxRSAEnc.Items.Count > 0 then
    ComboBoxRSAEnc.ItemIndex := 0;
  CertCombos.Add(ComboBoxACertificate);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Ini: TIniFile;
begin
  if Assigned(KSeF) and (KSeF.RefreshToken <> '') and (KSeF.RefreshTokenValidUntil > Now) then
  begin
    try
      Ini := TIniFile.Create(Application.ExeName + '.ini');
      Ini.WriteString('RefreshToken', 'Token', KSeF.RefreshToken);
      Ini.WriteDateTime('RefreshToken', 'ValidUntil', KSeF.RefreshTokenValidUntil);
      if (KSeF.AccessToken <> '') and (KSeF.AccessTokenValidUntil > Now) then
      begin
        Ini.WriteString('AccessToken', 'Token', KSeF.AccessToken);
        Ini.WriteDateTime('AccessToken', 'ValidUntil', KSeF.AccessTokenValidUntil);
      end;
      Ini.Free;
    except
      on E: Exception do
        MessageDlg('Wyj¹tek przy zapisywaniu statusu sesji: ' + E.Message, mtError, [mbOK], 0);
    end;
  end
  else
    if FileExists(Application.ExeName + '.ini') then
      DeleteFile(Application.ExeName + '.ini');
  ButtonObjCleaClick(nil);
  if Assigned(BatchRequest) then
    BatchRequest.Free;
  if Assigned(BatchResponse) then
    BatchResponse.Free;
  if Assigned(ExportResponse) then
    ExportResponse.Free;
  if Assigned(CertCombos) then
    CertCombos.Free;
end;

procedure TForm1.ButtonSetupClick(Sender: TObject);
var
  I: Integer;
  Signer: TlgCertificateSigner;
  MI: TMenuItem;
  Ini: TIniFile;
  D: TDateTime;
begin
  if not Assigned(Signers) then
    Signers := TObjectList.Create(True);
  for I := 0 to CheckListBoxSigners.Count - 1 do
    if CheckListBoxSigners.Checked[I] then
    begin
      Signer := TlgCertificateSignerClass(CheckListBoxSigners.Items.Objects[I]).Create(nil);
      {if Signer is TlgPKCS11CertificateSigner then
      try
        TlgPKCS11CertificateSigner(Signer).LoadLibrary(FileNameEditLibPKCS11.FileName);
        TabSheetPKCS11.TabVisible := True;
        PKCS11Signer := TlgPKCS11CertificateSigner(Signer);
      except
        on E: Exception do
        begin
          MessageDlg('B³¹d podczas ³adowania biblioteki PKCS11: ' + LineEnding + E.Message,
            mtError, [mbOK], 0);
          Signer.Free;
          Signer := nil;
        end;
      end;}
      if Signer <> nil then
      begin
        Signers.Add(Signer);
        Debug('Za³adowano klasê podpisu: ' + Signer.ClassName);
        MI := TMenuItem.Create(PopupMenuSigners);
        MI.Caption := Signer.ClassName;
        MI.OnClick := PopupMenuSignerClick;
        MI.Tag := PtrInt(Signer);
        PopupMenuSigners.Items.Add(MI);
      end;
    end;

  ReloadCerificates;

  TabSheetCert.TabVisible := True;
  TabSheetSetup.Enabled := False;

  if ComboBoxHTTPCli.ItemIndex >= 0 then
    HTTPClient := HTTPClientClasses[ComboBoxHTTPCli.ItemIndex].Create(Self);

  XAdES := TlgXAdES.Create(Self);
  if ComboBoxSHA256.ItemIndex >= 0 then
    XAdES.SHA256HashClass := SHA256HashClasses[ComboBoxSHA256.ItemIndex];
  if ComboBoxBase64.ItemIndex >= 0 then
    XAdES.Base64EncoderClass := Base64EncoderClasses[ComboBoxBase64.ItemIndex];
  XAdES.SignType := shtSHA256;

  KSeF := TlgKSeF2.Create(Self);
  KSeF.XAdES := XAdES;
  KSeF.HTTPClient := HTTPClient;
  if ComboBoxBase64.ItemIndex >= 0 then
    KSeF.Base64EncoderClass := Base64EncoderClasses[ComboBoxBase64.ItemIndex];
  if ComboBoxSHA256.ItemIndex >= 0 then
    KSeF.SHA256HashClass := SHA256HashClasses[ComboBoxSHA256.ItemIndex];
  if ComboBoxRSAEnc.ItemIndex >= 0 then
    KSeF.RSAPublicKeyClass := RSAPublicKeyClasses[ComboBoxRSAEnc.ItemIndex];
  if ComboBoxAES256.ItemIndex >= 0 then
    KSeF.AES256EncryptClass := AES256EncryptClasses[ComboBoxAES256.ItemIndex];
  if ComboBoxRandGen.ItemIndex >= 0 then
    KSeF.RandomGeneratorClass := RandomGeneratorClasses[ComboBoxRandGen.ItemIndex];
  KSeF.AutoRefreshToken := CheckBoxKSeFAutoRefresh.Checked;

  TabSheetKSeF2Auth.TabVisible := True;
  TabSheetKSeF2TestData.TabVisible := True;
  TabSheetKSeF2PublicKeys.TabVisible := True;

  TabSheetSetup.Enabled := False;

  if FileExists(Application.ExeName + '.ini') then
  begin
    try
      Ini := TIniFile.Create(Application.ExeName + '.ini');
      EditKSeFARefreshToken.Text := Ini.ReadString('RefreshToken', 'Token', '');
      D := Ini.ReadDateTime('RefreshToken', 'ValidUntil', 0);
      if D > 0 then
        DateTimePickerKSeFARefreshTokenValidUntil.DateTime := D;
      EditKSeFAAccessToken.Text := Ini.ReadString('AccessToken', 'Token', '');
      D := Ini.ReadDateTime('AccessToken', 'ValidUntil', 0);
      if D > 0 then
        DateTimePickerKSeFAAccessTokenValidUntil.DateTime := D;
      Ini.Free;
    except
    end;
  end;

  for I := 0 to RSAPublicKeyClasses.Count - 1 do
  begin
    MI := TMenuItem.Create(PopupMenuKeys);
    MI.Caption := RSAPublicKeyClasses[I].ClassName;
    MI.OnClick := PopupMenuKeysClick;
    MI.Tag := PtrInt(RSAPublicKeyClasses[I]);
    PopupMenuKeys.Items.Add(MI);
  end;

end;

procedure TForm1.PopupMenuSignerClick(Sender: TObject);
begin
  case PopupSignerMode of
    mUISelect: CertUISelect(TlgCertificateSigner(TMenuItem(Sender).Tag));
    mLoad: CertLoadFromFile(TlgCertificateSigner(TMenuItem(Sender).Tag));
  end;
end;

procedure TForm1.CertUISelect(ASigner: TlgCertificateSigner);
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

procedure TForm1.CertLoadFromFile(ASigner: TlgCertificateSigner);
var
  CertFileName, PrivKeyFileName, Password: String;
  CertFormat, KeyFormat: TlgEncodingType;
  CertStream: TFileStream;
  PrivKeyStream: TFileStream;
  Cert: TlgCertificate;
begin
  CertStream := nil;
  PrivKeyStream := nil;
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

procedure TForm1.SetKSeFPagesVisible(AValue: Boolean);
begin
  TabSheetKSeFInteractive.TabVisible := AValue;
  TabSheetKSeFBatch.TabVisible := AValue;
  TabSheetKSeFStatus.TabVisible := AValue;
  TabSheetKSeFUpo.TabVisible := AValue;
  TabSheetKSeFDownload.TabVisible := AValue;
  TabSheetKSeFToken.TabVisible := AValue;
end;

procedure TForm1.PopupMenuKeysClick(Sender: TObject);
var
  FileStream: TFileStream;
begin
  FileStream := nil;
  if OpenDialogKey.Execute then
  begin
    try
      FileStream := TFileStream.Create(OpenDialogKey.FileName, fmOpenRead);
      {if PopupMenuKeys.PopupComponent = ButtonKSeFLoadKeyToken then
        KSeF.RSATokenEncKey[TlgKSeFGateType(ComboBoxKSeFPKCertBramka.ItemIndex)] := TlgRSAPublicKeyClass(TMenuItem(Sender).Tag).Create(KSeF, FileStream, letDER)
      else if PopupMenuKeys.PopupComponent = ButtonKSeFLoadKeyKeyEx then
        KSeF.RSASymmetricKeyEncKey[TlgKSeFGateType(ComboBoxKSeFPKCertBramka.ItemIndex)] := TlgRSAPublicKeyClass(TMenuItem(Sender).Tag).Create(KSeF, FileStream, letDER);}
    finally
      if Assigned(FileStream) then
        FileStream.Free;
    end;
  end;
end;

procedure TForm1.KSeFRequestPartStream(Sender: TObject;
  APartNumber: Integer; var APartStream: TStream);
begin
  if Assigned(CurrentPartStream) then
  begin
    Debug('Zamykanie strumienia czêœci.');
    FreeAndNil(CurrentPartStream);
  end;
  if APartNumber < StringGridKSeFBEncOutFiles.RowCount then
  begin
    APartStream := TFileStream.Create(StringGridKSeFBEncOutFiles.Cells[0, APartNumber], fmCreate);
    CurrentPartStream := APartStream;
    Debug('Otwieranie strumienia czêœci dla pliku: ' + StringGridKSeFBEncOutFiles.Cells[0, APartNumber]);
  end;
end;

procedure TForm1.Debug(ATekst: String; ALinia: Boolean);
begin
  if ALinia then
    MemoLog.Lines.Add('-------------------------------');
  MemoLog.Lines.Add(ATekst);
end;

procedure TForm1.Debug(ATekst: String; ADane: array of const);
begin
  MemoLog.Lines.Add(Format(ATekst, ADane));
end;

procedure TForm1.DebugCert(ACertyfikat: TlgCertificate);
var
  K: TlgCertificateKeyUsage;
begin
  MemoLog.Lines.Add('Certyfikat (' + ACertyfikat.ClassName + ')');
  MemoLog.Lines.Add('  Nr seryjny: ' + ACertyfikat.SerialNoDec + ' (' + ACertyfikat.SerialNoHex + ')');
  MemoLog.Lines.Add('  Nazwa: ' + ACertyfikat.DisplayName);
  MemoLog.Lines.Add('  Wa¿ny od ' + DateTimeToStr(ACertyfikat.ValidFrom) + ' do ' + DateTimeToStr(ACertyfikat.ValidTo));
  MemoLog.Lines.Add('  Podmiot: ' + ACertyfikat.Subject);
  MemoLog.Lines.Add('  Wydawca: ' + ACertyfikat.Issuer);
  MemoLog.Lines.Add('  Rodzaj podpisu: ' + ACertyfikat.Signature);
  K := ACertyfikat.KeyUsage;
  MemoLog.Lines.Add('  U¿ycie: ' + SetToStringD(PTypeInfo(TypeInfo(TlgCertificateKeyUsage)), K));
  MemoLog.Lines.Add('  Algorytm klucza publicznego: ' + ACertyfikat.PublicKeyAlgorithm);
end;

procedure TForm1.ReloadCerificates;
var
  Certs: TlgCertificates;
  I, J: Integer;
begin
  if Assigned(Certificates) then
    Certificates.Clear
  else
    Certificates := TlgCertificates.Create(True);
  for I := 0 to Signers.Count - 1 do
  begin
    Certs := TlgCertificateSigner(Signers[I]).List;
    for J := 0 to Certs.Count - 1 do
      Certificates.Add(Certs[J]);
    Certs.OwnsObjects := False;
    Certs.Free;
  end;
  ListCertificates;
end;

procedure TForm1.ListCertificates;
var
  LI: TListItem;
  S: String;
  I, J: Integer;
  K: TlgCertificateKeyUsage;
begin
  ListViewCert.Clear;
  ComboBoxPKCS11Cert.Clear;
  for I := 0 to CertCombos.Count - 1 do
    TComboBox(CertCombos[I]).Clear;
  for I := 0 to Certificates.Count - 1 do
    with Certificates[I] do
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
      LI.SubItems.Add(SetToStringD(PTypeInfo(TypeInfo(TlgCertificateKeyUsage)), K));

      S := DisplayName + ' (' + DateToStr(ValidFrom) + ' - ' + DateToStr(ValidTo) + ') [' + ClassName + ']';
      for J := 0 to CertCombos.Count - 1 do
        TComboBox(CertCombos[J]).Items.AddObject(S, Certificates[I]);
      {if Cert is TlgPKCS11Certificate then
        ComboBoxPKCS11Cert.Items.AddObject(S, Cert);}

      DebugCert(Certificates[I]);
    end;
end;

procedure TForm1.ButtonShowCertClick(Sender: TObject);
begin
  Debug('Pokaz info o certyfikacie', True);
  {.$IFDEF WINDOWS}
  if (ListViewCert.ItemIndex >= 0) then
  begin
    DebugCert(Certificates[ListViewCert.ItemIndex]);
    if (Certificates[ListViewCert.ItemIndex] is TlgCNGCertificate) then
      TlgCNGCertificate(Certificates[ListViewCert.ItemIndex]).ShowCertificateInfo(Self.Handle)
    {else if (Certificates[ListViewCert.ItemIndex] is TlgPKCS11Certificate) then
      TlgPKCS11Certificate(Certificates[ListViewCert.ItemIndex]).ShowCertificateInfo(Self.Handle)}
  end;
  {.$ENDIF}
end;

procedure TForm1.ButtonCertWybierzClick(Sender: TObject);
begin
  PopupSignerMode := mUISelect;
  PopupMenuSigners.PopupComponent := ButtonCertWybierz;
  PopupMenuSigners.PopUp(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TForm1.ButtonCertReloadClick(Sender: TObject);
begin
  ReloadCerificates;
end;

procedure TForm1.ButtonCertLoadFromFileClick(Sender: TObject);
begin
  PopupSignerMode := mLoad;
  PopupMenuSigners.PopupComponent := ButtonCertWybierz;
  PopupMenuSigners.PopUp(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TForm1.ButtonKSeFASessionSetClick(Sender: TObject);
var
  Response: TKSeF2AuthenticationTokenRefreshResponse;
begin
  if (DateTimePickerKSeFARefreshTokenValidUntil.DateTime > 0) and
    (DateTimePickerKSeFARefreshTokenValidUntil.DateTime > Now) then
  begin
    KSeF.GateType := TlgKSeFGateType(ComboBoxKSeFABramka.ItemIndex);
    KSeF.IdentifierType := TlgKSeFIdentifierType(ComboBoxKSeFAIdentifierType.ItemIndex);
    KSeF.RefreshToken := EditKSeFARefreshToken.Text;
    KSeF.RefreshTokenValidUntil := DateTimePickerKSeFARefreshTokenValidUntil.DateTime;
    if ComboBoxACertificate.ItemIndex >= 0 then
    begin
      KSeF.AuthCertificate := TlgCertificate(ComboBoxACertificate.Items.Objects[ComboBoxACertificate.ItemIndex]);
      KSeF.AuthCertificateSubject := TlgKSeFCertificateAuthType(ComboBoxKSeFASubjectType.ItemIndex);
    end;
    KSeF.KsefToken := EditKSeFATokenKsef.Text;
    if (DateTimePickerKSeFAAccessTokenValidUntil.DateTime > 0) and
      (DateTimePickerKSeFAAccessTokenValidUntil.DateTime > Now) then
    begin
      KSeF.AccessToken := EditKSeFAAccessToken.Text;
      KSeF.AccessTokenValidUntil := DateTimePickerKSeFAAccessTokenValidUntil.DateTime;
    end
    else
      try
        Response := KSeF.AuthTokenRefresh;
        AddObject(Response);
        EditKSeFAAccessToken.Text := Response.AccessToken.Token;
        DateTimePickerKSeFAAccessTokenValidUntil.DateTime := Response.AccessToken.ValidUntil;
      except
        on E: Exception do
          DebugException(E);
      end;
    GroupBoxKSeFA1.Enabled := False;
    GroupBoxKSeFA2.Enabled := False;
    GroupBoxKSeFA3.Enabled := False;
    GroupBoxKSeFA4.Enabled := False;
    GroupBoxKSeFA5.Enabled := True;
    GroupBoxKSeFA6.Enabled := True;
    SetKSeFPagesVisible(True);
  end;
end;

function TForm1.GenerateFilter: TKSeF2InvoiceQueryFilters;
var
  I: TKSeF2InvoiceType;
  IT: TKSeF2InvoiceTypes;
begin
  IT := [];
  Result := TKSeF2InvoiceQueryFilters.Create(nil);
  with Result do
  begin
    SubjectType := TKSeF2InvoiceQuerySubjectType(ComboBoxKSeFDFSubjectType.ItemIndex);
    DateRange.DateType := TKSeF2InvoiceQueryDateType(ComboBoxKSeFDFDateType.ItemIndex);
    DateRange.From := DateTimePickerKSeFDFFrom.DateTime;
    if DateTimePickerKSeFDFTo.Checked then
      DateRange.To_ := DateTimePickerKSeFDFTo.DateTime;
    KsefNumber := EditKSeFDFKsefNumber.Text;
    InvoiceNumber := EditKSeFDFInvoiceNumber.Text;
    if (FloatSpinEditKSeFDFFrom.Value <> 0) or (FloatSpinEditKSeFDFTo.Value <> 0) then
    begin
      Amount := TKSeF2InvoiceQueryAmount.Create(Result);
      Amount.Type_ := TKSeF2AmountType(ComboBoxKSeFDFAmountType.ItemIndex);
      if FloatSpinEditKSeFDFFrom.Value <> 0 then
        Amount.From := FloatSpinEditKSeFDFFrom.Value;
      if FloatSpinEditKSeFDFTo.Value <> 0 then
        Amount.To_ := FloatSpinEditKSeFDFTo.Value;
    end;
    SellerNip := EditKSeFDFSellerNip.Text;
    if ComboBoxKSeFDFBuyerIdentifierType.ItemIndex > 0 then
    begin
      BuyerIdentifier := TKSeF2InvoiceQueryBuyerIdentifier.Create(Result);
      BuyerIdentifier.Type_ := TKSeF2BuyerIdentifierType(ComboBoxKSeFDFBuyerIdentifierType.ItemIndex - 1);
      BuyerIdentifier.Value := EditKSeFDFBuyerIdentifierValue.Text;
    end;
    if EditKSeFDFCurrencyCodes.Text <> '' then
      CurrencyCodes := SplitString(EditKSeFDFCurrencyCodes.Text, [',', ';']);
    if ComboBoxKSeFDFInvoicingMode.ItemIndex > 0 then
      InvoicingMode := TKSeF2InvoicingMode(ComboBoxKSeFDFInvoicingMode.ItemIndex - 1);
    IsSelfInvoicing := TKSeF2NullableBoolean(ComboBoxKSeFDFIsSelfInvoicing.ItemIndex);
    FormType := TKSeF2InvoiceQueryFormType(ComboBoxKSeFDFIsSelfInvoicing.ItemIndex);
    for I := Low(TKSeF2InvoiceType) to High(TKSeF2InvoiceType) do
      if CheckGroupKSeFDFInvoiceType.Checked[Ord(I)] then
        Include(IT, I);
    InvoiceTypes := IT;
    HasAttachment := TKSeF2NullableBoolean(ComboBoxKSeFDFHasAttachment.ItemIndex);
  end;
end;

procedure TForm1.AddObject(AObject: TObject);
begin
  if Assigned(AObject) then
    with ListViewObj.Items.Add do
    begin
      Caption := AObject.ClassName;
      Data := AObject;
    end;
end;

procedure TForm1.DebugException(AException: Exception);
var
  I: Integer;
begin
  Debug('Wyj¹tek: ' + AException.ClassName);
  Debug(AException.Message);
  if AException is EKSeF2ExceptionResponseBase then
    with EKSeF2ExceptionResponseBase(AException) do
    begin
      Debug('  ResponseCode: %d', [ResponseCode]);
      Debug('  RawData: ' + RawData);
    end;
  if AException is EKSeF2ExceptionResponse then
    with EKSeF2ExceptionResponse(AException) do
    begin
      Debug('  ServiceCtx: ' + ServiceCtx);
      Debug('  ServiceCode: ' + ServiceCode);
      Debug('  ServiceName: ' + ServiceName);
      Debug('  Timestamp: ' + DateTimeToStr(Timestamp));
      Debug('  ReferenceNumber: ' + ReferenceNumber);
      Debug('  ExceptionDetailList:');
      for I := 0 to Length(ExceptionDetailList) - 1 do
      begin
        Debug('  [');
        Debug('    ExceptionCode: %d', [ExceptionDetailList[I].ExceptionCode]);
        Debug('    ExceptionDescription: ' + ExceptionDetailList[I].ExceptionDescription);
        Debug('    Details: ' + StringArrayToString(ExceptionDetailList[I].Details, ', '));
        Debug('  ]');
      end;
    end;
end;

procedure TForm1.ButtonKSeFAXAdESClick(Sender: TObject);
var
  Response: TKSeF2AuthenticationInitResponse;
begin
  Debug('Uwierzytelnienie z wykorzystaniem podpisu XAdES', True);
  KSeF.GateType := TlgKSeFGateType(ComboBoxKSeFABramka.ItemIndex);
  KSeF.Identifier := EditKSeFAIdentifier.Text;
  KSeF.IdentifierType := TlgKSeFIdentifierType(ComboBoxKSeFAIdentifierType.ItemIndex);
  KSeF.AuthCertificate := TlgCertificate(ComboBoxACertificate.Items.Objects[ComboBoxACertificate.ItemIndex]);
  KSeF.AuthCertificateSubject := TlgKSeFCertificateAuthType(ComboBoxKSeFASubjectType.ItemIndex);
  try
    Response := KSeF.AuthXadesSignature;
    Debug('OdpowiedŸ: ' + Response.RawResponse);
    Debug('  ReferenceNumber:' + Response.ReferenceNumber);
    Debug('  AuthenticationToken.Token:' + Response.AuthenticationToken.Token);
    Debug('  AuthenticationToken.ValidUntil:' + DateTimeToStr(Response.AuthenticationToken.ValidUntil));
    GroupBoxKSeFA1.Enabled := False;
    GroupBoxKSeFA2.Enabled := False;
    GroupBoxKSeFA3.Enabled := False;
    GroupBoxKSeFA4.Enabled := False;
    GroupBoxKSeFA5.Enabled := True;
    GroupBoxKSeFA6.Enabled := True;
    AddObject(Response);
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TForm1.ButtonKSeFAXAdESSaveClick(Sender: TObject);
var
  FS: TFileStream;
  AuthStructure: UTF8String;
begin
  FS := nil;
  Debug('Generowanie struktury Auth dla zewnêtrznego podpisu XAdES', True);
  KSeF.GateType := TlgKSeFGateType(ComboBoxKSeFABramka.ItemIndex);
  KSeF.Identifier := EditKSeFAIdentifier.Text;
  KSeF.IdentifierType := TlgKSeFIdentifierType(ComboBoxKSeFAIdentifierType.ItemIndex);
  KSeF.AuthCertificateSubject := TlgKSeFCertificateAuthType(ComboBoxKSeFASubjectTypeExt.ItemIndex);
  try
    try
      AuthStructure := '<?xml version="1.0" encoding="UTF-8"?>' + #13#10 +
        KSeF.AuthXadesSignatureGenerate;
      Debug('Struktura: ' + AuthStructure);
      Debug('Zapisywanie do pliku: ' + FileNameEditKSeFAOutXades.Text);
      FS := TFileStream.Create(FileNameEditKSeFAOutXades.Text, fmCreate);
      FS.Write(AuthStructure[1], Length(AuthStructure));
      Debug('Zapisano');
    except
      on E: Exception do
        DebugException(E);
    end;
  finally
    if Assigned(FS) then
      FS.Free;
  end;
end;

procedure TForm1.ButtonKSeFAXAdESExtClick(Sender: TObject);
var
  SignedAuthStructure: String;
  FS: TFileStream;
  Response: TKSeF2AuthenticationInitResponse;
begin
  FS := nil;
  Debug('Uwierzytelnienie z wykorzystaniem zewnêtrznego podpisu XAdES', True);
  try
    try
      Debug('Wczytywanie z pliku: ' + FileNameEditKSeFAInXades.Text);
      FS := TFileStream.Create(FileNameEditKSeFAInXades.Text, fmOpenRead);
      SetLength(SignedAuthStructure, FS.Size);
      FS.Read(SignedAuthStructure[1], FS.Size);
      Debug('Struktura: ' + SignedAuthStructure);
      Response := KSeF.AuthXadesSignature(SignedAuthStructure);
      Debug('OdpowiedŸ: ' + Response.RawResponse);
      Debug('  ReferenceNumber:' + Response.ReferenceNumber);
      Debug('  AuthenticationToken.Token:' + Response.AuthenticationToken.Token);
      Debug('  AuthenticationToken.ValidUntil:' + DateTimeToStr(Response.AuthenticationToken.ValidUntil));
      GroupBoxKSeFA1.Enabled := False;
      GroupBoxKSeFA2.Enabled := False;
      GroupBoxKSeFA3.Enabled := False;
      GroupBoxKSeFA4.Enabled := False;
      GroupBoxKSeFA5.Enabled := True;
      GroupBoxKSeFA6.Enabled := True;
      AddObject(Response);
    except
      on E: Exception do
        DebugException(E);
    end;
  finally
    if Assigned(FS) then
      FS.Free;
  end;
end;

procedure TForm1.ButtonKSeFATokenKsefClick(Sender: TObject);
var
  Response: TKSeF2AuthenticationInitResponse;
begin
  Debug('Uwierzytelnienie z wykorzystaniem tokena KSeF', True);
  KSeF.GateType := TlgKSeFGateType(ComboBoxKSeFABramka.ItemIndex);
  KSeF.Identifier := EditKSeFAIdentifier.Text;
  KSeF.IdentifierType := TlgKSeFIdentifierType(ComboBoxKSeFAIdentifierType.ItemIndex);
  KSeF.KsefToken := EditKSeFATokenKsef.Text;
  try
    Response := KSeF.AuthKsefToken;
    Debug('OdpowiedŸ: ' + Response.RawResponse);
    Debug('  ReferenceNumber:' + Response.ReferenceNumber);
    Debug('  AuthenticationToken.Token:' + Response.AuthenticationToken.Token);
    Debug('  AuthenticationToken.ValidUntil:' + DateTimeToStr(Response.AuthenticationToken.ValidUntil));
    GroupBoxKSeFA1.Enabled := False;
    GroupBoxKSeFA2.Enabled := False;
    GroupBoxKSeFA3.Enabled := False;
    GroupBoxKSeFA4.Enabled := False;
    GroupBoxKSeFA5.Enabled := True;
    GroupBoxKSeFA6.Enabled := True;
    AddObject(Response);
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TForm1.ButtonKSeFAStatusClick(Sender: TObject);
var
  Response: TKSeF2AuthenticationOperationStatusResponse;
begin
  Debug('Pobranie statusu uwierzytelniania', True);
  try
    Response := KSeF.AuthStatus;
    Debug('OdpowiedŸ: ' + Response.RawResponse);
    Debug('  StartDate: ' + DateTimeToStr(Response.StartDate));
    Debug('  AuthenticationMethod: ' + Response.AuthenticationMethod);
    Debug('  Status.Code: ' + IntToStr(Response.Status.Code));
    Debug('  Status.Description: ' + Response.Status.Description);
    Debug('  IsTokenRedeemed: ' + BoolToStr(Response.IsTokenRedeemed));
    Debug('  LastTokenRefreshDate: ' + DateTimeToStr(Response.LastTokenRefreshDate));
    Debug('  RefreshTokenValidUntil: ' + DateTimeToStr(Response.RefreshTokenValidUntil));
    if Response.Status.Code >= 400 then
    begin
      GroupBoxKSeFA1.Enabled := True;
      GroupBoxKSeFA2.Enabled := True;
      GroupBoxKSeFA3.Enabled := True;
      GroupBoxKSeFA4.Enabled := True;
      GroupBoxKSeFA5.Enabled := False;
      GroupBoxKSeFA6.Enabled := False;
    end;
    AddObject(Response);
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TForm1.ButtonKSeFATokenRedemClick(Sender: TObject);
var
  Response: TKSeF2AuthenticationTokensResponse;
begin
  Debug('Pobranie tokenów dostêpowych', True);
  try
    Response := KSeF.AuthTokenRedem;
    Debug('OdpowiedŸ: ' + Response.RawResponse);
    Debug('  AccessToken.Token: ' + Response.AccessToken.Token);
    Debug('  AccessToken.ValidUntil: ' + DateTimeToStr(Response.AccessToken.ValidUntil));
    Debug('  RefreshToken.Token: ' + Response.RefreshToken.Token);
    Debug('  RefreshToken.ValidUntil: ' + DateTimeToStr(Response.RefreshToken.ValidUntil));

    EditKSeFAAccessToken.Text := Response.AccessToken.Token;
    DateTimePickerKSeFAAccessTokenValidUntil.DateTime := Response.AccessToken.ValidUntil;
    EditKSeFARefreshToken.Text := Response.RefreshToken.Token;
    DateTimePickerKSeFARefreshTokenValidUntil.DateTime := Response.RefreshToken.ValidUntil;
    SetKSeFPagesVisible(True);

    AddObject(Response);
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TForm1.ButtonKSeFATokenRefreshClick(Sender: TObject);
var
  Response: TKSeF2AuthenticationTokenRefreshResponse;
begin
  Debug('Pobranie tokenów dostêpowych', True);
  try
    Response := KSeF.AuthTokenRefresh;
    Debug('OdpowiedŸ: ' + Response.RawResponse);
    Debug('  AccessToken.Token: ' + Response.AccessToken.Token);
    Debug('  AccessToken.ValidUntil: ' + DateTimeToStr(Response.AccessToken.ValidUntil));
    EditKSeFAAccessToken.Text := Response.AccessToken.Token;
    DateTimePickerKSeFAAccessTokenValidUntil.DateTime := Response.AccessToken.ValidUntil;
    AddObject(Response);
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TForm1.ButtonKSeFASessionsClick(Sender: TObject);
var
  Response: TKSeF2AuthenticationListResponse;
begin
  Debug('Pobranie listy aktywnych sesji', True);
  try
    Response := KSeF.AuthSessions;
    Debug('OdpowiedŸ: ' + Response.RawResponse);
    Debug('  Items.Count: ' + IntToStr(Response.Items.Count));
    AddObject(Response);
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TForm1.ButtonKSeFASessionTermCurClick(Sender: TObject);
begin
  Debug('Uniewa¿nienie aktualnej sesji uwierzytelnienia', True);
  try
    KSeF.AuthSessionTerminateCurrent;
    GroupBoxKSeFA1.Enabled := True;
    GroupBoxKSeFA2.Enabled := True;
    GroupBoxKSeFA3.Enabled := True;
    GroupBoxKSeFA4.Enabled := True;
    GroupBoxKSeFA5.Enabled := False;
    GroupBoxKSeFA6.Enabled := False;
    SetKSeFPagesVisible(False);
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TForm1.ButtonKSeFASessionTermClick(Sender: TObject);
begin
  Debug('Uniewa¿nienie sesji uwierzytelnienia', True);
  try
    KSeF.AuthSessionTerminate(EditKSeFASessionRefNo.Text);
    if EditKSeFASessionRefNo.Text = KSeF.AuthenticationRefNo then
    begin
      GroupBoxKSeFA1.Enabled := True;
      GroupBoxKSeFA2.Enabled := True;
      GroupBoxKSeFA3.Enabled := True;
      GroupBoxKSeFA4.Enabled := True;
      GroupBoxKSeFA5.Enabled := False;
      GroupBoxKSeFA6.Enabled := False;
      SetKSeFPagesVisible(False);
    end;
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TForm1.ButtonKSeFIOpenClick(Sender: TObject);
var
  RefNo: String;
begin
  Debug('Otwarcie sesji interaktywnej', True);
  try
    KSeF.FormCode := TlgKSeFFormCode(ComboBoxIFormCode.ItemIndex);
    KSeF.FormCodeSystemCode := EditKSeFIFormCodeSystemCode.Text;
    KSeF.FormCodeSchemaVersion := EditKSeFIFormCodeSchemaVersion.Text;
    KSeF.FormCodeValue := EditKSeFIFormCodeValue.Text;
    RefNo := KSeF.InteractiveOpenSimple;
    Debug('Sesja otwarta, nr rf: ' + RefNo);
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TForm1.ButtonKSeFISendClick(Sender: TObject);
var
  RefNo: String;
  InvoiceFileStream: TFileStream;
begin
  InvoiceFileStream := nil;
  Debug('Wys³anie faktury', True);
  try
    try
      InvoiceFileStream := TFileStream.Create(FileNameEditKSeFIDoc.Text, fmOpenRead);
      RefNo := KSeF.InteractiveSend(InvoiceFileStream, CheckBoxKSeFIOffline.Checked, EditKSeFIHashOfCorrectedInvoice.Text);
      Debug('Wys³ano fakturê, nr ref: ' + RefNo);
    except
      on E: Exception do
        DebugException(E);
    end;
  finally
    if Assigned(InvoiceFileStream) then
      InvoiceFileStream.Free;
  end;
end;

procedure TForm1.ButtonKSeFICloseClick(Sender: TObject);
begin
  Debug('Zamkniêcie sesji interaktywnej', True);
  try
    KSeF.InteractiveClose;
    Debug('Sesja zosta³a zamkniêta');
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TForm1.ButtonObjShowClick(Sender: TObject);
begin
  if (ListViewObj.ItemFocused <> nil) and (ListViewObj.ItemFocused.Data <> nil) then
    Unit2.ShowObject(TKSeF2Object(ListViewObj.ItemFocused.Data));
end;

procedure TForm1.ButtonObjCleaClick(Sender: TObject);
begin
  with ListViewObj do
  begin
    //BeginUpdate;
    while Items.Count > 0 do
    begin
      if (Items[0].Data <> nil) and (Items[0].Data <> Pointer(BatchRequest)) and
        (Items[0].Data <> Pointer(BatchResponse)) and (Items[0].Data <> Pointer(ExportResponse)) then
        TObject(Items[0].Data).Free;
      Items[0].Free;
    end;
    //EndUpdate;
  end;
end;

procedure TForm1.ButtonObjCountClick(Sender: TObject);
begin
  {$IFDEF LGP_DEBUG_OBJ}
  Debug('Liczba obiektów KSeF: ' + IntToStr(ObjList.Count), True);
  {$ENDIF}
end;

procedure TForm1.ListViewObjDblClick(Sender: TObject);
begin
  ButtonObjShowClick(nil);
end;

procedure TForm1.ButtonFileNameEditKSeFBZIPInClick(Sender: TObject);
var
  PackageCount: Integer;
  PartSize: Integer;
  I: Integer;
begin
  OpenDialog1.FileName := FileNameEditKSeFBZIPIn.Text;
  if not OpenDialog1.Execute then
    Exit;
  FileNameEditKSeFBZIPIn.Text := OpenDialog1.FileName;
  if SpinEditKSeFBPartSize.Value = 0 then
    PartSize := KSEF2_MAX_PART_SIZE
  else
    PartSize := SpinEditKSeFBPartSize.Value;
  PackageCount := DivModInc(FileSize(OpenDialog1.FileName), PartSize);
  StringGridKSeFBEncOutFiles.RowCount := PackageCount + 1;
  for I := 1 to PackageCount do
    StringGridKSeFBEncOutFiles.Cells[0, I] := OpenDialog1.FileName + '.part' + IntToStr(I) + '.aes';
end;

procedure TForm1.ButtonKSeFBPrepareClick(Sender: TObject);
var
  ZipInStream: TFileStream;
begin
  ZipInStream := nil;
  if Assigned(BatchRequest) and (ListViewObj.FindData(0, BatchRequest, True, True) = nil) then
    FreeAndNil(BatchRequest)
  else
    BatchRequest := nil;
  Debug('Przygotowanie paczki faktur', True);
  try
    try
      ZipInStream := TFileStream.Create(FileNameEditKSeFBZIPIn.Text, fmOpenRead);
      KSeF.FormCode := TlgKSeFFormCode(ComboBoxIFormCode.ItemIndex);
      KSeF.FormCodeSystemCode := EditKSeFIFormCodeSystemCode.Text;
      KSeF.FormCodeSchemaVersion := EditKSeFIFormCodeSchemaVersion.Text;
      KSeF.FormCodeValue := EditKSeFIFormCodeValue.Text;
      KSeF.BatchPartSize := SpinEditKSeFBPartSize.Value;
      KSeF.OnRequestPartStream := KSeFRequestPartStream;
      BatchRequest := KSeF.BatchPrepare(ZipInStream);
      Debug('Przygotowano paczkê do wys³ania.');
      Debug('Zawartoœæ: ' + BatchRequest.AsJSONString);
      AddObject(BatchRequest);
      GroupBoxKSeFB2.Enabled := True;
      SpinEditKSeFBPartNumber.MaxValue := BatchRequest.BatchFile.FileParts.Count;
    except
      on E: Exception do
        DebugException(E);
    end;
  finally
    if Assigned(ZipInStream) then
      ZipInStream.Free;
    if Assigned(CurrentPartStream) then
      CurrentPartStream.Free;
  end;
end;

procedure TForm1.ButtonKSeFBOpenClick(Sender: TObject);
begin
  if Assigned(BatchResponse) and (ListViewObj.FindData(0, BatchResponse, True, True) = nil) then
    FreeAndNil(BatchResponse)
  else
    BatchResponse := nil;
  Debug('Otwarcie sesji wsadowej dla przygotowanej paczki', True);
  try
    BatchResponse := KSeF.BatchOpen(BatchRequest);
    Debug('Sesja zosta³a otwarta, nr ref: ' + BatchResponse.ReferenceNumber);
    Debug('OdpowiedŸ: ' + BatchResponse.RawResponse);
    AddObject(BatchResponse);
    GroupBoxKSeFB3.Enabled := True;
    GroupBoxKSeFB4.Enabled := True;
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TForm1.ButtonKSeFBSendClick(Sender: TObject);
var
  FileStream: TFileStream;
  I: Integer;
  FromIdx, ToIdx: Integer;
begin
  FileStream := nil;
  Debug('Wysy³anie paczki faktur', True);
  if SpinEditKSeFBPartNumber.Value = 0 then
  begin
    FromIdx := 0;
    ToIdx := BatchResponse.PartUploadRequests.Count - 1;
  end
  else
  begin
    FromIdx := SpinEditKSeFBPartNumber.Value - 1;
    ToIdx := SpinEditKSeFBPartNumber.Value - 1;
  end;
  try
    try
      for I := FromIdx to ToIdx do
      begin
        FileStream := TFileStream.Create(StringGridKSeFBEncOutFiles.Cells[0, I + 1], fmOpenRead);
        KSeF.BatchSendPart(BatchResponse.PartUploadRequests[I], FileStream);
        Debug('Wys³ano czêœæ ' + IntToStr(I + 1));
        FreeAndNil(FileStream);
      end;
    except
      on E: Exception do
        DebugException(E);
    end;
  finally
    if Assigned(FileStream) then
      FileStream.Free;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Debug('Zamkniêcie sesji wsadowej', True);
  try
    KSeF.BatchClose;
    Debug('Sesja zosta³a zamkniêta.');
    GroupBoxKSeFB2.Enabled := False;
    GroupBoxKSeFB3.Enabled := False;
    GroupBoxKSeFB4.Enabled := False;
    if ListViewObj.FindData(0, BatchRequest, True, True) = nil then
      BatchRequest.Free;
    BatchRequest := nil;
    if ListViewObj.FindData(0, BatchResponse, True, True) = nil then
      BatchResponse.Free;
    BatchResponse := nil;
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TForm1.ButtonKSeFSessionsClick(Sender: TObject);
var
  Statuses: TKSeF2CommonSessionStatuses;
  Status: TKSeF2CommonSessionStatus;
  Response: TKSeF2SessionsQueryResponse;
  D1, D2, D3, D4, D5, D6: TDateTime;
begin
  Debug('Pobranie listy sesji', True);
  try
    if not DateTimePickerKSeFSCreatedFrom.Checked then
      D1 := 0
    else
      D2 := DateTimePickerKSeFSCreatedFrom.DateTime;
    if not DateTimePickerKSeFSCreatedTo.Checked then
      D2 := 0
    else
      D2 := DateTimePickerKSeFSCreatedTo.DateTime;
    if not DateTimePickerKSeFSClosedFrom.Checked then
      D3 := 0
    else
      D3 := DateTimePickerKSeFSClosedFrom.DateTime;
    if not DateTimePickerKSeFSClosedTo.Checked then
      D4 := 0
    else
      D4 := DateTimePickerKSeFSClosedTo.DateTime;
    if not DateTimePickerKSeFSModifiedFrom.Checked then
      D5 := 0
    else
      D5 := DateTimePickerKSeFSModifiedFrom.DateTime;
    if not DateTimePickerKSeFSModifiedTo.Checked then
      D6 := 0
    else
      D6 := DateTimePickerKSeFSModifiedTo.DateTime;
    Statuses := [];
    for Status := Low(TKSeF2CommonSessionStatus) to High(TKSeF2CommonSessionStatus) do
      if CheckGroupKSeFSSesionStatuses.Checked[Ord(Status)] then
        Include(Statuses, Status);
    Response := KSeF.StatusSessions(TKSeF2SessionType(ComboBoxKSeFSSessionType.ItemIndex),
      EditKSeFSContinuationToken.Text, SpinEditKSeFSPageSize1.Value, EditKSeFSReferenceNumber.Text,
      D1, D2, D3, D4, D5, D6, Statuses);
    Debug('Pobrano, liczba sesji: ' + IntToStr(Response.Sessions.Count));
    Debug('OdpowiedŸ: ' + Response.RawResponse);
    EditKSeFSContinuationToken.Text := Response.ContinuationToken;
    AddObject(Response);
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TForm1.ButtonKSeFSessionClick(Sender: TObject);
var
  Response: TKSeF2SessionStatusResponse;
begin
  Debug('Pobranie statusu sesji', True);
  try
    Response := KSeF.StatusSession(EditKSeFSReferenceNumber2.Text);
    Debug('Pobrano, status: ' + Response.Status.Description);
    Debug('OdpowiedŸ: ' + Response.RawResponse);
    AddObject(Response);
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TForm1.ButtonKSeFSessionsInvoiceClick(Sender: TObject);
var
  Response: TKSeF2SessionInvoicesResponse;
begin
  Debug('Pobranie statusu sesji', True);
  try
    Response := KSeF.StatusInvoices(EditKSeFSReferenceNumber1.Text,
      EditKSeFSContinuationToken1.Text, SpinEditKSeFS1PageSize1.Value);
    Debug('Pobrano, liczba faktur: ' + IntToStr(Response.Invoices.Count));
    Debug('OdpowiedŸ: ' + Response.RawResponse);
    AddObject(Response);
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TForm1.ButtonKSeFSessionInvoiceClick(Sender: TObject);
var
  Response: TKSeF2SessionInvoicesResponse;
begin
  Debug('Pobranie statusu faktury z sesji', True);
  try
    Response := KSeF.StatusSessionInvoice(EditKSeFSReferenceNumber3.Text,
      EditKSeFSInvoiceReferenceNumber.Text, EditKSeFSContinuationToken1.Text);
    Debug('Pobrano, iloœæ faktur: ' + IntToStr(Response.Invoices.Count));
    Debug('OdpowiedŸ: ' + Response.RawResponse);
    EditKSeFSContinuationToken1.Text := Response.ContinuationToken;
    AddObject(Response);
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TForm1.ButtonKSeFSessionsInvoiceFailedClick(Sender: TObject);
var
  Response: TKSeF2SessionInvoicesResponse;
begin
  Debug('Pobranie niepoprawnie przetworzonych faktur sesji', True);
  try
    Response := KSeF.StatusInvoicesFailed(EditKSeFSReferenceNumber.Text,
      EditKSeFSContinuationToken2.Text, SpinEditKSeFS1PageSize1.Value);
    Debug('Pobrano, liczba faktur: ' + IntToStr(Response.Invoices.Count));
    Debug('OdpowiedŸ: ' + Response.RawResponse);
    EditKSeFSContinuationToken2.Text := Response.ContinuationToken;
    AddObject(Response);
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TForm1.ButtonFileNameEditKSeFUFileClick(Sender: TObject);
begin
  OpenDialog1.FileName := FileNameEditKSeFUFile.Text;
  if OpenDialog1.Execute then
    FileNameEditKSeFUFile.Text := OpenDialog1.FileName;
end;

procedure TForm1.ButtonFileNameEditKSeFUFile1Click(Sender: TObject);
begin
  OpenDialog1.FileName := FileNameEditKSeFUFile1.Text;
  if OpenDialog1.Execute then
    FileNameEditKSeFUFile1.Text := OpenDialog1.FileName;
end;

procedure TForm1.ButtonFileNameEditKSeFUFile2Click(Sender: TObject);
begin
  OpenDialog1.FileName := FileNameEditKSeFUFile2.Text;
  if OpenDialog1.Execute then
    FileNameEditKSeFUFile2.Text := OpenDialog1.FileName;
end;

procedure TForm1.ButtonKSeFUPobierzClick(Sender: TObject);
var
  FileStream: TFileStream;
begin
  FileStream := nil;
  Debug('Pobranie UPO faktury z sesji na podstawie numeru KSeF', True);
  try
    try
      FileStream := TFileStream.Create(FileNameEditKSeFUFile.Text, fmCreate);
      KSeF.StatusUpoKsef(EditKSeFUReferenceNumber.Text, EditKSeFUKSefNumber.Text,
        FileStream);
      Debug('Pobrano UPO do pliku: ' + FileNameEditKSeFUFile.Text);
    except
      on E: Exception do
        DebugException(E);
    end;
  finally
    if Assigned(FileStream) then
      FileStream.Free;
  end;
end;

procedure TForm1.ButtonKSeFUPobierz1Click(Sender: TObject);
var
  FileStream: TFileStream;
begin
  FileStream := nil;
  Debug('Pobranie UPO faktury z sesji na podstawie numeru KSeF', True);
  try
    try
      FileStream := TFileStream.Create(FileNameEditKSeFUFile1.Text, fmCreate);
      KSeF.StatusUpoSessionInvoice(EditKSeFUReferenceNumber1.Text, EditKSeFUInvoiceReferenceNumber.Text,
        FileStream);
      Debug('Pobrano UPO do pliku: ' + FileNameEditKSeFUFile1.Text);
    except
      on E: Exception do
        DebugException(E);
    end;
  finally
    if Assigned(FileStream) then
      FileStream.Free;
  end;
end;

procedure TForm1.ButtonKSeFUPobierz2Click(Sender: TObject);
var
  FileStream: TFileStream;
begin
  FileStream := nil;
  Debug('Pobranie UPO faktury z sesji na podstawie numeru KSeF', True);
  try
    try
      FileStream := TFileStream.Create(FileNameEditKSeFUFile2.Text, fmCreate);
      KSeF.StatusUpoKsef(EditKSeFUReferenceNumber2.Text, EditKSeFUUpoReferenceNumber2.Text,
        FileStream);
      Debug('Pobrano UPO do pliku: ' + FileNameEditKSeFUFile2.Text);
    except
      on E: Exception do
        DebugException(E);
    end;
  finally
    if Assigned(FileStream) then
      FileStream.Free;
  end;
end;

procedure TForm1.ButtonFileNameEditKSeFDOutFileClick(Sender: TObject);
begin
  OpenDialog1.FileName := FileNameEditKSeFDOutFile.Text;
  if OpenDialog1.Execute then
    FileNameEditKSeFDOutFile.Text := OpenDialog1.FileName;
end;

procedure TForm1.ButtonFileNameEditKSeFDEFileNameClick(Sender: TObject);
begin
  OpenDialog1.FileName := FileNameEditKSeFDEFileName.Text;
  if OpenDialog1.Execute then
    FileNameEditKSeFDEFileName.Text := OpenDialog1.FileName;
end;

procedure TForm1.ButtonKSeFDDownloadClick(Sender: TObject);
var
  FileStream: TFileStream;
begin
  FileStream := nil;
  Debug('Pobieranie faktury po numerze Ksef', True);
  try
    try
      FileStream := TFileStream.Create(FileNameEditKSeFDOutFile.Text, fmCreate);
      KSeF.InvoicesKsef(EditKSeFDKsefNumber.Text, FileStream);
      Debug('Pobrano do pliku: ' + FileNameEditKSeFDOutFile.Text);
    except
      on E: Exception do
        DebugException(E);
    end;
  finally
    if Assigned(FileStream) then
      FileStream.Free;
  end;
end;

procedure TForm1.ButtonKSeFDFClearClick(Sender: TObject);
var
  I: Integer;
begin
  ComboBoxKSeFDFSubjectType.ItemHeight := 0;
  ComboBoxKSeFDFDateType.ItemHeight := 0;
  DateTimePickerKSeFDFFrom.Date := Now;
  DateTimePickerKSeFDFTo.Checked := False;
  EditKSeFDFKsefNumber.Text := '';
  ComboBoxKSeFDFAmountType.ItemIndex := 0;
  FloatSpinEditKSeFDFFrom.Value := 0;
  FloatSpinEditKSeFDFTo.Value := 0;
  EditKSeFDFSellerNip.Text := '';
  ComboBoxKSeFDFBuyerIdentifierType.ItemIndex := 0;
  EditKSeFDFBuyerIdentifierValue.Text := '';
  EditKSeFDFCurrencyCodes.Text := '';
  ComboBoxKSeFDFInvoicingMode.ItemIndex := 0;
  ComboBoxKSeFDFIsSelfInvoicing.ItemIndex := 0;
  ComboBoxKSeFDFFormType.ItemIndex := 0;
  for I := 0 to CheckGroupKSeFDFInvoiceType.Items.Count - 1 do
    CheckGroupKSeFDFInvoiceType.Checked[I] := False;
  ComboBoxKSeFDFHasAttachment.ItemIndex := 0;
end;

procedure TForm1.ButtonKSeFDMetadataClick(Sender: TObject);
var
  Filter: TKSeF2InvoiceQueryFilters;
  Response: TKSeF2QueryInvoicesMetadataResponse;
begin
  Debug('Pobranie listy metadanych faktur', True);
  try
    Filter := GenerateFilter;
    AddObject(Filter);
    Response := KSeF.InvoicesQueryMetadata(Filter, SpinEditKSeFDPageOffset.Value,
      SpinEditKSeFDPageSize.Value);
    Debug('OdpowiedŸ: ' + Response.RawResponse);
    Debug('Iloœæ faktur: ' + IntToStr(Response.Invoices.Count));
    AddObject(Response);
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TForm1.ButtonKSeFDExportClick(Sender: TObject);
var
  Filter: TKSeF2InvoiceQueryFilters;
begin
  Debug('Eksport paczki faktur', True);
  try
    Filter := GenerateFilter;
    AddObject(Filter);
    EditKSeFDEOperationReferenceNumber.Text := KSeF.InvoicesExportSimple(Filter);
    Debug('Numer referencyjny operacji: ' + EditKSeFDEOperationReferenceNumber.Text);
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TForm1.ButtonKSeFDStatusClick(Sender: TObject);
var
  Response: TKSeF2InvoiceExportStatusResponse;
begin
  Debug('Pobranie statusu eksportu paczki faktur', True);
  try
    Response := KSeF.InvoicesExportStatus(EditKSeFDEOperationReferenceNumber.Text);
    Debug('OdpowiedŸ: ' + Response.RawResponse);
    Debug('Status: ' + IntToStr(Response.Status.Code));
    Debug('Opis: ' + Response.Status.Description);
    if (Response.Status.Code = 200) and (Response.Package.Parts.Count > 0) then
    begin
      if Assigned(ExportResponse) and (ListViewObj.FindData(0, Pointer(ExportResponse), True, True) = nil) then
      begin
        ExportResponse.Free;
        ExportResponse := nil;
      end;
      ExportResponse := Response;
      GroupBoxKSeFD1.Enabled := True;
    end;
    AddObject(Response);
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TForm1.ButtonKSeFDEDownloadClick(Sender: TObject);
var
  FileStream: TFileStream;
begin
  FileStream := nil;
  Debug('Pobieranie paczki faktur', True);
  try
    try
      FileStream := TFileStream.Create(FileNameEditKSeFDEFileName.Text, fmCreate);
      KSeF.InvoicesExportDownload(ExportResponse, FileStream);
      Debug('Pobrano do pliku: ' + FileNameEditKSeFDEFileName.Text);
    except
      on E: Exception do
        DebugException(E);
    end;
  finally
    if Assigned(FileStream) then
      FileStream.Free;
  end;
end;

procedure TForm1.ButtonKSeFTKGenerateClick(Sender: TObject);
var
  Response: TKSeF2GenerateTokenResponse;
  Perms: TKSeF2TokenPermissions;
  Perm: TKSeF2TokenPermissionType;
begin
  Debug('Wygenerowanie nowego tokena', True);
  try
    Perms := [];
    for Perm := Low(TKSeF2TokenPermissionType) to High(TKSeF2TokenPermissionType) do
      if CheckGroupKSeFTKPermisions.Checked[Ord(Perm)] then
        Include(Perms, Perm);
    Response := KSeF.TokensGenerate(Perms, EditKSeFTKDescription.Text);
    Debug('OdpowiedŸ: ' + Response.RawResponse);
    Debug('Utworzono token: ' + Response.Token);
    Debug('Nr ref: ' + Response.ReferenceNumber);
    AddObject(Response);
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TForm1.ButtonKSeFTKListClick(Sender: TObject);
var
  Response: TKSeF2QueryTokensResponse;
  Status: TKSeF2AuthenticationTokenStatus;
  Statuses: TKSeF2AuthenticationTokenStatuses;
begin
  Debug('Pobranie listy wygenerowanych tokenów', True);
  try
    Statuses := [];
    for Status := Low(TKSeF2AuthenticationTokenStatus) to High(TKSeF2AuthenticationTokenStatus) do
      if CheckGroupKSeFTKStatus.Checked[Ord(Status)] then
        Include(Statuses, Status);
    Response := KSeF.TokensList(Statuses, EditKSeFTKDescrFlt.Text,
      EditKSeFTKAuthorIdentifier.Text,
      TKSeF2TokenAuthorIdentifierType(ComboBoxKSeFTKAuthorIdentifierType.ItemIndex),
      SpinEditKSeFTKPageSize.Value, EditKSeFTKContinuationToken.Text);
    Debug('OdpowiedŸ: ' + Response.RawResponse);
    Debug('Iloœæ tokenów: ' + IntToStr(Response.Tokens.Count));
    AddObject(Response);
    EditKSeFTKContinuationToken.Text := Response.ContinuationToken;
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TForm1.ButtonKSeFTKStatusClick(Sender: TObject);
var
  Response: TKSeF2TokenStatusResponse;
begin
  Debug('Pobranie statusu tokena', True);
  try
    Response := KSeF.TokensStatus(EditKSeFTKSReferenceNumber.Text);
    Debug('OdpowiedŸ: ' + Response.RawResponse);
    AddObject(Response);
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TForm1.ButtonKSeFTKDeleteClick(Sender: TObject);
begin
  Debug('Uniewa¿nienie tokena', True);
  try
    KSeF.TokensRevoke(EditKSeFTKDReferenceNumber.Text);
    Debug('Uniewa¿niono');
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  StringGridDTUPSubunits.RowCount := StringGridDTUPSubunits.RowCount + 1;
end;

procedure TForm1.ButtonKSeFDTUtworzPodmiotClick(Sender: TObject);
var
  Request: TKSeF2SubjectCreateRequest;
  I: Integer;
  Subunit: TKSeF2Subunit;
begin
  Request := nil;
  Debug('Utworzenie podmiotu', True);
  try
    try
      Request := TKSeF2SubjectCreateRequest.Create(nil);
      Request.SubjectNip := EditKSeFDTUPSubjectNip.Text;
      if ComboBoxKSeFDTUPSubjectType.ItemIndex >= 0 then
        Request.SubjectType := TKSeF2SubjectType(ComboBoxKSeFDTUPSubjectType.ItemIndex);
      for I := 1 to StringGridDTUPSubunits.RowCount - 1 do
        if (StringGridDTUPSubunits.Cells[0, I] <> '') or (StringGridDTUPSubunits.Cells[1, I] <> '') then
        begin
          Subunit := TKSeF2Subunit.Create(nil);
          Subunit.SubjectNip := StringGridDTUPSubunits.Cells[0, I];
          Subunit.Description := StringGridDTUPSubunits.Cells[1, I];
          Request.Subunits.Add(Subunit);
        end;
      Request.Description := EditKSeFDTUPDescription.Text;
      Request.CreatedDate := DateTimePickerKSeFDTUPCreationDate.DateTime;
      Debug('Zapytanie: ' + Request.AsJSONString);
      KSeF.TestdataSubject(Request);
      Debug('Wykonano');
    except
      on E: Exception do
        DebugException(E);
    end;
  finally
    if Assigned(Request) then
      Request.Free;
  end;
end;

procedure TForm1.ButtonKSeFDTUsunPodmiotClick(Sender: TObject);
begin
  Debug('Usuniêcie podmiotu', True);
  try
    KSeF.TestdataSubjectRemove(EditKSeFDTUsPSubjectNip.Text);
    Debug('Wykonano');
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TForm1.ButtonKSeFDTUtworzOsobeClick(Sender: TObject);
var
  Request: TKSeF2PersonCreateRequest;
begin
  Request := nil;
  Debug('Utworzenie osoby fizycznej', True);
  try
    Request := TKSeF2PersonCreateRequest.Create(nil);
    Request.Nip := EditKSeFDTUONip.Text;
    Request.Pesel := EditKSeFDTUOPesel.Text;
    Request.Description := EditKSeFDTUODescription.Text;
    if DateTimePickerKSeFDTUOCreationDate.Checked then
      Request.CreatedDate := DateTimePickerKSeFDTUOCreationDate.DateTime;
    AddObject(Request);
    Debug('Zapytanie: ' + Request.AsJSONString);
    KSeF.TestdataPerson(Request);
    Debug('Wykonano');
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TForm1.ButtonKSeFDTUsunOsobeClick(Sender: TObject);
begin
  Debug('Usuniêcie osoby fizycznej', True);
  try
    KSeF.TestdataSubjectRemove(EditKSeFDTUsPSubjectNip.Text);
    Debug('Wykonano');
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TForm1.ButtonKSeFGetPublicKeyCertificatesClick(Sender: TObject);
var
  Response: TKSeF2PublicKeyCertificateResponse;
  I: Integer;
  BStream: TMemoryStream;

function LoadKey(AKeyData: String): TlgRSAPublicKey;
var
  B: TBytes;
begin
  BStream := TMemoryStream.Create;
  B := KSeF.Base64EncoderClass.DecodeBytes(AKeyData);
  BStream.Write(B[0], Length(B));
  BStream.Position := 0;
  Result := KSeF.RSAPublicKeyClass.Create(KSeF, BStream, letDER);
  FreeAndNil(BStream);
end;

begin
  BStream := nil;
  Debug('Pobieranie kluczy publicznych', True);
  try
    Response := KSeF.SecurityPublicKeyCertificates(TlgKSeFGateType(ComboBoxKSeFPKCertBramka.ItemIndex));
    Debug('OdpowiedŸ: ' + Response.RawResponse);
    AddObject(Response);

    // Zainstaluj pobrane klucze
    for I := 0 to Response.Items.Count - 1 do
    begin
      if kuKsefTokenEncryption in Response.Items[I].Usage then
        KSeF.RSATokenEncKey[TlgKSeFGateType(ComboBoxKSeFPKCertBramka.ItemIndex)]
          := LoadKey(Response.Items[I].Certificate);
      if kuSymmetricKeyEncryption in Response.Items[I].Usage then
        KSeF.RSASymmetricKeyEncKey[TlgKSeFGateType(ComboBoxKSeFPKCertBramka.ItemIndex)]
          := LoadKey(Response.Items[I].Certificate);
    end;

  except
    on E: Exception do
      DebugException(E);
  end;
  if Assigned(BStream) then
    BStream.Free;
end;

procedure TForm1.ButtonKSeFLoadKeyTokenClick(Sender: TObject);
begin
  PopupMenuKeys.PopupComponent := ButtonKSeFLoadKeyToken;
  PopupMenuKeys.PopUp(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TForm1.ButtonKSeFLoadKeyKeyExClick(Sender: TObject);
begin
  PopupMenuKeys.PopupComponent := ButtonKSeFLoadKeyKeyEx;
  PopupMenuKeys.PopUp(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TForm1.ButtonFileNameEditKSeFIDocClick(Sender: TObject);
begin
  OpenDialog1.FileName := FileNameEditKSeFIDoc.Text;
  if OpenDialog1.Execute then
    FileNameEditKSeFIDoc.Text := OpenDialog1.FileName;
end;

end.
