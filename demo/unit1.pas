unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  ExtCtrls, EditBtn, Spin, Grids, DateTimePicker, lgBackend, lgXAdES,
  lgEDeklaracja, lgJPK, lgKSeF, lgKSeFTypes, lgKSeFObjects;

type

  { TForm1 }

  TForm1 = class(TForm)
    ButtonCertLoadFromFile: TButton;
    ButtonKSeFCreGTokGen: TButton;
    ButtonKSeFCreGTokClr: TButton;
    ButtonKSeFCreQ: TButton;
    ButtonViesVatCheck: TButton;
    ButtonViesVatTestService: TButton;
    ButtonViesCheckStatus: TButton;
    ButtonXMLVerAdd: TButton;
    ButtonXMLTransAdd: TButton;
    ButtonXMLTrans: TButton;
    ButtonXMLVer: TButton;
    ButtonPKCS11SesClose: TButton;
    ButtonPKCS11SesInfo: TButton;
    ButtonPKCS11SesLogin: TButton;
    ButtonPKCS11SesLogout: TButton;
    ButtonPKCS11SesStart: TButton;
    ButtonObjCount: TButton;
    ButtonKSeFInvHide: TButton;
    ButtonKSeFBatchPodp: TButton;
    ButtonKSeFBatchSend: TButton;
    ButtonKSeFInvGet: TButton;
    ButtonKSeFInvShow: TButton;
    ButtonKSeFInvSend: TButton;
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
    ButtonObjClear: TButton;
    ButtonObjShow: TButton;
    ButtonPKCS11Info: TButton;
    ButtonPKCS11Slots: TButton;
    ButtonShowCert: TButton;
    ButtonSetup: TButton;
    CheckBoxLibXML2Cache: TCheckBox;
    CheckBoxXMLTransOpen: TCheckBox;
    CheckBoxKSeFQInvCrIsHidden: TCheckBox;
    CheckBoxKSeFQInvCrFaP17Annotation: TCheckBox;
    CheckBoxKSeFStatDet: TCheckBox;
    CheckBoxKSeFEncrypt: TCheckBox;
    CheckBoxJPKBCert: TCheckBox;
    CheckBoxJPKPCAdHoc: TCheckBox;
    CheckBoxEDekC14N: TCheckBox;
    CheckBoxJPKPAAdHoc: TCheckBox;
    CheckBoxXAdESCzas: TCheckBox;
    CheckGroupKSeFQInvCrIInvoiceTypes: TCheckGroup;
    ComboBoxKSeFCreQCriType: TComboBox;
    ComboBoxKSeFCreQCriType1: TComboBox;
    ComboBoxKSeFCreQCSRT: TComboBox;
    ComboBoxKSeFCreQCTRT: TComboBox;
    ComboBoxViesCountry: TComboBox;
    ComboBoxPKCS11UserType: TComboBox;
    ComboBoxPKCS11Cert: TComboBox;
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
    DateTimePickerKSeFQInvCrHidingDateFrom: TDateTimePicker;
    DateTimePickerEDPDataU: TDateTimePicker;
    DateTimePickerJPKPDataU: TDateTimePicker;
    DateTimePickerKSeFQInvCrDetInvFrom: TDateTimePicker;
    DateTimePickerKSeFQInvCrDetInvTo: TDateTimePicker;
    DateTimePickerKSeFQInvCrHidingDateTo: TDateTimePicker;
    DateTimePickerKSeFQInvCrIncInvFrom: TDateTimePicker;
    DateTimePickerKSeFQInvCrIncInvTo: TDateTimePicker;
    DateTimePickerKSeFQInvCrRanInvFrom: TDateTimePicker;
    DateTimePickerKSeFQInvCrRanInvTo: TDateTimePicker;
    DirectoryEditLibXML2Cache: TDirectoryEdit;
    EditKSeFCreGTokDesc: TEdit;
    EditKSeFCreQCriId: TEdit;
    EditKSeFCreQCriId1: TEdit;
    EditViesTraderName: TEdit;
    EditViesTraderStreet: TEdit;
    EditViesTraderPostalCode: TEdit;
    EditViesTraderCity: TEdit;
    EditViesTraderCompanyType: TEdit;
    EditViesVatNum: TEdit;
    EditPKCS11PIN: TEdit;
    EditKSeFInvHideNr: TEdit;
    EditKSeFInvShowNr: TEdit;
    EditKSeFInvHideReason: TEdit;
    EditKSeFBatchNIP: TEdit;
    EditKSeFBatchNrRef: TEdit;
    EditKSeFInvGetNr: TEdit;
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
    EditViesReqVatNum: TEdit;
    FileNameEditLibXlst: TFileNameEdit;
    FileNameEditLibExslt: TFileNameEdit;
    FileNameEditXMLTransSrc: TFileNameEdit;
    FileNameEditXMLTransDst: TFileNameEdit;
    FileNameEditXMLVer: TFileNameEdit;
    FileNameEditKSeFGetFN: TFileNameEdit;
    FileNameEditKSeFInvSend: TFileNameEdit;
    FileNameEditLibXml2: TFileNameEdit;
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
    GroupBox28: TGroupBox;
    GroupBox29: TGroupBox;
    GroupBox30: TGroupBox;
    GroupBoxKSeFCreQId: TGroupBox;
    GroupBoxKSeFCreQId1: TGroupBox;
    GroupBoxLibXML2Par: TGroupBox;
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
    Label142: TLabel;
    Label143: TLabel;
    Label144: TLabel;
    Label145: TLabel;
    Label146: TLabel;
    Label147: TLabel;
    Label148: TLabel;
    Label149: TLabel;
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
    RadioButtonKSeFCreQAll: TRadioButton;
    RadioButtonKSeFCreQById: TRadioButton;
    RadioButtonKSeFBatchCert: TRadioButton;
    RadioButtonKSeFBatchPZ: TRadioButton;
    RadioGroupXMLVal: TRadioGroup;
    ScrollBox4: TScrollBox;
    ScrollBox5: TScrollBox;
    ScrollBox6: TScrollBox;
    ScrollBox7: TScrollBox;
    Splitter2: TSplitter;
    StringGridKSeFCreGTok: TStringGrid;
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
    TabSheetKSeFCredentials: TTabSheet;
    TabSheetKSeFQueryCredentials: TTabSheet;
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
    procedure ButtonCertLoadFromFileClick(Sender: TObject);
    procedure ButtonKSeFCreGTokClrClick(Sender: TObject);
    procedure ButtonKSeFCreGTokGenClick(Sender: TObject);
    procedure ButtonKSeFCreQClick(Sender: TObject);
    procedure ButtonObjCountClick(Sender: TObject);
    procedure ButtonKSeFBatchSendClick(Sender: TObject);
    procedure ButtonKSeFBatchPodpClick(Sender: TObject);
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
    procedure ButtonViesCheckStatusClick(Sender: TObject);
    procedure ButtonViesVatCheckClick(Sender: TObject);
    procedure ButtonXMLTransAddClick(Sender: TObject);
    procedure ButtonXMLTransClick(Sender: TObject);
    procedure ButtonXMLVerAddClick(Sender: TObject);
    procedure ButtonXMLVerClick(Sender: TObject);
    procedure FileNameEditKSeFBatchInZIPAcceptFileName(Sender: TObject; var Value: String);
    procedure FileNameEditEDPAWejAcceptFileName(Sender: TObject;
      var Value: String);
    procedure FileNameEditEDPCWejAcceptFileName(Sender: TObject;
      var Value: String);
    procedure FileNameEditJPKPCWejAcceptFileName(Sender: TObject;
      var Value: String);
    procedure FileNameEditXMLTransSrcAcceptFileName(Sender: TObject;
      var Value: String);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RadioButtonKSeFBatchCertChange(Sender: TObject);
    procedure RadioButtonKSeFCreQByIdClick(Sender: TObject);
    procedure RadioGroupXMLValClick(Sender: TObject);
  private
    procedure UstawKSeFSesion(AWartosc: Boolean);
    function GetQueriInvoiceCr: TKSeFQueryInvoiceRequest;
    procedure ObjAdd(AObj: TKSeFObject);
    procedure SetupValidator;
    procedure SetupTrans;
    procedure SetupLXML;
  public
    Signer: TlgCertificateSigner;
    Certyfikaty: TlgCertificates;
    XAdES: TlgXAdES;
    EDek: TlgEDeklaracja;
    JPK: TlgJPK;
    HTTPClient: TlgHTTPClient;
    JPKRSAProd, JPKRSATest: TlgRSAKey;
    KSeF: TlgKSeF;
    KSeFRSAProd, KSeFRSADemo, KSeFRSATest: TlgRSAKey;

    {$IFDEF LGP_DEBUG_OBJ}
    ObjList: TList;
    {$ENDIF}

    XValidator: TlgXMLValidator;
    XTrans: TlgXMLXSLTransformation;

    procedure Debug(ATekst: String; ALinia: Boolean = False);
    procedure Debug(ATekst: String; ADane: array of const);
    procedure DebugCert(ACertyfikat: TlgCertificate);
    procedure DebugAuth(AImie, ANazwisko, ANIP: String; ADataU: TDate; AKwota: Currency);
    procedure DebugJPKItem(const AJPKItem: TlgJPKItem);

    procedure DebugKSeFResponse(AResp: TKSeFResponse);

    procedure LoadCertList;
    procedure UpdateCertList;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

uses
  {$IFDEF WINDOWS}
  lgCNG, lgMSXML, lgWinHTTP,
  {$ENDIF}
  lgWSTEDekGate, lgWSTProtocol, lgFPC, lgLibXML2, lgDCPCrypt, lgPKCS11, Unit2,
  Unit3, Rtti, DateUtils, xml2dyn, TypInfo, LCLIntf, xsltdyn, exsltdyn, Unit4,
  lgVies, lgOpenSSL;

const
  RSA_KEY_JPK_PROD = '..' + DirectorySeparator + 'pem' + DirectorySeparator + 'prod.pem';
  RSA_KEY_JPK_TEST = '..' + DirectorySeparator + 'pem' + DirectorySeparator + 'test.pem';
  RSA_KEY_KSEF_PROD = '..' + DirectorySeparator + 'pem' + DirectorySeparator + 'ksefprod.pem';
  RSA_KEY_KSEF_DEMO = '..' + DirectorySeparator + 'pem' + DirectorySeparator + 'ksefdemo.pem';
  RSA_KEY_KSEF_TEST = '..' + DirectorySeparator + 'pem' + DirectorySeparator + 'kseftest.pem';

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

