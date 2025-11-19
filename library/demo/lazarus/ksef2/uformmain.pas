unit uFormMain;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  uFormMainBase, LibGovPl4Backend, LibGovPl4KSeF2, LibGovPl4KSeFObj2,
  LibGovPl4XAdES, ComCtrls, LibGovPl4Intf, DateTimePicker, EditBtn, Menus, Spin,
  Grids;

type

  { TFormMain }

  TFormMain = class(TFormMainBase)
    Button2: TButton;
    ButtonKSeFASessions: TButton;
    ButtonKSeFASessionSet: TButton;
    ButtonKSeFASessionTerm: TButton;
    ButtonKSeFASessionTermCur: TButton;
    ButtonKSeFAStatus: TButton;
    ButtonKSeFATokenKsef: TButton;
    ButtonKSeFATokenRedem: TButton;
    ButtonKSeFATokenRefresh: TButton;
    ButtonKSeFAXAdES: TButton;
    ButtonKSeFAXAdESExt: TButton;
    ButtonKSeFAXAdESSave: TButton;
    ButtonKSeFBOpen: TButton;
    ButtonKSeFBPrepare: TButton;
    ButtonKSeFBSend: TButton;
    ButtonKSeFDDownload: TButton;
    ButtonKSeFDEDownload: TButton;
    ButtonKSeFDExport: TButton;
    ButtonKSeFDFClear: TButton;
    ButtonKSeFDMetadata: TButton;
    ButtonKSeFDStatus: TButton;
    ButtonKSeFDTUsunOsobe: TButton;
    ButtonKSeFDTUsunPodmiot: TButton;
    ButtonKSeFDTUtworzOsobe: TButton;
    ButtonKSeFDTUtworzPodmiot: TButton;
    ButtonKSeFGetPublicKeyCertificates: TButton;
    ButtonKSeFIClose: TButton;
    ButtonKSeFIOpen: TButton;
    ButtonKSeFISend: TButton;
    ButtonKSeFLoadKeyKeyEx: TButton;
    ButtonKSeFLoadKeyToken: TButton;
    ButtonKSeFSession: TButton;
    ButtonKSeFSessionInvoice: TButton;
    ButtonKSeFSessions: TButton;
    ButtonKSeFSessionsInvoice: TButton;
    ButtonKSeFSessionsInvoiceFailed: TButton;
    ButtonKSeFTKDelete: TButton;
    ButtonKSeFTKGenerate: TButton;
    ButtonKSeFTKList: TButton;
    ButtonKSeFTKStatus: TButton;
    ButtonKSeFUPobierz: TButton;
    ButtonKSeFUPobierz1: TButton;
    ButtonKSeFUPobierz2: TButton;
    ButtonObjClear: TButton;
    ButtonObjCount: TButton;
    ButtonObjShow: TButton;
    CheckBoxKSeFAutoRefresh: TCheckBox;
    CheckBoxKSeFIOffline: TCheckBox;
    CheckBoxKSeFTDUOIsBailiff: TCheckBox;
    CheckGroupKSeFDFInvoiceType: TCheckGroup;
    CheckGroupKSeFSSesionStatuses: TCheckGroup;
    CheckGroupKSeFTKPermisions: TCheckGroup;
    CheckGroupKSeFTKStatus: TCheckGroup;
    ComboBoxACertificate: TComboBox;
    ComboBoxAES256: TComboBox;
    ComboBoxBase64: TComboBox;
    ComboBoxBFormCode: TComboBox;
    ComboBoxHTTPCli: TComboBox;
    ComboBoxIFormCode: TComboBox;
    ComboBoxKSeFABramka: TComboBox;
    ComboBoxKSeFAIdentifierType: TComboBox;
    ComboBoxKSeFASubjectType: TComboBox;
    ComboBoxKSeFASubjectTypeExt: TComboBox;
    ComboBoxKSeFDFAmountType: TComboBox;
    ComboBoxKSeFDFBuyerIdentifierType: TComboBox;
    ComboBoxKSeFDFDateType: TComboBox;
    ComboBoxKSeFDFFormType: TComboBox;
    ComboBoxKSeFDFHasAttachment: TComboBox;
    ComboBoxKSeFDFInvoicingMode: TComboBox;
    ComboBoxKSeFDFIsSelfInvoicing: TComboBox;
    ComboBoxKSeFDFSubjectType: TComboBox;
    ComboBoxKSeFDTUPSubjectType: TComboBox;
    ComboBoxKSeFPKCertBramka: TComboBox;
    ComboBoxKSeFSSessionType: TComboBox;
    ComboBoxKSeFTKAuthorIdentifierType: TComboBox;
    ComboBoxRandGen: TComboBox;
    ComboBoxRSAEnc: TComboBox;
    ComboBoxSHA256: TComboBox;
    DateTimePickerKSeFAAccessTokenValidUntil: TDateTimePicker;
    DateTimePickerKSeFARefreshTokenValidUntil: TDateTimePicker;
    DateTimePickerKSeFDFFrom: TDateTimePicker;
    DateTimePickerKSeFDFTo: TDateTimePicker;
    DateTimePickerKSeFDTUOCreationDate: TDateTimePicker;
    DateTimePickerKSeFDTUPCreationDate: TDateTimePicker;
    DateTimePickerKSeFSClosedFrom: TDateTimePicker;
    DateTimePickerKSeFSClosedTo: TDateTimePicker;
    DateTimePickerKSeFSCreatedFrom: TDateTimePicker;
    DateTimePickerKSeFSCreatedTo: TDateTimePicker;
    DateTimePickerKSeFSModifiedFrom: TDateTimePicker;
    DateTimePickerKSeFSModifiedTo: TDateTimePicker;
    EditKSeFAAccessToken: TEdit;
    EditKSeFAIdentifier: TEdit;
    EditKSeFARefreshToken: TEdit;
    EditKSeFASessionRefNo: TEdit;
    EditKSeFATokenKsef: TEdit;
    EditKSeFBFormCodeSchemaVersion: TEdit;
    EditKSeFBFormCodeSystemCode: TEdit;
    EditKSeFBFormCodeValue: TEdit;
    EditKSeFDEOperationReferenceNumber: TEdit;
    EditKSeFDFBuyerIdentifierValue: TEdit;
    EditKSeFDFCurrencyCodes: TEdit;
    EditKSeFDFInvoiceNumber: TEdit;
    EditKSeFDFKsefNumber: TEdit;
    EditKSeFDFSellerNip: TEdit;
    EditKSeFDKsefNumber: TEdit;
    EditKSeFDTUODescription: TEdit;
    EditKSeFDTUONip: TEdit;
    EditKSeFDTUOPesel: TEdit;
    EditKSeFDTUPDescription: TEdit;
    EditKSeFDTUPSubjectNip: TEdit;
    EditKSeFDTUsONip: TEdit;
    EditKSeFDTUsPSubjectNip: TEdit;
    EditKSeFIFormCodeSchemaVersion: TEdit;
    EditKSeFIFormCodeSystemCode: TEdit;
    EditKSeFIFormCodeValue: TEdit;
    EditKSeFIHashOfCorrectedInvoice: TEdit;
    EditKSeFSContinuationToken: TEdit;
    EditKSeFSContinuationToken1: TEdit;
    EditKSeFSContinuationToken2: TEdit;
    EditKSeFSInvoiceReferenceNumber: TEdit;
    EditKSeFSReferenceNumber: TEdit;
    EditKSeFSReferenceNumber1: TEdit;
    EditKSeFSReferenceNumber2: TEdit;
    EditKSeFSReferenceNumber3: TEdit;
    EditKSeFSReferenceNumber4: TEdit;
    EditKSeFTKAuthorIdentifier: TEdit;
    EditKSeFTKContinuationToken: TEdit;
    EditKSeFTKDescrFlt: TEdit;
    EditKSeFTKDescription: TEdit;
    EditKSeFTKDReferenceNumber: TEdit;
    EditKSeFTKSReferenceNumber: TEdit;
    EditKSeFUInvoiceReferenceNumber: TEdit;
    EditKSeFUKSefNumber: TEdit;
    EditKSeFUReferenceNumber: TEdit;
    EditKSeFUReferenceNumber1: TEdit;
    EditKSeFUReferenceNumber2: TEdit;
    EditKSeFUUpoReferenceNumber2: TEdit;
    FileNameEditKSeFAInXades: TFileNameEdit;
    FileNameEditKSeFAOutXades: TFileNameEdit;
    FileNameEditKSeFBZIPIn: TFileNameEdit;
    FileNameEditKSeFDEFileName: TFileNameEdit;
    FileNameEditKSeFDOutFile: TFileNameEdit;
    FileNameEditKSeFIDoc: TFileNameEdit;
    FileNameEditKSeFUFile: TFileNameEdit;
    FileNameEditKSeFUFile1: TFileNameEdit;
    FileNameEditKSeFUFile2: TFileNameEdit;
    FloatSpinEditKSeFDFFrom: TFloatSpinEdit;
    FloatSpinEditKSeFDFTo: TFloatSpinEdit;
    GroupBox1: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    GroupBox13: TGroupBox;
    GroupBox14: TGroupBox;
    GroupBox15: TGroupBox;
    GroupBox16: TGroupBox;
    GroupBox17: TGroupBox;
    GroupBox18: TGroupBox;
    GroupBox19: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox20: TGroupBox;
    GroupBox21: TGroupBox;
    GroupBox22: TGroupBox;
    GroupBox25: TGroupBox;
    GroupBox26: TGroupBox;
    GroupBox27: TGroupBox;
    GroupBox28: TGroupBox;
    GroupBox29: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox30: TGroupBox;
    GroupBox31: TGroupBox;
    GroupBox32: TGroupBox;
    GroupBox33: TGroupBox;
    GroupBox34: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    GroupBoxKSeFA1: TGroupBox;
    GroupBoxKSeFA2: TGroupBox;
    GroupBoxKSeFA3: TGroupBox;
    GroupBoxKSeFA4: TGroupBox;
    GroupBoxKSeFA5: TGroupBox;
    GroupBoxKSeFA6: TGroupBox;
    GroupBoxKSeFB1: TGroupBox;
    GroupBoxKSeFB2: TGroupBox;
    GroupBoxKSeFB3: TGroupBox;
    GroupBoxKSeFB4: TGroupBox;
    GroupBoxKSeFD1: TGroupBox;
    GroupBoxKSeFSetup: TGroupBox;
    Label10: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label122: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label4: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label5: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label6: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label7: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label8: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label9: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    ListViewObj: TListView;
    OpenDialogKey: TOpenDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    PopupMenuKeys: TPopupMenu;
    SaveDialogKSeFBPart: TSaveDialog;
    ScrollBox2: TScrollBox;
    ScrollBox3: TScrollBox;
    ScrollBox4: TScrollBox;
    ScrollBox5: TScrollBox;
    ScrollBox6: TScrollBox;
    ScrollBox7: TScrollBox;
    ScrollBox8: TScrollBox;
    ScrollBox9: TScrollBox;
    SpinEditKSeFBPartNumber: TSpinEdit;
    SpinEditKSeFBPartSize: TSpinEdit;
    SpinEditKSeFDPageOffset: TSpinEdit;
    SpinEditKSeFDPageSize: TSpinEdit;
    SpinEditKSeFS1PageSize1: TSpinEdit;
    SpinEditKSeFS1PageSize2: TSpinEdit;
    SpinEditKSeFSPageSize1: TSpinEdit;
    SpinEditKSeFTKPageSize: TSpinEdit;
    Splitter2: TSplitter;
    StringGridDTUPSubunits: TStringGrid;
    StringGridKSeFBEncOutFiles: TStringGrid;
    TabSheetKSeF2PublicKeys: TTabSheet;
    TabSheetKSeF2TestData: TTabSheet;
    TabSheetKSeFToken: TTabSheet;
    TabSheetKSeFDownload: TTabSheet;
    TabSheetKSeFUpo: TTabSheet;
    TabSheetKSeFStatus: TTabSheet;
    TabSheetKSeFBatch: TTabSheet;
    TabSheetKSeFInteractive: TTabSheet;
    TabSheetKSeF2Auth: TTabSheet;
    procedure Button2Click(Sender: TObject);
    procedure ButtonKSeFASessionsClick(Sender: TObject);
    procedure ButtonKSeFASessionSetClick(Sender: TObject);
    procedure ButtonKSeFASessionTermClick(Sender: TObject);
    procedure ButtonKSeFASessionTermCurClick(Sender: TObject);
    procedure ButtonKSeFAStatusClick(Sender: TObject);
    procedure ButtonKSeFATokenKsefClick(Sender: TObject);
    procedure ButtonKSeFATokenRedemClick(Sender: TObject);
    procedure ButtonKSeFATokenRefreshClick(Sender: TObject);
    procedure ButtonKSeFAXAdESClick(Sender: TObject);
    procedure ButtonKSeFAXAdESExtClick(Sender: TObject);
    procedure ButtonKSeFAXAdESSaveClick(Sender: TObject);
    procedure ButtonKSeFBOpenClick(Sender: TObject);
    procedure ButtonKSeFBPrepareClick(Sender: TObject);
    procedure ButtonKSeFBSendClick(Sender: TObject);
    procedure ButtonKSeFDDownloadClick(Sender: TObject);
    procedure ButtonKSeFDEDownloadClick(Sender: TObject);
    procedure ButtonKSeFDExportClick(Sender: TObject);
    procedure ButtonKSeFDFClearClick(Sender: TObject);
    procedure ButtonKSeFDMetadataClick(Sender: TObject);
    procedure ButtonKSeFDStatusClick(Sender: TObject);
    procedure ButtonKSeFDTUsunOsobeClick(Sender: TObject);
    procedure ButtonKSeFDTUsunPodmiotClick(Sender: TObject);
    procedure ButtonKSeFDTUtworzOsobeClick(Sender: TObject);
    procedure ButtonKSeFDTUtworzPodmiotClick(Sender: TObject);
    procedure ButtonKSeFGetPublicKeyCertificatesClick(Sender: TObject);
    procedure ButtonKSeFICloseClick(Sender: TObject);
    procedure ButtonKSeFIOpenClick(Sender: TObject);
    procedure ButtonKSeFISendClick(Sender: TObject);
    procedure ButtonKSeFLoadKeyKeyExClick(Sender: TObject);
    procedure ButtonKSeFLoadKeyTokenClick(Sender: TObject);
    procedure ButtonKSeFSessionClick(Sender: TObject);
    procedure ButtonKSeFSessionInvoiceClick(Sender: TObject);
    procedure ButtonKSeFSessionsClick(Sender: TObject);
    procedure ButtonKSeFSessionsInvoiceClick(Sender: TObject);
    procedure ButtonKSeFSessionsInvoiceFailedClick(Sender: TObject);
    procedure ButtonKSeFTKDeleteClick(Sender: TObject);
    procedure ButtonKSeFTKGenerateClick(Sender: TObject);
    procedure ButtonKSeFTKListClick(Sender: TObject);
    procedure ButtonKSeFTKStatusClick(Sender: TObject);
    procedure ButtonKSeFUPobierz1Click(Sender: TObject);
    procedure ButtonKSeFUPobierz2Click(Sender: TObject);
    procedure ButtonKSeFUPobierzClick(Sender: TObject);
    procedure ButtonObjClearClick(Sender: TObject);
    procedure ButtonObjCountClick(Sender: TObject);
    procedure ButtonObjShowClick(Sender: TObject);
    procedure FileNameEditKSeFBZIPInAcceptFileName(Sender: TObject;
      var Value: String);
    procedure FormShow(Sender: TObject); override;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction); override;
    procedure ButtonSetupClick(Sender: TObject); override;
    procedure StringGridKSeFBEncOutFilesButtonClick(Sender: TObject; aCol,
      aRow: Integer);
  private
    procedure SetKSeFPagesVisible(AValue: Boolean);
    procedure PopupMenuKeysClick(Sender: TObject);
  public
    HTTPClient: TlgoHTTPClient;
    XAdES: TlgoXAdES;
    KSeF: TlgoKSeF2;

    BatchRequest: TKSeF2OpenBatchSessionRequest;
    BatchResponse: TKSeF2OpenBatchSessionResponse;
    CurrentPartStream: TStream;

    ExportResponse: TKSeF2InvoiceExportStatusResponse;

    procedure KSeFRequestPartStream(Sender: TObject; APartNumber: Integer; var APartStream: TStream);

    function GenerateFilter: TKSeF2InvoiceQueryFilters;

    procedure AddObject(AObject: TObject);
    procedure DebugException(AException: Exception);
  end;

