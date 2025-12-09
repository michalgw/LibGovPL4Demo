unit Unit1;

{$mode objfpc}{$H+}
{$codepage utf8}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  ExtCtrls, EditBtn, Spin, DateTimePicker, LibGovPL_1_0_TLB;

type

  { TForm1 }

  TForm1 = class(TForm)
    ButtonSkrypt: TButton;
    ButtonObjCount: TButton;
    ButtonObjShow: TButton;
    ButtonObjClear: TButton;
    ButtonKSeFBatchPodp: TButton;
    ButtonKSeFBatchSend: TButton;
    ButtonKSeFInvGet: TButton;
    ButtonKSeFInvHide: TButton;
    ButtonKSeFInvSend: TButton;
    ButtonKSeFInvShow: TButton;
    ButtonKSeFInvStat: TButton;
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
    ButtonPKCS11Info: TButton;
    ButtonPKCS11SesClose: TButton;
    ButtonPKCS11SesInfo: TButton;
    ButtonPKCS11SesLogin: TButton;
    ButtonPKCS11SesLogout: TButton;
    ButtonPKCS11SesStart: TButton;
    ButtonPKCS11Slots: TButton;
    ButtonShowCert: TButton;
    ButtonSetup: TButton;
    ButtonViesCheckStatus: TButton;
    ButtonViesVatCheck: TButton;
    ButtonViesVatTestService: TButton;
    ButtonXMLTrans: TButton;
    ButtonXMLTransAdd: TButton;
    ButtonXMLVer: TButton;
    ButtonXMLVerAdd: TButton;
    CheckBoxKSeFQInvCrFaP17Annotation: TCheckBox;
    CheckBoxKSeFQInvCrIsHidden: TCheckBox;
    CheckBoxKSeFStatDet: TCheckBox;
    CheckBoxKSeFEncrypt: TCheckBox;
    CheckBoxJPKBCert: TCheckBox;
    CheckBoxJPKPCAdHoc: TCheckBox;
    CheckBoxEDekC14N: TCheckBox;
    CheckBoxJPKPAAdHoc: TCheckBox;
    CheckBoxLibXML2Cache: TCheckBox;
    CheckBoxXAdESCzas: TCheckBox;
    CheckBoxXMLTransOpen: TCheckBox;
    CheckGroupKSeFQInvCrIInvoiceTypes: TCheckGroup;
    ComboBoxKSeFQInvCAamountType: TComboBox;
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
    ComboBoxPKCS11Cert: TComboBox;
    ComboBoxPKCS11UserType: TComboBox;
    ComboBoxViesCountry: TComboBox;
    ComboBoxViesReqCountry: TComboBox;
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
    DateTimePickerKSeFQInvCrHidingDateFrom: TDateTimePicker;
    DateTimePickerKSeFQInvCrHidingDateTo: TDateTimePicker;
    DateTimePickerKSeFQInvCrIncInvFrom: TDateTimePicker;
    DateTimePickerKSeFQInvCrIncInvTo: TDateTimePicker;
    DateTimePickerKSeFQInvCrRanInvFrom: TDateTimePicker;
    DateTimePickerKSeFQInvCrRanInvTo: TDateTimePicker;
    DirectoryEditLibXML2Cache: TDirectoryEdit;
    EditKSeFBatchNIP: TEdit;
    EditKSeFBatchNrRef: TEdit;
    EditKSeFInvGetNr: TEdit;
    EditKSeFInvHideNr: TEdit;
    EditKSeFInvHideReason: TEdit;
    EditKSeFInvShowNr: TEdit;
    EditKSeFInvShowReason: TEdit;
    EditKSeFInvStatNr: TEdit;
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
    EditPKCS11PIN: TEdit;
    EditViesReqVatNum: TEdit;
    EditViesTraderCity: TEdit;
    EditViesTraderCompanyType: TEdit;
    EditViesTraderName: TEdit;
    EditViesTraderPostalCode: TEdit;
    EditViesTraderStreet: TEdit;
    EditViesVatNum: TEdit;
    FileNameEditKSeFGetFN: TFileNameEdit;
    FileNameEditKSeFInvSend: TFileNameEdit;
    FileNameEditLibExslt: TFileNameEdit;
    FileNameEditLibXlst: TFileNameEdit;
    FileNameEditLibXML2: TFileNameEdit;
    FileNameEditKSeFBatchInZIP: TFileNameEdit;
    FileNameEditKSeFBatchOutEncZIP: TFileNameEdit;
    FileNameEditKSeFBatchOutInitUp: TFileNameEdit;
    FileNameEditKSeFBatchSendEnc: TFileNameEdit;
    FileNameEditKSeFBatchSendIU: TFileNameEdit;
    FileNameEditKSeFUPO: TFileNameEdit;
    FileNameEditKSeFCInvFN: TFileNameEdit;
    FileNameEditKSeFQInvAsyncFN: TFileNameEdit;
    FileNameEditKSeFInitPZIn: TFileNameEdit;
    FileNameEditKSeFInitPZOut: TFileNameEdit;
    FileNameEditKSeFRSAProd: TFileNameEdit;
    FileNameEditKSeFRSADemo: TFileNameEdit;
    FileNameEditKSeFRSATest: TFileNameEdit;
    FileNameEditJPKBPlikWyj: TFileNameEdit;
    FileNameEditJPKBIU: TFileNameEdit;
    FileNameEditJPKBEnc: TFileNameEdit;
    FileNameEditJPKPAEnc: TFileNameEdit;
    FileNameEditJPKPCInitUpload: TFileNameEdit;
    FileNameEditJPKPAInitUpload: TFileNameEdit;
    FileNameEditJPKPCWej: TFileNameEdit;
    FileNameEditJPKPCEnc: TFileNameEdit;
    FileNameEditJPKPAWej: TFileNameEdit;
    FileNameEditJPKRSAProd: TFileNameEdit;
    FileNameEditJPKRSATest: TFileNameEdit;
    FileNameEditEDBPlikWej: TFileNameEdit;
    FileNameEditEDBPlikWyj: TFileNameEdit;
    FileNameEditEDPCWej: TFileNameEdit;
    FileNameEditEDPAWej: TFileNameEdit;
    FileNameEditEDPCWyj: TFileNameEdit;
    FileNameEditEDPAWyj: TFileNameEdit;
    FileNameEditLibPKCS11: TFileNameEdit;
    FileNameEditXMLTransDst: TFileNameEdit;
    FileNameEditXMLTransSrc: TFileNameEdit;
    FileNameEditXMLVer: TFileNameEdit;
    FloatSpinEditKSeFCInvDueValue: TFloatSpinEdit;
    FloatSpinEditEDPKwota: TFloatSpinEdit;
    FloatSpinEditJPKPKwota: TFloatSpinEdit;
    FloatSpinEditKSeFQInvCAamountFrom: TFloatSpinEdit;
    FloatSpinEditKSeFQInvCAamountTo: TFloatSpinEdit;
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
    GroupBox21: TGroupBox;
    GroupBox22: TGroupBox;
    GroupBox23: TGroupBox;
    GroupBox24: TGroupBox;
    GroupBox25: TGroupBox;
    GroupBox26: TGroupBox;
    GroupBox27: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBoxKSeFSesGenIntId: TGroupBox;
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
    GroupBoxLibXML2Par: TGroupBox;
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
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    Label12: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Label122: TLabel;
    Label123: TLabel;
    Label124: TLabel;
    Label125: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    Label128: TLabel;
    Label129: TLabel;
    Label13: TLabel;
    Label130: TLabel;
    Label131: TLabel;
    Label132: TLabel;
    Label133: TLabel;
    Label134: TLabel;
    Label135: TLabel;
    Label136: TLabel;
    Label137: TLabel;
    Label138: TLabel;
    Label139: TLabel;
    Label140: TLabel;
    Label141: TLabel;
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
    ListViewObj: TListView;
    MemoLog: TMemo;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    RadioButtonKSeFBatchCert: TRadioButton;
    RadioButtonKSeFBatchPZ: TRadioButton;
    RadioGroupXMLVal: TRadioGroup;
    ScrollBox4: TScrollBox;
    ScrollBox5: TScrollBox;
    Splitter2: TSplitter;
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
    TabSheetVies: TTabSheet;
    TabSheetXMLVer: TTabSheet;
    TabSheetPKCS11: TTabSheet;
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
    procedure ButtonObjCountClick(Sender: TObject);
    procedure ButtonKSeFBatchPodpClick(Sender: TObject);
    procedure ButtonKSeFBatchSendClick(Sender: TObject);
    procedure ButtonKSeFCInvClearClick(Sender: TObject);
    procedure ButtonKSeFCInvGetClick(Sender: TObject);
    procedure ButtonKSeFGenIntIdClick(Sender: TObject);
    procedure ButtonKSeFInvHideClick(Sender: TObject);
    procedure ButtonKSeFInvShowClick(Sender: TObject);
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
    procedure ButtonObjClearClick(Sender: TObject);
    procedure ButtonObjShowClick(Sender: TObject);
    procedure ButtonPKCS11InfoClick(Sender: TObject);
    procedure ButtonPKCS11SesCloseClick(Sender: TObject);
    procedure ButtonPKCS11SesInfoClick(Sender: TObject);
    procedure ButtonPKCS11SesLoginClick(Sender: TObject);
    procedure ButtonPKCS11SesLogoutClick(Sender: TObject);
    procedure ButtonPKCS11SesStartClick(Sender: TObject);
    procedure ButtonPKCS11SlotsClick(Sender: TObject);
    procedure ButtonShowCertClick(Sender: TObject);
    procedure ButtonSetupClick(Sender: TObject);
    procedure ButtonSkryptClick(Sender: TObject);
    procedure ButtonViesCheckStatusClick(Sender: TObject);
    procedure ButtonViesVatCheckClick(Sender: TObject);
    procedure ButtonXMLTransAddClick(Sender: TObject);
    procedure ButtonXMLTransClick(Sender: TObject);
    procedure ButtonXMLVerAddClick(Sender: TObject);
    procedure ButtonXMLVerClick(Sender: TObject);
    procedure FileNameEditEDPAWejAcceptFileName(Sender: TObject;
      var Value: String);
    procedure FileNameEditEDPCWejAcceptFileName(Sender: TObject;
      var Value: String);
    procedure FileNameEditJPKPCWejAcceptFileName(Sender: TObject;
      var Value: String);
    procedure FileNameEditKSeFBatchInZIPAcceptFileName(Sender: TObject;
      var Value: String);
    procedure FileNameEditXMLTransSrcAcceptFileName(Sender: TObject;
      var Value: String);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ListViewObjDblClick(Sender: TObject);
    procedure RadioButtonKSeFBatchCertChange(Sender: TObject);
    procedure RadioGroupXMLValClick(Sender: TObject);
  private
    procedure UstawKSeFSesion(AWartosc: Boolean);
    function GetQueryInvoiceCr: IlgcKSeFRequest;
    procedure SetupValidator;
    procedure SetupTrans;
    procedure SetupLXML;
    procedure SetupVies;
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

    XValidator: IlgcXMLValidator;
    XTrans: IlgcXMLXSLTransformation;

    ViesService: IlgcViesService;

    procedure ObjAdd(AObj: IlgcObject);
    procedure Debug(ATekst: String; ALinia: Boolean = False);
    procedure Debug(ATekst: String; ADane: array of const);
    procedure DebugCert(ACertyfikat: IlgcCertificate);
    procedure DebugAuth(AImie, ANazwisko, ANIP: String; ADataU: TDate; AKwota: Currency);
    procedure DebugErrorInfo(AError: IlgcErrorInfo);

    procedure LoadCertList;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

