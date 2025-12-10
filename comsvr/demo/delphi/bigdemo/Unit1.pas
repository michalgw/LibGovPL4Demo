unit Unit1;

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  ExtCtrls, Spin, Types, Mask, TypInfo, Buttons, OleServer, ActiveX, LibGovPL_TLB;

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
    DateTimePickerKSeFQInvCrDetInvFromD: TDateTimePicker;
    DateTimePickerKSeFQInvCrDetInvToD: TDateTimePicker;
    DateTimePickerKSeFQInvCrIncInvFromD: TDateTimePicker;
    DateTimePickerKSeFQInvCrIncInvToD: TDateTimePicker;
    DateTimePickerKSeFQInvCrRanInvFromD: TDateTimePicker;
    DateTimePickerKSeFQInvCrRanInvToD: TDateTimePicker;
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
    FileNameEditKSeFBatchInZIP: TEdit;
    FileNameEditKSeFBatchOutEncZIP: TEdit;
    FileNameEditKSeFBatchOutInitUp: TEdit;
    FileNameEditKSeFBatchSendEnc: TEdit;
    FileNameEditKSeFBatchSendIU: TEdit;
    FileNameEditKSeFUPO: TEdit;
    FileNameEditKSeFCInvFN: TEdit;
    FileNameEditKSeFQInvAsyncFN: TEdit;
    FileNameEditKSeFInitPZIn: TEdit;
    FileNameEditKSeFInitPZOut: TEdit;
    FileNameEditKSeFRSAProd: TEdit;
    FileNameEditKSeFRSADemo: TEdit;
    FileNameEditKSeFRSATest: TEdit;
    FileNameEditJPKBPlikWyj: TEdit;
    FileNameEditJPKBIU: TEdit;
    FileNameEditJPKBEnc: TEdit;
    FileNameEditJPKPAEnc: TEdit;
    FileNameEditJPKPCInitUpload: TEdit;
    FileNameEditJPKPAInitUpload: TEdit;
    FileNameEditJPKPCWej: TEdit;
    FileNameEditJPKPCEnc: TEdit;
    FileNameEditJPKPAWej: TEdit;
    FileNameEditJPKRSAProd: TEdit;
    FileNameEditJPKRSATest: TEdit;
    FileNameEditEDBPlikWej: TEdit;
    FileNameEditEDBPlikWyj: TEdit;
    FileNameEditEDPCWej: TEdit;
    FileNameEditEDPAWej: TEdit;
    FileNameEditEDPCWyj: TEdit;
    FileNameEditEDPAWyj: TEdit;
    FloatSpinEditKSeFCInvDueValue: TEdit;
    FloatSpinEditEDPKwota: TEdit;
    FloatSpinEditJPKPKwota: TEdit;
    FloatSpinEditKSeFQInvCAamountFrom: TEdit;
    FloatSpinEditKSeFQInvCAamountTo: TEdit;
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
    GroupBox66: TGroupBox;
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
    Label7: TLabel;
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
    FilenameEditLibXML2: TEdit;
    Label115: TLabel;
    SBFileNameEditJPKRSAProd: TSpeedButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    SBFileNameEditJPKRSATest: TSpeedButton;
    SBFileNameEditKSeFRSAProd: TSpeedButton;
    SBFileNameEditKSeFRSADemo: TSpeedButton;
    SBFileNameEditKSeFRSATest: TSpeedButton;
    SBFilenameEditLibXML2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton23: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    SpeedButton26: TSpeedButton;
    SpeedButton27: TSpeedButton;
    ComboBoxKSeFQInvCAamountType: TComboBox;
    ScrollBox5: TScrollBox;
    GroupBox7: TGroupBox;
    Label71: TLabel;
    Label72: TLabel;
    SpeedButton17: TSpeedButton;
    EditKSeFInvGetNr: TEdit;
    FileNameEditKSeFGetFN: TEdit;
    ButtonKSeFInvGet: TButton;
    GroupBox6: TGroupBox;
    Label70: TLabel;
    EditKSeFInvStatNr: TEdit;
    ButtonKSeFInvStat: TButton;
    GroupBox5: TGroupBox;
    Label69: TLabel;
    SpeedButton16: TSpeedButton;
    FileNameEditKSeFInvSend: TEdit;
    ButtonKSeFInvSend: TButton;
    GroupBox21: TGroupBox;
    Label116: TLabel;
    Label117: TLabel;
    EditKSeFInvHideNr: TEdit;
    EditKSeFInvHideReason: TEdit;
    ButtonKSeFInvHide: TButton;
    GroupBox22: TGroupBox;
    Label118: TLabel;
    Label119: TLabel;
    EditKSeFInvShowNr: TEdit;
    EditKSeFInvShowReason: TEdit;
    ButtonKSeFInvShow: TButton;
    DateTimePickerKSeFQInvCrDetInvFromT: TDateTimePicker;
    DateTimePickerKSeFQInvCrDetInvToT: TDateTimePicker;
    DateTimePickerKSeFQInvCrIncInvFromT: TDateTimePicker;
    DateTimePickerKSeFQInvCrIncInvToT: TDateTimePicker;
    DateTimePickerKSeFQInvCrRanInvFromT: TDateTimePicker;
    DateTimePickerKSeFQInvCrRanInvToT: TDateTimePicker;
    CheckBoxKSeFQInvCrIsHidden: TCheckBox;
    DateTimePickerKSeFQInvCrHidingDateFromD: TDateTimePicker;
    DateTimePickerKSeFQInvCrHidingDateFromT: TDateTimePicker;
    DateTimePickerKSeFQInvCrHidingDateToD: TDateTimePicker;
    DateTimePickerKSeFQInvCrHidingDateToT: TDateTimePicker;
    CheckBoxKSeFQInvCrHidingDateFrom: TCheckBox;
    CheckBoxKSeFQInvCrHidingDateTo: TCheckBox;
    Panel5: TPanel;
    Panel6: TPanel;
    Splitter2: TSplitter;
    MemoLog: TMemo;
    ListViewObj: TListView;
    ButtonObjShow: TButton;
    ButtonObjClea: TButton;
    ButtonObjCount: TButton;
    Label120: TLabel;
    FileNameEditLibPKCS11: TEdit;
    SpeedButton28: TSpeedButton;
    TabSheetPKCS11: TTabSheet;
    GroupBox23: TGroupBox;
    ButtonPKCS11Info: TButton;
    ButtonPKCS11Slots: TButton;
    GroupBox24: TGroupBox;
    Label124: TLabel;
    ComboBoxPKCS11Cert: TComboBox;
    Label125: TLabel;
    EditPKCS11PIN: TEdit;
    ButtonPKCS11SesStart: TButton;
    ButtonPKCS11SesLogin: TButton;
    ButtonPKCS11SesLogout: TButton;
    ButtonPKCS11SesClose: TButton;
    ButtonPKCS11SesInfo: TButton;
    Label126: TLabel;
    ComboBoxPKCS11UserType: TComboBox;
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
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RadioButtonKSeFBatchCertChange(Sender: TObject);
    procedure SBFileNameEditJPKRSAProdClick(Sender: TObject);
    procedure ButtonKSeFInvHideClick(Sender: TObject);
    procedure ButtonKSeFInvShowClick(Sender: TObject);
    procedure ButtonObjShowClick(Sender: TObject);
    procedure ButtonObjCleaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonObjCountClick(Sender: TObject);
    procedure ButtonPKCS11InfoClick(Sender: TObject);
    procedure ButtonPKCS11SlotsClick(Sender: TObject);
    procedure ButtonPKCS11SesStartClick(Sender: TObject);
    procedure ButtonPKCS11SesLoginClick(Sender: TObject);
    procedure ButtonPKCS11SesLogoutClick(Sender: TObject);
    procedure ButtonPKCS11SesCloseClick(Sender: TObject);
    procedure ButtonPKCS11SesInfoClick(Sender: TObject);
  private
    procedure UstawKSeFSesion(AWartosc: Boolean);
    function GetQueryInvoiceCr: IlgcKSeFRequest;
    procedure ObjAdd(AObj: IlgcObject);
  public
    Backend: IlgcBackend;
    WSTBackend: IlgcWSTBackend;
    LibXMLBackend: IlgcLibXMLBackend;
    PKCS11Backend: IlgcPKCS11Backend;
    Signer: IlgcCertificateSigner;
    Certyfikaty: IlgcList;
    XAdES: IlgcXAdES;
    EDek: IlgcEDeklaracja;
    JPK: IlgcJPK;
    HTTPClient: IlgcHTTPClient;
    JPKRSAProd, JPKRSATest: IDispatch;
    KSeF: IlgcKSeF_2_6_0;
    KSeFRSAProd, KSeFRSADemo, KSeFRSATest: IDispatch;

    procedure Debug(ATekst: String; ALinia: Boolean = False); overload;
    procedure Debug(ATekst: String; ADane: array of const); overload;
    procedure DebugCert(ACertyfikat: IlgcCertificate);
    procedure DebugAuth(AImie, ANazwisko, ANIP: String; ADataU: TDate; AKwota: Currency);
    procedure DebugErrorInfo(AError: IlgcErrorInfo);
    //procedure DebugJPKItem(const AJPKItem: TlgJPKItem);

    //procedure DebugKSeFResponse(AResp: TKSeFResponse);

    procedure LoadCertList;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  DateUtils, Unit2, Variants, ComObj;

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

procedure AddSeparated(AValue: String; var AStr: String);
begin
  if AStr <> '' then
    AStr := AStr + ';';
  AStr := AStr + AValue;
end;

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);

procedure VarArrToStrings(AVarArr: Variant; Strings: TStrings);
var
  I: Integer;
begin
  for I := VarArrayLowBound(AVarArr, 1) to VarArrayHighBound(AVarArr, 1) do
    Strings.Add(AVarArr[I]);
end;

begin
  Backend := ColgcBackend.Create;
  Debug('lgplVersion: ' + Backend.GetLibVersion);
  VarArrToStrings(Backend.GetClassNames(lgcCTHTTPClient), ComboBoxHTTPCli.Items);
  VarArrToStrings(Backend.GetClassNames(lgcCTRandGenerator), ComboBoxRandGen.Items);
  VarArrToStrings(Backend.GetClassNames(lgcCTBase64Encoder), ComboBoxBase64.Items);
  VarArrToStrings(Backend.GetClassNames(lgcCTMD5Hash), ComboBoxMD5.Items);
  VarArrToStrings(Backend.GetClassNames(lgcCTSHA1Hash), ComboBoxSHA1.Items);
  VarArrToStrings(Backend.GetClassNames(lgcCTSHA256Hash), ComboBoxSHA256.Items);
  VarArrToStrings(Backend.GetClassNames(lgcCTAES256Encrypt), ComboBoxAES256.Items);
  VarArrToStrings(Backend.GetClassNames(lgcCTCertSigner), ComboBoxSign.Items);
  VarArrToStrings(Backend.GetClassNames(lgcCTEdekGate), ComboBoxEDek.Items);
  VarArrToStrings(Backend.GetClassNames(lgcCTXMLC14N), ComboBoxXMLC14N.Items);
  VarArrToStrings(Backend.GetClassNames(lgcCTXMLReader), ComboBoxXMLRead.Items);
  VarArrToStrings(Backend.GetClassNames(lgcCTZipper), ComboBoxZip.Items);
  VarArrToStrings(Backend.GetClassNames(lgcCTRSAEncrypt), ComboBoxRSAEnc.Items);
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
var
  IloscObiektowCOM, IloscObiektowKSeF: Integer;