var
  FormMain: TFormMain;

implementation

uses
  uFormKSeFObj, IniFiles, basenenc, FileUtil;

{$R *.lfm}

{ TFormMain }

procedure TFormMain.FormShow(Sender: TObject);
var
  SL: TStringList;
begin
  inherited FormShow(Sender);
  SL := TStringList.Create;
  SL.Delimiter := ';';
  SL.DelimitedText := lgplListDrivers(LGP_CLSTYPE_HTTP_CLIENT);
  ComboBoxHTTPCli.Items.AddStrings(SL);
  SL.DelimitedText := lgplListDrivers(LGP_CLSTYPE_RAND_GENERATOR);
  ComboBoxRandGen.Items.AddStrings(SL);
  SL.DelimitedText := lgplListDrivers(LGP_CLSTYPE_BASE64_ENCODER);
  ComboBoxBase64.Items.AddStrings(SL);
  SL.DelimitedText := lgplListDrivers(LGP_CLSTYPE_SHA256_HASH);
  ComboBoxSHA256.Items.AddStrings(SL);
  SL.DelimitedText := lgplListDrivers(LGP_CLSTYPE_AES256_ENC);
  ComboBoxAES256.Items.AddStrings(SL);
  SL.DelimitedText := lgplListDrivers(LGP_CLSTYPE_RSA_ENC);
  ComboBoxRSAEnc.Items.AddStrings(SL);
  SL.Free;
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