{$IFDEF LGP_DEBUG_OBJ}
procedure DbgObjCreate(AObject: TObject);
begin
  if Form1.ObjList.IndexOf(AObject) < 0 then
    Form1.ObjList.Add(AObject);
end;

procedure DbgObjDestroy(AObject: TObject);
begin
  Form1.ObjList.Remove(AObject);
end;
{$ENDIF}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to HTTPClientClasses.Count - 1 do
    ComboBoxHTTPCli.Items.Add(HTTPClientClasses[I].ClassDescription);
  for I := 0 to RandomGeneratorClasses.Count - 1 do
    ComboBoxRandGen.Items.Add(RandomGeneratorClasses[I].ClassDescription);
  for I := 0 to Base64EncoderClasses.Count - 1 do
    ComboBoxBase64.Items.Add(Base64EncoderClasses[I].ClassDescription);
  for I := 0 to MD5HashClasses.Count - 1 do
    ComboBoxMD5.Items.Add(MD5HashClasses[I].ClassDescription);
  for I := 0 to SHA1HashClasses.Count - 1 do
    ComboBoxSHA1.Items.Add(SHA1HashClasses[I].ClassDescription);
  for I := 0 to SHA256HashClasses.Count - 1 do
    ComboBoxSHA256.Items.Add(SHA256HashClasses[I].ClassDescription);
  for I := 0 to AES256EncryptClasses.Count - 1 do
    ComboBoxAES256.Items.Add(AES256EncryptClasses[I].ClassDescription);
  for I := 0 to CertSignerClasses.Count - 1 do
    ComboBoxSign.Items.Add(CertSignerClasses[I].ClassDescription);
  for I := 0 to EDekGateClasses.Count - 1 do
    ComboBoxEDek.Items.Add(EDekGateClasses[I].ClassDescription);
  for I := 0 to XMLCanonizatorClasses.Count - 1 do
    ComboBoxXMLC14N.Items.Add(XMLCanonizatorClasses[I].ClassDescription);
  for I := 0 to XMLReaderClasses.Count - 1 do
    ComboBoxXMLRead.Items.Add(XMLReaderClasses[I].ClassDescription);
  for I := 0 to ZipperClasses.Count - 1 do
    ComboBoxZip.Items.Add(ZipperClasses[I].ClassDescription);
  for I := 0 to RSAEncryptClasses.Count - 1 do
    ComboBoxRSAEnc.Items.Add(RSAEncryptClasses[I].ClassDescription);
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
  {$IFDEF LGP_DEBUG_OBJ}
  ObjList := TList.Create;
  KSeFObjectDbgCreate := @DbgObjCreate;
  KSeFObjectDbgDestroy := @DbgObjDestroy;
  {$ELSE}
  ButtonObjCount.Enabled := False;
  {$ENDIF}
  FileNameEditJPKRSAProd.FileName := RSA_KEY_JPK_PROD;
  FileNameEditJPKRSATest.FileName := RSA_KEY_JPK_TEST;
  FileNameEditKSeFRSAProd.FileName := RSA_KEY_KSEF_PROD;
  FileNameEditKSeFRSADemo.FileName := RSA_KEY_KSEF_DEMO;
  FileNameEditKSeFRSATest.FileName := RSA_KEY_KSEF_TEST;

  DirectoryEditLibXML2Cache.Directory := IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'cache';
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
  if Assigned(XValidator) then
    XValidator.Free;
  if Assigned(XTrans) then
    XTrans.Free;
  {$IFDEF LGP_DEBUG_OBJ}
  if ObjList.Count > 0 then
    MessageDlg('Debug', 'Liczba pozostałych obiektów KSeF: ' + IntToStr(ObjList.Count), mtWarning, [mbOK], 0);
  ObjList.Free;
  {$ENDIF}
end;

procedure TForm1.RadioButtonKSeFBatchCertChange(Sender: TObject);
begin
  ComboBoxKSeFBatchCert.Enabled := RadioButtonKSeFBatchCert.Checked;
end;

procedure TForm1.RadioButtonKSeFCreQByIdClick(Sender: TObject);
begin
  GroupBoxKSeFCreQId.Enabled := RadioButtonKSeFCreQById.Checked;
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
  TabSheetKSeFQueryCredentials.TabVisible := AWartosc;
  TabSheetKSeFCredentials.TabVisible := AWartosc;

  // Tylko dla serwerów testowych i prod >= 2.0.0
  //FloatSpinEditKSeFQInvCAamountFrom.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
  //FloatSpinEditKSeFQInvCAamountTo.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
  //ComboBoxKSeFQInvCAamountType.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
  //MemoKSeFQInvCrCurrencyCodes.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
  //CheckBoxKSeFQInvCrFaP17Annotation.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
  //CheckGroupKSeFQInvCrIInvoiceTypes.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;

  // Tylko dla serwerów testowych >= 2.2.0
  CheckBoxKSeFQInvCrIsHidden.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
  DateTimePickerKSeFQInvCrHidingDateFrom.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
  DateTimePickerKSeFQInvCrHidingDateTo.Enabled := ComboBoxKSeFBramka.ItemIndex = 2;
end;

function TForm1.GetQueriInvoiceCr: TKSeFQueryInvoiceRequest;
var
  I: Integer;
begin
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
        AmountType := TKSeFQueryCriteriaInvoiceDetail.TAmountType(ComboBoxKSeFQInvCAamountType.ItemIndex);
        if Trim(MemoKSeFQInvCrCurrencyCodes.Text) <> '' then
          CurrencyCodes := Concat(CurrencyCodes, [MemoKSeFQInvCrCurrencyCodes.Lines[I]]);
        FaP17Annotation := CheckBoxKSeFQInvCrFaP17Annotation.Checked;
        InvoiceNumber := EditKSeFQInvCrInvoiceNumber.Text;
        for I := 0 to CheckGroupKSeFQInvCrIInvoiceTypes.Items.Count - 1 do
          if CheckGroupKSeFQInvCrIInvoiceTypes.Checked[I] then
            InvoiceTypes := InvoiceTypes + [TKSeFInvoiceType(I)];
        KsefReferenceNumber := EditKSeFQInvCrRefNo.Text;
        if EditKSeFQInvCrSubjectByIdent.Text <> '' then
        begin
          SubjectBy := TKSeFSubjectBy.Create;
          SubjectBy.IssuedByIdentifier := TKSeFSubjectIdentifierByCompany.Create;
          TKSeFSubjectIdentifierByCompany(SubjectBy.IssuedByIdentifier).Identifier := EditKSeFQInvCrSubjectByIdent.Text;
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
              TKSeFSubjectIdentifierToCompany(SubjectTo.IssuedToIdentifier).Identifier := EditKSeFQInvCrSubjectToId.Text;
            end;
            2: begin
              SubjectTo.IssuedToIdentifier := TKSeFSubjectIdentifierToOther.Create;
              TKSeFSubjectIdentifierToOther(SubjectTo.IssuedToIdentifier).Identifier := EditKSeFQInvCrSubjectToId.Text;
            end;
            3: begin
              SubjectTo.IssuedToIdentifier := TKSeFSubjectIdentifierToVatUe.Create;
              TKSeFSubjectIdentifierToVatUe(SubjectTo.IssuedToIdentifier).Identifier := EditKSeFQInvCrSubjectToId.Text;
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
  if CheckBoxKSeFQInvCrIsHidden.Checked then
    Result.QueryCriteria.IsHidden := True;
  if not DateTimePickerKSeFQInvCrHidingDateFrom.DateIsNull then
    Result.QueryCriteria.HidingDateFrom := DateTimePickerKSeFQInvCrHidingDateFrom.DateTime;
  if not DateTimePickerKSeFQInvCrHidingDateTo.DateIsNull then
    Result.QueryCriteria.HidingDateTo := DateTimePickerKSeFQInvCrHidingDateTo.DateTime;
end;

procedure TForm1.ObjAdd(AObj: TKSeFObject);
var
  I: TListItem;
begin
  I := ListViewObj.Items.Add;
  I.Caption := AObj.ClassName;
  I.Data := AObj;
end;

procedure TForm1.SetupValidator;
begin
  if Assigned(XValidator) and (((XValidator is TlgMSXMLValidator) and (RadioGroupXMLVal.ItemIndex = 1))
    or ((XValidator is TlgLibXML2Validator) and (RadioGroupXMLVal.ItemIndex = 0))) then
    FreeAndNil(XValidator);
  if not Assigned(XValidator) then
    if RadioGroupXMLVal.ItemIndex = 0 then
      XValidator := TlgMSXMLValidator.Create
    else
      XValidator := TlgLibXML2Validator.Create;
  if RadioGroupXMLVal.ItemIndex = 1 then
    SetupLXML;
end;

procedure TForm1.SetupTrans;
begin
  if Assigned(XTrans) and (((XTrans is TlgMSXMLXSLTransformation) and (RadioGroupXMLVal.ItemIndex = 1))
    or ((XTrans is TlgLibXML2XSLTransformation) and (RadioGroupXMLVal.ItemIndex = 0))) then
    FreeAndNil(XTrans);
  if not Assigned(XTrans) then
    if RadioGroupXMLVal.ItemIndex = 0 then
      XTrans := TlgMSXMLXSLTransformation.Create
    else
      XTrans := TlgLibXML2XSLTransformation.Create;
  if RadioGroupXMLVal.ItemIndex = 1 then
    SetupLXML;
end;

procedure TForm1.SetupLXML;
begin
  TlgLibXML2Backend.CacheExternals := CheckBoxLibXML2Cache.Checked;
  TlgLibXML2Backend.CacheDir := DirectoryEditLibXML2Cache.Directory;
  if not DirectoryExists(DirectoryEditLibXML2Cache.Directory) then
    CreateDir(DirectoryEditLibXML2Cache.Directory);
  TlgLibXML2Backend.HTTPClient := HTTPClient;
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

procedure TForm1.DebugCert(ACertyfikat: TlgCertificate);
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

procedure TForm1.DebugJPKItem(const AJPKItem: TlgJPKItem);
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


end;

procedure TForm1.DebugKSeFResponse(AResp: TKSeFResponse);
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
end;

