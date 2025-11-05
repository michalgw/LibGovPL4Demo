unit uFormCertLoad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, lgBackend;

type
  TFormCertLoad = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    FileNameEditCert: TEdit;
    ButtonCert: TButton;
    ComboBoxCertFmt: TComboBox;
    FileNameEditKey: TEdit;
    ButtonKey: TButton;
    ComboBoxKeyFmt: TComboBox;
    EditPasswd: TEdit;
    BitBtnOK: TBitBtn;
    BitBtnCancel: TBitBtn;
    OpenDialog1: TOpenDialog;
    procedure ButtonCertClick(Sender: TObject);
    procedure ButtonKeyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function Execute(var ACertFile, APrivKeyFile, APassword: String; var ACertFmt, AKeyFmt: TlgEncodingType): Boolean;
  end;

var
  FormCertLoad: TFormCertLoad;

implementation

{$R *.dfm}

procedure TFormCertLoad.ButtonCertClick(Sender: TObject);
var
  S: String;
begin
  OpenDialog1.FileName := FileNameEditCert.Text;
  if OpenDialog1.Execute then
  begin
    FileNameEditCert.Text := OpenDialog1.FileName;
    S := LowerCase(ExtractFileExt(OpenDialog1.FileName));
    if (S = '.pem') or (S = '.ctr') then
      ComboBoxCertFmt.ItemIndex := 0
    else if (S = '.der') or (S = '.cer') then
      ComboBoxCertFmt.ItemIndex := 1
    else if (S = '.pfx') or (S = '.p12') then
      ComboBoxCertFmt.ItemIndex := 2;
  end;
end;

procedure TFormCertLoad.ButtonKeyClick(Sender: TObject);
var
  S: String;
begin
  OpenDialog1.FileName := FileNameEditKey.Text;
  if OpenDialog1.Execute then
  begin
    FileNameEditKey.Text := OpenDialog1.FileName;
    S := LowerCase(ExtractFileExt(OpenDialog1.FileName));
    if (S = '.pem') or (S = '.ctr') then
      ComboBoxKeyFmt.ItemIndex := 0
    else if (S = '.der') or (S = '.cer') then
      ComboBoxKeyFmt.ItemIndex := 1;
  end;
end;

class function TFormCertLoad.Execute(var ACertFile, APrivKeyFile, APassword: String;
  var ACertFmt, AKeyFmt: TlgEncodingType): Boolean;
begin
  with TFormCertLoad.Create(Application) do
  begin
    FileNameEditCert.Text := ACertFile;
    ComboBoxCertFmt.ItemIndex := Ord(ACertFmt);
    FileNameEditKey.Text := APrivKeyFile;
    ComboBoxKeyFmt.ItemIndex := Ord(AKeyFmt);
    EditPasswd.Text := APassword;
    Result := ShowModal = mrOK;
    if Result then
    begin
      ACertFile := FileNameEditCert.Text;
      ACertFmt := TlgEncodingType(ComboBoxCertFmt.ItemIndex);
      APrivKeyFile := FileNameEditKey.Text;
      AKeyFmt := TlgEncodingType(ComboBoxKeyFmt.ItemIndex);
      APassword := EditPasswd.Text;
    end;
    Free;
  end;
end;

end.