procedure TFormMain.ButtonObjShowClick(Sender: TObject);
begin
  if (ListViewObj.ItemFocused <> nil) and (ListViewObj.ItemFocused.Data <> nil) then
    ShowObject(TObject(ListViewObj.ItemFocused.Data));
end;

procedure TFormMain.FileNameEditKSeFBZIPInAcceptFileName(Sender: TObject;
  var Value: String);
var
  PackageCount: Integer;
  PartSize: Integer;
  I: Integer;
begin
  if SpinEditKSeFBPartSize.Value = 0 then
    PartSize := KSEF2_MAX_PART_SIZE
  else
    PartSize := SpinEditKSeFBPartSize.Value;
  PackageCount := (FileSize(Value) + PartSize - 1) div PartSize;
  StringGridKSeFBEncOutFiles.RowCount := PackageCount + 1;
  for I := 1 to PackageCount do
    StringGridKSeFBEncOutFiles.Cells[0, I] := Value + '.part' + IntToStr(I) + '.aes';
end;

procedure TFormMain.ButtonObjClearClick(Sender: TObject);
begin
  with ListViewObj do
  begin
    BeginUpdate;
    while Items.Count > 0 do
    begin
      if (Items[0].Data <> nil) and (Items[0].Data <> Pointer(BatchRequest)) and
        (Items[0].Data <> Pointer(BatchResponse)) and (Items[0].Data <> Pointer(ExportResponse)) then
        TObject(Items[0].Data).Free;
      Items[0].Free;
    end;
    EndUpdate;
  end;
end;

procedure TFormMain.ButtonKSeFASessionSetClick(Sender: TObject);
var
  Response: TKSeF2AuthenticationTokenRefreshResponse;
begin
  if (not DateTimePickerKSeFARefreshTokenValidUntil.DateIsNull) and
    (DateTimePickerKSeFARefreshTokenValidUntil.DateTime > Now) then
  begin
    KSeF.GateType := TlgoKSeFGateType(ComboBoxKSeFABramka.ItemIndex);
    KSeF.IdentifierType := TlgoKSeFIdentifierType(ComboBoxKSeFAIdentifierType.ItemIndex);
    KSeF.RefreshToken := EditKSeFARefreshToken.Text;
    KSeF.RefreshTokenValidUntil := DateTimePickerKSeFARefreshTokenValidUntil.DateTime;
    if ComboBoxACertificate.ItemIndex >= 0 then
    begin
      KSeF.AuthCertificate := TlgoCertificate(ComboBoxACertificate.Items.Objects[ComboBoxACertificate.ItemIndex]);
      KSeF.AuthCertificateSubject := TlgoKSeFCertificateAuthType(ComboBoxKSeFASubjectType.ItemIndex);
    end;
    KSeF.KsefToken := EditKSeFATokenKsef.Text;
    if (not DateTimePickerKSeFAAccessTokenValidUntil.DateIsNull) and
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

procedure TFormMain.ButtonKSeFASessionTermClick(Sender: TObject);
begin
  Debug('Unieważnienie sesji uwierzytelnienia', True);
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

procedure TFormMain.ButtonKSeFASessionTermCurClick(Sender: TObject);
begin
  Debug('Unieważnienie aktualnej sesji uwierzytelnienia', True);
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

procedure TFormMain.ButtonKSeFAStatusClick(Sender: TObject);
var
  Response: TKSeF2AuthenticationOperationStatusResponse;