uses
  DateUtils, Unit2, Variants, ComObj, ActiveX, Unit3, Unit4, LCLIntf;

procedure QuickSave(const APlik, ADane: String); overload;
var
  FS: TFileStream = nil;
begin
  try
    FS := TFileStream.Create(APlik, fmCreate);
    FS.Write(ADane[1], Length(ADane));
  finally
    FS.Free;
  end;
end;

procedure QuickSave(const APlik: String; const ADane: TBytes); overload;
var
  FS: TFileStream = nil;
begin
  try
    FS := TFileStream.Create(APlik, fmCreate);
    FS.Write(ADane[0], Length(ADane));
  finally
    FS.Free;
  end;
end;

function QuickLoad(const APlik: String): String;
var
  FS: TFileStream = nil;
begin
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
  if ComboBoxSign.Items.Count > 1 then
    ComboBoxSign.ItemIndex := 1;
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
  DirectoryEditLibXML2Cache.Directory := IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'cache';
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
  XValidator := nil;
  XTrans := nil;
  XValidator := nil;
  if Assigned(LibXMLBackend) then
    LibXMLBackend.HTTPClient := nil;
  LibXMLBackend := nil;
  ViesService := nil;
  Backend.ClearLastError;

  // Czy pozostaly jakies obiekty (poza Backend)?
  IloscObiektowCOM := Backend.GetDebugInfo(1);
  IloscObiektowKSeF := Backend.GetDebugInfo(2);
  if (IloscObiektowCOM > 1) or (IloscObiektowKSeF > 0) then
    MessageDlg(Format('Ilosc obiektow COM: %d' + LineEnding
      + 'Ilosc obiektow KSeF: %d', [IloscObiektowCOM, IloscObiektowKSeF]),
      mtWarning, [mbOK], 0);
end;

procedure TForm1.ListViewObjDblClick(Sender: TObject);
begin
  ButtonObjShowClick(nil);
end;

procedure TForm1.RadioButtonKSeFBatchCertChange(Sender: TObject);
begin
  ComboBoxKSeFBatchCert.Enabled := RadioButtonKSeFBatchCert.Checked;
end;

procedure TForm1.RadioGroupXMLValClick(Sender: TObject);
begin
  GroupBoxLibXML2Par.Enabled := RadioGroupXMLVal.ItemIndex = 1;
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

  // Tylko dla serwerów testowych lub prod >= 2.0.0
  //FloatSpinEditKSeFQInvCAamountFrom.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
  //FloatSpinEditKSeFQInvCAamountTo.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
  //ComboBoxKSeFQInvCAamountType.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
  //MemoKSeFQInvCrCurrencyCodes.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
  //CheckBoxKSeFQInvCrFaP17Annotation.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
  //CheckGroupKSeFQInvCrIInvoiceTypes.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;

  // Tylko dla serwerow testowych >= 2.2.0
  CheckBoxKSeFQInvCrIsHidden.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
  DateTimePickerKSeFQInvCrHidingDateFrom.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
  DateTimePickerKSeFQInvCrHidingDateTo.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
end;

function TForm1.GetQueryInvoiceCr: IlgcKSeFRequest;
var
  I: Integer;
  Req: OleVariant;
  Obj: OleVariant;
  S: String;
begin
  Req := KSeF.CreateKSeFObject('TKSeFQueryInvoiceRequest');
  case PageControlKSeFQInvSubjectType.ActivePageIndex of
    0: begin
      Req.QueryCriteria := KSeF.CreateKSeFObject('TKSeFQueryCriteriaInvoiceDetail');
      Obj := Req.QueryCriteria;
      Obj.SubjectType := ComboBoxKSeFQInvCrSubTyp.ItemIndex;
      Obj.InvoicingDateFrom := DateTimePickerKSeFQInvCrDetInvFrom.DateTime;
      Obj.InvoicingDateTo := DateTimePickerKSeFQInvCrDetInvTo.DateTime;
      Obj.AmountFrom := FloatSpinEditKSeFQInvCAamountFrom.Value;
      Obj.AmountTo := FloatSpinEditKSeFQInvCAamountTo.Value;
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
      for I := 0 to CheckGroupKSeFQInvCrIInvoiceTypes.Items.Count - 1 do
        if CheckGroupKSeFQInvCrIInvoiceTypes.Checked[I] then
        begin
          if S <> '' then
            S := S + ';';
          S := S + CheckGroupKSeFQInvCrIInvoiceTypes.Items[I];
        end;
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
      Obj.AcquisitionTimestampThresholdFrom := DateTimePickerKSeFQInvCrIncInvFrom.DateTime;
      Obj.AcquisitionTimestampThresholdTo := DateTimePickerKSeFQInvCrIncInvTo.DateTime;
    end;
    2: begin
      Req.QueryCriteria := KSeF.CreateKSeFObject('TKSeFQueryCriteriaInvoiceRange');
      Obj := Req.QueryCriteria;
      Obj.SubjectType := ComboBoxKSeFQInvCrSubTyp.ItemIndex;
      Obj.InvoicingDateFrom := DateTimePickerKSeFQInvCrDetInvFrom.DateTime;
      Obj.invoicingDateTo := DateTimePickerKSeFQInvCrDetInvTo.DateTime;
    end;
  end;
  if CheckBoxKSeFQInvCrIsHidden.Checked then
    Req.QueryCriteria.IsHidden := True;
  if not DateTimePickerKSeFQInvCrHidingDateFrom.DateIsNull then
    Req.QueryCriteria.HidingDateFrom := DateTimePickerKSeFQInvCrHidingDateFrom.DateTime;
  if not DateTimePickerKSeFQInvCrHidingDateTo.DateIsNull then
    Req.QueryCriteria.HidingDateTo := DateTimePickerKSeFQInvCrHidingDateTo.DateTime;
  Result := Req;
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