procedure TForm1.LoadCertList;
begin
  Debug('Pobieranie listy certyfikatów', True);
  if Assigned(Certyfikaty) then
    Certyfikaty.Free;
  Certyfikaty := Signer.List;
  UpdateCertList;
end;

procedure TForm1.UpdateCertList;
var
  I: Integer;
  LI: TListItem;
  S: String;
  K: TlgCertificateKeyUsage;
begin
  ListViewCert.Items.Clear;
  ComboBoxEdekCert.Items.Clear;
  ComboBoxJPKCert.Items.Clear;
  ComboBoxKSeFCert.Items.Clear;
  ComboBoxKSeFBatchCert.Items.Clear;
  ComboBoxPKCS11Cert.Items.Clear;

  if Certyfikaty = nil then
    Exit;

  for I := 0 to Certyfikaty.Count - 1 do
  begin
    Debug('Certyfikat nr ' + IntToStr(I));
    DebugCert(Certyfikaty[I]);
    with Certyfikaty[I] do
    begin
      LI := ListViewCert.Items.Add;
      LI.Caption := IntToStr(I);
      LI.SubItems.Add(DisplayName);
      LI.SubItems.Add(DateToStr(ValidFrom));
      LI.SubItems.Add(DateToStr(ValidTo));
      LI.SubItems.Add(SerialNoDec);
      LI.SubItems.Add(Issuer);
      LI.SubItems.Add(Subject);
      K := KeyUsage;
      LI.SubItems.Add(SetToString(PTypeInfo(TypeInfo(TlgCertificateKeyUsage)), @K));

      S := DisplayName + ' (' + DateToStr(ValidFrom) + ' - ' + DateToStr(ValidTo) + ')';
      ComboBoxEdekCert.Items.Add(S);
      ComboBoxJPKCert.Items.Add(S);
      ComboBoxKSeFCert.Items.Add(S);
      ComboBoxKSeFBatchCert.Items.Add(S);
      ComboBoxPKCS11Cert.Items.Add(S);
    end;
  end;
end;

procedure TForm1.ButtonSetupClick(Sender: TObject);
var
  FS: TFileStream = nil;
begin
  if (ComboBoxSign.ItemIndex > 0) and (CertSignerClasses[ComboBoxSign.ItemIndex - 1] = TlgPKCS11CertificateSigner) and
    (FileNameEditLibPKCS11.FileName = '') then
  begin
    MessageDlg('Wprowadź bibliotekę PKCS11', mtInformation, [mbOK], 0);
    Exit;
  end;

  if not Assigned(Signer) and (ComboBoxSign.ItemIndex > 0) then
  begin
    Signer := CertSignerClasses[ComboBoxSign.ItemIndex - 1].Create(Self);
    {$IFDEF WINDOWS}
    if Signer is TlgCNGCertificateSigner then
      TlgCNGCertificateSigner(Signer).HWnd := Self.Handle
    else
    {$ENDIF}
    if Signer is TlgPKCS11CertificateSigner then
    begin
      try
        TlgPKCS11CertificateSigner(Signer).LoadLibrary(FileNameEditLibPKCS11.FileName);
      except
        on E: Exception do
        begin
          MessageDlg('Błąd podczas ładowania biblioteki PKCS11: ' + E.Message, mtError, [mbOK], 0);
          FreeAndNil(Signer);
          Exit;
        end;
      end;
      ButtonPKCS11InfoClick(nil);
    end;
  end;

  if ComboBoxHTTPCli.ItemIndex >= 0 then
    HTTPClient := HTTPClientClasses[ComboBoxHTTPCli.ItemIndex].Create;

  EDek := TlgEDeklaracja.Create(Self);
  JPK := TlgJPK.Create(Self);

  if Assigned(Signer) then
  begin
    XAdES := TlgXAdES.Create(Self);
    with XAdES do
    begin
      if ComboBoxSHA1.ItemIndex >= 0 then
        SHA1HashClass := SHA1HashClasses[ComboBoxSHA1.ItemIndex];
      if ComboBoxSHA256.ItemIndex >= 0 then
        SHA256HashClass := SHA256HashClasses[ComboBoxSHA256.ItemIndex];
      if ComboBoxBase64.ItemIndex >= 0 then
        Base64EncoderClass := Base64EncoderClasses[ComboBoxBase64.ItemIndex];
      Signer := Self.Signer;
      SignType := TlgSignHashType(ComboBoxXAdESSHA.ItemIndex);
      IncludeSigningTime := CheckBoxXAdESCzas.Checked;
    end;
  end;

  with EDek do
  begin
    XAdES := Self.XAdES;
    if ComboBoxXMLC14N.ItemIndex >= 0 then
      XMLCanonizator := XMLCanonizatorClasses[ComboBoxXMLC14N.ItemIndex];
    if ComboBoxEDek.ItemIndex >= 0 then
    begin
      EDekGate := EDekGateClasses[ComboBoxEDek.ItemIndex];
      if EDekGate = TlgWSTEDekGate then
      begin
        LGPL4_RegisterHTTP_Transport;
        SetLGHTTPClient(Self.HTTPClient);
      end;
    end;
    Canonization := CheckBoxEDekC14N.Checked and (XMLCanonizator <> nil);
  end;

  with JPK do
  begin
    XAdES := Self.XAdES;
    HTTPClient := Self.HTTPClient;
    if ComboBoxBase64.ItemIndex >= 0 then
      Base64EncoderClass := Base64EncoderClasses[ComboBoxBase64.ItemIndex];
    if ComboBoxAES256.ItemIndex >= 0 then
      AES256EncryptClass := AES256EncryptClasses[ComboBoxAES256.ItemIndex];
    if ComboBoxMD5.ItemIndex >= 0 then
      MD5HashClass := MD5HashClasses[ComboBoxMD5.ItemIndex];
    if ComboBoxSHA256.ItemIndex >= 0 then
      SHA256HashClass := SHA256HashClasses[ComboBoxSHA256.ItemIndex];
    if ComboBoxZip.ItemIndex >= 0 then
      ZipperClass := ZipperClasses[ComboBoxZip.ItemIndex];
    if ComboBoxRSAEnc.ItemIndex >= 0 then
      RSAEncryptClass := RSAEncryptClasses[ComboBoxRSAEnc.ItemIndex];
    if ComboBoxRandGen.ItemIndex >= 0 then
      RandomGeneratorClass := RandomGeneratorClasses[ComboBoxRandGen.ItemIndex];
    if ComboBoxXMLRead.ItemIndex >= 0 then
      XMLReaderClass := XMLReaderClasses[ComboBoxXMLRead.ItemIndex];
    try
      FS := TFileStream.Create(FileNameEditJPKRSAProd.FileName, fmOpenRead);
      JPKRSAProd := RSAEncryptClass.CreateKey(FS);
    finally
      if Assigned(FS) then
        FreeAndNil(FS);
    end;
    try
      FS := TFileStream.Create(FileNameEditJPKRSATest.FileName, fmOpenRead);
      JPKRSATest := RSAEncryptClass.CreateKey(FS);
    finally
      if Assigned(FS) then
        FreeAndNil(FS);
    end;
    RSAKeyProd := JPKRSAProd;
    RSAKeyTest := JPKRSATest;
  end;

  KSeF := TlgKSeF.Create(nil);
  with KSeF do
  begin
    XAdES := Self.XAdES;
    HTTPClient := Self.HTTPClient;
    if ComboBoxBase64.ItemIndex >= 0 then
      Base64EncoderClass := Base64EncoderClasses[ComboBoxBase64.ItemIndex];
    if ComboBoxAES256.ItemIndex >= 0 then
      AES256EncryptClass := AES256EncryptClasses[ComboBoxAES256.ItemIndex];
    if ComboBoxSHA256.ItemIndex >= 0 then
      SHA256HashClass := SHA256HashClasses[ComboBoxSHA256.ItemIndex];
    if ComboBoxRandGen.ItemIndex >= 0 then
      RandomGeneratorClass := RandomGeneratorClasses[ComboBoxRandGen.ItemIndex];
    //if ComboBoxZip.ItemIndex >= 0 then
    //  ZipperClass := ZipperClasses[ComboBoxZip.ItemIndex];
    if ComboBoxRSAEnc.ItemIndex >= 0 then
      RSAEncryptClass := RSAEncryptClasses[ComboBoxRSAEnc.ItemIndex];
    try
      FS := TFileStream.Create(FileNameEditKSeFRSAProd.FileName, fmOpenRead);
      KSeFRSAProd := RSAEncryptClass.CreateKey(FS);
    finally
      if Assigned(FS) then
        FreeAndNil(FS);
    end;
    try
      FS := TFileStream.Create(FileNameEditKSeFRSADemo.FileName, fmOpenRead);
      KSeFRSADemo := RSAEncryptClass.CreateKey(FS);
    finally
      if Assigned(FS) then
        FreeAndNil(FS);
    end;
    try
      FS := TFileStream.Create(FileNameEditKSeFRSATest.FileName, fmOpenRead);
      KSeFRSATest := RSAEncryptClass.CreateKey(FS);
    finally
      if Assigned(FS) then
        FreeAndNil(FS);
    end;
    RSAKeyProd := KSeFRSAProd;
    RSAKeyDemo := KSeFRSADemo;
    RSAKeyTest := KSeFRSATest;
  end;

  if FileNameEditLibXml2.FileName <> '' then
    if not TlgLibXML2Backend.LoadLibXML(FileNameEditLibXml2.FileName) then
      MessageDlg('Nie można załadować biblioteki: ' + FileNameEditLibXml2.FileName,
        mtError, [mbOK], 0);
  if (FileNameEditLibXlst.FileName <> '') or (FileNameEditLibExslt.FileName <> '')  then
    if not TlgLibXML2Backend.LoadLibXSLT(FileNameEditLibXlst.FileName, FileNameEditLibExslt.FileName) then
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
  TabSheetVies.TabVisible := True;
  RadioGroupXMLValClick(nil);

  if Assigned(Signer) then
  begin
    TabSheetCert.TabVisible := True;
    TabSheetEDekPodpisCert.TabVisible := True;
    TabSheetJPKPodpisCert.TabVisible := True;
    if Signer is TlgPKCS11CertificateSigner then
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
end;

procedure TForm1.ButtonViesCheckStatusClick(Sender: TObject);
var
  Resp: TlgViesStatusInformationResponse;
  C: TlgViesCountryStatus;