begin
  Debug('Pobranie statusu uwierzytelniania', True);
  try
    Response := KSeF.AuthStatus;
    Debug('Odpowiedź: ' + Response.RawResponse);
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

procedure TFormMain.ButtonKSeFATokenKsefClick(Sender: TObject);
var
  Response: TKSeF2AuthenticationInitResponse;
begin
  Debug('Uwierzytelnienie z wykorzystaniem tokena KSeF', True);
  KSeF.GateType := TlgoKSeFGateType(ComboBoxKSeFABramka.ItemIndex);
  KSeF.Identifier := EditKSeFAIdentifier.Text;
  KSeF.IdentifierType := TlgoKSeFIdentifierType(ComboBoxKSeFAIdentifierType.ItemIndex);
  KSeF.KsefToken := EditKSeFATokenKsef.Text;
  try
    Response := KSeF.AuthKsefToken;
    Debug('Odpowiedź: ' + Response.RawResponse);
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

procedure TFormMain.ButtonKSeFATokenRedemClick(Sender: TObject);
var
  Response: TKSeF2AuthenticationTokensResponse;
begin
  Debug('Pobranie tokenów dostępowych', True);
  try
    Response := KSeF.AuthTokenRedem;
    Debug('Odpowiedź: ' + Response.RawResponse);
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

procedure TFormMain.ButtonKSeFATokenRefreshClick(Sender: TObject);
var
  Response: TKSeF2AuthenticationTokenRefreshResponse;
begin
  Debug('Pobranie tokenów dostępowych', True);
  try
    Response := KSeF.AuthTokenRefresh;
    Debug('Odpowiedź: ' + Response.RawResponse);
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

procedure TFormMain.ButtonKSeFASessionsClick(Sender: TObject);
var
  Response: TKSeF2AuthenticationListResponse;
begin
  Debug('Pobranie listy aktywnych sesji', True);
  try
    Response := KSeF.AuthSessions;
    Debug('Odpowiedź: ' + Response.RawResponse);
    Debug('  Items.Count: ' + IntToStr(Response.Items.Count));
    AddObject(Response);
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TFormMain.Button2Click(Sender: TObject);
begin
  Debug('Zamknięcie sesji wsadowej', True);
  try
    KSeF.BatchClose;
    Debug('Sesja została zamknięta.');
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

procedure TFormMain.ButtonKSeFAXAdESClick(Sender: TObject);
var
  Response: TKSeF2AuthenticationInitResponse;
begin
  Debug('Uwierzytelnienie z wykorzystaniem podpisu XAdES', True);
  KSeF.GateType := TlgoKSeFGateType(ComboBoxKSeFABramka.ItemIndex);
  KSeF.Identifier := EditKSeFAIdentifier.Text;
  KSeF.IdentifierType := TlgoKSeFIdentifierType(ComboBoxKSeFAIdentifierType.ItemIndex);
  KSeF.AuthCertificate := TlgoCertificate(ComboBoxACertificate.Items.Objects[ComboBoxACertificate.ItemIndex]);
  KSeF.AuthCertificateSubject := TlgoKSeFCertificateAuthType(ComboBoxKSeFASubjectType.ItemIndex);
  try
    Response := KSeF.AuthXadesSignature;
    Debug('Odpowiedź: ' + Response.RawResponse);
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

procedure TFormMain.ButtonKSeFAXAdESExtClick(Sender: TObject);
var
  SignedAuthStructure: String;
  FS: TFileStream = nil;
  Response: TKSeF2AuthenticationInitResponse;
begin
  Debug('Uwierzytelnienie z wykorzystaniem zewnętrznego podpisu XAdES', True);
  try
    try
      Debug('Wczytywanie z pliku: ' + FileNameEditKSeFAInXades.FileName);
      FS := TFileStream.Create(FileNameEditKSeFAInXades.FileName, fmOpenRead);
      SetLength(SignedAuthStructure, FS.Size);
      FS.Read(SignedAuthStructure[1], FS.Size);
      Debug('Struktura: ' + SignedAuthStructure);
      Response := KSeF.AuthXadesSignature(SignedAuthStructure);
      Debug('Odpowiedź: ' + Response.RawResponse);
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

procedure TFormMain.ButtonKSeFAXAdESSaveClick(Sender: TObject);
var
  FS: TFileStream = nil;
  AuthStructure: String;
begin
  Debug('Generowanie struktury Auth dla zewnętrznego podpisu XAdES', True);
  KSeF.GateType := TlgoKSeFGateType(ComboBoxKSeFABramka.ItemIndex);
  KSeF.Identifier := EditKSeFAIdentifier.Text;
  KSeF.IdentifierType := TlgoKSeFIdentifierType(ComboBoxKSeFAIdentifierType.ItemIndex);
  KSeF.AuthCertificateSubject := TlgoKSeFCertificateAuthType(ComboBoxKSeFASubjectTypeExt.ItemIndex);
  try
    try
      AuthStructure := '<?xml version="1.0" encoding="UTF-8"?>' + LineEnding +
        KSeF.AuthXadesSignatureGenerate;
      Debug('Struktura: ' + AuthStructure);
      Debug('Zapisywanie do pliku: ' + FileNameEditKSeFAOutXades.FileName);
      FS := TFileStream.Create(FileNameEditKSeFAOutXades.FileName, fmCreate);
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

procedure TFormMain.ButtonKSeFBOpenClick(Sender: TObject);
begin
  if Assigned(BatchResponse) and (ListViewObj.FindData(0, BatchResponse, True, True) = nil) then
    FreeAndNil(BatchResponse)
  else
    BatchResponse := nil;
  Debug('Otwarcie sesji wsadowej dla przygotowanej paczki', True);
  try
    BatchResponse := KSeF.BatchOpen(BatchRequest);
    Debug('Sesja została otwarta, nr ref: ' + BatchResponse.ReferenceNumber);
    Debug('Odpowiedź: ' + BatchResponse.RawResponse);
    AddObject(BatchResponse);
    GroupBoxKSeFB3.Enabled := True;
    GroupBoxKSeFB4.Enabled := True;
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TFormMain.ButtonKSeFBPrepareClick(Sender: TObject);
var
  ZipInStream: TFileStream = nil;
begin
  if Assigned(BatchRequest) and (ListViewObj.FindData(0, BatchRequest, True, True) = nil) then
    FreeAndNil(BatchRequest)
  else
    BatchRequest := nil;
  Debug('Przygotowanie paczki faktur', True);
  try
    try
      ZipInStream := TFileStream.Create(FileNameEditKSeFBZIPIn.FileName, fmOpenRead);
      KSeF.FormCode := TlgoKSeFFormCode(ComboBoxIFormCode.ItemIndex);
      KSeF.FormCodeSystemCode := EditKSeFIFormCodeSystemCode.Text;
      KSeF.FormCodeSchemaVersion := EditKSeFIFormCodeSchemaVersion.Text;
      KSeF.FormCodeValue := EditKSeFIFormCodeValue.Text;
      KSeF.BatchPartSize := SpinEditKSeFBPartSize.Value;
      KSeF.OnRequestPartStream := @KSeFRequestPartStream;
      BatchRequest := KSeF.BatchPrepare(ZipInStream);
      Debug('Przygotowano paczkę do wysłania.');
      Debug('Zawartość: ' + BatchRequest.AsJSONString);
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