begin
  KSeF := nil;
  KSeFRSAProd := nil;
  KSeFRSADemo := nil;
  KSeFRSATest := nil;
  JPK := nil;
  JPKRSAProd := nil;
  JPKRSATest := nil;
  EDek := nil;
  XAdES := nil;
  Certyfikaty := nil;
  Signer := nil;
  HTTPClient := nil;
  if Assigned(WSTBackend) then
    WSTBackend.HTTPClient := nil;
  WSTBackend := nil;

  // Czy pozostaly jakies obiekty (poza Backend)?
  IloscObiektowCOM := Backend.GetDebugInfo(1);
  IloscObiektowKSeF := Backend.GetDebugInfo(2);
  if (IloscObiektowCOM > 1) or (IloscObiektowKSeF > 0) then
    MessageDlg(Format('Ilosc obiektow COM: %d' + #13#10
      + 'Ilosc obiektow KSeF: %d', [IloscObiektowCOM, IloscObiektowKSeF]),
      mtWarning, [mbOK], 0);
end;

procedure TForm1.RadioButtonKSeFBatchCertChange(Sender: TObject);
begin
  ComboBoxKSeFBatchCert.Enabled := RadioButtonKSeFBatchCert.Checked;
end;

procedure TForm1.SBFileNameEditJPKRSAProdClick(Sender: TObject);
const
  FLT_PEM = 'Pliki PEM (*.pem)|*.pem|Wszystkie pliki (*.*)|*.*';
  FLT_DLL = 'Pliki DLL (*.dll)|*.dll|Wszystkie pliki (*.*)|*.*';
  FLT_XML = 'Pliki XML (*.xml)|*.xml|Wszystkie pliki (*.*)|*.*';
  FLT_SIG = 'Pliki SIG (*.sig)|*.sig|Wszystkie pliki (*.*)|*.*';
  FLT_ENC = 'Pliki ENC (*.enc)|*.enc|Wszystkie pliki (*.*)|*.*';
  FLT_ZIP = 'Pliki ZIP (*.zip)|*.zip|Wszystkie pliki (*.*)|*.*';
var
  E: TEdit;
  D: TOpenDialog;
begin
  D := nil;
  E := nil;
  case TComponent(Sender).Tag of
    1: begin
      E := FileNameEditJPKRSAProd;
      OpenDialog1.Filter := FLT_PEM;
      D := OpenDialog1;
    end;
    2: begin
      E := FileNameEditJPKRSATest;
      OpenDialog1.Filter := FLT_PEM;
      D := OpenDialog1;
    end;
    3: begin
      E := FileNameEditKSeFRSAProd;
      OpenDialog1.Filter := FLT_PEM;
      D := OpenDialog1;
    end;
    4: begin
      E := FileNameEditKSeFRSADemo;
      OpenDialog1.Filter := FLT_PEM;
      D := OpenDialog1;
    end;
    5: begin
      E := FileNameEditKSeFRSATest;
      OpenDialog1.Filter := FLT_PEM;
      D := OpenDialog1;
    end;
    6: begin
      E := FilenameEditLibXML2;
      OpenDialog1.Filter := FLT_DLL;
      D := OpenDialog1;
    end;
    7: begin
      E := FileNameEditEDBPlikWej;
      OpenDialog1.Filter := FLT_SIG;
      D := OpenDialog1;
    end;
    8: begin
      E := FileNameEditEDBPlikWyj;
      OpenDialog1.Filter := FLT_XML;
      D := OpenDialog1;
    end;
    9: begin
      E := FileNameEditEDPCWej;
      OpenDialog1.Filter := FLT_XML;
      D := OpenDialog1;
    end;
    10: begin
      E := FileNameEditEDPCWyj;
      D := SaveDialog1;
      D.Filter := FLT_SIG;
    end;
    11: begin
      E := FileNameEditEDPAWej;
      D := OpenDialog1;
      D.Filter := FLT_XML;
    end;
    12: begin
      E := FileNameEditEDPAWyj;
      D := SaveDialog1;
      D.Filter := FLT_SIG;
    end;
    13: begin
      E := FileNameEditJPKPCWej;
      D := OpenDialog1;
      D.Filter := FLT_XML;
    end;
    14: begin
      E := FileNameEditJPKPCEnc;
      D := SaveDialog1;
      D.Filter := FLT_ENC;
    end;
    15: begin
      E := FileNameEditJPKPCInitUpload;
      D := SaveDialog1;
      D.Filter := FLT_SIG;
    end;
    16: begin
      E := FileNameEditJPKPAWej;
      D := OpenDialog1;
      D.Filter := FLT_XML;
    end;
    17: begin
      E := FileNameEditJPKPAEnc;
      D := SaveDialog1;
      D.Filter := FLT_ENC;
    end;
    18: begin
      E := FileNameEditJPKPAInitUpload;
      D := SaveDialog1;
      D.Filter := FLT_SIG;
    end;
    19: begin
      E := FileNameEditJPKBIU;
      D := OpenDialog1;
      D.Filter := FLT_SIG;
    end;
    20: begin
      E := FileNameEditJPKBEnc;
      D := OpenDialog1;
      D.Filter := FLT_ENC;
    end;
    21: begin
      E := FileNameEditJPKBPlikWyj;
      D := SaveDialog1;
      D.Filter := FLT_XML;
    end;
    22: begin
      E := FileNameEditKSeFInvSend;
      D := OpenDialog1;
      D.Filter := FLT_XML;
    end;
    23: begin
      E := FileNameEditKSeFGetFN;
      D := SaveDialog1;
      D.Filter := FLT_XML;
    end;
    24: begin
      E := FileNameEditKSeFInitPZOut;
      D := SaveDialog1;
      D.Filter := FLT_XML;
    end;
    25: begin
      E := FileNameEditKSeFInitPZIn;
      D := OpenDialog1;
      D.Filter := FLT_SIG;
    end;
    26: begin
      E := FileNameEditKSeFCInvFN;
      D := SaveDialog1;
      D.Filter := FLT_XML;
    end;
    27: begin
      E := FileNameEditKSeFUPO;
      D := SaveDialog1;
      D.Filter := FLT_XML;
    end;
    28: begin
      E := FileNameEditKSeFBatchInZIP;
      D := OpenDialog1;
      D.Filter := FLT_ZIP;
    end;
    29: begin
      E := FileNameEditKSeFBatchOutInitUp;
      D := SaveDialog1;
      D.Filter := FLT_SIG;
    end;
    30: begin
      E := FileNameEditKSeFBatchOutEncZIP;
      D := SaveDialog1;
      D.Filter := FLT_ENC;
    end;
    31: begin
      E := FileNameEditKSeFBatchSendIU;
      D := OpenDialog1;
      D.Filter := FLT_SIG;
    end;
    32: begin
      E := FileNameEditKSeFBatchSendEnc;
      D := OpenDialog1;
      D.Filter := FLT_ENC;
    end;
    33: begin
      E := FileNameEditKSeFQInvAsyncFN;
      D := SaveDialog1;
      D.Filter := FLT_ZIP;
    end;
    34: begin
      E := FileNameEditLibPKCS11;
      D := OpenDialog1;
      D.Filter := FLT_DLL;
    end;
  end;
  if D = nil then
    Exit;
  D.FileName := E.Text;
  if D.Execute then
  begin
    E.Text := D.FileName;
    case TComponent(Sender).Tag of
      9: begin
        FileNameEditEDPCWyj.Text := D.FileName + '.sig';
      end;
      11: begin
        FileNameEditEDPAWyj.Text := D.FileName + '.sig';
      end;
      13: begin
        FileNameEditJPKPCEnc.Text := D.FileName + '.enc';
        FileNameEditJPKPCInitUpload.Text := D.FileName + '.iu.sig';
      end;
      16: begin
        FileNameEditJPKPAEnc.Text := D.FileName + '.enc';
        FileNameEditJPKPAInitUpload.Text := D.FileName + '.iu.sig';
      end;
      28: begin
        FileNameEditKSeFBatchOutEncZIP.Text := ChangeFileExt(D.FileName, '.part1');
        FileNameEditKSeFBatchOutInitUp.Text := ChangeFileExt(D.FileName, '.iu.xml');
      end;
    end;
  end;
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

  // Tylko dla serwerów testowych
  FloatSpinEditKSeFQInvCAamountFrom.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
  FloatSpinEditKSeFQInvCAamountTo.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
  ComboBoxKSeFQInvCAamountType.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
  MemoKSeFQInvCrCurrencyCodes.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
  CheckBoxKSeFQInvCrFaP17Annotation.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
  CheckGroupKSeFQInvCrIInvoiceTypes.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;

  // Tylko dla serwerow testowych >= 2.2.0
  CheckBoxKSeFQInvCrIsHidden.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
  DateTimePickerKSeFQInvCrHidingDateFromD.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
  DateTimePickerKSeFQInvCrHidingDateFromT.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
  DateTimePickerKSeFQInvCrHidingDateToD.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
  DateTimePickerKSeFQInvCrHidingDateToT.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
end;

function TForm1.GetQueryInvoiceCr: IlgcKSeFRequest;
var
  I: Integer;
  Req: OleVariant;
  Obj: OleVariant;
  S: String;
  D: TDateTime;
