unit Unit1;

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  ExtCtrls, Spin, LibGovPl4Intf, LibGovPl4Obj, LibGovPl4Backend, LibGovPl4XAdES,
  LibGovPl4KSeF, LibGovPl4KSeFObj, LibGovPl4EDek, LibGovPl4JPK, JvToolEdit,
  JvSpin, Types, Mask, JvExMask, TypInfo;

type

  { TForm1 }

  TForm1 = class(TForm)
    ButtonKSeFBatchPodp: TButton;
    ButtonKSeFBatchSend: TButton;
    ButtonKSeFStatusUPO: TButton;
    ButtonKSeFCInvClear: TButton;
    ButtonKSeFCInvGet: TButton;
    ButtonKSeFGenIntId: TButton;
    ButtonKSeFQInvAsyncStat: TButton;
    ButtonKSeFQInvAsyncFetch: TButton;
    ButtonKSeFQInvClear: TButton;
    ButtonKSeFQInvSync: TButton;
    ButtonKSeFQInvAsync: TButton;
    ButtonKSeFInvGet: TButton;
    ButtonKSeFInvStat: TButton;
    ButtonKSeFInvSend: TButton;
    ButtonKSeFSesTerm: TButton;
    ButtonkSeFSesStat: TButton;
    ButtonCertReload: TButton;
    ButtonJPKBUPO: TButton;
    ButtonJPKBWyslij: TButton;
    ButtonEDBUPO: TButton;
    ButtonEDBWyslij: TButton;
    ButtonEdekPodpiszCert: TButton;
    ButtonCertWybierz: TButton;
    ButtonEdekPodpiszAut: TButton;
    ButtonJPKPodpiszCert: TButton;
    ButtonJPKPodpiszAut: TButton;
    ButtonKSeFIniToken: TButton;
    ButtonKSeFInitPZ: TButton;
    ButtonKSeFInitPZZapisz: TButton;
    ButtonKSeFInitSigned: TButton;
    ButtonShowCert: TButton;
    ButtonSetup: TButton;
    CheckBoxKSeFQInvCrFaP17Annotation: TCheckBox;
    CheckBoxKSeFStatDet: TCheckBox;
    CheckBoxKSeFEncrypt: TCheckBox;
    CheckBoxJPKBCert: TCheckBox;
    CheckBoxJPKPCAdHoc: TCheckBox;
    CheckBoxEDekC14N: TCheckBox;
    CheckBoxJPKPAAdHoc: TCheckBox;
    CheckBoxXAdESCzas: TCheckBox;
    CheckGroupKSeFQInvCrIInvoiceTypes: TGroupBox;
    ComboBoxKSeFBatchBramka: TComboBox;
    ComboBoxKSeFBatchCert: TComboBox;
    ComboBoxKSeFBatchInitFormCode: TComboBox;
    ComboBoxKSeFBatchSendBramka: TComboBox;
    ComboBoxKSeFComBramka: TComboBox;
    ComboBoxKSeFInitFormCode: TComboBox;
    ComboBoxKSeFCertAuthType: TComboBox;
    ComboBoxEDBRodzBram: TComboBox;
    ComboBoxJPKBRodzBramUPO: TComboBox;
    ComboBoxJPKPCRodzBram: TComboBox;
    ComboBoxEDBRodzBramUPO: TComboBox;
    ComboBoxEDBRodzPodp: TComboBox;
    ComboBoxJPKCert: TComboBox;
    ComboBoxJPKPARodzBram: TComboBox;
    ComboBoxJPKBRodzBram: TComboBox;
    ComboBoxKSeFBramka: TComboBox;
    ComboBoxKSeFCert: TComboBox;
    ComboBoxKSeFQInvCrSubTyp: TComboBox;
    ComboBoxXAdESSHA: TComboBox;
    ComboBoxEdekCert: TComboBox;
    ComboBoxAES256: TComboBox;
    ComboBoxBase64: TComboBox;
    ComboBoxEDek: TComboBox;
    ComboBoxHTTPCli: TComboBox;
    ComboBoxMD5: TComboBox;
    ComboBoxRandGen: TComboBox;
    ComboBoxRSAEnc: TComboBox;
    ComboBoxSHA1: TComboBox;
    ComboBoxSHA256: TComboBox;
    ComboBoxSign: TComboBox;
    ComboBoxXMLC14N: TComboBox;
    ComboBoxXMLRead: TComboBox;
    ComboBoxZip: TComboBox;
    DateTimePickerEDPDataU: TDateTimePicker;
    DateTimePickerJPKPDataU: TDateTimePicker;
    DateTimePickerKSeFQInvCrDetInvFrom: TDateTimePicker;
    DateTimePickerKSeFQInvCrDetInvTo: TDateTimePicker;
    DateTimePickerKSeFQInvCrIncInvFrom: TDateTimePicker;
    DateTimePickerKSeFQInvCrIncInvTo: TDateTimePicker;
    DateTimePickerKSeFQInvCrRanInvFrom: TDateTimePicker;
    DateTimePickerKSeFQInvCrRanInvTo: TDateTimePicker;
    EditKSeFBatchNIP: TEdit;
    EditKSeFBatchNrRef: TEdit;
    EditKSeFStatusReferenceNumber: TEdit;
    EditKSeFCInvSubToFullName: TEdit;
    EditKSeFCInvSubToFirstName: TEdit;
    EditKSeFCInvSubToSurname: TEdit;
    EditKSeFCInvSubToTradeName: TEdit;
    EditKSeFCInvSubToIdent: TEdit;
    EditKSeFCInvRefNum: TEdit;
    EditKSeFCInvOrgNum: TEdit;
    EditKSeFinputDigitsSequence: TEdit;
    EditKSeFQInvAsyncERefNo: TEdit;
    EditKSeFQInvAsyncQRefNo: TEdit;
    EditKSeFQInvCrSubjectToId: TEdit;
    EditKSeFQInvCrSubjectByIdent: TEdit;
    EditKSeFInvGetNr: TEdit;
    EditKSeFInvStatNr: TEdit;
    EditKSeFQInvCrInvoiceNumber: TEdit;
    EditKSeFQInvCrRefNo: TEdit;
    EditKSeFSesStatRef: TEdit;
    EditEDBNrRef: TEdit;
    EditJPKBNrRef: TEdit;
    EditJPKPImie: TEdit;
    EditEDPNazwisko: TEdit;
    EditJPKPNazwisko: TEdit;
    EditEDPNIP: TEdit;
    EditEDPImie: TEdit;
    EditJPKPNIP: TEdit;
    EditKSeFNIP: TEdit;
    EditKSeFToken: TEdit;
    FileNameEditKSeFBatchInZIP: TJvFilenameEdit;
    FileNameEditKSeFBatchOutEncZIP: TJvFilenameEdit;
    FileNameEditKSeFBatchOutInitUp: TJvFilenameEdit;
    FileNameEditKSeFBatchSendEnc: TJvFilenameEdit;
    FileNameEditKSeFBatchSendIU: TJvFilenameEdit;
    FileNameEditKSeFUPO: TJvFilenameEdit;
    FileNameEditKSeFCInvFN: TJvFilenameEdit;
    FileNameEditKSeFQInvAsyncFN: TJvFilenameEdit;
    FileNameEditKSeFGetFN: TJvFilenameEdit;
    FileNameEditKSeFInvSend: TJvFilenameEdit;
    FileNameEditKSeFInitPZIn: TJvFilenameEdit;
    FileNameEditKSeFInitPZOut: TJvFilenameEdit;
    FileNameEditKSeFRSAProd: TJvFilenameEdit;
    FileNameEditKSeFRSADemo: TJvFilenameEdit;
    FileNameEditKSeFRSATest: TJvFilenameEdit;
    FileNameEditJPKBPlikWyj: TJvFilenameEdit;
    FileNameEditJPKBIU: TJvFilenameEdit;
    FileNameEditJPKBEnc: TJvFilenameEdit;
    FileNameEditJPKPAEnc: TJvFilenameEdit;
    FileNameEditJPKPCInitUpload: TJvFilenameEdit;
    FileNameEditJPKPAInitUpload: TJvFilenameEdit;
    FileNameEditJPKPCWej: TJvFilenameEdit;
    FileNameEditJPKPCEnc: TJvFilenameEdit;
    FileNameEditJPKPAWej: TJvFilenameEdit;
    FileNameEditJPKRSAProd: TJvFilenameEdit;
    FileNameEditJPKRSATest: TJvFilenameEdit;
    FileNameEditEDBPlikWej: TJvFilenameEdit;
    FileNameEditEDBPlikWyj: TJvFilenameEdit;
    FileNameEditEDPCWej: TJvFilenameEdit;
    FileNameEditEDPAWej: TJvFilenameEdit;
    FileNameEditEDPCWyj: TJvFilenameEdit;
    FileNameEditEDPAWyj: TJvFilenameEdit;
    FloatSpinEditKSeFCInvDueValue: TJvSpinEdit;
    FloatSpinEditEDPKwota: TJvSpinEdit;
    FloatSpinEditJPKPKwota: TJvSpinEdit;
    FloatSpinEditKSeFQInvCAamountFrom: TJvSpinEdit;
    FloatSpinEditKSeFQInvCAamountTo: TJvSpinEdit;
    FloatSpinEditKSeFQInvCAamountType: TJvSpinEdit;
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
    GroupBox20: TGroupBox;
    GroupBoxKSeFSesGenIntId: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    GroupBoxKSeFSesTerm: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBoxKSeFSesPar: TGroupBox;
    GroupBoxKSeFSesInitCert: TGroupBox;
    GroupBoxKSeFSesInitTok: TGroupBox;
    GroupBoxKSeFSesInitPZ: TGroupBox;
    GroupBoxKSeFSesStat: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label11: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label14: TLabel;
    Label15: TLabel;
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
    firstName: TLabel;
    Label99: TLabel;
    Panel4: TPanel;
    RadioButtonKSeFBatchCert: TRadioButton;
    RadioButtonKSeFBatchPZ: TRadioButton;
    ScrollBox4: TScrollBox;
    surname: TLabel;
    ListViewCert: TListView;
    MemoKSeFQInvCrCurrencyCodes: TMemo;
    MemoLog: TMemo;
    PageControl1: TPageControl;
    PageControlKSeFQInvSubjectType: TPageControl;
    Panel1: TScrollBox;
    Panel2: TPanel;
    Panel3: TPanel;
    RadioButtonKSeFCInvSubToPersonName: TRadioButton;
    RadioButtonKSeFCInvSubToFullName: TRadioButton;
    RadioGroupKSeFCInvSubToType: TRadioGroup;
    RadioGroupKSeFQInvCrSubjevtToType: TRadioGroup;
    ScrollBox1: TScrollBox;
    ScrollBox2: TScrollBox;
    ScrollBox3: TScrollBox;
    SpinEditKSeFQInvAsPS: TSpinEdit;
    SpinEditKSeFQInvAsPS1: TSpinEdit;
    SpinEditKSeFSesPgSz: TSpinEdit;
    SpinEditKSeFSesPgOf: TSpinEdit;
    Splitter1: TSplitter;
    TabSheetKSeFBatch: TTabSheet;
    TabSheetKSeFCommon: TTabSheet;
    TabSheetKSeFQInvCrDetail: TTabSheet;
    TabSheetKSeFQInvCrIncr: TTabSheet;
    TabSheetKSeFQInvCrRange: TTabSheet;
    TabSheetKSeFQueryInvoice: TTabSheet;
    TabSheetKSeFFaktury: TTabSheet;
    TabSheetKsefSession: TTabSheet;
    TabSheetJPKBramka: TTabSheet;
    TabSheetJPKPodpisAut: TTabSheet;
    TabSheetJPKPodpisCert: TTabSheet;
    TabSheetEDekBramka: TTabSheet;
    TabSheetEDekPodpisAut: TTabSheet;
    TabSheetEDekPodpisCert: TTabSheet;
    TabSheetCert: TTabSheet;
    TabSheetSetup: TTabSheet;
    CheckBoxKSeFQInvCrIInvTypVAT: TCheckBox;
    CheckBoxKSeFQInvCrIInvTypKOR: TCheckBox;
    CheckBoxKSeFQInvCrIInvTypZAL: TCheckBox;
    CheckBoxKSeFQInvCrIInvTypROZ: TCheckBox;
    CheckBoxKSeFQInvCrIInvTypUPR: TCheckBox;
    CheckBoxKSeFQInvCrIInvTypKOR_ZAL: TCheckBox;
    CheckBoxKSeFQInvCrIInvTypKOR_ROZ: TCheckBox;
    FilenameEditLibXML2: TJvFilenameEdit;
    Label115: TLabel;
    procedure ButtonKSeFBatchPodpClick(Sender: TObject);
    procedure ButtonKSeFBatchSendClick(Sender: TObject);
    procedure ButtonKSeFCInvClearClick(Sender: TObject);
    procedure ButtonKSeFCInvGetClick(Sender: TObject);
    procedure ButtonKSeFGenIntIdClick(Sender: TObject);
    procedure ButtonKSeFQInvAsyncClick(Sender: TObject);
    procedure ButtonKSeFQInvAsyncFetchClick(Sender: TObject);
    procedure ButtonKSeFQInvAsyncStatClick(Sender: TObject);
    procedure ButtonKSeFQInvClearClick(Sender: TObject);
    procedure ButtonKSeFQInvSyncClick(Sender: TObject);
    procedure ButtonCertReloadClick(Sender: TObject);
    procedure ButtonEDBUPOClick(Sender: TObject);
    procedure ButtonEDBWyslijClick(Sender: TObject);
    procedure ButtonEdekPodpiszAutClick(Sender: TObject);
    procedure ButtonEdekPodpiszCertClick(Sender: TObject);
    procedure ButtonCertWybierzClick(Sender: TObject);
    procedure ButtonJPKBUPOClick(Sender: TObject);
    procedure ButtonJPKBWyslijClick(Sender: TObject);
    procedure ButtonJPKPodpiszAutClick(Sender: TObject);
    procedure ButtonJPKPodpiszCertClick(Sender: TObject);
    procedure ButtonKSeFIniTokenClick(Sender: TObject);
    procedure ButtonKSeFInitPZClick(Sender: TObject);
    procedure ButtonKSeFInitPZZapiszClick(Sender: TObject);
    procedure ButtonKSeFInitSignedClick(Sender: TObject);
    procedure ButtonKSeFInvGetClick(Sender: TObject);
    procedure ButtonKSeFInvSendClick(Sender: TObject);
    procedure ButtonKSeFInvStatClick(Sender: TObject);
    procedure ButtonkSeFSesStatClick(Sender: TObject);
    procedure ButtonKSeFSesTermClick(Sender: TObject);
    procedure ButtonKSeFStatusUPOClick(Sender: TObject);
    procedure ButtonShowCertClick(Sender: TObject);
    procedure ButtonSetupClick(Sender: TObject);
    procedure FileNameEditEDPAWejAcceptFileName(Sender: TObject;
      var Value: String; var AAction: Boolean);
    procedure FileNameEditEDPCWejAcceptFileName(Sender: TObject;
      var Value: String; var AAction: Boolean);
    procedure FileNameEditJPKPCWejAcceptFileName(Sender: TObject;
      var Value: String; var AAction: Boolean);
    procedure FileNameEditKSeFBatchInZIPAcceptFileName(Sender: TObject;
      var Value: String; var AAction: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RadioButtonKSeFBatchCertChange(Sender: TObject);
    procedure FileNameEditJPKPAWejAfterDialog(Sender: TObject;
      var AName: string; var AAction: Boolean);
  private
    procedure UstawKSeFSesion(AWartosc: Boolean);
    function GetQueriInvoiceCr: TKSeFQueryInvoiceRequest;
  public
    Signer: TlgoCertificateSigner;
    Certyfikaty: TlgoCertificates;
    XAdES: TlgoXAdES;
    EDek: TlgoEDeklaracja;
    JPK: TlgoJPK;
    HTTPClient: TlgoHTTPClient;
    JPKRSAProd, JPKRSATest: TlgoRSAKey;
    KSeF: TlgoKSeF;
    KSeFRSAProd, KSeFRSADemo, KSeFRSATest: TlgoRSAKey;

    procedure Debug(ATekst: String; ALinia: Boolean = False); overload;
    procedure Debug(ATekst: String; ADane: array of const); overload;
    procedure DebugCert(ACertyfikat: TlgoCertificate);
    procedure DebugAuth(AImie, ANazwisko, ANIP: String; ADataU: TDate; AKwota: Currency);
    //procedure DebugJPKItem(const AJPKItem: TlgJPKItem);

    //procedure DebugKSeFResponse(AResp: TKSeFResponse);

    procedure LoadCertList;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  DateUtils;

procedure QuickSave(const APlik, ADane: String); overload;
var
  FS: TFileStream;
begin
  FS := nil;
  try
    FS := TFileStream.Create(APlik, fmCreate);
    FS.Write(ADane[1], Length(ADane));
  finally
    FS.Free;
  end;
end;

procedure QuickSave(const APlik: String; const ADane: TByteDynArray); overload;
var
  FS: TFileStream;
begin
  FS := nil;
  try
    FS := TFileStream.Create(APlik, fmCreate);
    FS.Write(ADane[0], Length(ADane));
  finally
    FS.Free;
  end;
end;

function QuickLoad(const APlik: String): String;
var
  FS: TFileStream;
begin
  FS := nil;
  try
     FS := TFileStream.Create(APlik, fmOpenRead);
     SetLength(Result, FS.Size);
     FS.Read(Result[1], FS.Size);
  finally
    FS.Free;
  end;
end;

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  SL: TStringList;
begin
  {$IF DECLARED(LIBGOVPL_DYNAMIC)}
  if not LoadLibGovPl then
  begin
    MessageDlg('Nie moøna za≥adowaÊ biblioteki ' + LGP_LIBNAME,
      mtError, [mbOK], 0);
    ButtonSetup.Enabled := False;
    Exit;
  end;
  {$IFEND}
  lgplInit;
  Debug('lgplVersion: ' + IntToHex(lgplVersion, 8));
  SL := TStringList.Create;
  SL.Delimiter := ';';
  SL.DelimitedText := lgplListDrivers(LGP_CLSTYPE_HTTP_CLIENT);
  ComboBoxHTTPCli.Items.AddStrings(SL);
  SL.DelimitedText := lgplListDrivers(LGP_CLSTYPE_RAND_GENERATOR);
  ComboBoxRandGen.Items.AddStrings(SL);
  SL.DelimitedText := lgplListDrivers(LGP_CLSTYPE_BASE64_ENCODER);
  ComboBoxBase64.Items.AddStrings(SL);
  SL.DelimitedText := lgplListDrivers(LGP_CLSTYPE_MD5_HASH);
  ComboBoxMD5.Items.AddStrings(SL);
  SL.DelimitedText := lgplListDrivers(LGP_CLSTYPE_SHA1_HASH);
  ComboBoxSHA1.Items.AddStrings(SL);
  SL.DelimitedText := lgplListDrivers(LGP_CLSTYPE_SHA256_HASH);
  ComboBoxSHA256.Items.AddStrings(SL);
  SL.DelimitedText := lgplListDrivers(LGP_CLSTYPE_AES256_ENC);
  ComboBoxAES256.Items.AddStrings(SL);
  SL.DelimitedText := lgplListDrivers(LGP_CLSTYPE_CERT_SIGNER);
  ComboBoxSign.Items.AddStrings(SL);
  SL.DelimitedText := lgplListDrivers(LGP_CLSTYPE_EDEK_GATE);
  ComboBoxEDek.Items.AddStrings(SL);
  SL.DelimitedText := lgplListDrivers(LGP_CLSTYPE_XML_C14N);
  ComboBoxXMLC14N.Items.AddStrings(SL);
  SL.DelimitedText := lgplListDrivers(LGP_CLSTYPE_XML_READER);
  ComboBoxXMLRead.Items.AddStrings(SL);
  SL.DelimitedText := lgplListDrivers(LGP_CLSTYPE_ZIPPRE);
  ComboBoxZip.Items.AddStrings(SL);
  SL.DelimitedText := lgplListDrivers(LGP_CLSTYPE_RSA_ENC);
  ComboBoxRSAEnc.Items.AddStrings(SL);
  SL.Free;
  if ComboBoxHTTPCli.Items.Count > 0 then
    ComboBoxHTTPCli.ItemIndex := 0;
  if ComboBoxRandGen.Items.Count > 0 then
    ComboBoxRandGen.ItemIndex := 0;
  if ComboBoxBase64.Items.Count > 0 then
    ComboBoxBase64.ItemIndex := 0;
  if ComboBoxMD5.Items.Count > 0 then
    ComboBoxMD5.ItemIndex := 0;
  if ComboBoxSHA1.Items.Count > 0 then
    ComboBoxSHA1.ItemIndex := 0;
  if ComboBoxSHA256.Items.Count > 0 then
    ComboBoxSHA256.ItemIndex := 0;
  if ComboBoxAES256.Items.Count > 0 then
    ComboBoxAES256.ItemIndex := 0;
  if ComboBoxSign.Items.Count > 0 then
    ComboBoxSign.ItemIndex := 0;
  if ComboBoxEDek.Items.Count > 0 then
    ComboBoxEDek.ItemIndex := 0;
  if ComboBoxXMLC14N.Items.Count > 0 then
    ComboBoxXMLC14N.ItemIndex := 0;
  if ComboBoxXMLRead.Items.Count > 0 then
    ComboBoxXMLRead.ItemIndex := 0;
  if ComboBoxZip.Items.Count > 0 then
    ComboBoxZip.ItemIndex := 0;
  if ComboBoxRSAEnc.Items.Count > 0 then
    ComboBoxRSAEnc.ItemIndex := 0;
  PageControl1.ActivePageIndex := 0;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  if Assigned(JPK) then
    JPK.Free;
  if Assigned(EDek) then
    EDek.Free;
  if Assigned(XAdES) then
    XAdES.Free;
  if Assigned(Certyfikaty) then
    Certyfikaty.Free;
  if Assigned(Signer) then
    Signer.Free;
  if Assigned(HTTPClient) then
    HTTPClient.Free;
  if Assigned(JPKRSAProd) then
    JPKRSAProd.Free;
  if Assigned(JPKRSATest) then
    JPKRSATest.Free;
  if Assigned(KSeF) then
    KSeF.Free;
  if Assigned(KSeFRSAProd) then
    KSeFRSAProd.Free;
  if Assigned(KSeFRSADemo) then
    KSeFRSADemo.Free;
  if Assigned(KSeFRSATest) then
    KSeFRSATest.Free;
  {$IF DECLARED(LIBGOVPL_DYNAMIC)}
  if LibGovPl4Handle <> 0 then
  {$IFEND}
  lgplExit;
end;

procedure TForm1.RadioButtonKSeFBatchCertChange(Sender: TObject);
begin
  ComboBoxKSeFBatchCert.Enabled := RadioButtonKSeFBatchCert.Checked;
end;

procedure TForm1.UstawKSeFSesion(AWartosc: Boolean);
begin
  GroupBoxKSeFSesStat.Enabled := AWartosc;
  GroupBoxKSeFSesTerm.Enabled := AWartosc;
  GroupBoxKSeFSesGenIntId.Enabled := AWartosc;
  GroupBoxKSeFSesPar.Enabled := not AWartosc;
  GroupBoxKSeFSesInitCert.Enabled := not AWartosc;
  GroupBoxKSeFSesInitTok.Enabled := not AWartosc;
  GroupBoxKSeFSesInitPZ.Enabled := not AWartosc;
  TabSheetKSeFFaktury.TabVisible := AWartosc;
  TabSheetKSeFQueryInvoice.TabVisible := AWartosc;

  // Tylko dla serwerÛw testowych
  FloatSpinEditKSeFQInvCAamountFrom.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
  FloatSpinEditKSeFQInvCAamountTo.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
  FloatSpinEditKSeFQInvCAamountType.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
  MemoKSeFQInvCrCurrencyCodes.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
  CheckBoxKSeFQInvCrFaP17Annotation.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
  CheckGroupKSeFQInvCrIInvoiceTypes.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
end;

function TForm1.GetQueriInvoiceCr: TKSeFQueryInvoiceRequest;
var
  I: Integer;
  Curs: TStringDynArray;
begin
  Curs := nil;
  Result := TKSeFQueryInvoiceRequest.Create;
  case PageControlKSeFQInvSubjectType.ActivePageIndex of
    0: begin
      Result.QueryCriteria := TKSeFQueryCriteriaInvoiceDetail.Create;
      with Result.QueryCriteria as TKSeFQueryCriteriaInvoiceDetail do
      begin
        SubjectType := TKSeFSubjectType(ComboBoxKSeFQInvCrSubTyp.ItemIndex);
        InvoicingDateFrom := DateTimePickerKSeFQInvCrDetInvFrom.DateTime;
        InvoicingDateTo := DateTimePickerKSeFQInvCrDetInvTo.DateTime;
        AmountFrom := FloatSpinEditKSeFQInvCAamountFrom.Value;
        AmountTo := FloatSpinEditKSeFQInvCAamountTo.Value;
        AmountType := FloatSpinEditKSeFQInvCAamountType.Value;
        if Trim(MemoKSeFQInvCrCurrencyCodes.Text) <> '' then
          for I := 0 to MemoKSeFQInvCrCurrencyCodes.Lines.Count - 1 do
            if Trim(MemoKSeFQInvCrCurrencyCodes.Lines[I]) <> '' then
            begin
              SetLength(Curs, Length(Curs) + 1);
              Curs[Length(Curs)-1] := AnsiToUtf8(MemoKSeFQInvCrCurrencyCodes.Lines[I]);
            end;
        FaP17Annotation := CheckBoxKSeFQInvCrFaP17Annotation.Checked;
        InvoiceNumber := AnsiToUtf8(EditKSeFQInvCrInvoiceNumber.Text);
        InvoiceTypes := [];
        if CheckBoxKSeFQInvCrIInvTypVAT.Checked then
          InvoiceTypes := InvoiceTypes + [itVAT];
        if CheckBoxKSeFQInvCrIInvTypKOR.Checked then
          InvoiceTypes := InvoiceTypes + [itKOR];
        if CheckBoxKSeFQInvCrIInvTypZAL.Checked then
          InvoiceTypes := InvoiceTypes + [itZAL];
        if CheckBoxKSeFQInvCrIInvTypROZ.Checked then
          InvoiceTypes := InvoiceTypes + [itROZ];
        if CheckBoxKSeFQInvCrIInvTypUPR.Checked then
          InvoiceTypes := InvoiceTypes + [itUPR];
        if CheckBoxKSeFQInvCrIInvTypKOR_ZAL.Checked then
          InvoiceTypes := InvoiceTypes + [itKOR_ZAL];
        if CheckBoxKSeFQInvCrIInvTypKOR_ROZ.Checked then
          InvoiceTypes := InvoiceTypes + [itKOR_ROZ];
        KsefReferenceNumber := EditKSeFQInvCrRefNo.Text;
        if EditKSeFQInvCrSubjectByIdent.Text <> '' then
        begin
          SubjectBy := TKSeFSubjectBy.Create;
          SubjectBy.IssuedByIdentifier := TKSeFSubjectIdentifierByCompany.Create;
          TKSeFSubjectIdentifierByCompany(SubjectBy.IssuedByIdentifier).Identifier := AnsiToUtf8(EditKSeFQInvCrSubjectByIdent.Text);
        end;
        if (RadioGroupKSeFQInvCrSubjevtToType.ItemIndex >= 0) and (EditKSeFQInvCrSubjectToId.Text <> '') then
        begin
          SubjectTo := TKSeFSubjectTo.Create;
          case RadioGroupKSeFQInvCrSubjevtToType.ItemIndex of
            0: begin
              SubjectTo.IssuedToIdentifier := TKSeFSubjectIdentifierToNone.Create;
            end;
            1: begin
              SubjectTo.IssuedToIdentifier := TKSeFSubjectIdentifierToCompany.Create;
              TKSeFSubjectIdentifierToCompany(SubjectTo.IssuedToIdentifier).Identifier := AnsiToUtf8(EditKSeFQInvCrSubjectToId.Text);
            end;
            2: begin
              SubjectTo.IssuedToIdentifier := TKSeFSubjectIdentifierToOther.Create;
              TKSeFSubjectIdentifierToOther(SubjectTo.IssuedToIdentifier).Identifier := AnsiToUtf8(EditKSeFQInvCrSubjectToId.Text);
            end;
            3: begin
              SubjectTo.IssuedToIdentifier := TKSeFSubjectIdentifierToVatUe.Create;
              TKSeFSubjectIdentifierToVatUe(SubjectTo.IssuedToIdentifier).Identifier := AnsiToUtf8(EditKSeFQInvCrSubjectToId.Text);
            end;
          end;
        end;
      end;
    end;
    1: begin
      Result.QueryCriteria := TKSeFQueryCriteriaInvoiceIncremental.Create;
      with TKSeFQueryCriteriaInvoiceIncremental(Result.QueryCriteria) do
      begin
        SubjectType := TKSeFSubjectType(ComboBoxKSeFQInvCrSubTyp.ItemIndex);
        AcquisitionTimestampThresholdFrom := DateTimePickerKSeFQInvCrIncInvFrom.DateTime;
        AcquisitionTimestampThresholdTo := DateTimePickerKSeFQInvCrIncInvTo.DateTime;
      end;
    end;
    2: begin
      Result.QueryCriteria := TKSeFQueryCriteriaInvoiceRange.Create;
      with TKSeFQueryCriteriaInvoiceRange(Result.QueryCriteria) do
      begin
        SubjectType := TKSeFSubjectType(ComboBoxKSeFQInvCrSubTyp.ItemIndex);
        InvoicingDateFrom := DateTimePickerKSeFQInvCrDetInvFrom.DateTime;
        invoicingDateTo := DateTimePickerKSeFQInvCrDetInvTo.DateTime;
      end;
    end;
  end;
end;

procedure TForm1.Debug(ATekst: String; ALinia: Boolean);
begin
  if ALinia then
    MemoLog.Lines.Append('-------------------------------');
  MemoLog.Lines.Append(ATekst);
end;

procedure TForm1.Debug(ATekst: String; ADane: array of const);
begin
  MemoLog.Lines.Append(Format(ATekst, ADane));
end;

procedure TForm1.DebugCert(ACertyfikat: TlgoCertificate);
begin
  MemoLog.Lines.Append('Certyfikat (' + ACertyfikat.ObjClassName + ')');
  MemoLog.Lines.Append('  Nr seryjny: ' + ACertyfikat.SerialNoDec + ' (' + ACertyfikat.SerialNoHex + ')');
  MemoLog.Lines.Append('  Nazwa: ' + Utf8ToAnsi(ACertyfikat.DisplayName));
  MemoLog.Lines.Append('  Waøny od ' + DateTimeToStr(ACertyfikat.ValidFrom) + ' do ' + DateTimeToStr(ACertyfikat.ValidTo));
  MemoLog.Lines.Append('  Podmiot: ' + Utf8ToAnsi(ACertyfikat.Subject));
  MemoLog.Lines.Append('  Wydawca: ' + Utf8ToAnsi(ACertyfikat.Issuer));
  //MemoLog.Append('  Rodzaj podpisu: ' + ACertyfikat.Signature);
end;

procedure TForm1.DebugAuth(AImie, ANazwisko, ANIP: String; ADataU: TDate;
  AKwota: Currency);
begin
  MemoLog.Lines.Append('Dane autoryzujπce:');
  MemoLog.Lines.Append('  NIP: ' + ANIP);
  MemoLog.Lines.Append('  ImiÍ: ' + AImie);
  MemoLog.Lines.Append('  Nazwisko: ' + ANazwisko);
  MemoLog.Lines.Append('  Data urodzenia: ' + DateToStr(ADataU));
  MemoLog.Lines.Append('  Kwota: ' + CurrToStr(AKwota));
end;

{procedure TForm1.DebugJPKItem(const AJPKItem: TlgJPKItem);
var
  S: String;
begin
  Debug('JPKItem:');

  if Assigned(AJPKItem.InputStream) then
    S := AJPKItem.InputStream.ClassName
  else
    S := 'nil';
  Debug('  InputStream: ' + S);

  if Assigned(AJPKItem.EncryptedStream) then
    S := AJPKItem.EncryptedStream.ClassName
  else
    S := 'nil';
  Debug('  EncryptedStream: ' + S);


end;}

{procedure TForm1.DebugKSeFResponse(AResp: TKSeFResponse);
var
  RttiCtx: TRttiContext;
  Level: Integer = 0;
procedure DumpClass(AObj: TObject);
var
  RT: TRttiType;
  PR: TRttiProperty;
  Line, S: String;
  V: TValue;
begin
  Inc(Level);
  RT := RttiCtx.GetType(AObj.ClassType);
  RT.GetProperties;
  for PR in RT.GetProperties do
  begin
    V := PR.GetValue(AObj);
    WriteStr(S, PR.PropertyType.TypeKind);
    Line := StringOfChar(' ', Level) + PR.Name + ':' + S + '=';
    if PR.PropertyType.TypeKind = tkClass then
    begin
      Debug(Line + V.AsObject.ClassName);
      DumpClass(V.AsObject);
    end
    else
    begin
      case PR.PropertyType.TypeKind of
        tkFloat: begin
          if SameText(PR.PropertyType.Name, 'TDateTime') or SameText(PR.PropertyType.Name, 'TDate') then
            Line := Line + DateTimeToStr(V.AsExtended)
          else
            Line := Line + FloatToStr(V.AsExtended);
        end;
        else
          Line := Line + V.ToString;
      end;
      Debug(Line);
    end;
  end;
  Dec(Level);
end;

begin
  RttiCtx := TRttiContext.Create;
  Debug(AResp.ClassName + '=');
  DumpClass(AResp);
  RttiCtx.Free;
end;}

procedure TForm1.LoadCertList;
var
  I: Integer;
  LI: TListItem;
  S: String;
begin
  Debug('Pobieranie listy certyfikatÛw', True);

  if Assigned(Certyfikaty) then
    Certyfikaty.Free;

  ListViewCert.Items.Clear;
  ComboBoxEdekCert.Items.Clear;
  ComboBoxJPKCert.Items.Clear;
  ComboBoxKSeFCert.Items.Clear;
  ComboBoxKSeFBatchCert.Items.Clear;

  Certyfikaty := Signer.List;
  for I := 0 to Certyfikaty.Count - 1 do
  begin
    Debug('Certyfikat nr ' + IntToStr(I));
    DebugCert(Certyfikaty[I]);
    with Certyfikaty[I] do
    begin
      LI := ListViewCert.Items.Add;
      LI.Caption := IntToStr(I);
      LI.SubItems.Add(Utf8ToAnsi(DisplayName));
      LI.SubItems.Add(DateToStr(ValidFrom));
      LI.SubItems.Add(DateToStr(ValidTo));
      LI.SubItems.Add(SerialNoDec);
      LI.SubItems.Add(Utf8ToAnsi(Issuer));
      LI.SubItems.Add(Utf8ToAnsi(Subject));

      S := Utf8ToAnsi(DisplayName) + ' (' + DateToStr(ValidFrom) + ' - ' + DateToStr(ValidTo) + ')';
      ComboBoxEdekCert.Items.Add(S);
      ComboBoxJPKCert.Items.Add(S);
      ComboBoxKSeFCert.Items.Add(S);
      ComboBoxKSeFBatchCert.Items.Add(S);
    end;
  end;
end;

procedure TForm1.ButtonSetupClick(Sender: TObject);
var
  FS: TFileStream;
begin
  FS := nil;
  if not Assigned(Signer) and (ComboBoxSign.ItemIndex >= 0) then
  begin
    Signer := TlgoCertificateSigner.Create(ComboBoxSign.Text);
    if SameText(Signer.ObjClassName, 'TlgCNGCertificateSigner') then
      lgoCheckResult(lgpCNGCertificateSigner_SetHWnd(Signer.ExtObject, Self.Handle));
  end;

  if ComboBoxHTTPCli.ItemIndex >= 0 then
    HTTPClient := TlgoHTTPClient.Create(ComboBoxHTTPCli.Text);

  XAdES := TlgoXAdES.Create;
  EDek := TlgoEDeklaracja.Create;
  JPK := TlgoJPK.Create;

  with XAdES do
  begin
    if ComboBoxSHA1.ItemIndex >= 0 then
      SHA1HashClass := ComboBoxSHA1.Text;
    if ComboBoxSHA256.ItemIndex >= 0 then
      SHA256HashClass := ComboBoxSHA256.Text;
    if ComboBoxBase64.ItemIndex >= 0 then
      Base64EncoderClass := ComboBoxBase64.Text;
    Signer := Self.Signer;
    SignType := TlgoSignHashType(ComboBoxXAdESSHA.ItemIndex);
    IncludeSigningTime := CheckBoxXAdESCzas.Checked;
  end;

  with EDek do
  begin
    XAdES := Self.XAdES;
    if ComboBoxXMLC14N.ItemIndex >= 0 then
      XMLCanonizator := ComboBoxXMLC14N.Text;
    if ComboBoxEDek.ItemIndex >= 0 then
    begin
      EDekGate := ComboBoxEDek.Text;
      if UpperCase(EDekGate) = UpperCase('TlgWSTEDekGate') then
      begin
        lgoCheckResult(lgpWST_RegisterTransport);
        lgoCheckResult(lgpWST_SetHTTPClient(Self.HTTPClient.ExtObject));
      end;
    end;
    Canonization := CheckBoxEDekC14N.Checked and (XMLCanonizator <> '');
  end;

  with JPK do
  begin
    XAdES := Self.XAdES;
    HTTPClient := Self.HTTPClient;
    if ComboBoxBase64.ItemIndex >= 0 then
      Base64EncoderClass := ComboBoxBase64.Text;
    if ComboBoxAES256.ItemIndex >= 0 then
      AES256EncryptClass := ComboBoxAES256.Text;
    if ComboBoxMD5.ItemIndex >= 0 then
      MD5HashClass := ComboBoxMD5.Text;
    if ComboBoxSHA256.ItemIndex >= 0 then
      SHA256HashClass := ComboBoxSHA256.Text;
    if ComboBoxZip.ItemIndex >= 0 then
      ZipperClass := ComboBoxZip.Text;
    if ComboBoxRSAEnc.ItemIndex >= 0 then
      RSAEncryptClass := ComboBoxRSAEnc.Text;
    if ComboBoxRandGen.ItemIndex >= 0 then
      RandomGeneratorClass := ComboBoxRandGen.Text;
    if ComboBoxXMLRead.ItemIndex >= 0 then
      XMLReaderClass := ComboBoxXMLRead.Text;
    try
      FS := TFileStream.Create(FileNameEditJPKRSAProd.FileName, fmOpenRead);
      JPKRSAProd := TlgoRSAEncrypt.CreateKey(ComboBoxRSAEnc.Text, FS);
    finally
      if Assigned(FS) then
        FreeAndNil(FS);
    end;
    try
      FS := TFileStream.Create(FileNameEditJPKRSATest.FileName, fmOpenRead);
      JPKRSATest := TlgoRSAEncrypt.CreateKey(ComboBoxRSAEnc.Text, FS);
    finally
      if Assigned(FS) then
        FreeAndNil(FS);
    end;
    RSAKeyProd := JPKRSAProd;
    RSAKeyTest := JPKRSATest;
  end;

  KSeF := TlgoKSeF.Create;
  with KSeF do
  begin
    XAdES := Self.XAdES;
    HTTPClient := Self.HTTPClient;
    if ComboBoxBase64.ItemIndex >= 0 then
      Base64EncoderClass := ComboBoxBase64.Text;
    if ComboBoxAES256.ItemIndex >= 0 then
      AES256EncryptClass := ComboBoxAES256.Text;
    if ComboBoxSHA256.ItemIndex >= 0 then
      SHA256HashClass := ComboBoxSHA256.Text;
    if ComboBoxRandGen.ItemIndex >= 0 then
      RandomGeneratorClass := ComboBoxRandGen.Text;
    //if ComboBoxZip.ItemIndex >= 0 then
    //  ZipperClass := ComboBoxZip.Text;
    if ComboBoxRSAEnc.ItemIndex >= 0 then
      RSAEncryptClass := ComboBoxRSAEnc.Text;
    try
      FS := TFileStream.Create(FileNameEditKSeFRSAProd.FileName, fmOpenRead);
      KSeFRSAProd := TlgoRSAEncrypt.CreateKey(ComboBoxRSAEnc.Text, FS);
    finally
      if Assigned(FS) then
        FreeAndNil(FS);
    end;
    try
      FS := TFileStream.Create(FileNameEditKSeFRSADemo.FileName, fmOpenRead);
      KSeFRSADemo := TlgoRSAEncrypt.CreateKey(ComboBoxRSAEnc.Text, FS);
    finally
      if Assigned(FS) then
        FreeAndNil(FS);
    end;
    try
      FS := TFileStream.Create(FileNameEditKSeFRSATest.FileName, fmOpenRead);
      KSeFRSATest := TlgoRSAEncrypt.CreateKey(ComboBoxRSAEnc.Text, FS);
    finally
      if Assigned(FS) then
        FreeAndNil(FS);
    end;
    RSAKey[kgtProd] := KSeFRSAProd;
    RSAKey[kgtDemo] := KSeFRSADemo;
    RSAKey[kgtTest] := KSeFRSATest;
  end;

  if FilenameEditLibXML2.FileName <> '' then
    if lgpLoadLibXML2(PAnsiChar(AnsiToUtf8(FilenameEditLibXML2.FileName))) = 0 then
      MessageDlg('Nie moøna za≥adowaÊ biblioteki: ' + FilenameEditLibXML2.FileName,
        mtError, [mbOK], 0);

  LoadCertList;

  TabSheetSetup.Enabled := False;
  TabSheetCert.TabVisible := True;
  TabSheetEDekPodpisCert.TabVisible := True;
  TabSheetEDekPodpisAut.TabVisible := True;
  TabSheetEDekBramka.TabVisible := True;
  TabSheetJPKPodpisCert.TabVisible := True;
  TabSheetJPKPodpisAut.TabVisible := True;
  TabSheetJPKBramka.TabVisible := True;
  TabSheetKsefSession.TabVisible := True;
  TabSheetKSeFCommon.TabVisible := True;
  TabSheetKSeFBatch.TabVisible := True;

  DateTimePickerKSeFQInvCrRanInvFrom.DateTime := IncDay(Now, -30);
  DateTimePickerKSeFQInvCrRanInvTo.DateTime := Now;
  DateTimePickerKSeFQInvCrIncInvFrom.DateTime := IncDay(Now, -30);
  DateTimePickerKSeFQInvCrIncInvTo.DateTime := Now;
  DateTimePickerKSeFQInvCrDetInvFrom.DateTime := IncDay(Now, -30);
  DateTimePickerKSeFQInvCrDetInvTo.DateTime := Now;
end;

procedure TForm1.FileNameEditEDPAWejAcceptFileName(Sender: TObject;
  var Value: String; var AAction: Boolean);
begin
  FileNameEditEDPAWyj.FileName := Value + '.sig';
end;

procedure TForm1.FileNameEditEDPCWejAcceptFileName(Sender: TObject;
  var Value: String; var AAction: Boolean);
begin
  FileNameEditEDPCWyj.FileName := Value + '.sig';
end;

procedure TForm1.FileNameEditJPKPAWejAfterDialog(Sender: TObject;
  var AName: string; var AAction: Boolean);
begin
  FileNameEditJPKPAEnc.FileName := AName + '.enc';
  FileNameEditJPKPAInitUpload.FileName := AName + '.iu.sig';
end;

procedure TForm1.FileNameEditJPKPCWejAcceptFileName(Sender: TObject;
  var Value: String; var AAction: Boolean);
begin
  FileNameEditJPKPCEnc.FileName := Value + '.enc';
  FileNameEditJPKPCInitUpload.FileName := Value + '.iu.sig';
end;

procedure TForm1.FileNameEditKSeFBatchInZIPAcceptFileName(Sender: TObject;
  var Value: String; var AAction: Boolean);
begin
  FileNameEditKSeFBatchOutEncZIP.FileName := ChangeFileExt(Value, '.part1');
  FileNameEditKSeFBatchOutInitUp.FileName := ChangeFileExt(Value, '.iu.xml');
end;

procedure TForm1.ButtonShowCertClick(Sender: TObject);
begin
  Debug('Pokaz info o certyfikacie', True);
  if (ListViewCert.ItemIndex >= 0) and SameText(Certyfikaty[ListViewCert.ItemIndex].ObjClassName, 'TlgCNGCertificate') then
  begin
    DebugCert(Certyfikaty[ListViewCert.ItemIndex]);
    lgoCheckResult(lgpCNGCertificate_ShowCertificateInfo(Certyfikaty[ListViewCert.ItemIndex].Item, Self.Handle));
  end;
end;

procedure TForm1.ButtonCertWybierzClick(Sender: TObject);
var
  Cert: TlgOCertificate;
begin
  Debug('Wybierz certyfikat', True);
  Cert := Signer.UISelect;
  if Assigned(Cert) then
  begin
    DebugCert(Cert);
    if SameText(Cert.ObjClassName, 'TlgCNGCertificate') then
      lgoCheckResult(lgpCNGCertificate_ShowCertificateInfo(Cert.Item, Self.Handle));
    Cert.Free;
  end
  else
    Debug('Anulowano');
end;

procedure TForm1.ButtonJPKBUPOClick(Sender: TObject);
var
  Status: Integer;
  Opis, Szczegoly: UTF8String;
  UPO: UTF8String;
  Timestamp: UTF8String;
begin
  Debug('JPK - Sprawdü status / pobierz UPO', True);
  try
    Status := JPK.RequestUPO(EditJPKBNrRef.Text, TlgoEDekGateType(ComboBoxJPKBRodzBramUPO.ItemIndex),
      Opis, Szczegoly, UPO, Timestamp);
    Debug('Status: ' + IntToStr(Status));
    Debug('Opis: ' + Utf8ToAnsi(Opis));
    Debug('SzczegÛ≥y: ' + Utf8ToAnsi(Szczegoly));
    Debug('Timestamp: ' + Timestamp);
    if Status = 200 then
    begin
      QuickSave(FileNameEditJPKBPlikWyj.FileName, UPO);
      Debug('Pobrano UPO');
    end
    else
      Debug('Nie pobrano UPO');
  except
    on E: Exception do
    begin
      Debug('B≥πd podzas sprawdzania statusu JPK (%s): %s', [E.ClassName, E.Message]);
      MessageDlg(Format('B≥πd podzas sprawdzania statusu JPK (%s): %s', [E.ClassName, Utf8ToAnsi(E.Message)]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonJPKBWyslijClick(Sender: TObject);
var
  InitUpload: UTF8String;
  EncStream: TFileStream;
  RefNo: UTF8String;
begin
  EncStream := nil;
  Debug('Wyúlij JPK', True);
  try
    try
      Debug('Wczytywanie struktury InitUpload: ' + FileNameEditJPKBIU.FileName);
      InitUpload := QuickLoad(FileNameEditJPKBIU.FileName);

      Debug('Otwarcie strumienia z zaszyfrowanymi danymi: ' + FileNameEditJPKBEnc.FileName);
      EncStream := TFileStream.Create(FileNameEditJPKBEnc.FileName, fmOpenRead);

      Debug('Wysy≥anie');
      JPK.Send(InitUpload, EncStream, RefNo, TlgoEDekGateType(ComboBoxJPKBRodzBram.ItemIndex),
        CheckBoxJPKBCert.Checked);

      EditJPKBNrRef.Text := RefNo;
      Debug('Wys≥ano plik JPK, ref no: ' + RefNo);
    except
      on E: Exception do
      begin
        Debug('B≥πd podzas wysy≥ania JPK (%s): %s', [E.ClassName, E.Message]);
        MessageDlg(Format('B≥πd podzas wysy≥ania JPK (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
      end;
    end;
  finally
    if Assigned(EncStream) then
      EncStream.Free;
  end;
end;

procedure TForm1.ButtonJPKPodpiszAutClick(Sender: TObject);
var
  IStream, OStream: TFileStream;
  S: String;
  InitUp: UTF8String;
begin
  IStream := nil;
  OStream := nil;
  Debug('Podpis JPK danymi autoryzujπcymi', True);
  try
    try
      Debug('Plik wejúciowy: ' + FileNameEditJPKPAWej.FileName);
      IStream := TFileStream.Create(FileNameEditJPKPAWej.FileName, fmOpenRead);

      Debug('Plik wynikowy (enc. zip): ' + FileNameEditJPKPAEnc.FileName );
      OStream := TFileStream.Create(FileNameEditJPKPAEnc.FileName, fmCreate);

      Debug('Na øπdanie (ad hoc): ' + BoolToStr(CheckBoxJPKPCAdHoc.Checked));

      S := GetEnumName(TypeInfo(TlgoEDekGateType), ComboBoxJPKPARodzBram.ItemIndex);
      //WriteStr(S, TlgoEDekGateType(ComboBoxJPKPARodzBram.ItemIndex));
      Debug('Bramka (klucz rsa): ' + S);

      DebugAuth(EditJPKPImie.Text, EditJPKPNazwisko.Text, EditJPKPNIP.Text,
        DateTimePickerJPKPDataU.Date, FloatSpinEditJPKPKwota.Value);

      JPK.SignAuthData(AnsiToUtf8(EditJPKPNIP.Text), AnsiToUtf8(EditJPKPImie.Text), AnsiToUtf8(EditJPKPNazwisko.Text),
        DateTimePickerJPKPDataU.Date, FloatSpinEditJPKPKwota.Value,
        TlgoEDekGateType(ComboBoxJPKPARodzBram.ItemIndex), CheckBoxJPKPCAdHoc.Checked,
        IStream, OStream, InitUp);

      Debug('Podpisano');

      Debug('Zapis InitUpload do pliku: ' + FileNameEditJPKPCInitUpload.FileName);
      QuickSave(FileNameEditJPKPCInitUpload.FileName, InitUp);
    except
      on E: Exception do
      begin
        Debug('B≥πd podzas podpisywaania (%s): %s', [E.ClassName, E.Message]);
        MessageDlg(Format('B≥πd podzas podpisywaania (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
      end;
    end;
  finally
    if Assigned(IStream) then
      IStream.Free;
    if Assigned(OStream) then
      OStream.Free;
  end;
end;

procedure TForm1.ButtonJPKPodpiszCertClick(Sender: TObject);
var
  IStream, OStream: TFileStream;
  InitUp: UTF8String;
  S: String;
begin
  IStream := nil;
  OStream := nil;
  Debug('Podpis JPK certyfikatem', True);
  try
    try
      Debug('Plik wejúciowy: ' + FileNameEditJPKPCWej.FileName);
      IStream := TFileStream.Create(FileNameEditJPKPCWej.FileName, fmOpenRead);

      Debug('Plik wynikowy (enc. zip): ' + FileNameEditJPKPCEnc.FileName );
      OStream := TFileStream.Create(FileNameEditJPKPCEnc.FileName, fmCreate);

      Debug('Na øπdanie (ad hoc): ' + BoolToStr(CheckBoxJPKPCAdHoc.Checked));

      S := GetEnumName(TypeInfo(TlgoEDekGateType), ComboBoxJPKPCRodzBram.ItemIndex);
      //WriteStr(S, TlgoEDekGateType(ComboBoxJPKPCRodzBram.ItemIndex));
      Debug('Bramka (klucz rsa): ' + S);

      DebugCert(Certyfikaty[ComboBoxJPKCert.ItemIndex]);

      JPK.SignCertificate(Certyfikaty[ComboBoxJPKCert.ItemIndex],
        TlgoEDekGateType(ComboBoxJPKPCRodzBram.ItemIndex), CheckBoxJPKPCAdHoc.Checked,
        IStream, OStream, InitUp);
      Debug('Podpisano');

      Debug('Zapis InitUpload do pliku: ' + FileNameEditJPKPCInitUpload.FileName);
      QuickSave(FileNameEditJPKPCInitUpload.FileName, InitUp);
    except
      on E: EAbort do
      begin
        Debug('Anulowano');
        MessageDlg('Anulowano', mtInformation, [mbOK], 0);
      end;
      on E: Exception do
      begin
        Debug('B≥πd podzas podpisywaania (%s): %s', [E.ClassName, E.Message]);
        MessageDlg(Format('B≥πd podzas podpisywaania (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
      end;
    end;
  finally
    if Assigned(IStream) then
      IStream.Free;
    if Assigned(OStream) then
      OStream.Free;
  end;
end;

procedure TForm1.ButtonKSeFIniTokenClick(Sender: TObject);
var
  Resp: TKSeFInitSessionResponse;
begin
  Resp := nil;
  if EditKSeFToken.Text = '' then
  begin
    MessageDlg('Wprowadü token', mtInformation, [mbOK], 0);
    Exit;
  end;
  Debug('KSeF - SessionInitToken');
  KSeF.NIP := EditKSeFNIP.Text;
  KSeF.Encryption := CheckBoxKSeFEncrypt.Checked;
  KSeF.Token := EditKSeFToken.Text;
  KSeF.GateType := TlgoKSeFGateType(ComboBoxKSeFBramka.ItemIndex);
  KSeF.FormCode := TlgoKSeFFormCode(ComboBoxKSeFInitFormCode.ItemIndex + 1);
  try
    try
      Resp := KSeF.SessionInitToken;
      Debug('Odpowiedü:' + Utf8ToAnsi(Resp.RawResponse));
      UstawKSeFSesion(True);
    except
      on E: Exception do
      begin
        Debug('B≥πd podczas inicjalizacji sesji (' + E.ClassName + '): ' + E.Message);
        if E is EKSeFExceptionResponse then
          Debug('Odpowiedü: ' + Utf8ToAnsi(EKSeFExceptionResponse(E).RawData));
        MessageDlg('B≥πd podczas inicjalizacji sesji (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
      end;
    end;
  finally
    if Assigned(Resp) then
      Resp.Free;
  end;
end;

procedure TForm1.ButtonKSeFInitPZClick(Sender: TObject);
var
  SignedInitAuth: String;
  Resp: TKSeFInitSessionResponse;
begin
  Resp := nil;
  Debug('KSeF - SessionInitPZ', True);
  KSeF.NIP := EditKSeFNIP.Text;
  KSeF.Encryption := CheckBoxKSeFEncrypt.Checked;
  KSeF.GateType := TlgoKSeFGateType(ComboBoxKSeFBramka.ItemIndex);
  KSeF.FormCode := TlgoKSeFFormCode(ComboBoxKSeFInitFormCode.ItemIndex + 1);
  try
    try
      Debug('Wczytywanie podpisanego pliku: ' + FileNameEditKSeFInitPZIn.FileName);
      SignedInitAuth := QuickLoad(FileNameEditKSeFInitPZIn.FileName);
      Resp := KSeF.SessionInitPZ(SignedInitAuth);
      Debug('Odpowiedü:' + Utf8ToAnsi(Resp.RawResponse));
      UstawKSeFSesion(True);
    except
      on E: Exception do
      begin
        Debug('B≥πd podczas inicjalizacji sesji (' + E.ClassName + '): ' + E.Message);
        if E is EKSeFExceptionResponse then
          Debug('Odpowiedü: ' + Utf8ToAnsi(EKSeFExceptionResponse(E).RawData));
        MessageDlg('B≥πd podczas inicjalizacji sesji (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
      end;
    end;
  finally
    if Assigned(Resp) then
      Resp.Free;
  end;
end;

procedure TForm1.ButtonKSeFInitPZZapiszClick(Sender: TObject);
var
  AuthStruct: String;
begin
  Debug('KSeF - InitSessionPZ', True);
  try
    KSeF.NIP := EditKSeFNIP.Text;
    KSeF.Encryption := CheckBoxKSeFEncrypt.Checked;
    KSeF.GateType := TlgoKSeFGateType(ComboBoxKSeFBramka.ItemIndex);
    KSeF.FormCode := TlgoKSeFFormCode(ComboBoxKSeFInitFormCode.ItemIndex + 1);
    AuthStruct := KSeF.SessionChalangePZ;
    QuickSave(FileNameEditKSeFInitPZOut.FileName, AuthStruct);
    Debug('Zapisano do pliku: ' + FileNameEditKSeFInitPZOut.FileName);
  except
    on E: Exception do
    begin
      Debug('B≥πd tworzenia pliku sesji (' + E.ClassName + '): ' + E.Message);
      if E is EKSeFExceptionResponse then
        Debug('Odpowiedü: ' + Utf8ToAnsi(EKSeFExceptionResponse(E).RawData));
      MessageDlg('B≥πd tworzenia pliku sesji (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonKSeFInitSignedClick(Sender: TObject);
var
  Resp: TKSeFInitSessionResponse;
begin
  Resp := nil;
  if ComboBoxKSeFCert.ItemIndex < 0 then
  begin
    MessageDlg('Wybierz certyfikat', mtInformation, [mbOK], 0);
    Exit;
  end;
  Debug('KSeF - SessionInitSigned', True);
  KSeF.NIP := EditKSeFNIP.Text;
  KSeF.Certificate := Certyfikaty[ComboBoxKSeFCert.ItemIndex];
  KSeF.Encryption := CheckBoxKSeFEncrypt.Checked;
  KSeF.GateType := TlgoKSeFGateType(ComboBoxKSeFBramka.ItemIndex);
  KSeF.CertificateAuthType := TlgoKSeFCertificateAuthType(ComboBoxKSeFCertAuthType.ItemIndex);
  KSeF.FormCode := TlgoKSeFFormCode(ComboBoxKSeFInitFormCode.ItemIndex + 1);
  try
    try
      Resp := KSeF.SessionInitSigned;
      Debug('Odpowiedü:' + Utf8ToAnsi(Resp.RawResponse));
      UstawKSeFSesion(True);
    except
      on E: Exception do
      begin
        Debug('B≥πd podczas inicjalizacji sesji (' + E.ClassName + '): ' + E.Message);
        if E is EKSeFExceptionResponse then
          Debug('Odpowiedü: ' + Utf8ToAnsi(EKSeFExceptionResponse(E).RawData));
        MessageDlg('B≥πd podczas inicjalizacji sesji (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
      end;
    end;
  finally
    if Assigned(Resp) then
      Resp.Free;
  end;
end;

procedure TForm1.ButtonKSeFInvGetClick(Sender: TObject);
var
  FA: TFileStream;
begin
  FA := nil;
  Debug('KSeF - pobierz fakturÍ', True);
  try
    try
      FA := TFileStream.Create(FileNameEditKSeFGetFN.FileName, fmCreate);
      KSeF.InvoiceGet(EditKSeFInvGetNr.Text, FA);
      Debug('Pobrano, zapisywanie do: ' + FileNameEditKSeFGetFN.FileName);
    except
      on E: Exception do
      begin
        Debug('B≥πd podczas pobierania faktury (' + E.ClassName + '): ' + E.Message);
        if E is EKSeFExceptionResponse then
          Debug('Odpowiedü: ' + Utf8ToAnsi(EKSeFExceptionResponse(E).RawData));
        MessageDlg('B≥πd podczas pobierania faktury (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
      end;
    end;
  finally
    if Assigned(FA) then
      FA.Free;
  end;
end;

procedure TForm1.ButtonKSeFInvSendClick(Sender: TObject);
var
  FS: TFileStream;
  Resp: TKSeFSendInvoiceResponse;
begin
  FS := nil;
  Debug('KSeF - wyúlij fakturÍ', True);
  try
    try
      Debug('Otwieranie pliku: ' + FileNameEditKSeFInvSend.FileName);
      FS := TFileStream.Create(FileNameEditKSeFInvSend.FileName, fmOpenRead);
      Debug('Wysy≥anie');
      Resp := KSeF.InvoiceSend(FS);
      Debug('Odpowiedü: ' + Utf8ToAnsi(Resp.RawResponse));
      EditKSeFInvStatNr.Text := Resp.ElementReferenceNumber;
      Debug('Wys≥ano, el. nr ref: ' + Resp.ElementReferenceNumber);
      Resp.Free;
    except
      on E: Exception do
      begin
        Debug('B≥πd podczas wysy≥ania faktury (' + E.ClassName + '): ' + E.Message);
        if E is EKSeFExceptionResponse then
          Debug('Odpowiedü: ' + Utf8ToAnsi(EKSeFExceptionResponse(E).RawData));
        MessageDlg('B≥πd podczas wysy≥ania faktury (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
      end;
    end;
  finally
    if Assigned(FS) then
      FS.Free;
  end;
end;

procedure TForm1.ButtonKSeFInvStatClick(Sender: TObject);
var
  Resp: TKSeFStatusInvoiceResponse;
begin
  Debug('KSeF - sprawdzanie statusu faktury', True);
  try
    Resp := KSeF.InvoiceStatus(EditKSeFInvStatNr.Text);
    Debug('Odpowiedü: ' + Utf8ToAnsi(Resp.RawResponse));
    Resp.Free;
  except
    on E: Exception do
    begin
      Debug('B≥πd podczas wysy≥ania faktury (' + E.ClassName + '): ' + E.Message);
      if E is EKSeFExceptionResponse then
        Debug('Odpowiedü: ' + Utf8ToAnsi(EKSeFExceptionResponse(E).RawData));
      MessageDlg('B≥πd podczas wysy≥ania faktury (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonkSeFSesStatClick(Sender: TObject);
var
  Resp: TKSeFSessionStatusResponse;
begin
  Resp := nil;
  Debug('Sprawdzenie statusu sesji', True);
  try
    try
      if EditKSeFSesStatRef.Text = '' then
        Resp := KSeF.SessionStatus(SpinEditKSeFSesPgSz.Value, SpinEditKSeFSesPgOf.Value,
          CheckBoxKSeFStatDet.Checked)
      else
        Resp := KSeF.SessionStatus(EditKSeFSesStatRef.Text, SpinEditKSeFSesPgSz.Value,
          SpinEditKSeFSesPgOf.Value, CheckBoxKSeFStatDet.Checked);
      Debug('Odpowiedü: ' + Utf8ToAnsi(Resp.RawResponse));
    except
      on E: Exception do
      begin
        Debug('B≥πd podczas sprawdzania statusu sesji (' + E.ClassName + '): ' + E.Message);
        if E is EKSeFExceptionResponse then
          Debug('Odpowiedü: ' + Utf8ToAnsi(EKSeFExceptionResponse(E).RawData));
        MessageDlg('B≥πd podczas sprawdzania statusu sesji (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
      end;
    end;
  finally
    if Assigned(Resp) then
      Resp.Free;
  end;
end;

procedure TForm1.ButtonKSeFSesTermClick(Sender: TObject);
var
  Resp: TKSeFTerminateSessionResponse;
begin
  Resp := nil;
  Debug('KoÒczenie sesji', True);
  try
    try
      Resp := KSeF.SessionTerminate;
      if Assigned(Resp) then
      begin
        Debug('Odpowiedü: ' + Utf8ToAnsi(Resp.RawResponse));
        UstawKSeFSesion(False);
      end;
    except
      on E: Exception do
      begin
        Debug('B≥πd podczas terminacji sesji (' + E.ClassName + '): ' + E.Message);
        if E is EKSeFExceptionResponse then
          Debug('Odpowiedü: ' + Utf8ToAnsi(EKSeFExceptionResponse(E).RawData));
        MessageDlg('B≥πd podczas terminacji sesji (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
      end;
    end;
  finally
    if Assigned(Resp) then
      Resp.Free;
  end;
end;

procedure TForm1.ButtonKSeFStatusUPOClick(Sender: TObject);
var
  Resp: TKSeFStatusResponse;
begin
  Resp := nil;
  Debug('KSeF - sprawdü status wysy≥ki wsadowej', True);
  try
    try
      Debug('Nr ref: ' + EditKSeFStatusReferenceNumber.Text);
      Debug('Bramka: ' + ComboBoxKSeFComBramka.Text);
      Resp := KSeF.CommonStatus(EditKSeFStatusReferenceNumber.Text, TlgoKSeFGateType(ComboBoxKSeFComBramka.ItemIndex));
      Debug('Status: ' + IntToStr(Resp.ProcessingCode));
      Debug('Opis: ' + Utf8ToAnsi(Resp.ProcessingDescription));
      if (Resp.ProcessingCode = 200) and (Resp.Upo <> '') then
      begin
        QuickSave(FileNameEditKSeFUPO.FileName, Resp.Upo);
        Debug('Pobrano UPO do pliku: ' + FileNameEditKSeFUPO.FileName);
      end
      else
        Debug('NIE pobrano UPO');
    except
      on E: Exception do
      begin
        Debug('B≥πd podczas terminacji sesji (' + E.ClassName + '): ' + E.Message);
        if E is EKSeFExceptionResponse then
          Debug('Odpowiedü: ' + Utf8ToAnsi(EKSeFExceptionResponse(E).RawData));
        MessageDlg('B≥πd podczas terminacji sesji (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
      end;
    end;
  finally
    if Assigned(Resp) then
      Resp.Free;
  end;
end;

procedure TForm1.ButtonEdekPodpiszCertClick(Sender: TObject);
var
  Wej: String;
  Wyj: UTF8String;
begin
  Debug('Podpis eDeklaracji certyfikatem', True);
  if (Certyfikaty.Count = 0) or (ComboBoxEdekCert.ItemIndex < 0) then
  begin
    Debug('B£•D: Brak wybranego certyfikatu.');
    MessageDlg('Brak wybranego certyfikatu.', mtError, [mbOK], 0);
    Exit;
  end;

  try
    Debug('Plik wej: ' + FileNameEditEDPCWej.FileName);
    Wej := QuickLoad(FileNameEditEDPCWej.FileName);

    DebugCert(Certyfikaty[ComboBoxEdekCert.ItemIndex]);
    Debug('Podpisywanie');
    EDek.PodpiszCertyfikatem(Wej, Certyfikaty[ComboBoxEdekCert.ItemIndex], Wyj);

    Debug('Plik wyj: ' + FileNameEditEDPCWyj.FileName);
    QuickSave(FileNameEditEDPCWyj.FileName, Wyj);

    Debug('Podpisano');
  except
    on E: EAbort do
    begin
      Debug('Anulowano');
      MessageDlg('Anulowano', mtInformation, [mbOK], 0);
    end;
    on E: Exception do
    begin
      Debug('B≥πd podzas podpisywaania (%s): %s', [E.ClassName, E.Message]);
      MessageDlg(Format('B≥πd podzas podpisywaania (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonEdekPodpiszAutClick(Sender: TObject);
var
  Wej: String;
  Wyj: UTF8String;
begin
  Debug('Podpis eDeklaracji certyfikatem', True);
  try
    Debug('Plik wej: ' + FileNameEditEDPAWej.FileName);
    Wej := QuickLoad(FileNameEditEDPAWej.FileName);

    DebugAuth(EditEDPImie.Text, EditEDPNazwisko.Text, EditEDPNIP.Text,
      DateTimePickerEDPDataU.Date, FloatSpinEditEDPKwota.Value);
    Debug('Podpisywanie');

    EDek.PodpiszDanymiAut(Wej, AnsiToUtf8(EditEDPImie.Text), AnsiToUtf8(EditEDPNazwisko.Text),
      EditEDPNIP.Text, DateTimePickerEDPDataU.Date, FloatSpinEditEDPKwota.Value,
      Wyj);

    Debug('Plik wyj: ' + FileNameEditEDPAWyj.FileName);
    QuickSave(FileNameEditEDPAWyj.FileName, Wyj);

    Debug('Podpisano');
  except
    on E: Exception do
    begin
      Debug('B≥πd podzas podpisywaania (%s): %s', [E.ClassName, E.Message]);
      MessageDlg(Format('B≥πd podzas podpisywaania (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonEDBWyslijClick(Sender: TObject);
var
  Dane: String;
  NrRef, Opis: UTF8String;
  Status: Integer;
  S: String;
begin
  Debug('Wyúlij eDeklaracjÍ', True);
  if ComboBoxEDBRodzBram.ItemIndex < 0 then
  begin
    MessageDlg('ProszÍ wybraÊ rodzaj bramki.', mtInformation, [mbOK], 0);
    Exit;
  end;
  if ComboBoxEDBRodzPodp.ItemIndex < 0 then
  begin
    MessageDlg('ProszÍ wybraÊ rodzaj podpisu, jakim podpisano deklaracjÍ', mtInformation, [mbOK], 0);
    Exit;
  end;

  try
    Debug('Plik wej: ' + FileNameEditEDBPlikWej.FileName);
    Dane := QuickLoad(FileNameEditEDBPlikWej.FileName);

    S := GetEnumName(TypeInfo(TlgoEDekGateType), ComboBoxEDBRodzBram.ItemIndex);
    //Str(TlgoEDekGateType(ComboBoxEDBRodzBram.ItemIndex), S);
    Debug('Bramka: ' + S);
    S := GetEnumName(TypeInfo(TlgoEDekSignType), ComboBoxEDBRodzPodp.ItemIndex);
    //Str(TlgoEDekSignType(ComboBoxEDBRodzPodp.ItemIndex), S);
    Debug('Podpis: ' + S);

    Debug('Wysy≥anie');

    EDek.Wyslij(Dane, TlgoEDekGateType(ComboBoxEDBRodzBram.ItemIndex),
      TlgoEDekSignType(ComboBoxEDBRodzPodp.ItemIndex), NrRef, Status, Opis);

    Debug('Status: ' + IntToStr(Status));
    Debug('Opis: ' + Utf8ToAnsi(Opis));
    Debug('Nr ref.: ' + NrRef);

    if (Status >= 100) and (Status <= 399) then
    begin
      EditEDBNrRef.Text := NrRef;
      Debug('Wys≥ano');
    end
    else
      Debug('NIE wys≥ano');
  except
    on E: Exception do
    begin
      Debug('B≥πd podczas wysy≥ania eDeklaracji (%s): %s', [E.ClassName, E.Message]);
      MessageDlg(Format('B≥πd podczas wysy≥ania eDeklaracji (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonEDBUPOClick(Sender: TObject);
var
  Status: Integer;
  S: String;
  Opis, UPO: UTF8String;
begin
  Debug('Sprawdü status eDeklaracji / pobierz UPO', True);
  if EditEDBNrRef.Text = '' then
  begin
    MessageDlg('Wprowadü nr referencyjny', mtInformation, [mbOK], 0);
    Exit;
  end;
  if ComboBoxEDBRodzBramUPO.ItemIndex < 0 then
  begin
    MessageDlg('Wybierz rodzaj bramki', mtInformation, [mbOK], 0);
    Exit;
  end;

  try
    Debug('Nr ref: ' + EditEDBNrRef.Text);
    S := GetEnumName(TypeInfo(TlgoEDekGateType), ComboBoxEDBRodzBramUPO.ItemIndex);
    //Str(TlgoEDekGateType(ComboBoxEDBRodzBramUPO.ItemIndex), S);
    Debug('Bramka: ' + S);
    Debug('Sprawdzanie statusu');

    EDek.PobierzUPO(EditEDBNrRef.Text, TlgoEDekGateType(ComboBoxEDBRodzBramUPO.ItemIndex), Status, Opis, UPO);

    Debug('Status: ' + IntToStr(Status));
    Debug('Opis: ' + Utf8ToAnsi(Opis));

    if Status = 200 then
    begin
      Debug('Pobrano UPO');
      Debug('UPO zapisano do: ' + FileNameEditEDBPlikWyj.FileName);
      QuickSave(FileNameEditEDBPlikWyj.FileName, UPO);
    end
    else
      Debug('NIE pobrano UPO');
  except
    on E: Exception do
    begin
      Debug('B≥πd podczas sprawdzania statusu eDeklaracji (%s): %s', [E.ClassName, E.Message]);
      MessageDlg(Format('B≥πd podczas sprawdzania statusu eDeklaracji (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonCertReloadClick(Sender: TObject);
begin
  LoadCertList;
end;

procedure TForm1.ButtonKSeFQInvClearClick(Sender: TObject);
begin
  FloatSpinEditKSeFQInvCAamountFrom.Value := 0;
  FloatSpinEditKSeFQInvCAamountTo.Value := 0;
  FloatSpinEditKSeFQInvCAamountType.Value := 0;
  MemoKSeFQInvCrCurrencyCodes.Clear;
  CheckBoxKSeFQInvCrFaP17Annotation.Checked := False;
  EditKSeFQInvCrInvoiceNumber.Clear;
  EditKSeFQInvCrRefNo.Clear;
  EditKSeFQInvCrSubjectToId.Clear;
  EditKSeFQInvCrSubjectByIdent.Clear;
  DateTimePickerKSeFQInvCrRanInvFrom.DateTime := IncDay(Now, -30);
  DateTimePickerKSeFQInvCrRanInvTo.DateTime := Now;
  DateTimePickerKSeFQInvCrIncInvFrom.DateTime := IncDay(Now, -30);
  DateTimePickerKSeFQInvCrIncInvTo.DateTime := Now;
  DateTimePickerKSeFQInvCrDetInvFrom.DateTime := IncDay(Now, -30);
  DateTimePickerKSeFQInvCrDetInvTo.DateTime := Now;
  CheckBoxKSeFQInvCrIInvTypVAT.Checked := False;
  CheckBoxKSeFQInvCrIInvTypKOR.Checked := False;
  CheckBoxKSeFQInvCrIInvTypZAL.Checked := False;
  CheckBoxKSeFQInvCrIInvTypROZ.Checked := False;
  CheckBoxKSeFQInvCrIInvTypUPR.Checked := False;
  CheckBoxKSeFQInvCrIInvTypKOR_ZAL.Checked := False;
  CheckBoxKSeFQInvCrIInvTypKOR_ROZ.Checked := False;
  RadioGroupKSeFQInvCrSubjevtToType.ItemIndex := -1;
end;

procedure TForm1.ButtonKSeFQInvAsyncClick(Sender: TObject);
var
  Req: TKSeFQueryInvoiceRequest;
  Resp: TKSeFQueryInvoiceAsyncInitResponse;
begin
  Debug('KSeF - Inicjowanie zapytania asynchronicznego o faktury', True);
  Req := GetQueriInvoiceCr;
  Debug('Zapytanie: ' + Req.AsJSONString);
  try
    try
      Resp := KSeF.QueryInvoiceAsyncInit(Req);
      Debug('Odpowiedü: ' + Utf8ToAnsi(Resp.RawResponse));
      EditKSeFQInvAsyncQRefNo.Text := Resp.ElementReferenceNumber;
      Resp.Free;
    except
      on E: Exception do
      begin
        Debug('B≥πd podczas inicjowania zapytania o faktury asynchronicznie (%s): %s', [E.ClassName, E.Message]);
        if E is EKSeFExceptionResponse then
          Debug('Odpowiedü: ' + Utf8ToAnsi(EKSeFExceptionResponse(E).RawData));
        MessageDlg(Format('B≥πd podczas inicjowania zapytania o faktury aynchronicznie (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
      end;
    end;
  finally
    Req.Free;
  end;
end;

procedure TForm1.ButtonKSeFGenIntIdClick(Sender: TObject);
var
  Resp: TKSeFInternalIdentifierGeneratedResponse;
begin
  Debug('KSeF - Wygenerowanie identyfikatora wewnetrznego na podstawie nip i 4 cyfr', True);
  try
    Resp := KSeF.SessionGenerateInternalIdentifier(EditKSeFinputDigitsSequence.Text);
    Debug('Identyfikator: ' + Resp.InternalIdentifier);
    Debug('Odpowiedü: ' + Utf8ToAnsi(Resp.RawResponse));
    Resp.Free;
  except
    on E: Exception do
    begin
      Debug('B≥πd podczas generowania identyfikatora wewn. (%s): %s', [E.ClassName, E.Message]);
      if E is EKSeFExceptionResponse then
        Debug('Odpowiedü: ' + Utf8ToAnsi(EKSeFExceptionResponse(E).RawData));
      MessageDlg(Format('B≥πd podczas generowania identyfikatora wewn. (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonKSeFCInvGetClick(Sender: TObject);
var
  FA: TFileStream;
  Req: TKSeFInvoiceRequestKSeF;
begin
  FA := nil;
  Req := nil;
  Debug('KSeF - interfejs ogÛlny - pobranie faktury', True);
  try
    try
      Req := TKSeFInvoiceRequestKSeF.Create;
      Req.KsefReferenceNumber := EditKSeFCInvRefNum.Text;
      Req.InvoiceDetails := TKSeFInvoiceQueryDetails.Create;
      Req.InvoiceDetails.DueValue := FloatSpinEditKSeFCInvDueValue.Value;
      Req.InvoiceDetails.InvoiceOryginalNumber := EditKSeFCInvOrgNum.Text;
      Req.InvoiceDetails.SubjectTo := TKSeFSubjectTo.Create;
      if RadioGroupKSeFCInvSubToType.ItemIndex >= 0 then
        case RadioGroupKSeFCInvSubToType.ItemIndex of
          0: Req.InvoiceDetails.SubjectTo.IssuedToIdentifier := TKSeFSubjectIdentifierToNone.Create;
          1: begin
            Req.InvoiceDetails.SubjectTo.IssuedToIdentifier := TKSeFSubjectIdentifierToCompany.Create;
            TKSeFSubjectIdentifierToCompany(Req.InvoiceDetails.SubjectTo.IssuedToIdentifier).Identifier := EditKSeFCInvSubToIdent.Text;
          end;
          2: begin
            Req.InvoiceDetails.SubjectTo.IssuedToIdentifier := TKSeFSubjectIdentifierToOther.Create;
            TKSeFSubjectIdentifierToOther(Req.InvoiceDetails.SubjectTo.IssuedToIdentifier).Identifier := EditKSeFCInvSubToIdent.Text;
          end;
        end;
      if RadioButtonKSeFCInvSubToFullName.Checked or RadioButtonKSeFCInvSubToPersonName.Checked then
      begin
        if RadioButtonKSeFCInvSubToPersonName.Checked then
        begin
          Req.InvoiceDetails.SubjectTo.IssuedToName := TKSeFSubjectPersonName.Create;
          with Req.InvoiceDetails.SubjectTo.IssuedToName as TKSeFSubjectPersonName do
          begin
            FirstName := AnsiToUtf8(EditKSeFCInvSubToFirstName.Text);
            Surname := AnsiToUtf8(EditKSeFCInvSubToSurname.Text);
            TradeName := AnsiToUtf8(EditKSeFCInvSubToTradeName.Text);
          end;
        end
        else
        begin
          Req.InvoiceDetails.SubjectTo.IssuedToName := TKSeFSubjectFullName.Create;
          with Req.InvoiceDetails.SubjectTo.IssuedToName as TKSeFSubjectFullName do
          begin
            FullName := AnsiToUtf8(EditKSeFCInvSubToFullName.Text);
            TradeName := AnsiToUtf8(EditKSeFCInvSubToTradeName.Text);
          end;
        end;
      end;
      Debug('Bramka: ' + ComboBoxKSeFComBramka.Text);
      Debug('Zapytanie: ' + Utf8ToAnsi(Req.AsJSONString));
      Debug('Plik wynikowy: ' + FileNameEditKSeFCInvFN.FileName);
      FA := TFileStream.Create(FileNameEditKSeFCInvFN.FileName, fmCreate);
      KSeF.CommonInvoiceKSeF(Req, FA, TlgoKSeFGateType(ComboBoxKSeFComBramka.ItemIndex));
    except
      on E: Exception do
      begin
        Debug('B≥πd podczas generowania identyfikatora wewn. (%s): %s', [E.ClassName, E.Message]);
        if E is EKSeFExceptionResponse then
          Debug('Odpowiedü: ' + Utf8ToAnsi(EKSeFExceptionResponse(E).RawData));
        MessageDlg(Format('B≥πd podczas generowania identyfikatora wewn. (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
      end;
    end;
  finally
    FA.Free;
    Req.Free;
  end;
end;

procedure TForm1.ButtonKSeFCInvClearClick(Sender: TObject);
begin
  EditKSeFCInvRefNum.Clear;
  EditKSeFCInvSubToIdent.Clear;
  EditKSeFCInvOrgNum.Clear;
  EditKSeFCInvSubToFirstName.Clear;
  EditKSeFCInvSubToIdent.Clear;
  EditKSeFCInvSubToFullName.Clear;
  EditKSeFCInvSubToSurname.Clear;
  EditKSeFCInvSubToTradeName.Clear;
  RadioGroupKSeFCInvSubToType.ItemIndex := -1;
  RadioButtonKSeFCInvSubToFullName.Checked := False;
  RadioButtonKSeFCInvSubToPersonName.Checked := False;
  FloatSpinEditKSeFCInvDueValue.Value := 0;
end;

procedure TForm1.ButtonKSeFBatchPodpClick(Sender: TObject);
var
  InZIPFile: TFileStream;
  InitUpload: UTF8String;
  OutEncZIPFile: TFileStream;
begin
  InZIPFile := nil;
  InitUpload := '';
  OutEncZIPFile := nil;
  Debug('KSeF - pobieranie / przygotowanie do wysy≥ki wsadowej', True);
  if RadioButtonKSeFBatchCert.Checked and (ComboBoxKSeFBatchCert.ItemIndex < 0) then
  begin
    MessageDlg('Wybierz certyfikat', mtInformation, [mbOK], 0);
    Exit;
  end;
  try
    try
      Debug('Otwieranie pliku wejúciowego: ' + FileNameEditKSeFBatchInZIP.FileName);
      InZIPFile := TFileStream.Create(FileNameEditKSeFBatchInZIP.FileName, fmOpenRead);
      Debug('Tworzenie pliku wyjúciowego: ' + FileNameEditKSeFBatchOutEncZIP.FileName);
      OutEncZIPFile := TFileStream.Create(FileNameEditKSeFBatchOutEncZIP.FileName, fmCreate);
      KSeF.NIP := EditKSeFBatchNIP.Text;
      KSeF.FormCode := TlgoKSeFFormCode(ComboBoxKSeFBatchInitFormCode.ItemIndex);
      KSeF.GateType := TlgoKSeFGateType(ComboBoxKSeFBatchBramka.ItemIndex);
      if RadioButtonKSeFBatchCert.Checked then
      begin
        Debug('Podpis certyfikatem');
        KSeF.Certificate := Certyfikaty[ComboBoxKSeFBatchCert.ItemIndex];
      end
      else
        Debug('Podpis profilem zaufanym');

      KSeF.BatchSign(InZIPFile, RadioButtonKSeFBatchPZ.Checked, OutEncZIPFile, InitUpload,
        ExtractFileName(FileNameEditKSeFBatchInZIP.FileName), ExtractFileName(FileNameEditKSeFBatchOutEncZIP.FileName));
      Debug('Podpisano');

      QuickSave(FileNameEditKSeFBatchOutInitUp.FileName, InitUpload);
      Debug('Zapisano strukturÍ InitUpload do pliku: ' + FileNameEditKSeFBatchOutInitUp.FileName);

      FileNameEditKSeFBatchSendIU.FileName := FileNameEditKSeFBatchOutInitUp.FileName;
      FileNameEditKSeFBatchSendEnc.FileName := FileNameEditKSeFBatchOutEncZIP.FileName;
      ComboBoxKSeFBatchSendBramka.ItemIndex := ComboBoxKSeFBatchBramka.ItemIndex;
    except
      on E: EAbort do
        Debug('ANULOWANO');
      on E: Exception do
      begin
        Debug('B≥πd podczas podpisywania / przygotowania do wysy≥ki wsadowej (%s): %s', [E.ClassName, E.Message]);
        MessageDlg(Format('B≥πd podczas podpisywania / przygotowania do wysy≥ki wsadowej (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
      end;
    end;
  finally
    if Assigned(InZIPFile) then
      InZIPFile.Free;
    if Assigned(OutEncZIPFile) then
      OutEncZIPFile.Free;
  end;
end;

procedure TForm1.ButtonKSeFBatchSendClick(Sender: TObject);
var
  InitUpload: UTF8String;
  EncZIPFile: TFileStream;
begin
  EncZIPFile := nil;
  Debug('KSeF - wysy≥ka wsadowa', True);
  try
    try
      Debug('Otwieranie pliku wejúciowego: ' + FileNameEditKSeFBatchSendEnc.FileName);
      EncZIPFile := TFileStream.Create(FileNameEditKSeFBatchSendEnc.FileName, fmOpenRead);
      Debug('Wczytanie InitUpload z pliku: ' + FileNameEditKSeFBatchSendIU.FileName);
      InitUpload := QuickLoad(FileNameEditKSeFBatchSendIU.FileName);
      KSeF.GateType := TlgoKSeFGateType(ComboBoxKSeFBatchSendBramka.ItemIndex);
      EditKSeFBatchNrRef.Text := KSeF.BatchSend(EncZIPFile, InitUpload);
      Debug('Wys≥ano, nr referencyjny: ' + EditKSeFBatchNrRef.Text);
    except
      on E: Exception do
      begin
        Debug('B≥πd podczas wysy≥ki wsadowej (%s): %s', [E.ClassName, E.Message]);
        if E is EKSeFExceptionResponse then
          Debug('Odpowiedü: ' + Utf8ToAnsi(EKSeFExceptionResponse(E).RawData));
        MessageDlg(Format('B≥πd podczas wysy≥ki wsadowej (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
      end;
    end;
  finally
    if Assigned(EncZIPFile) then
      EncZIPFile.Free;
  end;
end;

procedure TForm1.ButtonKSeFQInvAsyncFetchClick(Sender: TObject);
var
  FS: TFileStream;
begin
  Debug('KSeF - pobieranie wyniku zapytania o faktury asynchronicznie', True);
  if EditKSeFQInvAsyncQRefNo.Text = '' then
  begin
    MessageDlg('Wprowadü nr ref. zapytania', mtInformation, [mbOK], 0);
    Exit;
  end;
  if EditKSeFQInvAsyncERefNo.Text = '' then
  begin
    MessageDlg('Wprowadü nr ref. elementu', mtInformation, [mbOK], 0);
    Exit;
  end;
  if FileNameEditKSeFQInvAsyncFN.FileName = '' then
  begin
    MessageDlg('Wprowadü nazwÍ pliku docelowego', mtInformation, [mbOK], 0);
    Exit;
  end;
  FS := nil;
  try
    try
      FS := TFileStream.Create(FileNameEditKSeFQInvAsyncFN.FileName, fmCreate);
      KSeF.QueryInvoiceAsyncFetch(EditKSeFQInvAsyncQRefNo.Text, EditKSeFQInvAsyncERefNo.Text, FS);
      Debug('Zapis wyniku do: ' + FileNameEditKSeFQInvAsyncFN.FileName);
    except
      on E: Exception do
      begin
        Debug('B≥πd podczas pobierania wyniku zapytania o faktury asynchronicznie (%s): %s', [E.ClassName, E.Message]);
        if E is EKSeFExceptionResponse then
          Debug('Odpowiedü: ' + Utf8ToAnsi(EKSeFExceptionResponse(E).RawData));
        MessageDlg(Format('B≥πd podczas pobierania wyniku zapytania o faktury aynchronicznie (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
      end;
    end;
  finally
    if Assigned(FS) then
      FS.Free;
  end;
end;

procedure TForm1.ButtonKSeFQInvAsyncStatClick(Sender: TObject);
var
  Resp: TKSeFQueryInvoiceAsyncStatusResponse;
begin
  Debug('KSeF - pobranie statusu zapytania o faktury asynchronicznie', True);
  if EditKSeFQInvAsyncQRefNo.Text = '' then
  begin
    MessageDlg('Wprowadü nr ref. zapytania', mtInformation, [mbOK], 0);
    Exit;
  end;
  try
    Debug('Nr ref. zapytania: ' + EditKSeFQInvAsyncQRefNo.Text);
    Resp := KSeF.QueryInvoiceAsyncStatus(EditKSeFQInvAsyncQRefNo.Text);
    Debug('Odpowiedü: ' + Utf8ToAnsi(Resp.RawResponse));
    Debug('Status: ' + IntToStr(Resp.ProcessingCode));
    Debug('Opis statusu: ' + Utf8ToAnsi(Resp.ProcessingDescription));
    Debug('Liczba czÍúci: ' + IntToStr(Resp.NumberOfParts));
    if (Resp.ProcessingCode = 200) and Assigned(Resp.PartList) and (Resp.PartList.Count > 0) then
      EditKSeFQInvAsyncERefNo.Text := Resp.PartList.Items[0].PartReferenceNumber;
    Resp.Free;
  except
    on E: Exception do
    begin
      Debug('B≥πd podczas pobierania statusu zapytania o faktury asynchronicznie (%s): %s', [E.ClassName, E.Message]);
      if E is EKSeFExceptionResponse then
        Debug('Odpowiedü: ' + Utf8ToAnsi(EKSeFExceptionResponse(E).RawData));
      MessageDlg(Format('B≥πd podczas pobierania statusu zapytania o faktury aynchronicznie (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonKSeFQInvSyncClick(Sender: TObject);
var
  Req: TKSeFQueryInvoiceRequest;
  Resp: TKSeFQueryInvoiceSyncResponse;
begin
  Debug('KSeF - zapytanie o faktury synchronicznie', True);
  Req := GetQueriInvoiceCr;
  Debug('Zapytanie: ' + Req.AsJSONString);
  try
    try
      Resp := KSeF.QueryInvoiceSync(Req, SpinEditKSeFQInvAsPS.Value, SpinEditKSeFQInvAsPS1.Value);
      Debug('Odpowiedü: ' + Utf8ToAnsi(Resp.RawResponse));
      Resp.Free;
    except
      on E: Exception do
      begin
        Debug('B≥πd podczas zapytania o faktury synchronicznie (%s): %s', [E.ClassName, E.Message]);
        if E is EKSeFExceptionResponse then
          Debug('Odpowiedü: ' + Utf8ToAnsi(EKSeFExceptionResponse(E).RawData));
        MessageDlg(Format('B≥πd podczas zapytania o faktury synchronicznie (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
      end;
    end;
  finally
    Req.Free;
  end;
end;

end.