procedure TFormMain.ButtonKSeFBSendClick(Sender: TObject);
var
  FileStream: TFileStream = nil;
  I: Integer;
  FromIdx, ToIdx: Integer;
begin
  Debug('Wysyłanie paczki faktur', True);
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
        KSeF.BatchSendPart(BatchResponse.PartUploadRequests.Items[I], FileStream);
        Debug('Wysłano część ' + (I + 1).ToString);
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

procedure TFormMain.ButtonKSeFDDownloadClick(Sender: TObject);
var
  FileStream: TFileStream = nil;
begin
  Debug('Pobieranie faktury po numerze Ksef', True);
  try
    try
      FileStream := TFileStream.Create(FileNameEditKSeFDOutFile.FileName, fmCreate);
      KSeF.InvoicesKsef(EditKSeFDKsefNumber.Text, FileStream);
      Debug('Pobrano do pliku: ' + FileNameEditKSeFDOutFile.FileName);
    except
      on E: Exception do
        DebugException(E);
    end;
  finally
    if Assigned(FileStream) then
      FileStream.Free;
  end;
end;

procedure TFormMain.ButtonKSeFDEDownloadClick(Sender: TObject);
var
  FileStream: TFileStream = nil;
begin
  Debug('Pobieranie paczki faktur', True);
  try
    try
      FileStream := TFileStream.Create(FileNameEditKSeFDEFileName.FileName, fmCreate);
      KSeF.InvoicesExportDownload(ExportResponse, FileStream);
      Debug('Pobrano do pliku: ' + FileNameEditKSeFDEFileName.FileName);
    except
      on E: Exception do
        DebugException(E);
    end;
  finally
    if Assigned(FileStream) then
      FileStream.Free;
  end;
end;

procedure TFormMain.ButtonKSeFDExportClick(Sender: TObject);
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

procedure TFormMain.ButtonKSeFDFClearClick(Sender: TObject);
var
  I: Integer;
begin
  ComboBoxKSeFDFSubjectType.ItemHeight := 0;
  ComboBoxKSeFDFDateType.ItemHeight := 0;
  DateTimePickerKSeFDFFrom.Date := Now;
  DateTimePickerKSeFDFTo.DateTime := NullDate;
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

procedure TFormMain.ButtonKSeFDMetadataClick(Sender: TObject);
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
    Debug('Odpowiedź: ' + Response.RawResponse);
    Debug('Ilość faktur: ' + IntToStr(Response.Invoices.Count));
    AddObject(Response);
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TFormMain.ButtonKSeFDStatusClick(Sender: TObject);
var
  Response: TKSeF2InvoiceExportStatusResponse;
begin
  Debug('Pobranie statusu eksportu paczki faktur', True);
  try
    Response := KSeF.InvoicesExportStatus(EditKSeFDEOperationReferenceNumber.Text);
    Debug('Odpowiedź: ' + Response.RawResponse);
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

procedure TFormMain.ButtonKSeFDTUsunOsobeClick(Sender: TObject);
begin
  Debug('Usunięcie osoby fizycznej', True);
  try
    KSeF.TestdataSubjectRemove(EditKSeFDTUsPSubjectNip.Text);
    Debug('Wykonano');
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TFormMain.ButtonKSeFDTUsunPodmiotClick(Sender: TObject);
begin
  Debug('Usunięcie podmiotu', True);
  try
    KSeF.TestdataSubjectRemove(EditKSeFDTUsPSubjectNip.Text);
    Debug('Wykonano');
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TFormMain.ButtonKSeFDTUtworzOsobeClick(Sender: TObject);
var
  Request: TKSeF2PersonCreateRequest = nil;
begin
  Debug('Utworzenie osoby fizycznej', True);
  try
    Request := TKSeF2PersonCreateRequest.Create(nil, '');
    Request.Nip := EditKSeFDTUONip.Text;
    Request.Pesel := EditKSeFDTUOPesel.Text;
    Request.Description := EditKSeFDTUODescription.Text;
    if not DateTimePickerKSeFDTUOCreationDate.DateIsNull then
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

procedure TFormMain.ButtonKSeFDTUtworzPodmiotClick(Sender: TObject);
var
  Request: TKSeF2SubjectCreateRequest = nil;
  I: Integer;
  Subunit: TKSeF2Subunit;
begin
  Debug('Utworzenie podmiotu', True);
  try
    try
      Request := TKSeF2SubjectCreateRequest.Create(nil, '');
      Request.SubjectNip := EditKSeFDTUPSubjectNip.Text;
      if ComboBoxKSeFDTUPSubjectType.ItemIndex >= 0 then
        Request.SubjectType := TKSeF2SubjectType(ComboBoxKSeFDTUPSubjectType.ItemIndex);
      for I := 1 to StringGridDTUPSubunits.RowCount - 1 do
        if (StringGridDTUPSubunits.Cells[0, I] <> '') or (StringGridDTUPSubunits.Cells[1, I] <> '') then
        begin
          Subunit := TKSeF2Subunit.Create(nil, '');
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

procedure TFormMain.ButtonKSeFGetPublicKeyCertificatesClick(Sender: TObject);
var
  Response: TKSeF2PublicKeyCertificateResponse;
  I: Integer;
  BStream: TBytesStream = nil;

function LoadKey(AKeyData: String): TlgoRSAPublicKey;
begin
  BStream := TBytesStream.Create(Base64.Decode(AKeyData));
  Result := TlgoRSAPublicKey.CreateKey(KSeF.RSAPublicKeyClass, BStream, letDER);
  FreeAndNil(BStream);
end;

begin
  Debug('Pobieranie kluczy publicznych', True);
  try
    Response := KSeF.SecurityPublicKeyCertificates(TlgoKSeFGateType(ComboBoxKSeFPKCertBramka.ItemIndex));
    Debug('Odpowiedź: ' + Response.RawResponse);
    AddObject(Response);

    // Zainstaluj pobrane klucze
    for I := 0 to Response.Items.Count - 1 do
    begin
      if kuKsefTokenEncryption in Response.Items.Items[I].Usage then
      begin
        if Assigned(KSeF.RSATokenEncKey[TlgoKSeFGateType(ComboBoxKSeFPKCertBramka.ItemIndex)]) then
          KSeF.RSATokenEncKey[TlgoKSeFGateType(ComboBoxKSeFPKCertBramka.ItemIndex)].Free;
        KSeF.RSATokenEncKey[TlgoKSeFGateType(ComboBoxKSeFPKCertBramka.ItemIndex)]
          := LoadKey(Response.Items.Items[I].Certificate);
      end;
      if kuSymmetricKeyEncryption in Response.Items.Items[I].Usage then
      begin
        if Assigned(KSeF.RSASymmetricKeyEncKey[TlgoKSeFGateType(ComboBoxKSeFPKCertBramka.ItemIndex)]) then
          KSeF.RSASymmetricKeyEncKey[TlgoKSeFGateType(ComboBoxKSeFPKCertBramka.ItemIndex)].Free;
        KSeF.RSASymmetricKeyEncKey[TlgoKSeFGateType(ComboBoxKSeFPKCertBramka.ItemIndex)]
          := LoadKey(Response.Items.Items[I].Certificate);
      end;
    end;

  except
    on E: Exception do
      DebugException(E);
  end;
  if Assigned(BStream) then
    BStream.Free;
