unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    EditNS: TEdit;
    Label2: TLabel;
    FileNameEditRes: TEdit;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
  OpenDialog1.FileName := FileNameEditRes.Text;
  if OpenDialog1.Execute then
    FileNameEditRes.Text := OpenDialog1.FileName;
end;

end.