begin
  Debug('VIES - Sprawdź status usługi', True);
  try
    Resp := TlgViesService.CheckStatus(HTTPClient);
    Debug('VoW dostępne: ' + BoolToStr(Resp.VowAvaiable, 'Tak', 'Nie'));
    Debug('Liczba krajów: ' + IntToStr(Length(Resp.Countries)));
    for C in Resp.Countries do
      Debug('  ' + C.CountryCode + ': ' + C.Availability.ToString);
  except
    on E: Exception do
    begin
      Debug('Błąd podzas sprawdzania VIES (%s): %s', [E.ClassName, E.Message]);
      MessageDlg(Format('Błąd podzas sprawdzania VIES (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonViesVatCheckClick(Sender: TObject);
var
  Resp: TlgViesCheckVatResponse;
  S: String;
begin
  Debug('VIES - Sprawdź VAT' + specialize IfThen<String>(Sender = ButtonViesVatTestService, ' (TEST)', ''), True);
  try
    if Sender = ButtonViesVatTestService then
      Resp := TlgViesService.CheckVatTestService(ComboBoxViesCountry.Text, EditViesVatNum.Text,
        ComboBoxViesReqCountry.Text, EditViesReqVatNum.Text, EditViesTraderName.Text,
        EditViesTraderStreet.Text, EditViesTraderPostalCode.Text, EditViesTraderCity.Text,
        EditViesTraderCompanyType.Text, HTTPClient)
    else
      Resp := TlgViesService.CheckVatNumber(ComboBoxViesCountry.Text, EditViesVatNum.Text,
        ComboBoxViesReqCountry.Text, EditViesReqVatNum.Text, EditViesTraderName.Text,
        EditViesTraderStreet.Text, EditViesTraderPostalCode.Text, EditViesTraderCity.Text,
        EditViesTraderCompanyType.Text, HTTPClient);
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

procedure TForm1.ButtonXMLTransClick(Sender: TObject);
var
  XDoc: TlgXMLReader = nil;
  FS: TFileStream = nil;
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
    try
      if RadioGroupXMLVal.ItemIndex = 0 then
        XDoc := TlgMSXMLReader.CreateFromFile(FileNameEditXMLTransSrc.FileName)
      else
        XDoc := TlgLibXML2Reader.CreateFromFile(FileNameEditXMLTransSrc.FileName);
      FS := TFileStream.Create(FileNameEditXMLTransDst.FileName, fmCreate);
      XTrans.Transform(XDoc, FS);
      Debug('Zapisano do pliku: ' + FileNameEditXMLTransDst.FileName);
      if CheckBoxXMLTransOpen.Checked then
        OpenDocument(FileNameEditXMLTransDst.FileName);
    except
      on E: Exception do
      begin
        Debug('Błąd podzas transformacji XSLT (%s): %s', [E.ClassName, E.Message]);
        MessageDlg(Format('Błąd podzas transformacji XSLT (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
      end;
    end;
  finally
    if Assigned(FS) then
      FS.Free;
    if Assigned(XDoc) then
      XDoc.Free;
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
  Errors: TlgXMLValidationErrors = ();
  XDoc: TlgXMLReader = nil;
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
    try
      if RadioGroupXMLVal.ItemIndex = 0 then
        XDoc := TlgMSXMLReader.CreateFromFile(FileNameEditXMLVer.FileName)
      else
        XDoc := TlgLibXML2Reader.CreateFromFile(FileNameEditXMLVer.FileName);
      if XValidator.Validate(XDoc, Errors) then
        Debug('Jest poprawny')
      else
      begin
        Debug('NIE jest poprawny');
        Debug('Błędy:');
        for I := 0 to Length(Errors) - 1 do
        begin
          Debug('Nr błędu: ' + IntToStr(Errors[I].ErrorCode));
          Debug('Linia: ' + IntToStr(Errors[I].Line));
          Debug('Komunikat: ' + Errors[I].Message);
          Debug('Element: ' + Errors[I].Path);
          Debug('Sciezka: ' + Errors[I].SimplePath);
          Debug('-------');
        end;
      end;
    except
      on E: Exception do
      begin
        Debug('Błąd podzas walidacji XML (%s): %s', [E.ClassName, E.Message]);
        MessageDlg(Format('Błąd podzas walidacji XML (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
      end;
    end;
  finally
    if Assigned(XDoc) then
      XDoc.Free;
  end;
end;

procedure TForm1.FileNameEditKSeFBatchInZIPAcceptFileName(Sender: TObject; var Value: String
  );
begin
  FileNameEditKSeFBatchOutEncZIP.FileName := ChangeFileExt(Value, '.part1');
  FileNameEditKSeFBatchOutInitUp.FileName := ChangeFileExt(Value, '.xml');
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
begin
  Debug('Pokaz info o certyfikacie', True);
  {$IFDEF WINDOWS}
  if (ListViewCert.ItemIndex >= 0) then
  begin
    DebugCert(Certyfikaty[ListViewCert.ItemIndex]);
    if (Certyfikaty[ListViewCert.ItemIndex] is TlgCNGCertificate) then
      TlgCNGCertificate(Certyfikaty[ListViewCert.ItemIndex]).ShowCertificateInfo(Self.Handle)
    else if (Certyfikaty[ListViewCert.ItemIndex] is TlgPKCS11Certificate) then
      TlgPKCS11Certificate(Certyfikaty[ListViewCert.ItemIndex]).ShowCertificateInfo(Self.Handle)
  end;
  {$ENDIF}
end;

procedure TForm1.ButtonCertWybierzClick(Sender: TObject);
var
  Cert: TlgCertificate;
begin
  Debug('Wybierz certyfikat', True);
  Cert := Signer.UISelect;
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

procedure TForm1.ButtonJPKBUPOClick(Sender: TObject);
var
  Status: Integer;
  Opis, Szczegoly: String;
  UPO: String;
  Timestamp: String;
begin
  Debug('JPK - Sprawdź status / pobierz UPO', True);
  try
    Status := JPK.RequestUPO(EditJPKBNrRef.Text, TlgEDekGateType(ComboBoxJPKBRodzBramUPO.ItemIndex),
      Opis, Szczegoly, UPO, Timestamp);
    Debug('Status: ' + IntToStr(Status));
    Debug('Opis: ' + Opis);
    Debug('Szczegóły: ' + Szczegoly);
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
      Debug('Błąd podzas sprawdzania statusu JPK (%s): %s', [E.ClassName, E.Message]);
      MessageDlg(Format('Błąd podzas sprawdzania statusu JPK (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonJPKBWyslijClick(Sender: TObject);
var
  InitUpload: String;
  EncStream: TFileStream = nil;
  RefNo: String;
begin
  Debug('Wyślij JPK', True);
  try
    try
      Debug('Wczytywanie struktury InitUpload: ' + FileNameEditJPKBIU.FileName);
      InitUpload := QuickLoad(FileNameEditJPKBIU.FileName);

      Debug('Otwarcie strumienia z zaszyfrowanymi danymi: ' + FileNameEditJPKBEnc.FileName);
      EncStream := TFileStream.Create(FileNameEditJPKBEnc.FileName, fmOpenRead);

      Debug('Wysyłanie');
      JPK.Send(InitUpload, EncStream, RefNo, TlgEDekGateType(ComboBoxJPKBRodzBram.ItemIndex),
        CheckBoxJPKBCert.Checked);

      EditJPKBNrRef.Text := RefNo;
      Debug('Wysłano plik JPK, ref no: ' + RefNo);
    except
      on E: Exception do
      begin
        Debug('Błąd podzas wysyłania JPK (%s): %s', [E.ClassName, E.Message]);
        MessageDlg(Format('Błąd podzas wysyłania JPK (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
      end;
    end;
  finally
    if Assigned(EncStream) then
      EncStream.Free;
  end;
end;

procedure TForm1.ButtonJPKPodpiszAutClick(Sender: TObject);
var
  JPKItem: TlgJPKItem;
  S: String;
begin
  Debug('Podpis JPK danymi autoryzującymi', True);
  JPKItem.Clear;
  try
    try
      Debug('Plik wejściowy: ' + FileNameEditJPKPAWej.FileName);
      JPKItem.InputStream := TFileStream.Create(FileNameEditJPKPAWej.FileName, fmOpenRead);

      Debug('Plik wynikowy (enc. zip): ' + FileNameEditJPKPAEnc.FileName );
      JPKItem.EncryptedStream := TFileStream.Create(FileNameEditJPKPAEnc.FileName, fmCreate);

      Debug('Na żądanie (ad hoc): ' + BoolToStr(CheckBoxJPKPCAdHoc.Checked));
      JPKItem.AdHoc := CheckBoxJPKPCAdHoc.Checked;

      WriteStr(S, TlgEDekGateType(ComboBoxJPKPARodzBram.ItemIndex));
      Debug('Bramka (klucz rsa): ' + S);
      JPKItem.GateType := TlgEDekGateType(ComboBoxJPKPARodzBram.ItemIndex);

      DebugAuth(EditJPKPImie.Text, EditJPKPNazwisko.Text, EditJPKPNIP.Text,
        DateTimePickerJPKPDataU.Date, FloatSpinEditJPKPKwota.Value);
      JPKItem.NIP := EditJPKPNIP.Text;
      JPKItem.ImiePierwsze := EditJPKPImie.Text;
      JPKItem.Nazwisko := EditJPKPNazwisko.Text;
      JPKItem.DataUrodzenia := DateTimePickerJPKPDataU.Date;
      JPKItem.Kwota := FloatSpinEditJPKPKwota.Value;

      JPK.Sign(JPKItem);
      Debug('Podpisano');

      Debug('Zapis InitUpload do pliku: ' + FileNameEditJPKPCInitUpload.FileName);
      QuickSave(FileNameEditJPKPCInitUpload.FileName, JPKItem.InitUploadSigned);
    except
      on E: Exception do
      begin
        Debug('Błąd podzas podpisywaania (%s): %s', [E.ClassName, E.Message]);
        MessageDlg(Format('Błąd podzas podpisywaania (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
      end;
    end;
  finally
    if Assigned(JPKItem.InputStream) then
      JPKItem.InputStream.Free;
    if Assigned(JPKItem.EncryptedStream) then
      JPKItem.EncryptedStream.Free;
  end;
end;

procedure TForm1.ButtonJPKPodpiszCertClick(Sender: TObject);
var
  JPKItem: TlgJPKItem;
  S: String;
begin
  Debug('Podpis JPK certyfikatem', True);
  JPKItem.Clear;
  try
    try
      Debug('Plik wejściowy: ' + FileNameEditJPKPCWej.FileName);
      JPKItem.InputStream := TFileStream.Create(FileNameEditJPKPCWej.FileName, fmOpenRead);

      Debug('Plik wynikowy (enc. zip): ' + FileNameEditJPKPCEnc.FileName );
      JPKItem.EncryptedStream := TFileStream.Create(FileNameEditJPKPCEnc.FileName, fmCreate);

      Debug('Na żądanie (ad hoc): ' + BoolToStr(CheckBoxJPKPCAdHoc.Checked));
      JPKItem.AdHoc := CheckBoxJPKPCAdHoc.Checked;

      WriteStr(S, TlgEDekGateType(ComboBoxJPKPCRodzBram.ItemIndex));
      Debug('Bramka (klucz rsa): ' + S);
      JPKItem.GateType := TlgEDekGateType(ComboBoxJPKPCRodzBram.ItemIndex);

      DebugCert(Certyfikaty[ComboBoxJPKCert.ItemIndex]);
      JPKItem.Certificate := Certyfikaty[ComboBoxJPKCert.ItemIndex];

      JPK.Sign(JPKItem);
      Debug('Podpisano');

      Debug('Zapis InitUpload do pliku: ' + FileNameEditJPKPCInitUpload.FileName);
      QuickSave(FileNameEditJPKPCInitUpload.FileName, JPKItem.InitUploadSigned);
    except
      on E: EAbort do
      begin
        Debug('Anulowano');
        MessageDlg('Anulowano', mtInformation, [mbOK], 0);
      end;
      on E: Exception do
      begin
        Debug('Błąd podzas podpisywaania (%s): %s', [E.ClassName, E.Message]);
        MessageDlg(Format('Błąd podzas podpisywaania (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
      end;
    end;
  finally
    if Assigned(JPKItem.InputStream) then
      JPKItem.InputStream.Free;
    if Assigned(JPKItem.EncryptedStream) then
      JPKItem.EncryptedStream.Free;
  end;
end;

procedure TForm1.ButtonKSeFIniTokenClick(Sender: TObject);
var
  Resp: TKSeFInitSessionResponse = nil;
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
  KSeF.GateType := TlgKSeFGateType(ComboBoxKSeFBramka.ItemIndex);
  KSeF.FormCode := TlgKSeFFormCode(ComboBoxKSeFInitFormCode.ItemIndex + 1);
  try
    try
      Resp := KSeF.SessionInitToken;
      Debug('Odpowiedź:' + Resp.RawResponse);
      UstawKSeFSesion(True);
      ObjAdd(Resp);
    except
      on E: Exception do
      begin
        Debug('Błąd podczas inicjalizacji sesji (' + E.ClassName + '): ' + E.Message);
        if E is EKSeFExceptionResponse then
          Debug('Odpowiedź: ' + EKSeFExceptionResponse(E).RawData);
        MessageDlg('Błąd podczas inicjalizacji sesji (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
      end;
    end;
  finally
    //if Assigned(Resp) then
    //  Resp.Free;
  end;
end;

procedure TForm1.ButtonKSeFInitPZClick(Sender: TObject);
var
  SignedInitAuth: String;
  Resp: TKSeFInitSessionResponse = nil;
begin
  Debug('KSeF - SessionInitPZ', True);
  KSeF.NIP := EditKSeFNIP.Text;
  KSeF.Encryption := CheckBoxKSeFEncrypt.Checked;
  KSeF.GateType := TlgKSeFGateType(ComboBoxKSeFBramka.ItemIndex);
  KSeF.FormCode := TlgKSeFFormCode(ComboBoxKSeFInitFormCode.ItemIndex + 1);
  try
    try
      Debug('Wczytywanie podpisanego pliku: ' + FileNameEditKSeFInitPZIn.FileName);
      SignedInitAuth := QuickLoad(FileNameEditKSeFInitPZIn.FileName);
      Resp := KSeF.SessionInitPZ(SignedInitAuth);
      Debug('Odpowiedź:' + Resp.RawResponse);
      UstawKSeFSesion(True);
      ObjAdd(Resp);
    except
      on E: Exception do
      begin
        Debug('Błąd podczas inicjalizacji sesji (' + E.ClassName + '): ' + E.Message);
        if E is EKSeFExceptionResponse then
          Debug('Odpowiedź: ' + EKSeFExceptionResponse(E).RawData);
        MessageDlg('Błąd podczas inicjalizacji sesji (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
      end;
    end;
  finally
    //if Assigned(Resp) then
    //  Resp.Free;
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
    KSeF.GateType := TlgKSeFGateType(ComboBoxKSeFBramka.ItemIndex);
    KSeF.FormCode := TlgKSeFFormCode(ComboBoxKSeFInitFormCode.ItemIndex + 1);
    AuthStruct := KSeF.SessionChalangePZ;
    QuickSave(FileNameEditKSeFInitPZOut.FileName, AuthStruct);
    Debug('Zapisano do pliku: ' + FileNameEditKSeFInitPZOut.FileName);
  except
    on E: Exception do
    begin
      Debug('Błąd tworzenia pliku sesji (' + E.ClassName + '): ' + E.Message);
      if E is EKSeFExceptionResponse then
        Debug('Odpowiedź: ' + EKSeFExceptionResponse(E).RawData);
      MessageDlg('Błąd tworzenia pliku sesji (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonKSeFInitSignedClick(Sender: TObject);
var
  Resp: TKSeFInitSessionResponse = nil;
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
  KSeF.GateType := TlgKSeFGateType(ComboBoxKSeFBramka.ItemIndex);
  KSeF.CertificateAuthType := TlgKSeFCertificateAuthType(ComboBoxKSeFCertAuthType.ItemIndex);
  KSeF.FormCode := TlgKSeFFormCode(ComboBoxKSeFInitFormCode.ItemIndex + 1);
  try
    try
      Resp := KSeF.SessionInitSigned;
      Debug('Odpowiedź:' + Resp.RawResponse);
      UstawKSeFSesion(True);
      ObjAdd(Resp);
    except
      on E: Exception do
      begin
        Debug('Błąd podczas inicjalizacji sesji (' + E.ClassName + '): ' + E.Message);
        if E is EKSeFExceptionResponse then
          Debug('Odpowiedź: ' + EKSeFExceptionResponse(E).RawData);
        MessageDlg('Błąd podczas inicjalizacji sesji (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
      end;
    end;
  finally
    //if Assigned(Resp) then
    //  Resp.Free;
  end;
end;

procedure TForm1.ButtonKSeFInvGetClick(Sender: TObject);
var
  FA: TFileStream = nil;
begin
  Debug('KSeF - pobierz fakturę', True);
  try
    try
      FA := TFileStream.Create(FileNameEditKSeFGetFN.FileName, fmCreate);
      KSeF.InvoiceGet(EditKSeFInvGetNr.Text, FA);
      Debug('Pobrano, zapisywanie do: ' + FileNameEditKSeFGetFN.FileName);
    except
      on E: Exception do
      begin
        Debug('Błąd podczas pobierania faktury (' + E.ClassName + '): ' + E.Message);
        if E is EKSeFExceptionResponse then
          Debug('Odpowiedź: ' + EKSeFExceptionResponse(E).RawData);
        MessageDlg('Błąd podczas pobierania faktury (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
      end;
    end;
  finally
    if Assigned(FA) then
      FA.Free;
  end;
end;

procedure TForm1.ButtonKSeFInvSendClick(Sender: TObject);
var
  FS: TFileStream = nil;
  Resp: TKSeFSendInvoiceResponse = nil;
begin
  Debug('KSeF - wyślij fakturę', True);
  try
    try
      Debug('Otwieranie pliku: ' + FileNameEditKSeFInvSend.FileName);
      FS := TFileStream.Create(FileNameEditKSeFInvSend.FileName, fmOpenRead);
      Debug('Wysyłanie');
      Resp := KSeF.InvoiceSend(FS);
      Debug('Odpowiedź: ' + Resp.RawResponse);
      EditKSeFInvStatNr.Text := Resp.ElementReferenceNumber;
      Debug('Wysłano, el. nr ref: ' + Resp.ElementReferenceNumber);
      //Resp.Free;
      ObjAdd(Resp);
    except
      on E: Exception do
      begin
        Debug('Błąd podczas wysyłania faktury (' + E.ClassName + '): ' + E.Message);
        if E is EKSeFExceptionResponse then
          Debug('Odpowiedź: ' + EKSeFExceptionResponse(E).RawData);
        MessageDlg('Błąd podczas wysyłania faktury (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
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
    Debug('Odpowiedź: ' + Resp.RawResponse);
    //Resp.Free;
    ObjAdd(Resp);
  except
    on E: Exception do
    begin
      Debug('Błąd podczas wysyłania faktury (' + E.ClassName + '): ' + E.Message);
      if E is EKSeFExceptionResponse then
        Debug('Odpowiedź: ' + EKSeFExceptionResponse(E).RawData);
      MessageDlg('Błąd podczas wysyłania faktury (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonkSeFSesStatClick(Sender: TObject);
var
  Resp: TKSeFSessionStatusResponse = nil;
begin
  Debug('Sprawdzenie statusu sesji', True);
  try
    try
      if EditKSeFSesStatRef.Text = '' then
        Resp := KSeF.SessionStatus(SpinEditKSeFSesPgSz.Value, SpinEditKSeFSesPgOf.Value,
          CheckBoxKSeFStatDet.Checked)
      else
        Resp := KSeF.SessionStatus(EditKSeFSesStatRef.Text, SpinEditKSeFSesPgSz.Value,
          SpinEditKSeFSesPgOf.Value, CheckBoxKSeFStatDet.Checked);
      Debug('Odpowiedź: ' + Resp.RawResponse);
      Debug('Kod przetwarzania: ' + IntToStr(Resp.ProcessingCode));
      Debug('Opis przetwarzania: ' + Resp.ProcessingDescription);
      ObjAdd(Resp);
    except
      on E: Exception do
      begin
        Debug('Błąd podczas sprawdzania statusu sesji (' + E.ClassName + '): ' + E.Message);
        if E is EKSeFExceptionResponse then
          Debug('Odpowiedź: ' + EKSeFExceptionResponse(E).RawData);
        MessageDlg('Błąd podczas sprawdzania statusu sesji (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
      end;
    end;
  finally
    //if Assigned(Resp) then
    //  Resp.Free;
  end;
end;

procedure TForm1.ButtonKSeFSesTermClick(Sender: TObject);
var
  Resp: TKSeFTerminateSessionResponse = nil;
begin
  Debug('Kończenie sesji', True);
  try
    try
      Resp := KSeF.SessionTerminate;
      if Assigned(Resp) then
      begin
        Debug('Odpowiedź: ' + Resp.RawResponse);
        UstawKSeFSesion(False);
        ObjAdd(Resp);
      end;
    except
      on E: Exception do
      begin
        Debug('Błąd podczas terminacji sesji (' + E.ClassName + '): ' + E.Message);
        if E is EKSeFExceptionResponse then
          Debug('Odpowiedź: ' + EKSeFExceptionResponse(E).RawData);
        MessageDlg('Błąd podczas terminacji sesji (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
      end;
    end;
  finally
    //if Assigned(Resp) then
    //  Resp.Free;
  end;
end;

procedure TForm1.ButtonKSeFStatusUPOClick(Sender: TObject);
var
  Resp: TKSeFStatusResponse = nil;
begin
  Debug('KSeF - sprawdź status wysyłki wsadowej', True);
  try
    try
      Debug('Nr ref: ' + EditKSeFStatusReferenceNumber.Text);
      Debug('Bramka: ' + ComboBoxKSeFComBramka.Text);
      Resp := KSeF.CommonStatus(EditKSeFStatusReferenceNumber.Text, TlgKSeFGateType(ComboBoxKSeFComBramka.ItemIndex));
      Debug('Status: ' + IntToStr(Resp.ProcessingCode));
      Debug('Opis: ' + Resp.ProcessingDescription);
      if (Resp.ProcessingCode = 200) and (Resp.Upo <> '') then
      begin
        QuickSave(FileNameEditKSeFUPO.FileName, Base64EncoderClasses[ComboBoxBase64.ItemIndex].DecodeString(Resp.Upo));
        Debug('Pobrano UPO do pliku: ' + FileNameEditKSeFUPO.FileName);
      end
      else
        Debug('NIE pobrano UPO');
      ObjAdd(Resp);
    except
      on E: Exception do
      begin
        Debug('Błąd podczas terminacji sesji (' + E.ClassName + '): ' + E.Message);
        if E is EKSeFExceptionResponse then
          Debug('Odpowiedź: ' + EKSeFExceptionResponse(E).RawData);
        MessageDlg('Błąd podczas terminacji sesji (' + E.ClassName + '): ' + E.Message, mtError, [mbOK], 0);
      end;
    end;
  finally
    //if Assigned(Resp) then
    //  Resp.Free;
  end;
end;

procedure TForm1.ButtonObjClearClick(Sender: TObject);
var
  I: TListItem;
begin
  while ListViewObj.Items.Count > 0 do
  begin
    I := ListViewObj.Items[0];
    if I.Data <> nil then
      TKSeFObject(I.Data).Free;
    ListViewObj.Items.Delete(0);
  end;
end;

procedure TForm1.ButtonObjShowClick(Sender: TObject);
begin
  if ListViewObj.Selected <> nil then
    ShowObject(TKSeFObject(ListViewObj.Selected.Data));
end;

procedure TForm1.ButtonPKCS11InfoClick(Sender: TObject);
begin
  Debug('Info o bibliotece PKCS11:', True);
  try
    with TlgPKCS11CertificateSigner(Signer).GetInfo do
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

procedure TForm1.ButtonPKCS11SesCloseClick(Sender: TObject);
begin
  if ComboBoxPKCS11Cert.ItemIndex < 0 then
  begin
    MessageDlg('Wybierz certyfikat', mtInformation, [mbOK], 0);
    Exit;
  end;
  Debug('PKCS11: Zakończ sesję (' + IntToStr(ComboBoxPKCS11Cert.ItemIndex) + '): ' + Certyfikaty[ComboBoxPKCS11Cert.ItemIndex].DisplayName, True);
  try
    if TlgPKCS11Certificate(Certyfikaty[ComboBoxPKCS11Cert.ItemIndex]).Session = nil then
    begin
      Debug('Sesja nie została rozpoczęta');
      MessageDlg('Sesja nie została rozpoczęta', mtInformation, [mbOK], 0);
      Exit;
    end;
    TlgPKCS11CertificateSigner(Signer).SessionClose(TlgPKCS11Certificate(Certyfikaty[ComboBoxPKCS11Cert.ItemIndex]).Session);
    Debug('Sesja zakończona');
  except
    on E: Exception do
    begin
      Debug('Błąd podczas próby zamknięcia sesji: ' + E.Message);
      MessageDlg('Błąd podczas próby zamknięcia sesji: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonPKCS11SesInfoClick(Sender: TObject);
var
  S: String;
  F: TlgPKCS11SessionFlags;
begin
  if ComboBoxPKCS11Cert.ItemIndex < 0 then
  begin
    MessageDlg('Wybierz certyfikat', mtInformation, [mbOK], 0);
    Exit;
  end;
  Debug('PKCS11: Info o sesji (' + IntToStr(ComboBoxPKCS11Cert.ItemIndex) + '): ' + Certyfikaty[ComboBoxPKCS11Cert.ItemIndex].DisplayName, True);
  if TlgPKCS11Certificate(Certyfikaty[ComboBoxPKCS11Cert.ItemIndex]).Session = nil then
  begin
    Debug('Sesja nie została rozpoczęta');
    MessageDlg('Sesja nie została rozpoczęta', mtInformation, [mbOK], 0);
    Exit;
  end;
  try
    with TlgPKCS11Certificate(Certyfikaty[ComboBoxPKCS11Cert.ItemIndex]).Session do
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

procedure TForm1.ButtonPKCS11SesLoginClick(Sender: TObject);
begin
  if ComboBoxPKCS11Cert.ItemIndex < 0 then
  begin
    MessageDlg('Wybierz certyfikat', mtInformation, [mbOK], 0);
    Exit;
  end;
  Debug('PKCS11: Zaloguj (' + IntToStr(ComboBoxPKCS11Cert.ItemIndex) + '): ' + Certyfikaty[ComboBoxPKCS11Cert.ItemIndex].DisplayName, True);
  try
    if TlgPKCS11Certificate(Certyfikaty[ComboBoxPKCS11Cert.ItemIndex]).Session = nil then
    begin
      Debug('Sesja nie została rozpoczęta');
      MessageDlg('Sesja nie została rozpoczęta', mtInformation, [mbOK], 0);
      Exit;
    end;
    TlgPKCS11Certificate(Certyfikaty[ComboBoxPKCS11Cert.ItemIndex]).Session.Login(EditPKCS11PIN.Text, TlgPKCS11UserType(ComboBoxPKCS11UserType.ItemIndex));
    Debug('Zalogowano');
  except
    on E: Exception do
    begin
      Debug('Błąd podczas próby zalogowania: ' + E.Message);
      MessageDlg('Błąd podczas próby zalogowania: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonPKCS11SesLogoutClick(Sender: TObject);
begin
  if ComboBoxPKCS11Cert.ItemIndex < 0 then
  begin
    MessageDlg('Wybierz certyfikat', mtInformation, [mbOK], 0);
    Exit;
  end;
  Debug('PKCS11: Wyloguj (' + IntToStr(ComboBoxPKCS11Cert.ItemIndex) + '): ' + Certyfikaty[ComboBoxPKCS11Cert.ItemIndex].DisplayName, True);
  try
    if TlgPKCS11Certificate(Certyfikaty[ComboBoxPKCS11Cert.ItemIndex]).Session = nil then
    begin
      Debug('Sesja nie została rozpoczęta');
      MessageDlg('Sesja nie została rozpoczęta', mtInformation, [mbOK], 0);
      Exit;
    end;
    TlgPKCS11Certificate(Certyfikaty[ComboBoxPKCS11Cert.ItemIndex]).Session.Logout;
    Debug('Wylogowano');
  except
    on E: Exception do
    begin
      Debug('Błąd podczas próby wylogowania: ' + E.Message);
      MessageDlg('Błąd podczas próby wylogowania: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonPKCS11SesStartClick(Sender: TObject);
begin
  if ComboBoxPKCS11Cert.ItemIndex < 0 then
  begin
    MessageDlg('Wybierz certyfikat', mtInformation, [mbOK], 0);
    Exit;
  end;
  Debug('PKCS11: Rozpocznij sesję dla certyfikatu (' + IntToStr(ComboBoxPKCS11Cert.ItemIndex) + '): ' + Certyfikaty[ComboBoxPKCS11Cert.ItemIndex].DisplayName, True);
  try
    if Assigned(TlgPKCS11Certificate(Certyfikaty[ComboBoxPKCS11Cert.ItemIndex]).Session) then
    begin
      Debug('Sesja już została rozpoczęta');
      MessageDlg('Sesja już została rozpoczęta', mtInformation, [mbOK], 0);
      Exit;
    end;
    TlgPKCS11CertificateSigner(Signer).SessionStart(TlgPKCS11Certificate(Certyfikaty[ComboBoxPKCS11Cert.ItemIndex]));
    Debug('Nowa sesja rozpoczęta');
  except
    on E: Exception do
    begin
      Debug('Błąd podczas próby rozpoczęcia sesji: ' + E.Message);
      MessageDlg('Błąd podczas próby rozpoczęcia sesji: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonPKCS11SlotsClick(Sender: TObject);
var
  Slots: TlgPKCS11SlotInfoList;
  I: Integer;
begin
  Debug('Lista slotów PKCS11', True);
  try
    Slots := TlgPKCS11CertificateSigner(Signer).GetSlots(False);
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

procedure TForm1.ButtonEdekPodpiszCertClick(Sender: TObject);
var
  Wej, Wyj: String;
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
      Debug('Błąd podzas podpisywaania (%s): %s', [E.ClassName, E.Message]);
      MessageDlg(Format('Błąd podzas podpisywaania (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonEdekPodpiszAutClick(Sender: TObject);
var
  Wej, Wyj: String;
begin
  Debug('Podpis eDeklaracji certyfikatem', True);
  try
    Debug('Plik wej: ' + FileNameEditEDPAWej.FileName);
    Wej := QuickLoad(FileNameEditEDPAWej.FileName);

    DebugAuth(EditEDPImie.Text, EditEDPNazwisko.Text, EditEDPNIP.Text,
      DateTimePickerEDPDataU.Date, FloatSpinEditEDPKwota.Value);
    Debug('Podpisywanie');

    EDek.PodpiszDanymiAut(Wej, EditEDPImie.Text, EditEDPNazwisko.Text,
      EditEDPNIP.Text, DateTimePickerEDPDataU.Date, FloatSpinEditEDPKwota.Value,
      Wyj);

    Debug('Plik wyj: ' + FileNameEditEDPAWyj.FileName);
    QuickSave(FileNameEditEDPAWyj.FileName, Wyj);

    Debug('Podpisano');
  except
    on E: Exception do
    begin
      Debug('Błąd podzas podpisywaania (%s): %s', [E.ClassName, E.Message]);
      MessageDlg(Format('Błąd podzas podpisywaania (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonEDBWyslijClick(Sender: TObject);
var
  Dane, NrRef, Opis: String;
  Status: Integer;
  S: String;
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

    Str(TlgEDekGateType(ComboBoxEDBRodzBram.ItemIndex), S);
    Debug('Bramka: ' + S);
    Str(TlgEDekSignType(ComboBoxEDBRodzPodp.ItemIndex), S);
    Debug('Podpis: ' + S);

    Debug('Wysyłanie');

    EDek.Wyslij(Dane, TlgEDekGateType(ComboBoxEDBRodzBram.ItemIndex),
      TlgEDekSignType(ComboBoxEDBRodzPodp.ItemIndex), NrRef, Status, Opis);

    Debug('Status: ' + IntToStr(Status));
    Debug('Opis: ' + Opis);
    Debug('Nr ref.: ' + NrRef);

    if (Status >= 100) and (Status <= 399) then
    begin
      EditEDBNrRef.Text := NrRef;
      Debug('Wysłano');
    end
    else
      Debug('NIE wysłano');
  except
    on E: Exception do
    begin
      Debug('Błąd podczas wysyłania eDeklaracji (%s): %s', [E.ClassName, E.Message]);
      MessageDlg(Format('Błąd podczas wysyłania eDeklaracji (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonEDBUPOClick(Sender: TObject);
var
  Status: Integer;
  Opis, UPO, S: String;
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
    Str(TlgEDekGateType(ComboBoxEDBRodzBramUPO.ItemIndex), S);
    Debug('Bramka: ' + S);
    Debug('Sprawdzanie statusu');

    EDek.PobierzUPO(EditEDBNrRef.Text, TlgEDekGateType(ComboBoxEDBRodzBramUPO.ItemIndex), Status, Opis, UPO);

    Debug('Status: ' + IntToStr(Status));
    Debug('Opis: ' + Opis);

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
      Debug('Błąd podczas sprawdzania statusu eDeklaracji (%s): %s', [E.ClassName, E.Message]);
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
  Req: TKSeFQueryInvoiceRequest;
  Resp: TKSeFQueryInvoiceAsyncInitResponse;
begin
  Debug('KSeF - Inicjowanie zapytania asynchronicznego o faktury', True);
  Req := GetQueriInvoiceCr;
  Debug('Zapytanie: ' + Req.GetJSONString);
  ObjAdd(Req);
  try
    try
      Resp := KSeF.QueryInvoiceAsyncInit(Req);
      Debug('Odpowiedź: ' + Resp.RawResponse);
      EditKSeFQInvAsyncQRefNo.Text := Resp.ElementReferenceNumber;
      //Resp.Free;
      ObjAdd(Resp);
    except
      on E: Exception do
      begin
        Debug('Błąd podczas inicjowania zapytania o faktury asynchronicznie (%s): %s', [E.ClassName, E.Message]);
        if E is EKSeFExceptionResponse then
          Debug('Odpowiedź: ' + EKSeFExceptionResponse(E).RawData);
        MessageDlg(Format('Błąd podczas inicjowania zapytania o faktury aynchronicznie (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
      end;
    end;
  finally
    //Req.Free;
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
    Debug('Odpowiedź: ' + Resp.RawResponse);
    //Resp.Free;
    ObjAdd(Resp);
  except
    on E: Exception do
    begin
      Debug('Błąd podczas generowania identyfikatora wewn. (%s): %s', [E.ClassName, E.Message]);
      if E is EKSeFExceptionResponse then
        Debug('Odpowiedź: ' + EKSeFExceptionResponse(E).RawData);
      MessageDlg(Format('Błąd podczas generowania identyfikatora wewn. (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonKSeFInvHideClick(Sender: TObject);
var
  Resp: TKSeFVisibilityInvoiceResponseStatusMain;
begin
  Debug('KSeF - ukrywanie wybranej faktury', True);
  try
    Debug('Nr ref. KSeF faktury: ' + EditKSeFInvHideNr.Text);
    Debug('Przyczyna: ' + EditKSeFInvHideReason.Text);
    Resp := KSeF.InvoiceVisibilityHide(EditKSeFInvHideNr.Text, EditKSeFInvHideReason.Text);
    //Resp.Free;
    ObjAdd(Resp);
    Debug('Ukryto.');
  except
    on E: Exception do
    begin
      Debug('Błąd podczas ukrywania faktury (%s): %s', [E.ClassName, E.Message]);
      if E is EKSeFExceptionResponse then
        Debug('Odpowiedź: ' + EKSeFExceptionResponse(E).RawData);
      MessageDlg(Format('Błąd podczas ukrywania faktury (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonKSeFInvShowClick(Sender: TObject);
var
  Resp: TKSeFVisibilityInvoiceResponseStatusMain;
begin
  Debug('KSeF - Anulowanie ukrycia wybranej faktury', True);
  try
    Debug('Nr ref. KSeF faktury: ' + EditKSeFInvShowNr.Text);
    Debug('Przyczyna: ' + EditKSeFInvShowReason.Text);
    Resp := KSeF.InvoiceVisibilityShow(EditKSeFInvShowNr.Text, EditKSeFInvShowReason.Text);
    //Resp.Free;
    ObjAdd(Resp);
    Debug('Anulowano ukrycie.');
  except
    on E: Exception do
    begin
      Debug('Błąd podczas anulowania ukrycia faktury (%s): %s', [E.ClassName, E.Message]);
      if E is EKSeFExceptionResponse then
        Debug('Odpowiedź: ' + EKSeFExceptionResponse(E).RawData);
      MessageDlg(Format('Błąd podczas anulowania ukrycia faktury (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.ButtonKSeFCInvGetClick(Sender: TObject);
var
  FA: TFileStream = nil;
  Req: TKSeFInvoiceRequestKSeF = nil;
begin
  Debug('KSeF - interfejs ogólny - pobranie faktury', True);
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
            FirstName := EditKSeFCInvSubToFirstName.Text;
            Surname := EditKSeFCInvSubToSurname.Text;
            TradeName := EditKSeFCInvSubToTradeName.Text;
          end;
        end
        else
        begin
          Req.InvoiceDetails.SubjectTo.IssuedToName := TKSeFSubjectFullName.Create;
          with Req.InvoiceDetails.SubjectTo.IssuedToName as TKSeFSubjectFullName do
          begin
            FullName := EditKSeFCInvSubToFullName.Text;
            TradeName := EditKSeFCInvSubToTradeName.Text;
          end;
        end;
      end;
      ObjAdd(Req);
      Debug('Bramka: ' + ComboBoxKSeFComBramka.Text);
      Debug('Zapytanie: ' + Req.GetJSONString);
      Debug('Plik wynikowy: ' + FileNameEditKSeFCInvFN.FileName);
      FA := TFileStream.Create(FileNameEditKSeFCInvFN.FileName, fmCreate);
      KSeF.CommonInvoiceKSeF(Req, FA, TlgKSeFGateType(ComboBoxKSeFComBramka.ItemIndex));
    except
      on E: Exception do
      begin
        Debug('Błąd podczas generowania identyfikatora wewn. (%s): %s', [E.ClassName, E.Message]);
        if E is EKSeFExceptionResponse then
          Debug('Odpowiedź: ' + EKSeFExceptionResponse(E).RawData);
        MessageDlg(Format('Błąd podczas generowania identyfikatora wewn. (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
      end;
    end;
  finally
    FA.Free;
    //Req.Free;
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
  InZIPFile: TFileStream = nil;
  InitUpload: String = '';
  OutEncZIPFile: TFileStream = nil;
begin
  Debug('KSeF - pobieranie / przygotowanie do wysyłki wsadowej', True);
  if RadioButtonKSeFBatchCert.Checked and (ComboBoxKSeFBatchCert.ItemIndex < 0) then
  begin
    MessageDlg('Wybierz certyfikat', mtInformation, [mbOK], 0);
    Exit;
  end;
  try
    try
      Debug('Otwieranie pliku wejściowego: ' + FileNameEditKSeFBatchInZIP.FileName);
      InZIPFile := TFileStream.Create(FileNameEditKSeFBatchInZIP.FileName, fmOpenRead);
      Debug('Tworzenie pliku wyjściowego: ' + FileNameEditKSeFBatchOutEncZIP.FileName);
      OutEncZIPFile := TFileStream.Create(FileNameEditKSeFBatchOutEncZIP.FileName, fmCreate);
      KSeF.NIP := EditKSeFBatchNIP.Text;
      KSeF.FormCode := TlgKSeFFormCode(ComboBoxKSeFBatchInitFormCode.ItemIndex);
      KSeF.GateType := TlgKSeFGateType(ComboBoxKSeFBatchBramka.ItemIndex);
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
      Debug('Zapisano strukturę InitUpload do pliku: ' + FileNameEditKSeFBatchOutInitUp.FileName);

      FileNameEditKSeFBatchSendIU.FileName := FileNameEditKSeFBatchOutInitUp.FileName;
      FileNameEditKSeFBatchSendEnc.FileName := FileNameEditKSeFBatchOutEncZIP.FileName;
      ComboBoxKSeFBatchSendBramka.ItemIndex := ComboBoxKSeFBatchBramka.ItemIndex;
    except
      on E: EAbort do
        Debug('ANULOWANO');
      on E: Exception do
      begin
        Debug('Błąd podczas podpisywania / przygotowania do wysyłki wsadowej (%s): %s', [E.ClassName, E.Message]);
        MessageDlg(Format('Błąd podczas podpisywania / przygotowania do wysyłki wsadowej (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
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
  InitUpload: String;
  EncZIPFile: TFileStream = nil;
begin
  Debug('KSeF - wysyłka wsadowa', True);
  try
    try
      Debug('Otwieranie pliku wejściowego: ' + FileNameEditKSeFBatchSendEnc.FileName);
      EncZIPFile := TFileStream.Create(FileNameEditKSeFBatchSendEnc.FileName, fmOpenRead);
      Debug('Wczytanie InitUpload z pliku: ' + FileNameEditKSeFBatchSendIU.FileName);
      InitUpload := QuickLoad(FileNameEditKSeFBatchSendIU.FileName);
      KSeF.GateType := TlgKSeFGateType(ComboBoxKSeFBatchSendBramka.ItemIndex);
      EditKSeFBatchNrRef.Text := KSeF.BatchSend(EncZIPFile, InitUpload);
      Debug('Wysłano, nr referencyjny: ' + EditKSeFBatchNrRef.Text);
    except
      on E: Exception do
      begin
        Debug('Błąd podczas wysyłki wsadowej (%s): %s', [E.ClassName, E.Message]);
        if E is EKSeFExceptionResponse then
          Debug('Odpowiedź: ' + EKSeFExceptionResponse(E).RawData);
        MessageDlg(Format('Błąd podczas wysyłki wsadowej (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
      end;
    end;
  finally
    if Assigned(EncZIPFile) then
      EncZIPFile.Free;
  end;
end;

procedure TForm1.ButtonObjCountClick(Sender: TObject);
begin
  {$IFDEF LGP_DEBUG_OBJ}
  Debug('Liczba obiektów KSeF: ' + IntToStr(ObjList.Count), True);
  {$ENDIF}
end;

procedure TForm1.ButtonKSeFCreQClick(Sender: TObject);
var
  Req: TKSeFQuerySyncCredentialsRequest;
  Resp: TKSeFQuerySyncCredentialsResponse;
begin
  Debug('KSeF - Zapytanie o poświadczenia', True);
  Req := TKSeFQuerySyncCredentialsRequest.Create;
  if RadioButtonKSeFCreQById.Checked then
  begin
    Req.QueryCriteria := TKSeFQueryCriteriaCredentialsId.Create;
    with TKSeFQueryCriteriaCredentialsId(Req.QueryCriteria) do
    begin
      QueryCredentialsScopeResultTypeRaw := ComboBoxKSeFCreQCSRT.Text;
      QueryCredentialsTypeResultTypeRaw := ComboBoxKSeFCreQCTRT.Text;
      CredentialsIdentifier := TKSeFCredentialsIdentifierRequest.Create;
      CredentialsIdentifier.&Type := ComboBoxKSeFCreQCriType.Text;
      CredentialsIdentifier.Identifier := EditKSeFCreQCriId.Text;
    end;
  end
  else
  begin
    Req.QueryCriteria := TKSeFQueryCriteriaCredentialsAll.Create;
    with TKSeFQueryCriteriaCredentialsAll(Req.QueryCriteria) do
    begin
      QueryCredentialsScopeResultTypeRaw := ComboBoxKSeFCreQCSRT.Text;
      QueryCredentialsTypeResultTypeRaw := ComboBoxKSeFCreQCTRT.Text;
    end;
  end;
  Debug('Zapytanie: ' + Req.GetJSONString);
  ObjAdd(Req);
  try
    try
      Resp := KSeF.QueryCredentialSync(Req);
      Debug('Odpowiedź: ' + Resp.RawResponse);
      //Resp.Free;
      ObjAdd(Resp);
    except
      on E: Exception do
      begin
        Debug('Błąd podczas zapytania o poświadczenia (%s): %s', [E.ClassName, E.Message]);
        if E is EKSeFExceptionResponse then
          Debug('Odpowiedź: ' + EKSeFExceptionResponse(E).RawData);
        MessageDlg(Format('Błąd podczas zapytania o poświadczenia (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
      end;
    end;
  finally
    //Req.Free;
  end;
end;

procedure TForm1.ButtonKSeFCreGTokClrClick(Sender: TObject);
var
  I: Integer;
begin
  EditKSeFCreGTokDesc.Text := '';
  for I := 1 to 6 do
  begin
    StringGridKSeFCreGTok.Cells[0, I] := '';
    StringGridKSeFCreGTok.Cells[1, I] := '';
  end;
end;

procedure TForm1.ButtonCertLoadFromFileClick(Sender: TObject);
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
  if TForm4.Execute(CertFileName, PrivKeyFileName, Password, CertFormat, KeyFormat) then
  begin
    try
      CertStream := TFileStream.Create(CertFileName, fmOpenRead);
      if PrivKeyFileName <> '' then
        PrivKeyStream := TFileStream.Create(PrivKeyFileName, fmOpenRead);
      Cert := Signer.LoadFromStream(CertStream, CertFormat, PrivKeyStream, KeyFormat, Password);
      if not Assigned(Certyfikaty) then
        Certyfikaty := TlgCertificates.Create(True);
      Certyfikaty.Add(Cert);
      UpdateCertList;
    finally
      if CertStream <> nil then
        CertStream.Free;
      if PrivKeyStream <> nil then
        PrivKeyStream.Free;
    end;
  end;
end;

procedure TForm1.ButtonKSeFCreGTokGenClick(Sender: TObject);
var
  Req: TKSeFGenerateTokenRequest;
  Resp: TKSeFGenerateTokenResponse;
  Role: TKSeFCredentialsRoleRequestToken;
  I: Integer;
begin
  Debug('KSeF - Poświadczenia - Generowanie tokena autoryzacyjnego', True);
  Req := TKSeFGenerateTokenRequest.Create;
  Req.GenerateToken := TKSeFGenerateTokenRequestType.Create;
  Req.GenerateToken.Description := EditKSeFCreGTokDesc.Text;
  for I := 1 to 6 do
    if (StringGridKSeFCreGTok.Cells[0, I] <> '') and (StringGridKSeFCreGTok.Cells[1, I] <> '') then
    begin
      Role := TKSeFCredentialsRoleRequestToken.Create;
      Role.RoleDescription := StringGridKSeFCreGTok.Cells[0, I];
      Role.RoleType := StringGridKSeFCreGTok.Cells[1, I];
      Req.GenerateToken.CredentialsRoleList.Add(Role);
    end;
  Debug('Zapytanie: ' + Req.GetJSONString);
  ObjAdd(Req);
  try
    try
      Resp := KSeF.CredentialsGenerateToken(Req);
      Debug('Odpowiedź: ' + Resp.RawResponse);
      Debug('Wygenerowany token: ' + Resp.AuthorisationToken);
      //Resp.Free;
      ObjAdd(Resp);
    except
      on E: Exception do
      begin
        Debug('Błąd podczas żądania generowania tokena autoryzacyjnego (%s): %s', [E.ClassName, E.Message]);
        if E is EKSeFExceptionResponse then
          Debug('Odpowiedź: ' + EKSeFExceptionResponse(E).RawData);
        MessageDlg(Format('Błąd podczas żądania generowania tokena autoryzacyjnego (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
      end;
    end;
  finally
    //Req.Free;
  end;
end;

procedure TForm1.ButtonKSeFQInvAsyncFetchClick(Sender: TObject);
var
  Resp: TFileStream = nil;
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
  try
    try
      Debug('Zapis wyniku do: ' + FileNameEditKSeFQInvAsyncFN.FileName);
      Resp := TFileStream.Create(FileNameEditKSeFQInvAsyncFN.FileName, fmCreate);
      KSeF.QueryInvoiceAsyncFetch(EditKSeFQInvAsyncQRefNo.Text, EditKSeFQInvAsyncERefNo.Text, Resp);
    except
      on E: Exception do
      begin
        Debug('Błąd podczas pobierania wyniku zapytania o faktury asynchronicznie (%s): %s', [E.ClassName, E.Message]);
        if E is EKSeFExceptionResponse then
          Debug('Odpowiedź: ' + EKSeFExceptionResponse(E).RawData);
        MessageDlg(Format('Błąd podczas pobierania wyniku zapytania o faktury aynchronicznie (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
      end;
    end;
  finally
    if Assigned(Resp) then
      Resp.Free;
  end;
end;

procedure TForm1.ButtonKSeFQInvAsyncStatClick(Sender: TObject);
var
  Resp: TKSeFQueryInvoiceAsyncStatusResponse;
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
    if (Resp.ProcessingCode = 200) and Assigned(Resp.PartList) and (Resp.PartList.Count > 0) then
      EditKSeFQInvAsyncERefNo.Text := Resp.PartList[0].PartReferenceNumber;
    //Resp.Free;
    ObjAdd(Resp);
  except
    on E: Exception do
    begin
      Debug('Błąd podczas pobierania statusu zapytania o faktury asynchronicznie (%s): %s', [E.ClassName, E.Message]);
      if E is EKSeFExceptionResponse then
        Debug('Odpowiedź: ' + EKSeFExceptionResponse(E).RawData);
      MessageDlg(Format('Błąd podczas pobierania statusu zapytania o faktury aynchronicznie (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
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
  Debug('Zapytanie: ' + Req.GetJSONString);
  ObjAdd(Req);
  try
    try
      Resp := KSeF.QueryInvoiceSync(Req, SpinEditKSeFQInvAsPS.Value, SpinEditKSeFQInvAsPS1.Value);
      Debug('Odpowiedź: ' + Resp.RawResponse);
      //Resp.Free;
      ObjAdd(Resp);
    except
      on E: Exception do
      begin
        Debug('Błąd podczas zapytania o faktury synchronicznie (%s): %s', [E.ClassName, E.Message]);
        if E is EKSeFExceptionResponse then
          Debug('Odpowiedź: ' + EKSeFExceptionResponse(E).RawData);
        MessageDlg(Format('Błąd podczas zapytania o faktury synchronicznie (%s): %s', [E.ClassName, E.Message]), mtError, [mbOK], 0);
      end;
    end;
  finally
    //Req.Free;
  end;
end;

finalization
  lgLibXml2Done;

end.