end;

procedure TFormMain.ButtonKSeFICloseClick(Sender: TObject);
begin
  Debug('Zamknięcie sesji interaktywnej', True);
  try
    KSeF.InteractiveClose;
    Debug('Sesja została zamknięta');
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TFormMain.ButtonKSeFIOpenClick(Sender: TObject);
var
  RefNo: String;
begin
  Debug('Otwarcie sesji interaktywnej', True);
  try
    KSeF.FormCode := TlgoKSeFFormCode(ComboBoxIFormCode.ItemIndex);
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

procedure TFormMain.ButtonKSeFISendClick(Sender: TObject);
var
  RefNo: String;
  InvoiceFileStream: TFileStream = nil;
begin
  Debug('Wysłanie faktury', True);
  try
    try
      InvoiceFileStream := TFileStream.Create(FileNameEditKSeFIDoc.FileName, fmOpenRead);
      RefNo := KSeF.InteractiveSend(InvoiceFileStream, CheckBoxKSeFIOffline.Checked, EditKSeFIHashOfCorrectedInvoice.Text);
      Debug('Wysłano fakturę, nr ref: ' + RefNo);
    except
      on E: Exception do
        DebugException(E);
    end;
  finally
    if Assigned(InvoiceFileStream) then
      InvoiceFileStream.Free;
  end;
end;

procedure TFormMain.ButtonKSeFLoadKeyKeyExClick(Sender: TObject);
begin
  PopupMenuKeys.PopupComponent := ButtonKSeFLoadKeyKeyEx;
  PopupMenuKeys.PopUp;
end;

procedure TFormMain.ButtonKSeFLoadKeyTokenClick(Sender: TObject);
begin
  PopupMenuKeys.PopupComponent := ButtonKSeFLoadKeyToken;
  PopupMenuKeys.PopUp;
end;

procedure TFormMain.ButtonKSeFSessionClick(Sender: TObject);
var
  Response: TKSeF2SessionStatusResponse;
begin
  Debug('Pobranie statusu sesji', True);
  try
    Response := KSeF.StatusSession(EditKSeFSReferenceNumber2.Text);
    Debug('Pobrano, status: ' + Response.Status.Description);
    Debug('Odpowiedź: ' + Response.RawResponse);
    AddObject(Response);
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TFormMain.ButtonKSeFSessionInvoiceClick(Sender: TObject);
var
  Response: TKSeF2SessionInvoiceStatusResponse;
begin
  Debug('Pobranie statusu faktury z sesji', True);
  try
    Response := KSeF.StatusSessionInvoice(EditKSeFSReferenceNumber3.Text,
      EditKSeFSInvoiceReferenceNumber.Text);
    Debug('Pobrano, status: ' + IntToStr(Response.Status.Code));
    Debug('Opis statusu: ' + Response.Status.Description);
    AddObject(Response);
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TFormMain.ButtonKSeFSessionsClick(Sender: TObject);
var
  Statuses: TKSeF2CommonSessionStatuses;
  Status: TKSeF2CommonSessionStatus;
  Response: TKSeF2SessionsQueryResponse;
  D1, D2, D3, D4, D5, D6: TDateTime;
begin
  Debug('Pobranie listy sesji', True);
  try
    if DateTimePickerKSeFSCreatedFrom.DateIsNull then
      D1 := 0
    else
      D2 := DateTimePickerKSeFSCreatedFrom.DateTime;
    if DateTimePickerKSeFSCreatedTo.DateIsNull then
      D2 := 0
    else
      D2 := DateTimePickerKSeFSCreatedTo.DateTime;
    if DateTimePickerKSeFSClosedFrom.DateIsNull then
      D3 := 0
    else
      D3 := DateTimePickerKSeFSClosedFrom.DateTime;
    if DateTimePickerKSeFSClosedTo.DateIsNull then
      D4 := 0
    else
      D4 := DateTimePickerKSeFSClosedTo.DateTime;
    if DateTimePickerKSeFSModifiedFrom.DateIsNull then
      D5 := 0
    else
      DateTimePickerKSeFSModifiedFrom.DateTime;
    if DateTimePickerKSeFSModifiedTo.DateIsNull then
      D6 := 0
    else
      D6 := DateTimePickerKSeFSModifiedTo.DateTime;
    Statuses := [];
    for Status in TKSeF2CommonSessionStatus do
      if CheckGroupKSeFSSesionStatuses.Checked[Ord(Status)] then
        Include(Statuses, Status);
    Response := KSeF.StatusSessions(TKSeF2SessionType(ComboBoxKSeFSSessionType.ItemIndex),
      EditKSeFSContinuationToken.Text, SpinEditKSeFSPageSize1.Value, EditKSeFSReferenceNumber.Text,
      D1, D2, D3, D4, D5, D6, Statuses);
    Debug('Pobrano, liczba sesji: ' + IntToStr(Response.Sessions.Count));
    Debug('Odpowiedź: ' + Response.RawResponse);
    EditKSeFSContinuationToken.Text := Response.ContinuationToken;
    AddObject(Response);
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TFormMain.ButtonKSeFSessionsInvoiceClick(Sender: TObject);
var
  Response: TKSeF2SessionInvoicesResponse;
begin
  Debug('Pobranie statusu sesji', True);
  try
    Response := KSeF.StatusInvoices(EditKSeFSReferenceNumber1.Text,
      EditKSeFSContinuationToken1.Text, SpinEditKSeFS1PageSize1.Value);
    Debug('Pobrano, liczba faktur: ' + IntToStr(Response.Invoices.Count));
    Debug('Odpowiedź: ' + Response.RawResponse);
    EditKSeFSContinuationToken1.Text := Response.ContinuationToken;
    AddObject(Response);
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TFormMain.ButtonKSeFSessionsInvoiceFailedClick(Sender: TObject);
var
  Response: TKSeF2SessionInvoicesResponse;
begin
  Debug('Pobranie niepoprawnie przetworzonych faktur sesji', True);
  try
    Response := KSeF.StatusInvoicesFailed(EditKSeFSReferenceNumber.Text,
      EditKSeFSContinuationToken2.Text, SpinEditKSeFS1PageSize1.Value);
    Debug('Pobrano, liczba faktur: ' + IntToStr(Response.Invoices.Count));
    Debug('Odpowiedź: ' + Response.RawResponse);
    EditKSeFSContinuationToken2.Text := Response.ContinuationToken;
    AddObject(Response);
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TFormMain.ButtonKSeFTKDeleteClick(Sender: TObject);
begin
  Debug('Unieważnienie tokena', True);
  try
    KSeF.TokensRevoke(EditKSeFTKDReferenceNumber.Text);
    Debug('Unieważniono');
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TFormMain.ButtonKSeFTKGenerateClick(Sender: TObject);
var
  Response: TKSeF2GenerateTokenResponse;
  Perms: TKSeF2TokenPermissions;
  Perm: TKSeF2TokenPermissionType;
