unit uFormCertLoad;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ButtonPanel, EditBtn,
  StdCtrls, lgBackend;

type

  { TFormCertLoad }

  TFormCertLoad = class(TForm)
    ButtonPanel1: TButtonPanel;
    ComboBoxCertFmt: TComboBox;
    ComboBoxKeyFmt: TComboBox;
    EditPasswd: TEdit;
    FileNameEditCert: TFileNameEdit;
    FileNameEditKey: TFileNameEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FileNameEditCertAcceptFileName(Sender: TObject; var Value: String
      );
    procedure FileNameEditKeyAcceptFileName(Sender: TObject; var Value: String);
  private

  public
    class function Execute(var ACertFile, APrivKeyFile, APassword: String; var ACertFmt, AKeyFmt: TlgEncodingType): Boolean;
  end;

var
  FormCertLoad: TFormCertLoad;

implementation

{$R *.lfm}

{ TFormCertLoad }

procedure TFormCertLoad.FileNameEditCertAcceptFileName(Sender: TObject;
  var Value: String);
begin
  case LowerCase(ExtractFileExt(Value)) of
    '.pem', '.ctr': ComboBoxCertFmt.ItemIndex := 0;
    '.der', '.cer': ComboBoxCertFmt.ItemIndex := 1;
    '.pfx', '.p12': ComboBoxCertFmt.ItemIndex := 2;
  end;
end;

procedure TFormCertLoad.FileNameEditKeyAcceptFileName(Sender: TObject;
  var Value: String);
begin
  case LowerCase(ExtractFileExt(Value)) of
    '.pem': ComboBoxCertFmt.ItemIndex := 0;
    '.der': ComboBoxCertFmt.ItemIndex := 1;
  end;
end;

class function TFormCertLoad.Execute(var ACertFile, APrivKeyFile, APassword: String;
  var ACertFmt, AKeyFmt: TlgEncodingType): Boolean;
begin
  with TFormCertLoad.Create(Application) do
  begin
    FileNameEditCert.FileName := ACertFile;
    ComboBoxCertFmt.ItemIndex := Ord(ACertFmt);
    FileNameEditKey.FileName := APrivKeyFile;
    ComboBoxKeyFmt.ItemIndex := Ord(AKeyFmt);
    EditPasswd.Text := APassword;
    Result := ShowModal = mrOK;
    if Result then
    begin
      ACertFile := FileNameEditCert.FileName;
      ACertFmt := TlgEncodingType(ComboBoxCertFmt.ItemIndex);
      APrivKeyFile := FileNameEditKey.FileName;
      AKeyFmt := TlgEncodingType(ComboBoxKeyFmt.ItemIndex);
      APassword := EditPasswd.Text;
    end;
    Free;
  end;
end;

end.