procedure TForm1.SetupValidator;
const
  VALCLS: array[0..1] of UTF8String = ('TlgMSXMLValidator', 'TlgLibXML2Validator');
begin
  if Assigned(XValidator) and ((SameText(XValidator.GetObjClassName, VALCLS[0]) and (RadioGroupXMLVal.ItemIndex = 1))
    or (SameText(XValidator.GetObjClassName, VALCLS[1]) and (RadioGroupXMLVal.ItemIndex = 0))) then
    XValidator := nil;
  if not Assigned(XValidator) then
      XValidator := Backend.CreateXMLValidator(VALCLS[RadioGroupXMLVal.ItemIndex]) as IlgcXMLValidator;
  if RadioGroupXMLVal.ItemIndex = 1 then
    SetupLXML;
end;

procedure TForm1.SetupTrans;
const
  TRNCLS: array[0..1] of UTF8String = ('TlgMSXMLXSLTransformation', 'TlgLibXML2XSLTransformation');
begin
  if Assigned(XTrans) and ((SameText(XTrans.GetObjClassName, TRNCLS[0]) and (RadioGroupXMLVal.ItemIndex = 1))
    or (SameText(XTrans.GetObjClassName, TRNCLS[1]) and (RadioGroupXMLVal.ItemIndex = 0))) then
    XTrans := nil;
  if not Assigned(XTrans) then
      XTrans := Backend.CreateXMLXSLTranformation(TRNCLS[RadioGroupXMLVal.ItemIndex]) as IlgcXMLXSLTransformation;
  if RadioGroupXMLVal.ItemIndex = 1 then
    SetupLXML;
end;

procedure TForm1.SetupLXML;
begin
  LibXMLBackend.CacheExternals := CheckBoxLibXML2Cache.Checked;
  LibXMLBackend.CacheDir := DirectoryEditLibXML2Cache.Directory;
  if not DirectoryExists(DirectoryEditLibXML2Cache.Directory) then
    CreateDir(DirectoryEditLibXML2Cache.Directory);
  LibXMLBackend.HTTPClient := HTTPClient;
end;

procedure TForm1.SetupVies;
begin
  if ViesService = nil then
  begin
    ViesService := ColgcViesService.Create;
    ViesService.HTTPClient := HTTPClient;
  end;
end;

procedure TForm1.Debug(ATekst: String; ALinia: Boolean);
begin
  if ALinia then
    MemoLog.Append('-------------------------------');
  MemoLog.Append(ATekst);
end;

procedure TForm1.Debug(ATekst: String; ADane: array of const);
begin
  MemoLog.Append(Format(ATekst, ADane));
end;

procedure TForm1.DebugCert(ACertyfikat: IlgcCertificate);
begin
  MemoLog.Append('Certyfikat (' + ACertyfikat.GetObjClassName + ')');
  MemoLog.Append('  Nr seryjny: ' + ACertyfikat.SerialNoDec + ' (' + ACertyfikat.SerialNoHex + ')');
  MemoLog.Append('  Nazwa: ' + ACertyfikat.DisplayName);
  MemoLog.Append('  Ważny od ' + DateTimeToStr(ACertyfikat.ValidFrom) + ' do ' + DateTimeToStr(ACertyfikat.ValidTo));
  MemoLog.Append('  Podmiot: ' + ACertyfikat.Subject);
  MemoLog.Append('  Wydawca: ' + ACertyfikat.Issuer);
  //MemoLog.Append('  Rodzaj podpisu: ' + ACertyfikat.Signature);
end;

procedure TForm1.DebugAuth(AImie, ANazwisko, ANIP: String; ADataU: TDate;
  AKwota: Currency);
begin
  MemoLog.Append('Dane autoryzujące:');
  MemoLog.Append('  NIP: ' + ANIP);
  MemoLog.Append('  Imię: ' + AImie);
  MemoLog.Append('  Nazwisko: ' + ANazwisko);
  MemoLog.Append('  Data urodzenia: ' + DateToStr(ADataU));
  MemoLog.Append('  Kwota: ' + CurrToStr(AKwota));
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
  FS: TFileStream = nil;
  S: String;
  IP11Signer: IlgcPKCS11CertificateSigner;
  ICNGSigner: IlgcCNGCertificateSigner;