begin
  Debug('Wygenerowanie nowego tokena', True);
  try
    Perms := [];
    for Perm in TKSeF2TokenPermissionType do
      if CheckGroupKSeFTKPermisions.Checked[Ord(Perm)] then
        Include(Perms, Perm);
    Response := KSeF.TokensGenerate(Perms, EditKSeFTKDescription.Text);
    Debug('Odpowiedź: ' + Response.RawResponse);
    Debug('Utworzono token: ' + Response.Token);
    Debug('Nr ref: ' + Response.ReferenceNumber);
    AddObject(Response);
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TFormMain.ButtonKSeFTKListClick(Sender: TObject);
var
  Response: TKSeF2QueryTokensResponse;
  Status: TKSeF2AuthenticationTokenStatus;
  Statuses: TKSeF2AuthenticationTokenStatuses;
begin
  Debug('Pobranie listy wygenerowanych tokenów', True);
  try
    Statuses := [];
    for Status in TKSeF2AuthenticationTokenStatus do
      if CheckGroupKSeFTKStatus.Checked[Ord(Status)] then
        Include(Statuses, Status);
    Response := KSeF.TokensList(Statuses, EditKSeFTKDescrFlt.Text,
      EditKSeFTKAuthorIdentifier.Text,
      TKSeF2TokenAuthorIdentifierType(ComboBoxKSeFTKAuthorIdentifierType.ItemIndex),
      SpinEditKSeFTKPageSize.Value, EditKSeFTKContinuationToken.Text);
    Debug('Odpowiedź: ' + Response.RawResponse);
    Debug('Ilość tokenów: ' + Response.Tokens.Count.ToString);
    AddObject(Response);
    EditKSeFTKContinuationToken.Text := Response.ContinuationToken;
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TFormMain.ButtonKSeFTKStatusClick(Sender: TObject);
var
  Response: TKSeF2TokenStatusResponse;
begin
  Debug('Pobranie statusu tokena', True);
  try
    Response := KSeF.TokensStatus(EditKSeFTKSReferenceNumber.Text);
    Debug('Odpowiedź: ' + Response.RawResponse);
    AddObject(Response);
  except
    on E: Exception do
      DebugException(E);
  end;
end;

procedure TFormMain.ButtonKSeFUPobierz1Click(Sender: TObject);
var
  FileStream: TFileStream = nil;
begin
  Debug('Pobranie UPO faktury z sesji na podstawie numeru KSeF', True);
  try
    try
      FileStream := TFileStream.Create(FileNameEditKSeFUFile1.FileName, fmCreate);
      KSeF.StatusUpoSessionInvoice(EditKSeFUReferenceNumber1.Text, EditKSeFUInvoiceReferenceNumber.Text,
        FileStream);
      Debug('Pobrano UPO do pliku: ' + FileNameEditKSeFUFile1.FileName);
    except
      on E: Exception do
        DebugException(E);
    end;
  finally
    if Assigned(FileStream) then
      FileStream.Free;
  end;
end;

procedure TFormMain.ButtonKSeFUPobierz2Click(Sender: TObject);
var
  FileStream: TFileStream = nil;
begin
  Debug('Pobranie UPO faktury z sesji na podstawie numeru KSeF', True);
  try
    try
      FileStream := TFileStream.Create(FileNameEditKSeFUFile2.FileName, fmCreate);
      KSeF.StatusUpoKsef(EditKSeFUReferenceNumber2.Text, EditKSeFUUpoReferenceNumber2.Text,
        FileStream);
      Debug('Pobrano UPO do pliku: ' + FileNameEditKSeFUFile.FileName);
    except
      on E: Exception do
        DebugException(E);
    end;
  finally
    if Assigned(FileStream) then
      FileStream.Free;
  end;
end;

procedure TFormMain.ButtonKSeFUPobierzClick(Sender: TObject);
var
  FileStream: TFileStream = nil;
begin
  Debug('Pobranie UPO faktury z sesji na podstawie numeru KSeF', True);
  try
    try
      FileStream := TFileStream.Create(FileNameEditKSeFUFile.FileName, fmCreate);
      KSeF.StatusUpoKsef(EditKSeFUReferenceNumber.Text, EditKSeFUKSefNumber.Text,
        FileStream);
      Debug('Pobrano UPO do pliku: ' + FileNameEditKSeFUFile.FileName);
    except
      on E: Exception do
        DebugException(E);
    end;
  finally
    if Assigned(FileStream) then
      FileStream.Free;
  end;
end;

procedure TFormMain.ButtonObjCountClick(Sender: TObject);
begin
  Debug('Ilość obiektów: ' + IntToStr(lgpDbgObjectCount), True);
end;

procedure TFormMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
  Ini: TIniFile;
  G: TlgoKSeFGateType;
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
        MessageDlg('Wyjątek przy zapisywaniu statusu sesji: ' + E.Message, mtError, [mbOK], 0);
    end;
  end
  else
    if FileExists(Application.ExeName + '.ini') then
      DeleteFile(Application.ExeName + '.ini');
  ButtonObjClearClick(nil);
  if Assigned(BatchRequest) then
    BatchRequest.Free;
  if Assigned(BatchResponse) then
    BatchResponse.Free;
  if Assigned(ExportResponse) then
    ExportResponse.Free;
  if Assigned(KSeF) then
  begin
    for G in TlgoKSeFGateType do
    begin
      if Assigned(KSeF.RSASymmetricKeyEncKey[G]) then
        KSeF.RSASymmetricKeyEncKey[G].Free;
      if Assigned(KSeF.RSATokenEncKey[G]) then
        KSeF.RSATokenEncKey[G].Free;
    end;
    KSeF.Free;
  end;
  if Assigned(XAdES) then
    XAdES.Free;
  if Assigned(HTTPClient) then
    HTTPClient.Free;
  ButtonObjClearClick(nil);
  inherited FormClose(Sender, CloseAction);
end;

procedure TFormMain.ButtonSetupClick(Sender: TObject);
var
  Ini: TIniFile;
  D: TDateTime;
  I: Integer;
  MI: TMenuItem;
  SL: TStringList;
begin
  inherited ButtonSetupClick(Sender);
  if ComboBoxHTTPCli.ItemIndex >= 0 then
    HTTPClient := TlgoHTTPClient.Create(ComboBoxHTTPCli.Text);

  XAdES := TlgoXAdES.Create;
  if ComboBoxSHA256.ItemIndex >= 0 then
    XAdES.SHA256HashClass := ComboBoxSHA256.Text;
  if ComboBoxBase64.ItemIndex >= 0 then
    XAdES.Base64EncoderClass := ComboBoxBase64.Text;
  XAdES.SignType := shtSHA256;

  KSeF := TlgoKSeF2.Create;
  KSeF.XAdES := XAdES;
  KSeF.HTTPClient := HTTPClient;
  if ComboBoxBase64.ItemIndex >= 0 then
    KSeF.Base64EncoderClass := ComboBoxBase64.Text;
  if ComboBoxSHA256.ItemIndex >= 0 then
    KSeF.SHA256HashClass := ComboBoxSHA256.Text;
  if ComboBoxRSAEnc.ItemIndex >= 0 then
    KSeF.RSAPublicKeyClass := ComboBoxRSAEnc.Text;
  if ComboBoxAES256.ItemIndex >= 0 then
    KSeF.AES256EncryptClass := ComboBoxAES256.Text;
  if ComboBoxRandGen.ItemIndex >= 0 then
    KSeF.RandomGeneratorClass := ComboBoxRandGen.Text;
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

  SL := TStringList.Create;
  SL.Delimiter := ';';
  SL.DelimitedText := lgplListDrivers(LGP_CLSTYPE_RSA_ENC);
  for I := 0 to SL.Count - 1 do
  begin
    MI := TMenuItem.Create(PopupMenuKeys);
    MI.Caption := SL[I];
    MI.OnClick := @PopupMenuKeysClick;
    PopupMenuKeys.Items.Add(MI);
  end;
  SL.Free;