begin
  Req := KSeF.CreateKSeFObject('TKSeFQueryInvoiceRequest');
  case PageControlKSeFQInvSubjectType.ActivePageIndex of
    0: begin
      Req.QueryCriteria := KSeF.CreateKSeFObject('TKSeFQueryCriteriaInvoiceDetail');
      Obj := Req.QueryCriteria;
      Obj.SubjectType := ComboBoxKSeFQInvCrSubTyp.ItemIndex;
      D := DateOf(DateTimePickerKSeFQInvCrDetInvFromD.DateTime) + TimeOf(DateTimePickerKSeFQInvCrDetInvFromT.DateTime);
      Obj.InvoicingDateFrom := D;
      D := DateOf(DateTimePickerKSeFQInvCrDetInvToD.DateTime) + TimeOf(DateTimePickerKSeFQInvCrDetInvToT.DateTime);
      Obj.InvoicingDateTo := D;
      Obj.AmountFrom := StrToCurr(FloatSpinEditKSeFQInvCAamountFrom.Text);
      Obj.AmountTo := StrToCurr(FloatSpinEditKSeFQInvCAamountTo.Text);
      Obj.AmountType := ComboBoxKSeFQInvCAamountType.ItemIndex;
      if Trim(MemoKSeFQInvCrCurrencyCodes.Text) <> '' then
      begin
        S := '';
        for I := 0 to MemoKSeFQInvCrCurrencyCodes.Lines.Count - 1 do
          if Trim(MemoKSeFQInvCrCurrencyCodes.Lines[I]) <> '' then
          begin
            if S <> '' then
              S := S + ';';
            S := S + Trim(MemoKSeFQInvCrCurrencyCodes.Lines[I]);
          end;
        Obj.CurrencyCodesStr := S;
      end;
      Obj.FaP17Annotation := CheckBoxKSeFQInvCrFaP17Annotation.Checked;
      Obj.InvoiceNumber := EditKSeFQInvCrInvoiceNumber.Text;
      S := '';
      if CheckBoxKSeFQInvCrIInvTypVAT.Checked then
        AddSeparated('VAT', S);
      if CheckBoxKSeFQInvCrIInvTypKOR.Checked then
        AddSeparated('KOR', S);
      if CheckBoxKSeFQInvCrIInvTypZAL.Checked then
        AddSeparated('ZAL', S);
      if CheckBoxKSeFQInvCrIInvTypROZ.Checked then
        AddSeparated('ROZ', S);
      if CheckBoxKSeFQInvCrIInvTypUPR.Checked then
        AddSeparated('UPR', S);
      if CheckBoxKSeFQInvCrIInvTypKOR_ZAL.Checked then
        AddSeparated('KOR_ZAL', S);
      if CheckBoxKSeFQInvCrIInvTypKOR_ROZ.Checked then
        AddSeparated('KOR_ROZ', S);
      if S <> '' then
        Obj.InvoiceTypesStr := S;
      Obj.KsefReferenceNumber := EditKSeFQInvCrRefNo.Text;
      if EditKSeFQInvCrSubjectByIdent.Text <> '' then
      begin
        Obj.SubjectBy := KSeF.CreateKSeFObject('TKSeFSubjectBy');
        Obj.SubjectBy.IssuedByIdentifier := KSeF.CreateKSeFObject('TKSeFSubjectIdentifierByCompany');
        Obj.SubjectBy.IssuedByIdentifier.Identifier := EditKSeFQInvCrSubjectByIdent.Text;
      end;
      if (RadioGroupKSeFQInvCrSubjevtToType.ItemIndex >= 0) and (EditKSeFQInvCrSubjectToId.Text <> '') then
      begin
        Obj.SubjectTo := KSeF.CreateKSeFObject('TKSeFSubjectTo');
        case RadioGroupKSeFQInvCrSubjevtToType.ItemIndex of
          0: begin
            Obj.SubjectTo.IssuedToIdentifier := KSeF.CreateKSeFObject('TKSeFSubjectIdentifierToNone');
          end;
          1: begin
            Obj.SubjectTo.IssuedToIdentifier := KSeF.CreateKSeFObject('TKSeFSubjectIdentifierToCompany');
            Obj.SubjectTo.IssuedToIdentifier.Identifier := EditKSeFQInvCrSubjectToId.Text;
          end;
          2: begin
            Obj.SubjectTo.IssuedToIdentifier := KSeF.CreateKSeFObject('TKSeFSubjectIdentifierToOther');
            Obj.SubjectTo.IssuedToIdentifier.Identifier := EditKSeFQInvCrSubjectToId.Text;
          end;
          3: begin
            Obj.SubjectTo.IssuedToIdentifier := KSeF.CreateKSeFObject('TKSeFSubjectIdentifierToVatUe');
            Obj.SubjectTo.IssuedToIdentifier.Identifier := EditKSeFQInvCrSubjectToId.Text;
          end;
        end;
      end;
    end;
    1: begin
      Req.QueryCriteria := KSeF.CreateKSeFObject('TKSeFQueryCriteriaInvoiceIncremental');
      Obj := Req.QueryCriteria;
      Obj.SubjectType := ComboBoxKSeFQInvCrSubTyp.ItemIndex;
      D := DateOf(DateTimePickerKSeFQInvCrIncInvFromD.DateTime) + TimeOf(DateTimePickerKSeFQInvCrIncInvFromT.DateTime);
      Obj.AcquisitionTimestampThresholdFrom := D;
      D := DateOf(DateTimePickerKSeFQInvCrIncInvToD.DateTime) + TimeOf(DateTimePickerKSeFQInvCrIncInvToT.DateTime);
      Obj.AcquisitionTimestampThresholdTo := D;
    end;
    2: begin
      Req.QueryCriteria := KSeF.CreateKSeFObject('TKSeFQueryCriteriaInvoiceRange');
      Obj := Req.QueryCriteria;
      Obj.SubjectType := ComboBoxKSeFQInvCrSubTyp.ItemIndex;
      D := DateOf(DateTimePickerKSeFQInvCrDetInvFromD.DateTime) + TimeOf(DateTimePickerKSeFQInvCrDetInvFromT.DateTime);
      Obj.InvoicingDateFrom := D;
      D := DateOf(DateTimePickerKSeFQInvCrDetInvToD.DateTime) + TimeOf(DateTimePickerKSeFQInvCrDetInvToT.DateTime);
      Obj.invoicingDateTo := D;
    end;
  end;
  if CheckBoxKSeFQInvCrIsHidden.Checked then
    Req.QueryCriteria.IsHidden := True;
  if CheckBoxKSeFQInvCrHidingDateFrom.Checked then
  begin
    D := DateOf(DateTimePickerKSeFQInvCrHidingDateFromD.DateTime) + TimeOf(DateTimePickerKSeFQInvCrHidingDateFromT.DateTime);
    Req.QueryCriteria.HidingDateFrom := D;
  end;
  if CheckBoxKSeFQInvCrHidingDateTo.Checked then
  begin
    D := DateOf(DateTimePickerKSeFQInvCrHidingDateToD.DateTime) + TimeOf(DateTimePickerKSeFQInvCrHidingDateToT.DateTime);
    Req.QueryCriteria.HidingDateTo := D;
  end;
  Result := IDispatch(Req) as IlgcKSeFRequest;
end;

procedure TForm1.ObjAdd(AObj: IlgcObject);
var
  I: TListItem;
begin
  I := ListViewObj.Items.Add;
  I.Caption := AObj.GetObjClassName;
  I.Data := Pointer(AObj);
  AObj._AddRef;
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

procedure TForm1.DebugCert(ACertyfikat: IlgcCertificate);
begin
  MemoLog.Lines.Append('Certyfikat (' + ACertyfikat.GetObjClassName + ')');
  MemoLog.Lines.Append('  Nr seryjny: ' + ACertyfikat.SerialNoDec + ' (' + ACertyfikat.SerialNoHex + ')');
  MemoLog.Lines.Append('  Nazwa: ' + ACertyfikat.DisplayName);
  MemoLog.Lines.Append('  Wa¿ny od ' + DateTimeToStr(ACertyfikat.ValidFrom) + ' do ' + DateTimeToStr(ACertyfikat.ValidTo));
  MemoLog.Lines.Append('  Podmiot: ' + ACertyfikat.Subject);
  MemoLog.Lines.Append('  Wydawca: ' + ACertyfikat.Issuer);
  //MemoLog.Append('  Rodzaj podpisu: ' + ACertyfikat.Signature);
end;

procedure TForm1.DebugAuth(AImie, ANazwisko, ANIP: String; ADataU: TDate;
  AKwota: Currency);
begin
  MemoLog.Lines.Append('Dane autoryzuj¹ce:');
  MemoLog.Lines.Append('  NIP: ' + ANIP);
  MemoLog.Lines.Append('  Imiê: ' + AImie);
  MemoLog.Lines.Append('  Nazwisko: ' + ANazwisko);
  MemoLog.Lines.Append('  Data urodzenia: ' + DateToStr(ADataU));
  MemoLog.Lines.Append('  Kwota: ' + CurrToStr(AKwota));
end;

procedure TForm1.DebugErrorInfo(AError: IlgcErrorInfo);
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
  ICrt: IlgcCertificate;
begin
  Debug('Pobieranie listy certyfikatów', True);

  Certyfikaty := nil;

  ListViewCert.Items.Clear;
  ComboBoxEdekCert.Items.Clear;
  ComboBoxJPKCert.Items.Clear;
  ComboBoxKSeFCert.Items.Clear;
  ComboBoxKSeFBatchCert.Items.Clear;
  ComboBoxPKCS11Cert.Items.Clear;

  Certyfikaty := Signer.List as IlgcList;
  for I := 0 to Certyfikaty.Count - 1 do
  begin
    Debug('Certyfikat nr ' + IntToStr(I));
    if Supports(Certyfikaty.Item[I], IlgcCertificate, ICrt) then
    begin
      DebugCert(ICrt);
      with ICrt do
      begin
        LI := ListViewCert.Items.Add;
        LI.Caption := IntToStr(I);
        LI.SubItems.Add(DisplayName);
        LI.SubItems.Add(DateToStr(ValidFrom));
        LI.SubItems.Add(DateToStr(ValidTo));
        LI.SubItems.Add(SerialNoDec);
        LI.SubItems.Add(Issuer);
        LI.SubItems.Add(Subject);

        S := DisplayName + ' (' + DateToStr(ValidFrom) + ' - ' + DateToStr(ValidTo) + ')';
        ComboBoxEdekCert.Items.Add(S);
        ComboBoxJPKCert.Items.Add(S);
        ComboBoxKSeFCert.Items.Add(S);
        ComboBoxKSeFBatchCert.Items.Add(S);
        ComboBoxPKCS11Cert.Items.Add(S);
      end;
    end;
  end;
end;

procedure TForm1.ButtonSetupClick(Sender: TObject);
const
  PKCS11LIBCLASS = 'TlgPKCS11CertificateSigner';
var
  FS: TFileStream;
  S: String;
  IP11Signer: IlgcPKCS11CertificateSigner;
  ICNGSigner: IlgcCNGCertificateSigner;