begin
  if SameText(ComboBoxSign.Text, PKCS11LIBCLASS) and (FileNameEditLibPKCS11.FileName = '') then
  begin
    MessageDlg('Wprowadź nazwę pliku biblioteki PKCS#11', mtInformation, [mbOK], 0);
    Exit;
  end;
  if not Assigned(Signer) and (ComboBoxSign.ItemIndex > 0) then
  begin
    Signer := Backend.CreateCertificateSigner(ComboBoxSign.Text) as IlgcCertificateSigner;
    if Supports(Signer, IlgcPKCS11CertificateSigner, IP11Signer) then
    begin
      try
        IP11Signer.LoadLibrary(FileNameEditLibPKCS11.FileName);
      except
        on E: Exception do
        begin
          MessageDlg('Wystąpił błąd podczas próby załadowania biblioteki PKCS#11', mtError, [mbOK], 0);
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

  EDek := Backend.CreateEDeklaracja as IlgcEDeklaracja;
  JPK := Backend.CreateJPK as IlgcJPK;

  if Assigned(Signer) then
  begin
    XAdES := Backend.CreateXAdES as IlgcXAdES;
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
    if ComboBoxRandGen.ItemIndex >= 0 then
      RandomGeneratorClass := ComboBoxRandGen.Text;
    if ComboBoxXMLRead.ItemIndex >= 0 then
      XMLReaderClass := ComboBoxXMLRead.Text;
    JPKRSAProd := Backend.CreateRSAPublicKey(ComboBoxRSAEnc.Text, FileNameEditJPKRSAProd.FileName, lgcETPEM);
    try
      FS := TFileStream.Create(FileNameEditJPKRSATest.FileName, fmOpenRead);
      SetLength(S, FS.Size);
      FS.Read(S[1], FS.Size);
    finally
      FS.Free;
    end;
    JPKRSATest := Backend.CreateRSAPublicKey(ComboBoxRSAEnc.Text, S, lgcETPEM);
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
    KSeFRSAProd := Backend.CreateRSAPublicKey(ComboBoxRSAEnc.Text, FileNameEditKSeFRSAProd.FileName, lgcETPEM);
    KSeFRSADemo := Backend.CreateRSAPublicKey(ComboBoxRSAEnc.Text, FileNameEditKSeFRSADemo.FileName, lgcETPEM);
    KSeFRSATest := Backend.CreateRSAPublicKey(ComboBoxRSAEnc.Text, FileNameEditKSeFRSATest.FileName, lgcETPEM);
    RSAKeyProd := KSeFRSAProd;
    RSAKeyDemo := KSeFRSADemo;
    RSAKeyTest := KSeFRSATest;
  end;

  LibXMLBackend := ColgcLibXMLBackend.Create;
  if FileNameEditLibXML2.FileName <> '' then
    if not LibXMLBackend.LoadLibXML(FileNameEditLibXML2.FileName) then
      MessageDlg('Nie można zładować biblioteki: ' + FileNameEditLibXML2.FileName, mtError, [mbOK], 0);
  if (FileNameEditLibXlst.FileName <> '') or (FileNameEditLibExslt.FileName <> '')  then
    if not LibXMLBackend.LoadLibXSLT(FileNameEditLibXlst.FileName, FileNameEditLibExslt.FileName) then
      MessageDlg('Nie można załadować biblioteki libxslt lub libexslt.', mtError, [mbOK], 0);

  TabSheetSetup.Enabled := False;
  TabSheetEDekPodpisAut.TabVisible := True;
  TabSheetEDekBramka.TabVisible := True;
  TabSheetJPKPodpisAut.TabVisible := True;
  TabSheetJPKBramka.TabVisible := True;
  TabSheetKsefSession.TabVisible := True;
  TabSheetKSeFCommon.TabVisible := True;
  TabSheetKSeFBatch.TabVisible := True;
  TabSheetXMLVer.TabVisible := True;
  RadioGroupXMLValClick(nil);
  TabSheetVies.TabVisible := True;

  if Assigned(Signer) then
  begin
    TabSheetCert.TabVisible := True;
    TabSheetEDekPodpisCert.TabVisible := True;
    TabSheetJPKPodpisCert.TabVisible := True;
    if Signer is IlgcPKCS11CertificateSigner then
      TabSheetPKCS11.TabVisible := True;
    LoadCertList;
  end
  else
    GroupBoxKSeFSesInitCert.Visible := False;

  DateTimePickerKSeFQInvCrRanInvFrom.DateTime := IncDay(Now, -30);
  DateTimePickerKSeFQInvCrRanInvTo.DateTime := Now;
  DateTimePickerKSeFQInvCrIncInvFrom.DateTime := IncDay(Now, -30);
  DateTimePickerKSeFQInvCrIncInvTo.DateTime := Now;
  DateTimePickerKSeFQInvCrDetInvFrom.DateTime := IncDay(Now, -30);
  DateTimePickerKSeFQInvCrDetInvTo.DateTime := Now;

  if Assigned(XAdES) then
  begin
    Debug('XAdES', True);
    Debug('SHA1HashClass: ' + XAdES.SHA1HashClass);
    Debug('SHA256HashClass: ' + XAdES.SHA256HashClass);
    Debug('Base64EncoderClass: ' + XAdES.Base64EncoderClass);
  end;
  Debug('EDek', True);
  Debug('XMLCanonizator: ' + EDek.XMLCanonizator);
  Debug('EDekGate: ' + EDek.EDekGate);
  Debug('JPK', True);
  Debug('Base64EncoderClass: ' + JPK.Base64EncoderClass);
  Debug('AES256EncryptClass: ' + JPK.AES256EncryptClass);
  Debug('MD5HashClass: ' + JPK.MD5HashClass);
  Debug('SHA256HashClass: ' + JPK.SHA256HashClass);
  Debug('ZipperClass: ' + JPK.ZipperClass);
  Debug('RandomGeneratorClass: ' + JPK.RandomGeneratorClass);
  Debug('XMLReaderClass: ' + JPK.XMLReaderClass);
  Debug('KSeF', True);
  Debug('Base64EncoderClass: ' + KSeF.Base64EncoderClass);
  Debug('AES256EncryptClass: ' + KSeF.AES256EncryptClass);
  Debug('SHA256HashClass: ' + KSeF.SHA256HashClass);
  Debug('RandomGeneratorClass: ' + KSeF.RandomGeneratorClass);
  if Assigned(Signer) and (Signer is IlgcPKCS11CertificateSigner) then
    ButtonPKCS11InfoClick(nil);
end;

procedure TForm1.ButtonSkryptClick(Sender: TObject);
begin
  Form4.Visible := True;
end;

procedure TForm1.ButtonViesCheckStatusClick(Sender: TObject);
var
  Resp: IlgcViesStatusInformationResponse;
  I: Integer;