end;

procedure TFormMain.StringGridKSeFBEncOutFilesButtonClick(Sender: TObject;
  aCol, aRow: Integer);
begin
  SaveDialogKSeFBPart.FileName := StringGridKSeFBEncOutFiles.Cells[aCol, aRow];
  if SaveDialogKSeFBPart.Execute then
    StringGridKSeFBEncOutFiles.Cells[aCol, aRow] := SaveDialogKSeFBPart.FileName;
end;

procedure TFormMain.SetKSeFPagesVisible(AValue: Boolean);
begin
  TabSheetKSeFInteractive.TabVisible := AValue;
  TabSheetKSeFBatch.TabVisible := AValue;
  TabSheetKSeFStatus.TabVisible := AValue;
  TabSheetKSeFUpo.TabVisible := AValue;
  TabSheetKSeFDownload.TabVisible := AValue;
  TabSheetKSeFToken.TabVisible := AValue;
end;

procedure TFormMain.PopupMenuKeysClick(Sender: TObject);
var
  FileStream: TFileStream = nil;
begin
  if OpenDialogKey.Execute then
  begin
    try
      FileStream := TFileStream.Create(OpenDialogKey.FileName, fmOpenRead);
      if PopupMenuKeys.PopupComponent = ButtonKSeFLoadKeyToken then
        KSeF.RSATokenEncKey[TlgoKSeFGateType(ComboBoxKSeFPKCertBramka.ItemIndex)] := TlgoRSAPublicKey.CreateKey(TMenuItem(Sender).Caption, FileStream, letDER)
      else if PopupMenuKeys.PopupComponent = ButtonKSeFLoadKeyKeyEx then
        KSeF.RSASymmetricKeyEncKey[TlgoKSeFGateType(ComboBoxKSeFPKCertBramka.ItemIndex)] := TlgoRSAPublicKey.CreateKey(TMenuItem(Sender).Caption, FileStream, letDER);
    finally
      if Assigned(FileStream) then
        FileStream.Free;
    end;
  end;
end;

procedure TFormMain.KSeFRequestPartStream(Sender: TObject;
  APartNumber: Integer; var APartStream: TStream);
begin
  if Assigned(CurrentPartStream) then
  begin
    Debug('Zamykanie strumienia części.');
    FreeAndNil(CurrentPartStream);
  end;
  if APartNumber < StringGridKSeFBEncOutFiles.RowCount then
  begin
    APartStream := TFileStream.Create(StringGridKSeFBEncOutFiles.Cells[0, APartNumber], fmCreate);
    CurrentPartStream := APartStream;
    Debug('Otwieranie strumienia części dla pliku: ' + StringGridKSeFBEncOutFiles.Cells[0, APartNumber]);
  end;
end;

function TFormMain.GenerateFilter: TKSeF2InvoiceQueryFilters;
var
  I: TKSeF2InvoiceType;
  IT: TKSeF2InvoiceTypes = [];
begin
  Result := TKSeF2InvoiceQueryFilters.Create(nil, '');
  with Result do
  begin
    SubjectType := TKSeF2InvoiceQuerySubjectType(ComboBoxKSeFDFSubjectType.ItemIndex);
    DateRange.DateType := TKSeF2InvoiceQueryDateType(ComboBoxKSeFDFDateType.ItemIndex);
    DateRange.From := DateTimePickerKSeFDFFrom.DateTime;
    if not DateTimePickerKSeFDFTo.DateIsNull then
      DateRange.To_ := DateTimePickerKSeFDFTo.DateTime;
    KsefNumber := EditKSeFDFKsefNumber.Text;
    InvoiceNumber := EditKSeFDFInvoiceNumber.Text;
    if (FloatSpinEditKSeFDFFrom.Value <> 0) or (FloatSpinEditKSeFDFTo.Value <> 0) then
    begin
      Amount := TKSeF2InvoiceQueryAmount.Create(Result, '');
      Amount.Type_ := TKSeF2AmountType(ComboBoxKSeFDFAmountType.ItemIndex);
      if FloatSpinEditKSeFDFFrom.Value <> 0 then
        Amount.From := FloatSpinEditKSeFDFFrom.Value;
      if FloatSpinEditKSeFDFTo.Value <> 0 then
        Amount.To_ := FloatSpinEditKSeFDFTo.Value;
    end;
    SellerNip := EditKSeFDFSellerNip.Text;
    if ComboBoxKSeFDFBuyerIdentifierType.ItemIndex > 0 then
    begin
      BuyerIdentifier := TKSeF2InvoiceQueryBuyerIdentifier.Create(Result, '');
      BuyerIdentifier.Type_ := TKSeF2BuyerIdentifierType(ComboBoxKSeFDFBuyerIdentifierType.ItemIndex - 1);
      BuyerIdentifier.Value := EditKSeFDFBuyerIdentifierValue.Text;
    end;
    if EditKSeFDFCurrencyCodes.Text <> '' then
      CurrencyCodes := EditKSeFDFCurrencyCodes.Text;
    if ComboBoxKSeFDFInvoicingMode.ItemIndex > 0 then
      InvoicingMode := TKSeF2InvoicingMode(ComboBoxKSeFDFInvoicingMode.ItemIndex - 1);
    IsSelfInvoicing := TKSeF2NullableBoolean(ComboBoxKSeFDFIsSelfInvoicing.ItemIndex);
    FormType := TKSeF2InvoiceQueryFormType(ComboBoxKSeFDFIsSelfInvoicing.ItemIndex);
    for I in TKSeF2InvoiceType do
      if CheckGroupKSeFDFInvoiceType.Checked[Ord(I)] then
        Include(IT, I);
    InvoiceTypes := IT;
    HasAttachment := TKSeF2NullableBoolean(ComboBoxKSeFDFHasAttachment.ItemIndex);
  end;
end;

procedure TFormMain.AddObject(AObject: TObject);
begin
  if Assigned(AObject) then
    with ListViewObj.Items.Add do
    begin
      Caption := AObject.ClassName;
      Data := AObject;
    end;
end;

procedure TFormMain.DebugException(AException: Exception);
var
  ED: TKSeF2ExceptionDetail;
begin
  Debug('Wyjątek: ' + AException.ClassName);
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
      for ED in ExceptionDetailList do
      begin
        Debug('  [');
        Debug('    ExceptionCode: %d', [ED.ExceptionCode]);
        Debug('    ExceptionDescription: ' + ED.ExceptionDescription);
        Debug('    Details: ' + ED.ExceptionDetails);
        Debug('  ]');
      end;
    end;
end;

end.