begin
  FS := nil;
  if SameText(ComboBoxSign.Text, PKCS11LIBCLASS) and (FileNameEditLibPKCS11.Text = '') then
  begin
    MessageDlg('WprowadŸ nazwê pliku biblioteki PKCS#11', mtInformation, [mbOK], 0);
    Exit;
  end;
  if not Assigned(Signer) and (ComboBoxSign.ItemIndex >= 0) then
  begin
    Signer := Backend.CreateCertificateSigner(ComboBoxSign.Text) as IlgcCertificateSigner;
    if Supports(Signer, IlgcPKCS11CertificateSigner, IP11Signer) then
    begin
      try
        IP11Signer.LoadLibrary(FileNameEditLibPKCS11.Text);
      except
        on E: Exception do
        begin
          MessageDlg('Wyst¹pi³ b³¹d podczas próby za³adowania biblioteki PKCS#11', mtError, [mbOK], 0);
          FreeAndNil(Signer);
          Exit;
        end;
      end;
    end;
    if Supports(Signer, IlgcCNGCertificateSigner, ICNGSigner) then
      ICNGSigner.WinHandle := Self.Handle;
  end;

  if ComboBoxHTTPCli.ItemIndex >= 0 then
    HTTPClient := Backend.CreateHTTPClient(ComboBoxHTTPCli.Text) as IlgcHTTPClient;

  XAdES := Backend.CreateXAdES as IlgcXAdES;
  EDek := Backend.CreateEDeklaracja as IlgcEDeklaracja;
  JPK := Backend.CreateJPK as IlgcJPK;

  with XAdES do
  begin
    if ComboBoxSHA1.ItemIndex >= 0 then
      SHA1HashClass := ComboBoxSHA1.Text;
    if ComboBoxSHA256.ItemIndex >= 0 then
      SHA256HashClass := ComboBoxSHA256.Text;
    if ComboBoxBase64.ItemIndex >= 0 then
      Base64EncoderClass := ComboBoxBase64.Text;
    Signer := Self.Signer;
    SignType := ComboBoxXAdESSHA.ItemIndex;
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
        WSTBackend := ColgcWSTBackend.Create;
        WSTBackend.RegisterTransport();
        WSTBackend.HTTPClient := Self.HTTPClient;
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
    JPKRSAProd := Backend.CreateRSAKey(ComboBoxRSAEnc.Text, FileNameEditJPKRSAProd.Text);
    try
      FS := TFileStream.Create(FileNameEditJPKRSATest.Text, fmOpenRead);
      SetLength(S, FS.Size);
      FS.Read(S[1], FS.Size);
    finally
      FS.Free;
    end;
    JPKRSATest := Backend.CreateRSAKey(ComboBoxRSAEnc.Text, S);
    RSAKeyProd := JPKRSAProd;
    RSAKeyTest := JPKRSATest;
  end;

  KSeF := Backend.CreateKSeF as IlgcKSeF_2_6_0;
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
    if ComboBoxRSAEnc.ItemIndex >= 0 then
      RSAEncryptClass := ComboBoxRSAEnc.Text;
    KSeFRSAProd := Backend.CreateRSAKey(ComboBoxRSAEnc.Text, FileNameEditKSeFRSAProd.Text);
    KSeFRSADemo := Backend.CreateRSAKey(ComboBoxRSAEnc.Text, FileNameEditKSeFRSADemo.Text);
    KSeFRSATest := Backend.CreateRSAKey(ComboBoxRSAEnc.Text, FileNameEditKSeFRSATest.Text);
    RSAKeyProd := KSeFRSAProd;
    RSAKeyDemo := KSeFRSADemo;
    RSAKeyTest := KSeFRSATest;
  end;

  if FileNameEditLibXML2.Text <> '' then
    with ColgcLibXMLBackend.Create do
      LoadLibXML(FileNameEditLibXML2.Text);

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
  if Supports(Signer, IlgcPKCS11CertificateSigner) then
    TabSheetPKCS11.TabVisible := True;

  DateTimePickerKSeFQInvCrRanInvFromD.DateTime := IncDay(Now, -30);
  DateTimePickerKSeFQInvCrRanInvFromT.DateTime := Now;
  DateTimePickerKSeFQInvCrRanInvToD.DateTime := Now;
  DateTimePickerKSeFQInvCrRanInvToT.DateTime := Now;
  DateTimePickerKSeFQInvCrIncInvFromD.DateTime := IncDay(Now, -30);
  DateTimePickerKSeFQInvCrIncInvFromT.DateTime := Now;
  DateTimePickerKSeFQInvCrIncInvToD.DateTime := Now;
  DateTimePickerKSeFQInvCrIncInvToT.DateTime := Now;
  DateTimePickerKSeFQInvCrDetInvFromD.DateTime := IncDay(Now, -30);
  DateTimePickerKSeFQInvCrDetInvFromT.DateTime := Now;
  DateTimePickerKSeFQInvCrDetInvToD.DateTime := Now;
  DateTimePickerKSeFQInvCrDetInvToT.DateTime := Now;

  Debug('XAdES', True);
  Debug('SHA1HashClass: ' + XAdES.SHA1HashClass);
  Debug('SHA256HashClass: ' + XAdES.SHA256HashClass);
  Debug('Base64EncoderClass: ' + XAdES.Base64EncoderClass);
  Debug('EDek', True);
  Debug('XMLCanonizator: ' + EDek.XMLCanonizator);
  Debug('EDekGate: ' + EDek.EDekGate);
  Debug('JPK', True);
  Debug('Base64EncoderClass: ' + JPK.Base64EncoderClass);
  Debug('AES256EncryptClass: ' + JPK.AES256EncryptClass);
  Debug('MD5HashClass: ' + JPK.MD5HashClass);
  Debug('SHA256HashClass: ' + JPK.SHA256HashClass);
  Debug('ZipperClass: ' + JPK.ZipperClass);
  Debug('RSAEncryptClass: ' + JPK.RSAEncryptClass);
  Debug('RandomGeneratorClass: ' + JPK.RandomGeneratorClass);
  Debug('XMLReaderClass: ' + JPK.XMLReaderClass);
  Debug('KSeF', True);
  Debug('RSAEncryptClass: ' + KSeF.RSAEncryptClass);
  Debug('Base64EncoderClass: ' + KSeF.Base64EncoderClass);
  Debug('AES256EncryptClass: ' + KSeF.AES256EncryptClass);
  Debug('SHA256HashClass: ' + KSeF.SHA256HashClass);
  Debug('RandomGeneratorClass: ' + KSeF.RandomGeneratorClass);
  if Supports(Signer, IlgcPKCS11CertificateSigner) then
    ButtonPKCS11InfoClick(nil);
end;

procedure TForm1.ButtonShowCertClick(Sender: TObject);
var
  ICert: IlgcCertificate;
begin
  Debug('Pokaz info o certyfikacie', True);
  if (ListViewCert.ItemIndex >= 0) and Supports(Certyfikaty[ListViewCert.ItemIndex], IlgcCertificate, ICert) then
  begin
    DebugCert(ICert);
    ICert.ShowCertificateInfo(Self.Handle);
  end;
end;

procedure TForm1.ButtonCertWybierzClick(Sender: TObject);
var
  Cert: IlgcCertificate;
  CNSigner: IlgcCNGCertificateSigner;
begin
  Debug('Wybierz certyfikat', True);
  if Supports(Signer, IlgcCNGCertificateSigner, CNSigner) then
  begin
    Cert := CNSigner.UISelect as IlgcCertificate;
    if Assigned(Cert) then
    begin
      DebugCert(Cert);
      Cert.ShowCertificateInfo(Self.Handle);
    end
    else
      Debug('Anulowano');
  end;
end;

procedure TForm1.ButtonJPKBUPOClick(Sender: TObject);
var
  Status: IlgcEDeklaracjaStatus;