begin
  Debug('VIES - Sprawdź status usługi', True);
  try
    SetupVies;
    Resp := ViesService.CheckStatus(HTTPClient) as IlgcViesStatusInformationResponse;
    Debug('VoW dostępne: ' + BoolToStr(Resp.VowAvaiable, 'Tak', 'Nie'));
    Debug('Liczba krajów: ' + IntToStr((Resp.Countries as IlgcList).Count));
    for I := 0 to (Resp.Countries as IlgcList).Count - 1 do
      Debug('  ' + (Resp.Countries as IlgcList).Item[I].CountryCode + ': ' + IntToStr((Resp.Countries as IlgcList).Item[I].Availability));
  except
    on E: Exception do
    begin
      Debug('Błąd podzas sprawdzania VIES (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('Błąd podzas sprawdzania VIES (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonViesVatCheckClick(Sender: TObject);
var
  Resp: IlgcViesCheckVatResponse;
  S: String;
begin
  Debug('VIES - Sprawdź VAT' + specialize IfThen<String>(Sender = ButtonViesVatTestService, ' (TEST)', ''), True);
  try
    SetupVies;
    if Sender = ButtonViesVatTestService then
      Resp := ViesService.CheckVatTestService(ComboBoxViesCountry.Text, EditViesVatNum.Text,
        ComboBoxViesReqCountry.Text, EditViesReqVatNum.Text, EditViesTraderName.Text,
        EditViesTraderStreet.Text, EditViesTraderPostalCode.Text, EditViesTraderCity.Text,
        EditViesTraderCompanyType.Text, nil) as IlgcViesCheckVatResponse
    else
      Resp := ViesService.CheckVatNumber(ComboBoxViesCountry.Text, EditViesVatNum.Text,
        ComboBoxViesReqCountry.Text, EditViesReqVatNum.Text, EditViesTraderName.Text,
        EditViesTraderStreet.Text, EditViesTraderPostalCode.Text, EditViesTraderCity.Text,
        EditViesTraderCompanyType.Text, nil) as IlgcViesCheckVatResponse;
    Debug('Odpowiedź:');
    Debug('  Kod kraju: ' + Resp.CountryCode);
    Debug('  Nr VAT: ' + Resp.VatNumber);
    Debug('  Data żądania: ' + DateTimeToStr(Resp.RequestDate));
    Debug('  Prawidłowy: ' + BoolToStr(Resp.Valid, 'Tak', 'Nie'));
    Debug('  Identyfikator żądania: ' + Resp.RequestIdentifier);
    Debug('  Nazwa: ' + Resp.Name);
    Debug('  Adres: ' + Resp.Address);
    Debug('  Nazwa handlowa: ' + Resp.TraderName);
    Debug('  Ulica: ' + Resp.TraderStreet);
    Debug('  Kod poczt.: ' + Resp.TraderPostalCode);
    Debug('  Miejscowość: ' + Resp.TraderCity);
    Debug('  Rodzaj firmy: ' + Resp.TraderCompanyType);
    WriteStr(S, Resp.TraderNameMatch);
    Debug('  Dopasowanie nazwy: ' + S);
    WriteStr(S, Resp.TraderStreetMatch);
    Debug('  Dopasowanie ulicy: ' + S);
    WriteStr(S, Resp.TraderPostalCodeMatch);
    Debug('  Dopasowanie kodu poczt.: ' + S);
    WriteStr(S, Resp.TraderCityMatch);
    Debug('  Dopasowanie miejscowości: ' + S);
    WriteStr(S, Resp.TraderCompanyTypeMatch);
    Debug('  Dopasowanie rodzaju: ' + S);
    Debug('  RawResponse: ' + Resp.RawResponse);
  except
    on E: Exception do
    begin
      Debug('Błąd podzas sprawdzania VIES (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('Błąd podzas sprawdzania VIES (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonXMLTransAddClick(Sender: TObject);
begin
  Debug('Dodawanie szablonu', True);
  SetupTrans;
  with TForm3.Create(Self) do
  begin
    if ShowModal = mrOK then
      XValidator.AddSchema(EditNS.Text, FileNameEditRes.FileName);
    Debug('Dodano szablon:');
    Debug('NS: ' + EditNS.Text);
    Debug('Zasób: ' + FileNameEditRes.FileName);
    Free;
  end;
end;

const
  RDRCLS: array[0..1] of UTF8String = ('TlgMSXMLReader', 'TlgLibXML2Reader');

procedure TForm1.ButtonXMLTransClick(Sender: TObject);
var
  XDoc: IlgcXMLReader = nil;
  FS: IlgcFileStream = nil;
begin
  SetupTrans;
  if (FileNameEditXMLTransSrc.FileName = '') or (FileNameEditXMLTransDst.FileName = '') then
  begin
    MessageDlg('Wprowadź nazwę pliku.', mtInformation, [mbOK], 0);
    Exit;
  end;
  Debug('Transformacja XML na podstawie XSLT', True);
  Debug('Plik wejściowy: ' + FileNameEditXMLTransSrc.FileName);
  try
    XDoc := Backend.CreateXMLReader(RDRCLS[RadioGroupXMLVal.ItemIndex], FileNameEditXMLTransSrc.FileName) as IlgcXMLReader;
    FS := Backend.CreateFileStream(FileNameEditXMLTransDst.FileName, fmCreate) as IlgcFileStream;
    XTrans.Transform(XDoc, FS);
    Debug('Zapisano do pliku: ' + FileNameEditXMLTransDst.FileName);
    FS := nil;
    XDoc := nil;
    if CheckBoxXMLTransOpen.Checked then
      OpenDocument(FileNameEditXMLTransDst.FileName);
  except
    on E: Exception do
    begin
      Debug('Błąd podzas transformacji XSLT (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('Błąd podzas transformacji XSLT (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonXMLVerAddClick(Sender: TObject);
begin
  Debug('Dodawanie schematu', True);
  SetupValidator;
  with TForm3.Create(Self) do
  begin
    if ShowModal = mrOK then
      XValidator.AddSchema(EditNS.Text, FileNameEditRes.FileName);
    Debug('Dodano schemat:');
    Debug('NS: ' + EditNS.Text);
    Debug('Zasób: ' + FileNameEditRes.FileName);
    Free;
  end;
end;

procedure TForm1.ButtonXMLVerClick(Sender: TObject);
var
  Errors: IDispatch = nil;
  XDoc: IlgcXMLReader = nil;
  I: Integer;
begin
  if FileNameEditXMLVer.FileName = '' then
  begin
    MessageDlg('Wprowadź nazwę pliku do weryfikacji.', mtInformation, [mbOK], 0);
    Exit;
  end;
  Debug('Weryfikacja pliku', True);
  Debug('Plik: ' + FileNameEditXMLVer.FileName);
  SetupValidator;
  try
    XDoc := Backend.CreateXMLReader(RDRCLS[RadioGroupXMLVal.ItemIndex], FileNameEditXMLVer.FileName) as IlgcXMLReader;
    if XValidator.Validate2(XDoc, Errors) then
      Debug('Jest poprawny')
    else
    begin
      Debug('NIE jest poprawny');
      Debug('Błędy:');
      with Errors as IlgcList do
        for I := 0 to Count - 1 do
        begin
          Debug('Nr błędu: ' + IntToStr(Item[I].ErrorCode));
          Debug('Linia: ' + IntToStr(Item[I].Line));
          Debug('Komunikat: ' + Item[I].Message);
          Debug('Element: ' + Item[I].Path);
          Debug('Sciezka: ' + Item[I].SimplePath);
          Debug('-------');
        end;
      Errors := nil;
    end;
    XDoc := nil;
  except
    on E: Exception do
    begin
      Debug('Błąd podzas walidacji XML (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('Błąd podzas walidacji XML (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.FileNameEditEDPAWejAcceptFileName(Sender: TObject;
  var Value: String);
begin
  FileNameEditEDPAWyj.FileName := Value + '.sig';
end;

procedure TForm1.FileNameEditEDPCWejAcceptFileName(Sender: TObject;
  var Value: String);
begin
  FileNameEditEDPCWyj.FileName := Value + '.sig';
end;

procedure TForm1.FileNameEditJPKPCWejAcceptFileName(Sender: TObject;
  var Value: String);
begin
  FileNameEditJPKPCEnc.FileName := Value + '.enc';
  FileNameEditJPKPCInitUpload.FileName := Value + '.iu.sig';
end;

procedure TForm1.FileNameEditKSeFBatchInZIPAcceptFileName(Sender: TObject;
  var Value: String);
begin
  FileNameEditKSeFBatchOutEncZIP.FileName := ChangeFileExt(Value, '.part1');
  FileNameEditKSeFBatchOutInitUp.FileName := ChangeFileExt(Value, '.iu.xml');
end;

procedure TForm1.FileNameEditXMLTransSrcAcceptFileName(Sender: TObject;
  var Value: String);
begin
  FileNameEditXMLTransDst.FileName := Value + '.html';
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  ButtonObjClearClick(nil);
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
  Debug('JPK - Sprawdź status / pobierz UPO', True);
  try
    Status := JPK.RequestUPO(EditJPKBNrRef.Text, ComboBoxJPKBRodzBramUPO.ItemIndex) as IlgcEDeklaracjaStatus;
    Debug('Status: ' + IntToStr(Status.Status));
    Debug('Opis: ' + Status.Opis);
    Debug('Szczegóły: ' + Status.Szczegoly);
    Debug('Timestamp: ' + DateTimeToStr(Status.Timestamp));
    if Status.Status = 200 then
    begin
      QuickSave(FileNameEditJPKBPlikWyj.FileName, Status.UPO);
      Debug('Pobrano UPO');
    end
    else
      Debug('Nie pobrano UPO');
  except
    on E: Exception do
    begin
      Debug('Błąd podzas sprawdzania statusu JPK (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('Błąd podzas sprawdzania statusu JPK (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonJPKBWyslijClick(Sender: TObject);
var
  InitUpload: String;
  EncStream: IDispatch;
  RefNo: String;
begin
  Debug('Wyślij JPK', True);
  try
    Debug('Wczytywanie struktury InitUpload: ' + FileNameEditJPKBIU.FileName);
    InitUpload := QuickLoad(FileNameEditJPKBIU.FileName);

    Debug('Otwarcie strumienia z zaszyfrowanymi danymi: ' + FileNameEditJPKBEnc.FileName);
    EncStream := Backend.CreateFileStream(FileNameEditJPKBEnc.FileName, fmOpenRead);

    Debug('Wysyłanie');
    RefNo := JPK.Send(InitUpload, EncStream, ComboBoxJPKBRodzBram.ItemIndex,
      CheckBoxJPKBCert.Checked);

    EditJPKBNrRef.Text := RefNo;
    Debug('Wysłano plik JPK, ref no: ' + RefNo);
  except
    on E: Exception do
    begin
      Debug('Błąd podzas wysyłania JPK (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('Błąd podzas wysyłania JPK (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
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
  Debug('Podpis JPK danymi autoryzującymi', True);
  try
    Debug('Plik wejściowy: ' + FileNameEditJPKPAWej.FileName);
    IStream := Backend.CreateFileStream(FileNameEditJPKPAWej.FileName, fmOpenRead);

    Debug('Plik wynikowy (enc. zip): ' + FileNameEditJPKPAEnc.FileName );
    OStream := Backend.CreateFileStream(FileNameEditJPKPAEnc.FileName, fmCreate);

    Debug('Na żądanie (ad hoc): ' + BoolToStr(CheckBoxJPKPCAdHoc.Checked));

    Debug('Bramka (klucz rsa): ' + ComboBoxJPKPARodzBram.Text);

    DebugAuth(EditJPKPImie.Text, EditJPKPNazwisko.Text, EditJPKPNIP.Text,
      DateTimePickerJPKPDataU.Date, FloatSpinEditJPKPKwota.Value);

    InitUp := JPK.SignAuthData(EditJPKPNIP.Text, EditJPKPImie.Text, EditJPKPNazwisko.Text,
      DateTimePickerJPKPDataU.Date, FloatSpinEditJPKPKwota.Value,
      ComboBoxJPKPARodzBram.ItemIndex, CheckBoxJPKPCAdHoc.Checked,
      IStream, OStream);

    Debug('Podpisano');

    Debug('Zapis InitUpload do pliku: ' + FileNameEditJPKPCInitUpload.FileName);
    QuickSave(FileNameEditJPKPCInitUpload.FileName, InitUp);
  except
    on E: Exception do
    begin
      Debug('Błąd podzas podpisywaania (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('Błąd podzas podpisywaania (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
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
    Debug('Plik wejściowy: ' + FileNameEditJPKPCWej.FileName);
    IStream := Backend.CreateFileStream(FileNameEditJPKPCWej.FileName, fmOpenRead);

    Debug('Plik wynikowy (enc. zip): ' + FileNameEditJPKPCEnc.FileName );
    OStream := Backend.CreateFileStream(FileNameEditJPKPCEnc.FileName, fmCreate);

    Debug('Na żądanie (ad hoc): ' + BoolToStr(CheckBoxJPKPCAdHoc.Checked));

    Debug('Bramka (klucz rsa): ' + ComboBoxJPKPCRodzBram.Text);

    DebugCert(IInterface(Certyfikaty[ComboBoxJPKCert.ItemIndex]) as IlgcCertificate);

    InitUp := JPK.SignCertificate(IInterface(Certyfikaty[ComboBoxJPKCert.ItemIndex]) as IlgcCertificate,
      ComboBoxJPKPCRodzBram.ItemIndex, CheckBoxJPKPCAdHoc.Checked,
      IStream, OStream);
    Debug('Podpisano');

    Debug('Zapis InitUpload do pliku: ' + FileNameEditJPKPCInitUpload.FileName);
    QuickSave(FileNameEditJPKPCInitUpload.FileName, InitUp);
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
        Debug('Błąd podzas podpisywaania (%s): %s', [E.ClassName, E.Message]);
        MessageDlg(Format('Błąd podzas podpisywaania (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
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
    MessageDlg('Wprowadź token', mtInformation, [mbOK], 0);
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
    Debug('Odpowiedź:' + Resp.GetRawResponse);
    UstawKSeFSesion(True);
    ObjAdd(Resp);
  except
    on E: Exception do
    begin
      Debug('Błąd podczas inicjalizacji sesji (' + E.ClassName + '): ' + E.Message);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('Błąd podczas inicjalizacji sesji (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
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
    Debug('Wczytywanie podpisanego pliku: ' + FileNameEditKSeFInitPZIn.FileName);
    SignedInitAuth := QuickLoad(FileNameEditKSeFInitPZIn.FileName);
    Resp := KSeF.SessionInitPZ(SignedInitAuth) as IlgcKSeFResponse;
    Debug('Odpowiedź:' + Resp.GetRawResponse);
    UstawKSeFSesion(True);
    ObjAdd(Resp);
  except
    on E: Exception do
    begin
      Debug('Błąd podczas inicjalizacji sesji (' + E.ClassName + '): ' + E.Message);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('Błąd podczas inicjalizacji sesji (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
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
    QuickSave(FileNameEditKSeFInitPZOut.FileName, AuthStruct);
    Debug('Zapisano do pliku: ' + FileNameEditKSeFInitPZOut.FileName);
  except
    on E: Exception do
    begin
      Debug('Błąd tworzenia pliku sesji (' + E.ClassName + '): ' + E.Message);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('Błąd tworzenia pliku sesji (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
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
    Debug('Odpowiedź:' + Resp.GetRawResponse);
    UstawKSeFSesion(True);
    ObjAdd(Resp);
  except
    on E: Exception do
    begin
      Debug('Błąd podczas inicjalizacji sesji (' + E.ClassName + '): ' + E.Message);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('Błąd podczas inicjalizacji sesji (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonKSeFInvGetClick(Sender: TObject);
var
  ISA: IStream;
begin
  Debug('KSeF - pobierz fakturę', True);
  try
    ISA := TStreamAdapter.Create(TFileStream.Create(FileNameEditKSeFGetFN.FileName, fmCreate), soOwned) as IStream;
    KSeF.InvoiceGet(EditKSeFInvGetNr.Text, ISA);
    Debug('Pobrano, zapisywanie do: ' + FileNameEditKSeFGetFN.FileName);
  except
    on E: Exception do
    begin
      Debug('Błąd podczas pobierania faktury (' + E.ClassName + '): ' + E.Message);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('Błąd podczas pobierania faktury (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonKSeFInvSendClick(Sender: TObject);
var
  Resp: OleVariant;
begin
  Debug('KSeF - wyślij fakturę', True);
  try
    Debug('Otwieranie pliku: ' + FileNameEditKSeFInvSend.FileName);
    Debug('Wysyłanie');
    Resp := KSeF.InvoiceSend(TStreamAdapter.Create(TFileStream.Create(FileNameEditKSeFInvSend.FileName, fmOpenRead), soOwned) as IUnknown) as IlgcKSeFResponse;
    Debug('Odpowiedź: ' + Resp.GetRawResponse);
    EditKSeFInvStatNr.Text := VarToStr(Resp.ElementReferenceNumber);
    Debug('Wysłano, el. nr ref: ' + Resp.ElementReferenceNumber);
    ObjAdd(Resp);
  except
    on E: Exception do
    begin
      Debug('Błąd podczas wysyłania faktury (' + E.ClassName + '): ' + E.Message);
     DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
     MessageDlg('Błąd podczas wysyłania faktury (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
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
    Debug('Odpowiedź: ' + Resp.GetRawResponse);
    ObjAdd(Resp);
  except
    on E: Exception do
    begin
      Debug('Błąd podczas wysyłania faktury (' + E.ClassName + '): ' + E.Message);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('Błąd podczas wysyłania faktury (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
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
    Debug('Odpowiedź: ' + Resp.GetRawResponse);
    ObjAdd(Resp);
  except
    on E: Exception do
    begin
      Debug('Błąd podczas sprawdzania statusu sesji (' + E.ClassName + '): ' + E.Message);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('Błąd podczas sprawdzania statusu sesji (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonKSeFSesTermClick(Sender: TObject);
var
  Resp: IlgcKSeFResponse;
begin
  Debug('Kończenie sesji', True);
  try
    Resp := KSeF.SessionTerminate(False) as IlgcKSeFResponse;
    if Assigned(Resp) then
    begin
      Debug('Odpowiedź: ' + Resp.GetRawResponse);
      UstawKSeFSesion(False);
      ObjAdd(Resp);
    end;
  except
    on E: Exception do
    begin
      Debug('Błąd podczas terminacji sesji (' + E.ClassName + '): ' + E.Message);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('Błąd podczas terminacji sesji (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonKSeFStatusUPOClick(Sender: TObject);
var
  Resp: OleVariant;
begin
  Debug('KSeF - sprawdź status wysyłki wsadowej', True);
  try
    Debug('Nr ref: ' + EditKSeFStatusReferenceNumber.Text);
    Debug('Bramka: ' + ComboBoxKSeFComBramka.Text);
    Resp := KSeF.CommonStatus(EditKSeFStatusReferenceNumber.Text, ComboBoxKSeFComBramka.ItemIndex);
    Debug('Status: ' + IntToStr(Resp.ProcessingCode));
    Debug('Opis: ' + Resp.ProcessingDescription);
    if (Resp.ProcessingCode = 200) and (Resp.Upo <> '') then
    begin
      QuickSave(FileNameEditKSeFUPO.FileName, VarToStr(Resp.UpoDecoded));
      Debug('Pobrano UPO do pliku: ' + FileNameEditKSeFUPO.FileName);
    end
    else
      Debug('NIE pobrano UPO');
    ObjAdd(IDispatch(Resp) as IlgcObject);
  except
    on E: Exception do
    begin
      Debug('Błąd podczas terminacji sesji (' + E.ClassName + '): ' + E.Message);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('Błąd podczas terminacji sesji (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonObjClearClick(Sender: TObject);
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

procedure TForm1.ButtonObjShowClick(Sender: TObject);
begin
  if ListViewObj.Selected <> nil then
    ShowObject(IUnknown(ListViewObj.Selected.Data));
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
      Debug('Błąd podczas pobierania informacji o bibliotece PKCS11: ' + E.Message);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg('Błąd podczas pobierania informacji o bibliotece PKCS11: ' + E.Message, mtError, [mbOK], 0);
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
  Debug('PKCS11: Zakończ sesję (' + IntToStr(ComboBoxPKCS11Cert.ItemIndex) + '): ' + ICert.DisplayName, True);
  try
    if ICert.Session = nil then
    begin
      Debug('Sesja nie została rozpoczęta');
      MessageDlg('Sesja nie została rozpoczęta', mtInformation, [mbOK], 0);
      Exit;
    end;
    ICertSigner.SessionClose(ICert.Session);
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
    Debug('Sesja nie została rozpoczęta');
    MessageDlg('Sesja nie została rozpoczęta', mtInformation, [mbOK], 0);
    Exit;
  end;
  try
    with ICert.Session as IlgcPKCS11Session do
    begin
      Debug('State: ' + IntToHex(State));
      Debug('Flags: ' + IntToHex(Flags));
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
      Debug('Sesja nie została rozpoczęta');
      MessageDlg('Sesja nie została rozpoczęta', mtInformation, [mbOK], 0);
      Exit;
    end;
    (ICert.Session as IlgcPKCS11Session).Login(EditPKCS11PIN.Text, ComboBoxPKCS11UserType.ItemIndex);
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
      Debug('Sesja nie została rozpoczęta');
      MessageDlg('Sesja nie została rozpoczęta', mtInformation, [mbOK], 0);
      Exit;
    end;
    (ICert.Session as IlgcPKCS11Session).Logout;
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
  Debug('PKCS11: Rozpocznij sesję dla certyfikatu (' + IntToStr(ComboBoxPKCS11Cert.ItemIndex) + '): ' + ICert.DisplayName, True);
  try
    if ICert.Session <> nil then
    begin
      Debug('Sesja już została rozpoczęta');
      MessageDlg('Sesja już została rozpoczęta', mtInformation, [mbOK], 0);
      Exit;
    end;
    ICertSigner.SessionStart(ICert);
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

procedure TForm1.ButtonEdekPodpiszCertClick(Sender: TObject);
var
  Wej: String;
  Wyj: String;
begin
  Debug('Podpis eDeklaracji certyfikatem', True);
  if (Certyfikaty.Count = 0) or (ComboBoxEdekCert.ItemIndex < 0) then
  begin
    Debug('BŁĄD: Brak wybranego certyfikatu.');
    MessageDlg('Brak wybranego certyfikatu.', mtError, [mbOK], 0);
    Exit;
  end;

  try
    Debug('Plik wej: ' + FileNameEditEDPCWej.FileName);
    Wej := QuickLoad(FileNameEditEDPCWej.FileName);

    DebugCert(IInterface(Certyfikaty[ComboBoxEdekCert.ItemIndex]) as IlgcCertificate);
    Debug('Podpisywanie');
    Wyj := EDek.PodpiszCertyfikatem(Wej, IInterface(Certyfikaty[ComboBoxEdekCert.ItemIndex]) as IlgcCertificate);

    Debug('Plik wyj: ' + FileNameEditEDPCWyj.FileName);
    QuickSave(FileNameEditEDPCWyj.FileName, Wyj);

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
        Debug('Błąd podzas podpisywaania (%s): %s', [E.ClassName, E.Message]);
        MessageDlg(Format('Błąd podzas podpisywaania (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
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
    Debug('Plik wej: ' + FileNameEditEDPAWej.FileName);
    Wej := QuickLoad(FileNameEditEDPAWej.FileName);

    DebugAuth(EditEDPImie.Text, EditEDPNazwisko.Text, EditEDPNIP.Text,
      DateTimePickerEDPDataU.Date, FloatSpinEditEDPKwota.Value);
    Debug('Podpisywanie');

    Wyj := EDek.PodpiszDanymiAut(Wej, EditEDPImie.Text, EditEDPNazwisko.Text,
      EditEDPNIP.Text, DateTimePickerEDPDataU.Date, FloatSpinEditEDPKwota.Value);

    Debug('Plik wyj: ' + FileNameEditEDPAWyj.FileName);
    QuickSave(FileNameEditEDPAWyj.FileName, Wyj);

    Debug('Podpisano');
  except
    on E: Exception do
    begin
      Debug('Błąd podzas podpisywaania (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('Błąd podzas podpisywaania (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonEDBWyslijClick(Sender: TObject);
var
  Dane: String;
  Status: IlgcEDeklaracjaStatus;
begin
  Debug('Wyślij eDeklarację', True);
  if ComboBoxEDBRodzBram.ItemIndex < 0 then
  begin
    MessageDlg('Proszę wybrać rodzaj bramki.', mtInformation, [mbOK], 0);
    Exit;
  end;
  if ComboBoxEDBRodzPodp.ItemIndex < 0 then
  begin
    MessageDlg('Proszę wybrać rodzaj podpisu, jakim podpisano deklarację', mtInformation, [mbOK], 0);
    Exit;
  end;

  try
    Debug('Plik wej: ' + FileNameEditEDBPlikWej.FileName);
    Dane := QuickLoad(FileNameEditEDBPlikWej.FileName);

    Debug('Bramka: ' + ComboBoxEDBRodzBram.Text);
    Debug('Podpis: ' + ComboBoxEDBRodzPodp.Text);

    Debug('Wysyłanie');

    Status := EDek.Wyslij(Dane, ComboBoxEDBRodzBram.ItemIndex,
      ComboBoxEDBRodzPodp.ItemIndex) as IlgcEDeklaracjaStatus;

    Debug('Status: ' + IntToStr(Status.Status));
    Debug('Opis: ' + Status.Opis);
    Debug('Nr ref.: ' + Status.NrRef);

    if (Status.Status >= 100) and (Status.Status <= 399) then
    begin
      EditEDBNrRef.Text := Status.NrRef;
      Debug('Wysłano');
    end
    else
      Debug('NIE wysłano');
  except
    on E: Exception do
    begin
      Debug('Błąd podczas wysyłania eDeklaracji (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('Błąd podczas wysyłania eDeklaracji (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonEDBUPOClick(Sender: TObject);
var
  Status: IlgcEDeklaracjaStatus;
begin
  Debug('Sprawdź status eDeklaracji / pobierz UPO', True);
  if EditEDBNrRef.Text = '' then
  begin
    MessageDlg('Wprowadź nr referencyjny', mtInformation, [mbOK], 0);
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
      Debug('UPO zapisano do: ' + FileNameEditEDBPlikWyj.FileName);
      QuickSave(FileNameEditEDBPlikWyj.FileName, Status.UPO);
    end
    else
      Debug('NIE pobrano UPO');
  except
    on E: Exception do
    begin
      Debug('Błąd podczas sprawdzania statusu eDeklaracji (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('Błąd podczas sprawdzania statusu eDeklaracji (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonCertReloadClick(Sender: TObject);
begin
  LoadCertList;
end;

procedure TForm1.ButtonKSeFQInvClearClick(Sender: TObject);
var
  I: Integer;
begin
  FloatSpinEditKSeFQInvCAamountFrom.Value := 0;
  FloatSpinEditKSeFQInvCAamountTo.Value := 0;
  ComboBoxKSeFQInvCAamountType.ItemIndex := 0;
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
  for I := 0 to CheckGroupKSeFQInvCrIInvoiceTypes.Items.Count - 1 do
    CheckGroupKSeFQInvCrIInvoiceTypes.Checked[I] := False;
  RadioGroupKSeFQInvCrSubjevtToType.ItemIndex := -1;
  CheckBoxKSeFQInvCrIsHidden.Checked := False;
  DateTimePickerKSeFQInvCrHidingDateFrom.DateTime := NullDate;
  DateTimePickerKSeFQInvCrHidingDateTo.DateTime := NullDate;
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
    Debug('Odpowiedź: ' + Resp.GetRawResponse);
    EditKSeFQInvAsyncQRefNo.Text := VarToStr(Resp.ElementReferenceNumber);
    ObjAdd(IDispatch(Resp) as IlgcObject);
  except
    on E: Exception do
    begin
      Debug('Błąd podczas inicjowania zapytania o faktury asynchronicznie (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('Błąd podczas inicjowania zapytania o faktury aynchronicznie (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
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
    Debug('Odpowiedź: ' + Resp.GetRawResponse);
    ObjAdd(Resp);
  except
    on E: Exception do
    begin
      Debug('Błąd podczas generowania identyfikatora wewn. (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('Błąd podczas generowania identyfikatora wewn. (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
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
      MessageDlg(Format('Błąd podczas ukrywania faktury (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
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
      Debug('Błąd podczas anulowania ukrycia faktury (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('Błąd podczas anulowania ukrycia faktury (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
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
    Req.InvoiceDetails.DueValue := FloatSpinEditKSeFCInvDueValue.Value;
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
    Debug('Plik wynikowy: ' + FileNameEditKSeFCInvFN.FileName);
    FA := CreateOleObject('LibGovPL.lgcMemoryStream') as IlgcMemoryStream;
    ObjAdd(Req);
    KSeF.CommonInvoiceKSeF(Req, FA, ComboBoxKSeFComBramka.ItemIndex);
    FA.SaveToFile(FileNameEditKSeFCInvFN.FileName);
  except
    on E: Exception do
    begin
      Debug('Błąd podczas generowania identyfikatora wewn. (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('Błąd podczas generowania identyfikatora wewn. (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
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
  FloatSpinEditKSeFCInvDueValue.Value := 0;
end;

procedure TForm1.ButtonKSeFBatchPodpClick(Sender: TObject);
var
  InZIPFile: IlgcFileStream;
  InitUpload: WideString;
  OutEncZIPFile: IlgcFileStream;
begin
  Debug('KSeF - pobieranie / przygotowanie do wysyłki wsadowej', True);
  if RadioButtonKSeFBatchCert.Checked and (ComboBoxKSeFBatchCert.ItemIndex < 0) then
  begin
    MessageDlg('Wybierz certyfikat', mtInformation, [mbOK], 0);
    Exit;
  end;
  try
    Debug('Otwieranie pliku wejściowego: ' + FileNameEditKSeFBatchInZIP.FileName);
    InZIPFile := Backend.CreateFileStream(FileNameEditKSeFBatchInZIP.FileName, fmOpenRead) as IlgcFileStream;
    Debug('Tworzenie pliku wyjściowego: ' + FileNameEditKSeFBatchOutEncZIP.FileName);
    OutEncZIPFile := Backend.CreateFileStream(FileNameEditKSeFBatchOutEncZIP.FileName, fmCreate) as IlgcFileStream;
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
      ExtractFileName(FileNameEditKSeFBatchInZIP.FileName), ExtractFileName(FileNameEditKSeFBatchOutEncZIP.FileName));
    Debug('Podpisano');

    QuickSave(FileNameEditKSeFBatchOutInitUp.FileName, InitUpload);
    Debug('Zapisano strukturę InitUpload do pliku: ' + FileNameEditKSeFBatchOutInitUp.FileName);

    FileNameEditKSeFBatchSendIU.FileName := FileNameEditKSeFBatchOutInitUp.FileName;
    FileNameEditKSeFBatchSendEnc.FileName := FileNameEditKSeFBatchOutEncZIP.FileName;
    ComboBoxKSeFBatchSendBramka.ItemIndex := ComboBoxKSeFBatchBramka.ItemIndex;
  except
    on E: Exception do
    begin
      if (E is EOleError) and Assigned(Backend.LastError) and SameText((Backend.LastError as IlgcErrorInfo).ExceptionClass, 'EAbord') then
        Debug('ANULOWANO')
      else
      begin
        Debug('Błąd podczas podpisywania / przygotowania do wysyłki wsadowej (%s): %s', [E.ClassName, E.Message]);
        DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
        MessageDlg(Format('Błąd podczas podpisywania / przygotowania do wysyłki wsadowej (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
      end;
    end;
  end;
end;

procedure TForm1.ButtonObjCountClick(Sender: TObject);
begin
  Debug('Ilość obiektów COM: ' + IntToStr(Backend.GetDebugInfo(1)), True);
  Debug('Ilość obiektów KSeF: ' + IntToStr(Backend.GetDebugInfo(2)));
end;

procedure TForm1.ButtonKSeFBatchSendClick(Sender: TObject);
var
  InitUpload: WideString;
  EncZIPFile: IlgcFileStream;
begin
  Debug('KSeF - wysyłka wsadowa', True);
  try
    Debug('Otwieranie pliku wejściowego: ' + FileNameEditKSeFBatchSendEnc.FileName);
    EncZIPFile := Backend.CreateFileStream(FileNameEditKSeFBatchSendEnc.FileName, fmOpenRead) as IlgcFileStream;
    Debug('Wczytanie InitUpload z pliku: ' + FileNameEditKSeFBatchSendIU.FileName);
    InitUpload := QuickLoad(FileNameEditKSeFBatchSendIU.FileName);
    KSeF.GateType := ComboBoxKSeFBatchSendBramka.ItemIndex;
    EditKSeFBatchNrRef.Text := KSeF.BatchSend(EncZIPFile, InitUpload);
    Debug('Wysłano, nr referencyjny: ' + EditKSeFBatchNrRef.Text);
  except
    on E: Exception do
    begin
      Debug('Błąd podczas wysyłki wsadowej (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('Błąd podczas wysyłki wsadowej (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
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
    MessageDlg('Wprowadź nr ref. zapytania', mtInformation, [mbOK], 0);
    Exit;
  end;
  if EditKSeFQInvAsyncERefNo.Text = '' then
  begin
    MessageDlg('Wprowadź nr ref. elementu', mtInformation, [mbOK], 0);
    Exit;
  end;
  if FileNameEditKSeFQInvAsyncFN.FileName = '' then
  begin
    MessageDlg('Wprowadź nazwę pliku docelowego', mtInformation, [mbOK], 0);
    Exit;
  end;
  FS := nil;
  try
      FS := Backend.CreateFileStream(FileNameEditKSeFQInvAsyncFN.FileName, fmCreate) as IlgcFileStream;
    KSeF.QueryInvoiceAsyncFetch(EditKSeFQInvAsyncQRefNo.Text, EditKSeFQInvAsyncERefNo.Text, FS);
    Debug('Zapis wyniku do: ' + FileNameEditKSeFQInvAsyncFN.FileName);
  except
    on E: Exception do
    begin
      Debug('Błąd podczas pobierania wyniku zapytania o faktury asynchronicznie (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('Błąd podczas pobierania wyniku zapytania o faktury aynchronicznie (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
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
    MessageDlg('Wprowadź nr ref. zapytania', mtInformation, [mbOK], 0);
    Exit;
  end;
  try
    Debug('Nr ref. zapytania: ' + EditKSeFQInvAsyncQRefNo.Text);
    Resp := KSeF.QueryInvoiceAsyncStatus(EditKSeFQInvAsyncQRefNo.Text);
    Debug('Odpowiedź: ' + Resp.RawResponse);
    Debug('Status: ' + IntToStr(Resp.ProcessingCode));
    Debug('Opis statusu: ' + Resp.ProcessingDescription);
    Debug('Liczba części: ' + IntToStr(Resp.NumberOfParts));
    if (Resp.ProcessingCode = 200) and (not VarIsNull(Resp.PartList)) and (Resp.PartList.Count > 0) then
      EditKSeFQInvAsyncERefNo.Text := VarToStr(Resp.PartList.Items[0].PartReferenceNumber);
    ObjAdd(IDispatch(Resp) as IlgcObject);
  except
    on E: Exception do
    begin
      Debug('Błąd podczas pobierania statusu zapytania o faktury asynchronicznie (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('Błąd podczas pobierania statusu zapytania o faktury aynchronicznie (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
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
    Debug('Odpowiedź: ' + Resp.RawResponse);
    ObjAdd(IDispatch(Resp) as IlgcObject);
  except
    on E: Exception do
    begin
      Debug('Błąd podczas zapytania o faktury synchronicznie (%s): %s', [E.ClassName, E.Message]);
      DebugErrorInfo(Backend.LastError as IlgcErrorInfo);
      MessageDlg(Format('Błąd podczas zapytania o faktury synchronicznie (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

end.