begin
  Debug('JPK - SprawdŸ status / pobierz UPO', True);
  try
    Status := JPK.RequestUPO(EditJPKBNrRef.Text, ComboBoxJPKBRodzBramUPO.ItemIndex) as IlgcEDeklaracjaStatus;
    Debug('Status: ' + IntToStr(Status.Status));
    Debug('Opis: ' + Status.Opis);
    Debug('Szczegó³y: ' + Status.Szczegoly);
    Debug('Timestamp: ' + DateTimeToStr(Status.Timestamp));
    if Status.Status = 200 then
    begin
      QuickSave(FileNameEditJPKBPlikWyj.Text, Status.UPO);
      Debug('Pobrano UPO');
    end
    else
      Debug('Nie pobrano UPO');
  except
    on E: Exception do
    begin
      Debug('B³¹d podzas sprawdzania statusu JPK (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('B³¹d podzas sprawdzania statusu JPK (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonJPKBWyslijClick(Sender: TObject);
var
  InitUpload: String;
  EncStream: IDispatch;
  RefNo: String;
begin
  Debug('Wyœlij JPK', True);
  try
    Debug('Wczytywanie struktury InitUpload: ' + FileNameEditJPKBIU.Text);
    InitUpload := QuickLoad(FileNameEditJPKBIU.Text);

    Debug('Otwarcie strumienia z zaszyfrowanymi danymi: ' + FileNameEditJPKBEnc.Text);
    EncStream := Backend.CreateFileStream(FileNameEditJPKBEnc.Text, fmOpenRead);

    Debug('Wysy³anie');
    RefNo := JPK.Send(InitUpload, EncStream, ComboBoxJPKBRodzBram.ItemIndex,
      CheckBoxJPKBCert.Checked);

    EditJPKBNrRef.Text := RefNo;
    Debug('Wys³ano plik JPK, ref no: ' + RefNo);
  except
    on E: Exception do
    begin
      Debug('B³¹d podzas wysy³ania JPK (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('B³¹d podzas wysy³ania JPK (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonJPKPodpiszAutClick(Sender: TObject);
var
  IStream, OStream: IDispatch;
  InitUp: String;
begin
  IStream := nil;
  OStream := nil;
  Debug('Podpis JPK danymi autoryzuj¹cymi', True);
  try
    Debug('Plik wejœciowy: ' + FileNameEditJPKPAWej.Text);
    IStream := Backend.CreateFileStream(FileNameEditJPKPAWej.Text, fmOpenRead);

    Debug('Plik wynikowy (enc. zip): ' + FileNameEditJPKPAEnc.Text );
    OStream := Backend.CreateFileStream(FileNameEditJPKPAEnc.Text, fmCreate);

    Debug('Na ¿¹danie (ad hoc): ' + BoolToStr(CheckBoxJPKPCAdHoc.Checked));

    Debug('Bramka (klucz rsa): ' + ComboBoxJPKPARodzBram.Text);

    DebugAuth(EditJPKPImie.Text, EditJPKPNazwisko.Text, EditJPKPNIP.Text,
      DateTimePickerJPKPDataU.Date, StrToCurr(FloatSpinEditJPKPKwota.Text));

    InitUp := JPK.SignAuthData(EditJPKPNIP.Text, EditJPKPImie.Text, EditJPKPNazwisko.Text,
      DateTimePickerJPKPDataU.Date, StrToCurr(FloatSpinEditJPKPKwota.Text),
      ComboBoxJPKPARodzBram.ItemIndex, CheckBoxJPKPCAdHoc.Checked,
      IStream, OStream);

    Debug('Podpisano');

    Debug('Zapis InitUpload do pliku: ' + FileNameEditJPKPCInitUpload.Text);
    QuickSave(FileNameEditJPKPCInitUpload.Text, InitUp);
  except
    on E: Exception do
    begin
      Debug('B³¹d podzas podpisywaania (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('B³¹d podzas podpisywaania (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonJPKPodpiszCertClick(Sender: TObject);
var
  IStream, OStream: IDispatch;
  InitUp: String;
begin
  Debug('Podpis JPK certyfikatem', True);
  try
    Debug('Plik wejœciowy: ' + FileNameEditJPKPCWej.Text);
    IStream := Backend.CreateFileStream(FileNameEditJPKPCWej.Text, fmOpenRead);

    Debug('Plik wynikowy (enc. zip): ' + FileNameEditJPKPCEnc.Text );
    OStream := Backend.CreateFileStream(FileNameEditJPKPCEnc.Text, fmCreate);

    Debug('Na ¿¹danie (ad hoc): ' + BoolToStr(CheckBoxJPKPCAdHoc.Checked));

    Debug('Bramka (klucz rsa): ' + ComboBoxJPKPCRodzBram.Text);

    DebugCert(IInterface(Certyfikaty[ComboBoxJPKCert.ItemIndex]) as IlgcCertificate);

    InitUp := JPK.SignCertificate(IInterface(Certyfikaty[ComboBoxJPKCert.ItemIndex]) as IlgcCertificate,
      ComboBoxJPKPCRodzBram.ItemIndex, CheckBoxJPKPCAdHoc.Checked,
      IStream, OStream);
    Debug('Podpisano');

    Debug('Zapis InitUpload do pliku: ' + FileNameEditJPKPCInitUpload.Text);
    QuickSave(FileNameEditJPKPCInitUpload.Text, InitUp);
  except
    on E: Exception do
    begin
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      if (E is EOleSysError) and (Backend.LastError <> nil) and SameText((Backend.LastError as IlgcErrorInfo).ExceptionClass, 'EAbort') then
      begin
        Debug('Anulowano');
        MessageDlg('Anulowano', mtInformation, [mbOK], 0);
      end
      else
      begin
        Debug('B³¹d podzas podpisywaania (%s): %s', [E.ClassName, E.Message]);
        MessageDlg(Format('B³¹d podzas podpisywaania (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
      end;
    end;
  end;
end;

procedure TForm1.ButtonKSeFIniTokenClick(Sender: TObject);
var
  Resp: IlgcKSeFResponse;
begin
  if EditKSeFToken.Text = '' then
  begin
    MessageDlg('WprowadŸ token', mtInformation, [mbOK], 0);
    Exit;
  end;
  Debug('KSeF - SessionInitToken');
  KSeF.NIP := EditKSeFNIP.Text;
  KSeF.Encryption := CheckBoxKSeFEncrypt.Checked;
  KSeF.Token := EditKSeFToken.Text;
  KSeF.GateType := ComboBoxKSeFBramka.ItemIndex;
  KSeF.FormCode := ComboBoxKSeFInitFormCode.ItemIndex + 1;
  try
    Resp := KSeF.SessionInitToken as IlgcKSeFResponse;
    Debug('OdpowiedŸ:' + Resp.GetRawResponse);
    UstawKSeFSesion(True);
    ObjAdd(Resp);
  except
    on E: Exception do
    begin
      Debug('B³¹d podczas inicjalizacji sesji (' + E.ClassName + '): ' + E.Message);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('B³¹d podczas inicjalizacji sesji (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonKSeFInitPZClick(Sender: TObject);
var
  SignedInitAuth: String;
  Resp: IlgcKSeFResponse;
begin
  Debug('KSeF - SessionInitPZ', True);
  KSeF.NIP := EditKSeFNIP.Text;
  KSeF.Encryption := CheckBoxKSeFEncrypt.Checked;
  KSeF.GateType := ComboBoxKSeFBramka.ItemIndex;
  KSeF.FormCode := ComboBoxKSeFInitFormCode.ItemIndex + 1;
  try
    Debug('Wczytywanie podpisanego pliku: ' + FileNameEditKSeFInitPZIn.Text);
    SignedInitAuth := QuickLoad(FileNameEditKSeFInitPZIn.Text);
    Resp := KSeF.SessionInitPZ(SignedInitAuth) as IlgcKSeFResponse;
    Debug('OdpowiedŸ:' + Resp.GetRawResponse);
    UstawKSeFSesion(True);
    ObjAdd(Resp);
  except
    on E: Exception do
    begin
      Debug('B³¹d podczas inicjalizacji sesji (' + E.ClassName + '): ' + E.Message);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('B³¹d podczas inicjalizacji sesji (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
    end;
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
    KSeF.GateType := ComboBoxKSeFBramka.ItemIndex;
    KSeF.FormCode := ComboBoxKSeFInitFormCode.ItemIndex + 1;
    AuthStruct := KSeF.SessionChalangePZ;
    QuickSave(FileNameEditKSeFInitPZOut.Text, AuthStruct);
    Debug('Zapisano do pliku: ' + FileNameEditKSeFInitPZOut.Text);
  except
    on E: Exception do
    begin
      Debug('B³¹d tworzenia pliku sesji (' + E.ClassName + '): ' + E.Message);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('B³¹d tworzenia pliku sesji (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonKSeFInitSignedClick(Sender: TObject);
var
  Resp: IlgcKSeFResponse;
begin
  if ComboBoxKSeFCert.ItemIndex < 0 then
  begin
    MessageDlg('Wybierz certyfikat', mtInformation, [mbOK], 0);
    Exit;
  end;
  Debug('KSeF - SessionInitSigned', True);
  KSeF.NIP := EditKSeFNIP.Text;
  KSeF.Certificate := Certyfikaty[ComboBoxKSeFCert.ItemIndex];
  KSeF.Encryption := CheckBoxKSeFEncrypt.Checked;
  KSeF.GateType := ComboBoxKSeFBramka.ItemIndex;
  KSeF.CertificateAuthType := ComboBoxKSeFCertAuthType.ItemIndex;
  KSeF.FormCode := ComboBoxKSeFInitFormCode.ItemIndex + 1;
  try
    Resp := KSeF.SessionInitSigned as IlgcKSeFResponse;
    Debug('OdpowiedŸ:' + Resp.GetRawResponse);
    UstawKSeFSesion(True);
    ObjAdd(Resp);
  except
    on E: Exception do
    begin
      Debug('B³¹d podczas inicjalizacji sesji (' + E.ClassName + '): ' + E.Message);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('B³¹d podczas inicjalizacji sesji (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonKSeFInvGetClick(Sender: TObject);
var
  ISA: IStream;
begin
  Debug('KSeF - pobierz fakturê', True);
  try
    ISA := TStreamAdapter.Create(TFileStream.Create(FileNameEditKSeFGetFN.Text, fmCreate), soOwned) as IStream;
    KSeF.InvoiceGet(EditKSeFInvGetNr.Text, ISA);
    Debug('Pobrano, zapisywanie do: ' + FileNameEditKSeFGetFN.Text);
  except
    on E: Exception do
    begin
      Debug('B³¹d podczas pobierania faktury (' + E.ClassName + '): ' + E.Message);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('B³¹d podczas pobierania faktury (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonKSeFInvHideClick(Sender: TObject);
var
  Resp: IlgcKSeFResponse;
begin
  Debug('KSeF - ukrywanie wybranej faktury', True);
  try
    Debug('Nr ref. KSeF faktury: ' + EditKSeFInvHideNr.Text);
    Debug('Przyczyna: ' + EditKSeFInvHideReason.Text);
    Resp := KSeF.InvoiceVisibilityHide(EditKSeFInvHideNr.Text, EditKSeFInvHideReason.Text) as IlgcKSeFResponse;
    ObjAdd(Resp);
    Debug('Ukryto.');
  except
    on E: Exception do
    begin
      Debug('Blad podczas ukrywania faktury (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('B³¹d podczas ukrywania faktury (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonKSeFInvSendClick(Sender: TObject);
var
  Resp: OleVariant;
begin
  Debug('KSeF - wyœlij fakturê', True);
  try
    Debug('Otwieranie pliku: ' + FileNameEditKSeFInvSend.Text);
    Debug('Wysy³anie');
    Resp := KSeF.InvoiceSend(TStreamAdapter.Create(TFileStream.Create(FileNameEditKSeFInvSend.Text, fmOpenRead), soOwned) as IUnknown) as IlgcKSeFResponse;
    Debug('OdpowiedŸ: ' + Resp.GetRawResponse);
    EditKSeFInvStatNr.Text := VarToStr(Resp.ElementReferenceNumber);
    Debug('Wys³ano, el. nr ref: ' + Resp.ElementReferenceNumber);
    ObjAdd(IDispatch(Resp) as IlgcObject);
  except
    on E: Exception do
    begin
      Debug('B³¹d podczas wysy³ania faktury (' + E.ClassName + '): ' + E.Message);
     DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
     MessageDlg('B³¹d podczas wysy³ania faktury (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonKSeFInvShowClick(Sender: TObject);
var
  Resp: IlgcKSeFResponse;
begin
  Debug('KSeF - Anulowanie ukrycia wybranej faktury', True);
  try
    Debug('Nr ref. KSeF faktury: ' + EditKSeFInvShowNr.Text);
    Debug('Przyczyna: ' + EditKSeFInvShowReason.Text);
    Resp := KSeF.InvoiceVisibilityShow(EditKSeFInvShowNr.Text, EditKSeFInvShowReason.Text) as IlgcKSeFResponse;
    ObjAdd(Resp);
    Debug('Anulowano ukrycie.');
  except
    on E: Exception do
    begin
      Debug('B³¹d podczas anulowania ukrycia faktury (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('B³¹d podczas anulowania ukrycia faktury (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonKSeFInvStatClick(Sender: TObject);
var
  Resp: IlgcKSeFResponse;
begin
  Debug('KSeF - sprawdzanie statusu faktury', True);
  try
    Resp := KSeF.InvoiceStatus(EditKSeFInvStatNr.Text, lgcKNVDefault) as IlgcKSeFResponse;
    Debug('OdpowiedŸ: ' + Resp.GetRawResponse);
    ObjAdd(Resp);
  except
    on E: Exception do
    begin
      Debug('B³¹d podczas wysy³ania faktury (' + E.ClassName + '): ' + E.Message);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('B³¹d podczas wysy³ania faktury (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonkSeFSesStatClick(Sender: TObject);
var
  Resp: IlgcKSeFResponse;
begin
  Debug('Sprawdzenie statusu sesji', True);
  try
    Resp := KSeF.SessionStatus(EditKSeFSesStatRef.Text, SpinEditKSeFSesPgSz.Value,
      SpinEditKSeFSesPgOf.Value, CheckBoxKSeFStatDet.Checked) as IlgcKSeFResponse;
    Debug('OdpowiedŸ: ' + Resp.GetRawResponse);
    ObjAdd(Resp);
  except
    on E: Exception do
    begin
      Debug('B³¹d podczas sprawdzania statusu sesji (' + E.ClassName + '): ' + E.Message);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('B³¹d podczas sprawdzania statusu sesji (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonKSeFSesTermClick(Sender: TObject);
var
  Resp: IlgcKSeFResponse;
begin
  Debug('Koñczenie sesji', True);
  try
    Resp := KSeF.SessionTerminate(False) as IlgcKSeFResponse;
    if Assigned(Resp) then
    begin
      Debug('OdpowiedŸ: ' + Resp.GetRawResponse);
      UstawKSeFSesion(False);
      ObjAdd(Resp);
    end;
  except
    on E: Exception do
    begin
      Debug('B³¹d podczas terminacji sesji (' + E.ClassName + '): ' + E.Message);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('B³¹d podczas terminacji sesji (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonKSeFStatusUPOClick(Sender: TObject);
var
  Resp: OleVariant;
begin
  Debug('KSeF - sprawdŸ status wysy³ki wsadowej', True);
  try
    Debug('Nr ref: ' + EditKSeFStatusReferenceNumber.Text);
    Debug('Bramka: ' + ComboBoxKSeFComBramka.Text);
    Resp := KSeF.CommonStatus(EditKSeFStatusReferenceNumber.Text, ComboBoxKSeFComBramka.ItemIndex);
    Debug('Status: ' + IntToStr(Resp.ProcessingCode));
    Debug('Opis: ' + Resp.ProcessingDescription);
    if (Resp.ProcessingCode = 200) and (Resp.Upo <> '') then
    begin
      QuickSave(FileNameEditKSeFUPO.Text, VarToStr(Resp.UpoDecoded));
      Debug('Pobrano UPO do pliku: ' + FileNameEditKSeFUPO.Text);
    end
    else
      Debug('NIE pobrano UPO');
    ObjAdd(IDispatch(Resp) as IlgcObject);
  except
    on E: Exception do
    begin
      Debug('B³¹d podczas terminacji sesji (' + E.ClassName + '): ' + E.Message);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('B³¹d podczas terminacji sesji (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonEdekPodpiszCertClick(Sender: TObject);
var
  Wej: String;
  Wyj: String;
begin
  Debug('Podpis eDeklaracji certyfikatem', True);
  if (Certyfikaty.Count = 0) or (ComboBoxEdekCert.ItemIndex < 0) then
  begin
    Debug('B£¥D: Brak wybranego certyfikatu.');
    MessageDlg('Brak wybranego certyfikatu.', mtError, [mbOK], 0);
    Exit;
  end;

  try
    Debug('Plik wej: ' + FileNameEditEDPCWej.Text);
    Wej := QuickLoad(FileNameEditEDPCWej.Text);

    DebugCert(IInterface(Certyfikaty[ComboBoxEdekCert.ItemIndex]) as IlgcCertificate);
    Debug('Podpisywanie');
    Wyj := EDek.PodpiszCertyfikatem(Wej, IInterface(Certyfikaty[ComboBoxEdekCert.ItemIndex]) as IlgcCertificate);

    Debug('Plik wyj: ' + FileNameEditEDPCWyj.Text);
    QuickSave(FileNameEditEDPCWyj.Text, Wyj);

    Debug('Podpisano');
  except
    on E: Exception do
    begin
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      if (E is EOleSysError) and (Backend.LastError <> nil) and SameText((Backend.LastError as IlgcErrorInfo).ExceptionClass, 'EAbort') then
      begin
        Debug('Anulowano');
        MessageDlg('Anulowano', mtInformation, [mbOK], 0);
      end
      else
      begin
        Debug('B³¹d podzas podpisywaania (%s): %s', [E.ClassName, E.Message]);
        MessageDlg(Format('B³¹d podzas podpisywaania (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
      end;
    end;
  end;
end;

procedure TForm1.ButtonEdekPodpiszAutClick(Sender: TObject);
var
  Wej: String;
  Wyj: String;
begin
  Debug('Podpis eDeklaracji certyfikatem', True);
  try
    Debug('Plik wej: ' + FileNameEditEDPAWej.Text);
    Wej := QuickLoad(FileNameEditEDPAWej.Text);

    DebugAuth(EditEDPImie.Text, EditEDPNazwisko.Text, EditEDPNIP.Text,
      DateTimePickerEDPDataU.Date, StrToCurr(FloatSpinEditEDPKwota.Text));
    Debug('Podpisywanie');

    Wyj := EDek.PodpiszDanymiAut(Wej, EditEDPImie.Text, EditEDPNazwisko.Text,
      EditEDPNIP.Text, DateTimePickerEDPDataU.Date, StrToCurr(FloatSpinEditEDPKwota.Text));

    Debug('Plik wyj: ' + FileNameEditEDPAWyj.Text);
    QuickSave(FileNameEditEDPAWyj.Text, Wyj);

    Debug('Podpisano');
  except
    on E: Exception do
    begin
      Debug('B³¹d podzas podpisywaania (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('B³¹d podzas podpisywaania (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonEDBWyslijClick(Sender: TObject);
var
  Dane: String;
  Status: IlgcEDeklaracjaStatus;
begin
  Debug('Wyœlij eDeklaracjê', True);
  if ComboBoxEDBRodzBram.ItemIndex < 0 then
  begin
    MessageDlg('Proszê wybraæ rodzaj bramki.', mtInformation, [mbOK], 0);
    Exit;
  end;
  if ComboBoxEDBRodzPodp.ItemIndex < 0 then
  begin
    MessageDlg('Proszê wybraæ rodzaj podpisu, jakim podpisano deklaracjê', mtInformation, [mbOK], 0);
    Exit;
  end;

  try
    Debug('Plik wej: ' + FileNameEditEDBPlikWej.Text);
    Dane := QuickLoad(FileNameEditEDBPlikWej.Text);

    Debug('Bramka: ' + ComboBoxEDBRodzBram.Text);
    Debug('Podpis: ' + ComboBoxEDBRodzPodp.Text);

    Debug('Wysy³anie');

    Status := EDek.Wyslij(Dane, ComboBoxEDBRodzBram.ItemIndex,
      ComboBoxEDBRodzPodp.ItemIndex) as IlgcEDeklaracjaStatus;

    Debug('Status: ' + IntToStr(Status.Status));
    Debug('Opis: ' + Status.Opis);
    Debug('Nr ref.: ' + Status.NrRef);

    if (Status.Status >= 100) and (Status.Status <= 399) then
    begin
      EditEDBNrRef.Text := Status.NrRef;
      Debug('Wys³ano');
    end
    else
      Debug('NIE wys³ano');
  except
    on E: Exception do
    begin
      Debug('B³¹d podczas wysy³ania eDeklaracji (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('B³¹d podczas wysy³ania eDeklaracji (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonEDBUPOClick(Sender: TObject);
var
  Status: IlgcEDeklaracjaStatus;
begin
  Debug('SprawdŸ status eDeklaracji / pobierz UPO', True);
  if EditEDBNrRef.Text = '' then
  begin
    MessageDlg('WprowadŸ nr referencyjny', mtInformation, [mbOK], 0);
    Exit;
  end;
  if ComboBoxEDBRodzBramUPO.ItemIndex < 0 then
  begin
    MessageDlg('Wybierz rodzaj bramki', mtInformation, [mbOK], 0);
    Exit;
  end;

  try
    Debug('Nr ref: ' + EditEDBNrRef.Text);
    Debug('Bramka: ' + ComboBoxEDBRodzBramUPO.Text);
    Debug('Sprawdzanie statusu');

    Status := EDek.PobierzUPO(EditEDBNrRef.Text, ComboBoxEDBRodzBramUPO.ItemIndex) as IlgcEDeklaracjaStatus;

    Debug('Status: ' + IntToStr(Status.Status));
    Debug('Opis: ' + Status.Opis);

    if Status.Status = 200 then
    begin
      Debug('Pobrano UPO');
      Debug('UPO zapisano do: ' + FileNameEditEDBPlikWyj.Text);
      QuickSave(FileNameEditEDBPlikWyj.Text, Status.UPO);
    end
    else
      Debug('NIE pobrano UPO');
  except
    on E: Exception do
    begin
      Debug('B³¹d podczas sprawdzania statusu eDeklaracji (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('B³¹d podczas sprawdzania statusu eDeklaracji (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonCertReloadClick(Sender: TObject);
begin
  LoadCertList;
end;

procedure TForm1.ButtonKSeFQInvClearClick(Sender: TObject);
begin
  FloatSpinEditKSeFQInvCAamountFrom.Text := '0';
  FloatSpinEditKSeFQInvCAamountTo.Text := '0';
  ComboBoxKSeFQInvCAamountType.ItemIndex := 0;
  MemoKSeFQInvCrCurrencyCodes.Clear;
  CheckBoxKSeFQInvCrFaP17Annotation.Checked := False;
  EditKSeFQInvCrInvoiceNumber.Clear;
  EditKSeFQInvCrRefNo.Clear;
  EditKSeFQInvCrSubjectToId.Clear;
  EditKSeFQInvCrSubjectByIdent.Clear;
  DateTimePickerKSeFQInvCrRanInvFromD.DateTime := DateOf(IncDay(Now, -30));
  DateTimePickerKSeFQInvCrRanInvFromT.DateTime := TimeOf(Now);
  DateTimePickerKSeFQInvCrRanInvToD.DateTime := DateOf(Now);
  DateTimePickerKSeFQInvCrRanInvToT.DateTime := TimeOf(Now);
  DateTimePickerKSeFQInvCrIncInvFromD.DateTime := DateOf(IncDay(Now, -30));
  DateTimePickerKSeFQInvCrIncInvFromT.DateTime := TimeOf(Now);
  DateTimePickerKSeFQInvCrIncInvToD.DateTime := DateOf(Now);
  DateTimePickerKSeFQInvCrIncInvToT.DateTime := TimeOf(Now);
  DateTimePickerKSeFQInvCrDetInvFromD.DateTime := DateOf(IncDay(Now, -30));
  DateTimePickerKSeFQInvCrDetInvFromT.DateTime := TimeOf(Now);
  DateTimePickerKSeFQInvCrDetInvToD.DateTime := DateOf(Now);
  DateTimePickerKSeFQInvCrDetInvToT.DateTime := TimeOf(Now);
  CheckBoxKSeFQInvCrIInvTypVAT.Checked := False;
  CheckBoxKSeFQInvCrIInvTypKOR.Checked := False;
  CheckBoxKSeFQInvCrIInvTypZAL.Checked := False;
  CheckBoxKSeFQInvCrIInvTypROZ.Checked := False;
  CheckBoxKSeFQInvCrIInvTypUPR.Checked := False;
  CheckBoxKSeFQInvCrIInvTypKOR_ZAL.Checked := False;
  CheckBoxKSeFQInvCrIInvTypKOR_ROZ.Checked := False;
  RadioGroupKSeFQInvCrSubjevtToType.ItemIndex := -1;
  CheckBoxKSeFQInvCrIsHidden.Checked := False;
  DateTimePickerKSeFQInvCrHidingDateFromD.Date := DateOf(Now);
  DateTimePickerKSeFQInvCrHidingDateFromT.Time := TimeOf(Now);
  DateTimePickerKSeFQInvCrHidingDateToD.Date := DateOf(Now);
  DateTimePickerKSeFQInvCrHidingDateToT.Time := TimeOf(Now);
end;

procedure TForm1.ButtonKSeFQInvAsyncClick(Sender: TObject);
var
  Req: IlgcKSeFRequest;
  Resp: OleVariant;
begin
  Debug('KSeF - Inicjowanie zapytania asynchronicznego o faktury', True);
  Req := GetQueryInvoiceCr as IlgcKSeFRequest;
  Debug('Zapytanie: ' + Req.GetAsJSON);
  ObjAdd(Req);
  try
    Resp := KSeF.QueryInvoiceAsyncInit(Req);
    Debug('OdpowiedŸ: ' + Resp.GetRawResponse);
    EditKSeFQInvAsyncQRefNo.Text := VarToStr(Resp.ElementReferenceNumber);
    ObjAdd(IDispatch(Resp) as IlgcObject);
  except
    on E: Exception do
    begin
      Debug('B³¹d podczas inicjowania zapytania o faktury asynchronicznie (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('B³¹d podczas inicjowania zapytania o faktury aynchronicznie (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonKSeFGenIntIdClick(Sender: TObject);
var
  Resp: OleVariant;
begin
  Debug('KSeF - Wygenerowanie identyfikatora wewnetrznego na podstawie nip i 4 cyfr', True);
  try
    Resp := KSeF.SessionGenerateInternalIdentifier(EditKSeFinputDigitsSequence.Text);
    Debug('Identyfikator: ' + Resp.InternalIdentifier);
    Debug('OdpowiedŸ: ' + Resp.GetRawResponse);
    ObjAdd(IDispatch(Resp) as IlgcObject);
  except
    on E: Exception do
    begin
      Debug('B³¹d podczas generowania identyfikatora wewn. (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('B³¹d podczas generowania identyfikatora wewn. (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonKSeFCInvGetClick(Sender: TObject);
var
  FA: IlgcMemoryStream;
  Req: OleVariant;
begin
  Debug('KSeF - interfejs ogólny - pobranie faktury', True);
  try
    Req := KSeF.CreateKSeFObject('TKSeFInvoiceRequestKSeF');
    Req.KsefReferenceNumber := EditKSeFCInvRefNum.Text;
    Req.InvoiceDetails := KSeF.CreateKSeFObject('TKSeFInvoiceQueryDetails');
    Req.InvoiceDetails.DueValue := StrToCurr(FloatSpinEditKSeFCInvDueValue.Text);
    Req.InvoiceDetails.InvoiceOryginalNumber := EditKSeFCInvOrgNum.Text;
    Req.InvoiceDetails.SubjectTo := KSeF.CreateKSeFObject('TKSeFSubjectTo');
    if RadioGroupKSeFCInvSubToType.ItemIndex >= 0 then
      case RadioGroupKSeFCInvSubToType.ItemIndex of
        0: Req.InvoiceDetails.SubjectTo.IssuedToIdentifier := KSeF.CreateKSeFObject('TKSeFSubjectIdentifierToNone');
        1: begin
          Req.InvoiceDetails.SubjectTo.IssuedToIdentifier := KSeF.CreateKSeFObject('TKSeFSubjectIdentifierToCompany');
          Req.InvoiceDetails.SubjectTo.IssuedToIdentifier.Identifier := EditKSeFCInvSubToIdent.Text;
        end;
        2: begin
          Req.InvoiceDetails.SubjectTo.IssuedToIdentifier := KSeF.CreateKSeFObject('TKSeFSubjectIdentifierToOther');
          Req.InvoiceDetails.SubjectTo.IssuedToIdentifier.Identifier := EditKSeFCInvSubToIdent.Text;
        end;
      end;
    if RadioButtonKSeFCInvSubToFullName.Checked or RadioButtonKSeFCInvSubToPersonName.Checked then
    begin
      if RadioButtonKSeFCInvSubToPersonName.Checked then
      begin
        Req.InvoiceDetails.SubjectTo.IssuedToName := KSeF.CreateKSeFObject('TKSeFSubjectPersonName');
        Req.InvoiceDetails.SubjectTo.IssuedToName.FirstName := EditKSeFCInvSubToFirstName.Text;
        Req.InvoiceDetails.SubjectTo.IssuedToName.Surname := EditKSeFCInvSubToSurname.Text;
        Req.InvoiceDetails.SubjectTo.IssuedToName.TradeName := EditKSeFCInvSubToTradeName.Text;
      end
      else
      begin
        Req.InvoiceDetails.SubjectTo.IssuedToName := KSeF.CreateKSeFObject('TKSeFSubjectFullName');
        Req.InvoiceDetails.SubjectTo.IssuedToName.FullName := EditKSeFCInvSubToFullName.Text;
        Req.InvoiceDetails.SubjectTo.IssuedToName.TradeName := EditKSeFCInvSubToTradeName.Text;
      end;
    end;
    Debug('Bramka: ' + ComboBoxKSeFComBramka.Text);
    Debug('Zapytanie: ' + Req.GetAsJSON);
    Debug('Plik wynikowy: ' + FileNameEditKSeFCInvFN.Text);
    FA := CreateOleObject('LibGovPL.lgcMemoryStream') as IlgcMemoryStream;
    ObjAdd(IDispatch(Req) as IlgcObject);
    KSeF.CommonInvoiceKSeF(Req, FA, ComboBoxKSeFComBramka.ItemIndex);
    FA.SaveToFile(FileNameEditKSeFCInvFN.Text);
  except
    on E: Exception do
    begin
      Debug('B³¹d podczas generowania identyfikatora wewn. (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('B³¹d podczas generowania identyfikatora wewn. (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
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
  FloatSpinEditKSeFCInvDueValue.Text := '0';
end;

procedure TForm1.ButtonKSeFBatchPodpClick(Sender: TObject);
var
  InZIPFile: IlgcFileStream;
  InitUpload: WideString;
  OutEncZIPFile: IlgcFileStream;
begin
  Debug('KSeF - pobieranie / przygotowanie do wysy³ki wsadowej', True);
  if RadioButtonKSeFBatchCert.Checked and (ComboBoxKSeFBatchCert.ItemIndex < 0) then
  begin
    MessageDlg('Wybierz certyfikat', mtInformation, [mbOK], 0);
    Exit;
  end;
  try
    Debug('Otwieranie pliku wejœciowego: ' + FileNameEditKSeFBatchInZIP.Text);
    InZIPFile := Backend.CreateFileStream(FileNameEditKSeFBatchInZIP.Text, fmOpenRead) as IlgcFileStream;
    Debug('Tworzenie pliku wyjœciowego: ' + FileNameEditKSeFBatchOutEncZIP.Text);
    OutEncZIPFile := Backend.CreateFileStream(FileNameEditKSeFBatchOutEncZIP.Text, fmCreate) as IlgcFileStream;
    KSeF.NIP := EditKSeFBatchNIP.Text;
    KSeF.FormCode := ComboBoxKSeFBatchInitFormCode.ItemIndex;
    KSeF.GateType := ComboBoxKSeFBatchBramka.ItemIndex;
    if RadioButtonKSeFBatchCert.Checked then
    begin
      Debug('Podpis certyfikatem');
      KSeF.Certificate := Certyfikaty[ComboBoxKSeFBatchCert.ItemIndex];
    end
    else
      Debug('Podpis profilem zaufanym');

    InitUpload := KSeF.BatchSign(InZIPFile, RadioButtonKSeFBatchPZ.Checked, OutEncZIPFile,
      ExtractFileName(FileNameEditKSeFBatchInZIP.Text), ExtractFileName(FileNameEditKSeFBatchOutEncZIP.Text));
    Debug('Podpisano');

    QuickSave(FileNameEditKSeFBatchOutInitUp.Text, InitUpload);
    Debug('Zapisano strukturê InitUpload do pliku: ' + FileNameEditKSeFBatchOutInitUp.Text);

    FileNameEditKSeFBatchSendIU.Text := FileNameEditKSeFBatchOutInitUp.Text;
    FileNameEditKSeFBatchSendEnc.Text := FileNameEditKSeFBatchOutEncZIP.Text;
    ComboBoxKSeFBatchSendBramka.ItemIndex := ComboBoxKSeFBatchBramka.ItemIndex;
  except
    on E: Exception do
    begin
      if (E is EOleError) and Assigned(Backend.LastError) and SameText((Backend.LastError as IlgcErrorInfo).ExceptionClass, 'EAbord') then
        Debug('ANULOWANO')
      else
      begin
        Debug('B³¹d podczas podpisywania / przygotowania do wysy³ki wsadowej (%s): %s', [E.ClassName, E.Message]);
        DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
        MessageDlg(Format('B³¹d podczas podpisywania / przygotowania do wysy³ki wsadowej (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
      end;
    end;
  end;
end;

procedure TForm1.ButtonKSeFBatchSendClick(Sender: TObject);
var
  InitUpload: WideString;
  EncZIPFile: IlgcFileStream;
begin
  Debug('KSeF - wysy³ka wsadowa', True);
  try
    Debug('Otwieranie pliku wejœciowego: ' + FileNameEditKSeFBatchSendEnc.Text);
    EncZIPFile := Backend.CreateFileStream(FileNameEditKSeFBatchSendEnc.Text, fmOpenRead) as IlgcFileStream;
    Debug('Wczytanie InitUpload z pliku: ' + FileNameEditKSeFBatchSendIU.Text);
    InitUpload := QuickLoad(FileNameEditKSeFBatchSendIU.Text);
    KSeF.GateType := ComboBoxKSeFBatchSendBramka.ItemIndex;
    EditKSeFBatchNrRef.Text := KSeF.BatchSend(EncZIPFile, InitUpload);
    Debug('Wys³ano, nr referencyjny: ' + EditKSeFBatchNrRef.Text);
  except
    on E: Exception do
    begin
      Debug('B³¹d podczas wysy³ki wsadowej (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('B³¹d podczas wysy³ki wsadowej (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonKSeFQInvAsyncFetchClick(Sender: TObject);
var
  FS: IlgcFileStream;
begin
  Debug('KSeF - pobieranie wyniku zapytania o faktury asynchronicznie', True);
  if EditKSeFQInvAsyncQRefNo.Text = '' then
  begin
    MessageDlg('WprowadŸ nr ref. zapytania', mtInformation, [mbOK], 0);
    Exit;
  end;
  if EditKSeFQInvAsyncERefNo.Text = '' then
  begin
    MessageDlg('WprowadŸ nr ref. elementu', mtInformation, [mbOK], 0);
    Exit;
  end;
  if FileNameEditKSeFQInvAsyncFN.Text = '' then
  begin
    MessageDlg('WprowadŸ nazwê pliku docelowego', mtInformation, [mbOK], 0);
    Exit;
  end;
  FS := nil;
  try
      FS := Backend.CreateFileStream(FileNameEditKSeFQInvAsyncFN.Text, fmCreate) as IlgcFileStream;
    KSeF.QueryInvoiceAsyncFetch(EditKSeFQInvAsyncQRefNo.Text, EditKSeFQInvAsyncERefNo.Text, FS);
    Debug('Zapis wyniku do: ' + FileNameEditKSeFQInvAsyncFN.Text);
  except
    on E: Exception do
    begin
      Debug('B³¹d podczas pobierania wyniku zapytania o faktury asynchronicznie (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('B³¹d podczas pobierania wyniku zapytania o faktury aynchronicznie (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonKSeFQInvAsyncStatClick(Sender: TObject);
var
  Resp: OleVariant;
begin
  Debug('KSeF - pobranie statusu zapytania o faktury asynchronicznie', True);
  if EditKSeFQInvAsyncQRefNo.Text = '' then
  begin
    MessageDlg('WprowadŸ nr ref. zapytania', mtInformation, [mbOK], 0);
    Exit;
  end;
  try
    Debug('Nr ref. zapytania: ' + EditKSeFQInvAsyncQRefNo.Text);
    Resp := KSeF.QueryInvoiceAsyncStatus(EditKSeFQInvAsyncQRefNo.Text);
    Debug('OdpowiedŸ: ' + Resp.RawResponse);
    Debug('Status: ' + IntToStr(Resp.ProcessingCode));
    Debug('Opis statusu: ' + Resp.ProcessingDescription);
    Debug('Liczba czêœci: ' + IntToStr(Resp.NumberOfParts));
    if (Resp.ProcessingCode = 200) and (not VarIsNull(Resp.PartList)) and (Resp.PartList.Count > 0) then
      EditKSeFQInvAsyncERefNo.Text := VarToStr(Resp.PartList.Items[0].PartReferenceNumber);
    ObjAdd(IDispatch(Resp) as IlgcObject);
  except
    on E: Exception do
    begin
      Debug('B³¹d podczas pobierania statusu zapytania o faktury asynchronicznie (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('B³¹d podczas pobierania statusu zapytania o faktury aynchronicznie (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonKSeFQInvSyncClick(Sender: TObject);
var
  Req: IlgcKSeFRequest;
  Resp: OleVariant;
begin
  Debug('KSeF - zapytanie o faktury synchronicznie', True);
  Req := GetQueryInvoiceCr as IlgcKSeFRequest;
  Debug('Zapytanie: ' + Req.GetAsJSON);
  ObjAdd(Req);
  try
    Resp := KSeF.QueryInvoiceSync(Req, SpinEditKSeFQInvAsPS.Value, SpinEditKSeFQInvAsPS1.Value);
    Debug('OdpowiedŸ: ' + Resp.RawResponse);
    ObjAdd(IDispatch(Resp) as IlgcObject);
  except
    on E: Exception do
    begin
      Debug('B³¹d podczas zapytania o faktury synchronicznie (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('B³¹d podczas zapytania o faktury synchronicznie (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonObjShowClick(Sender: TObject);
begin
  if ListViewObj.Selected <> nil then
    ShowObject(IUnknown(ListViewObj.Selected.Data));
end;

procedure TForm1.ButtonObjCleaClick(Sender: TObject);
var
  I: TListItem;
begin
  while ListViewObj.Items.Count > 0 do
  begin
    I := ListViewObj.Items[0];
    IUnknown(I.Data)._Release;
    if I.Data <> nil then
      I.Data := nil;
    ListViewObj.Items.Delete(0);
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ButtonObjCleaClick(nil);
end;

procedure TForm1.ButtonObjCountClick(Sender: TObject);
begin
  Debug('Iloœæ obiektów COM: ' + IntToStr(Backend.GetDebugInfo(1)), True);
  Debug('Iloœæ obiektów KSeF: ' + IntToStr(Backend.GetDebugInfo(2)));
end;

procedure TForm1.ButtonPKCS11InfoClick(Sender: TObject);
var
  ICertSigner: IlgcPKCS11CertificateSigner;
begin
  Debug('Info o bibliotece PKCS11:', True);
  if Supports(Signer, IlgcPKCS11CertificateSigner, ICertSigner) then
  try
    with ICertSigner.GetInfo as IlgcPKCS11Info do
    begin
      Debug('Wersja Cryptokit: ' + CryptokitVersionStr);
      Debug('ID producenta: ' + ManufacturerID);
      Debug('Wersja biblioteki: ' + LibraryVersionStr);
      Debug('Opis biblioteki: ' + LibraryDescription);
    end;
  except
    on E: Exception do
    begin
      Debug('B³¹d podczas pobierania informacji o bibliotece PKCS11: ' + E.Message);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('B³¹d podczas pobierania informacji o bibliotece PKCS11: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

{function PKCS11SlotFlagsToStr(AFlags: TlgPKCS11SlotFlags): String;
var
  F: TlgPKCS11SlotFlag;
begin
  Result := '';
  for F := Low(TlgPKCS11SlotFlag) to High(TlgPKCS11SlotFlag) do
    if F in AFlags then
      Result := Result + GetEnumName(TypeInfo(TlgPKCS11SlotFlag), Ord(F)) + ',';
end;

function PKCS11TokenFlagsToStr(AFlags: TlgPKCS11TokenFlags): String;
var
  F: TlgPKCS11TokenFlag;
begin
  Result := '';
  for F := Low(TlgPKCS11TokenFlag) to High(TlgPKCS11TokenFlag) do
    if F in AFlags then
      Result := Result + GetEnumName(TypeInfo(TlgPKCS11TokenFlag), Ord(F)) + ',';
end;

function PKCS11SessionFlagsToStr(AFlags: TlgPKCS11SessionFlags): String;
var
  F: TlgPKCS11SessionFlag;
begin
  Result := '';
  for F := Low(TlgPKCS11SessionFlag) to High(TlgPKCS11SessionFlag) do
    if F in AFlags then
      Result := Result + GetEnumName(TypeInfo(TlgPKCS11SessionFlag), Ord(F)) + ',';
end;}

procedure TForm1.ButtonPKCS11SlotsClick(Sender: TObject);
var
  Slots: IlgcList;
  Info: IlgcPKCS11SlotInfo;
  I: Integer;
  ICertSigner: IlgcPKCS11CertificateSigner;
begin
  Debug('Lista slotów PKCS11', True);
  if not Supports(Signer, IlgcPKCS11CertificateSigner, ICertSigner) then
    Exit;
  try
    Slots := ICertSigner.GetSlots(False) as IlgcList;
    Debug('Lista slotów: ' + IntToStr(Slots.Count));
    for I := 0 to Slots.Count - 1 do
    begin
      if not Supports(Slots.Item[I], IlgcPKCS11SlotInfo, Info) then
        Continue;
      Debug('Slot ' + IntToStr(I));
      Debug('  SlotDescription: ' + Info.SlotDescription);
      Debug('  ManufacturerID: ' + Info.ManufacturerID);
      Debug('  Flags: ' + IntToHex(Info.Flags, 8));
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
          Debug('    Flags:' + IntToHex(Flags, 8));
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
      Debug('B³¹d podczas próby pobrania listy slotów: ' + E.Message);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('B³¹d podczas próby pobrania listy slotów: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonPKCS11SesStartClick(Sender: TObject);
var
  ICert: IlgcPKCS11Certificate;
  ICertSigner: IlgcPKCS11CertificateSigner;
begin
  if ComboBoxPKCS11Cert.ItemIndex < 0 then
  begin
    MessageDlg('Wybierz certyfikat', mtInformation, [mbOK], 0);
    Exit;
  end;
  if (not Supports(Certyfikaty[ComboBoxPKCS11Cert.ItemIndex], IlgcPKCS11Certificate, ICert))
    or (not Supports(Signer, IlgcPKCS11CertificateSigner, ICertSigner)) then
    Exit;
  Debug('PKCS11: Rozpocznij sesjê dla certyfikatu (' + IntToStr(ComboBoxPKCS11Cert.ItemIndex) + '): ' + ICert.DisplayName, True);
  try
    if ICert.Session <> nil then
    begin
      Debug('Sesja ju¿ zosta³a rozpoczêta');
      MessageDlg('Sesja ju¿ zosta³a rozpoczêta', mtInformation, [mbOK], 0);
      Exit;
    end;
    ICertSigner.SessionStart(ICert);
    Debug('Nowa sesja rozpoczêta');
  except
    on E: Exception do
    begin
      Debug('B³¹d podczas próby rozpoczêcia sesji: ' + E.Message);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('B³¹d podczas próby rozpoczêcia sesji: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonPKCS11SesLoginClick(Sender: TObject);
var
  ICert: IlgcPKCS11Certificate;
begin
  if ComboBoxPKCS11Cert.ItemIndex < 0 then
  begin
    MessageDlg('Wybierz certyfikat', mtInformation, [mbOK], 0);
    Exit;
  end;
  if not Supports(Certyfikaty[ComboBoxPKCS11Cert.ItemIndex], IlgcPKCS11Certificate, ICert) then
    Exit;
  Debug('PKCS11: Zaloguj (' + IntToStr(ComboBoxPKCS11Cert.ItemIndex) + '): ' + ICert.DisplayName, True);
  try
    if ICert.Session = nil then
    begin
      Debug('Sesja nie zosta³a rozpoczêta');
      MessageDlg('Sesja nie zosta³a rozpoczêta', mtInformation, [mbOK], 0);
      Exit;
    end;
    (ICert.Session as IlgcPKCS11Session).Login(EditPKCS11PIN.Text, ComboBoxPKCS11UserType.ItemIndex);
    Debug('Zalogowano');
  except
    on E: Exception do
    begin
      Debug('B³¹d podczas próby zalogowania: ' + E.Message);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('B³¹d podczas próby zalogowania: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonPKCS11SesLogoutClick(Sender: TObject);
var
  ICert: IlgcPKCS11Certificate;
begin
  if ComboBoxPKCS11Cert.ItemIndex < 0 then
  begin
    MessageDlg('Wybierz certyfikat', mtInformation, [mbOK], 0);
    Exit;
  end;
  if not Supports(Certyfikaty[ComboBoxPKCS11Cert.ItemIndex], IlgcPKCS11Certificate, ICert) then
    Exit;
  Debug('PKCS11: Wyloguj (' + IntToStr(ComboBoxPKCS11Cert.ItemIndex) + '): ' + ICert.DisplayName, True);
  try
    if ICert.Session = nil then
    begin
      Debug('Sesja nie zosta³a rozpoczêta');
      MessageDlg('Sesja nie zosta³a rozpoczêta', mtInformation, [mbOK], 0);
      Exit;
    end;
    (ICert.Session as IlgcPKCS11Session).Logout;
    Debug('Wylogowano');
  except
    on E: Exception do
    begin
      Debug('B³¹d podczas próby wylogowania: ' + E.Message);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('B³¹d podczas próby wylogowania: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonPKCS11SesCloseClick(Sender: TObject);
var
  ICert: IlgcPKCS11Certificate;
  ICertSigner: IlgcPKCS11CertificateSigner;
begin
  if ComboBoxPKCS11Cert.ItemIndex < 0 then
  begin
    MessageDlg('Wybierz certyfikat', mtInformation, [mbOK], 0);
    Exit;
  end;
  if (not Supports(Certyfikaty[ComboBoxPKCS11Cert.ItemIndex], IlgcPKCS11Certificate, ICert))
    or (not Supports(Signer, IlgcPKCS11CertificateSigner, ICertSigner)) then
  begin
    Exit;
  end;
  Debug('PKCS11: Zakoñcz sesjê (' + IntToStr(ComboBoxPKCS11Cert.ItemIndex) + '): ' + ICert.DisplayName, True);
  try
    if ICert.Session = nil then
    begin
      Debug('Sesja nie zosta³a rozpoczêta');
      MessageDlg('Sesja nie zosta³a rozpoczêta', mtInformation, [mbOK], 0);
      Exit;
    end;
    ICertSigner.SessionClose(ICert.Session);
    Debug('Sesja zakoñczona');
  except
    on E: Exception do
    begin
      Debug('B³¹d podczas próby zamkniêcia sesji: ' + E.Message);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('B³¹d podczas próby zamkniêcia sesji: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonPKCS11SesInfoClick(Sender: TObject);
var
  ICert: IlgcPKCS11Certificate;
begin
  if ComboBoxPKCS11Cert.ItemIndex < 0 then
  begin
    MessageDlg('Wybierz certyfikat', mtInformation, [mbOK], 0);
    Exit;
  end;
  if not Supports(Certyfikaty[ComboBoxPKCS11Cert.ItemIndex], IlgcPKCS11Certificate, ICert) then
    Exit;
  Debug('PKCS11: Info o sesji (' + IntToStr(ComboBoxPKCS11Cert.ItemIndex) + '): ' + ICert.DisplayName, True);
  if ICert.Session = nil then
  begin
    Debug('Sesja nie zosta³a rozpoczêta');
    MessageDlg('Sesja nie zosta³a rozpoczêta', mtInformation, [mbOK], 0);
    Exit;
  end;
  try
    with ICert.Session as IlgcPKCS11Session do
    begin
      Debug('State: ' + IntToHex(State, 8));
      Debug('Flags: ' + IntToHex(Flags, 8));
    end;
  except
    on E: Exception do
    begin
      Debug('B³¹d podczas próby pobrania informacji o sesji: ' + E.Message);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('B³¹d podczas próby pobrania informacji o sesji: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

end.

