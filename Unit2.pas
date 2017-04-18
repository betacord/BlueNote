unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtDlgs, Vcl.Buttons;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    OpenTextFileDialog1: TOpenTextFileDialog;
    OpenTextFileDialog2: TOpenTextFileDialog;
    BitBtn1: TBitBtn;
    procedure Edit1Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

ustawienia = packed record
  baza : shortstring;
  notatki : shortstring;
end;
  opcje = file of ustawienia;
var
  Form2: TForm2;
  o : ustawienia;
  plik : opcje;
  p : shortstring;

implementation

{$R *.dfm}

uses unit1;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  with o do
  begin
    baza:=edit1.Text;
    notatki:=edit2.Text;
  end;
  assignfile(plik, p);
  rewrite(plik);
  reset(plik);
  seek(plik, 0);
  write(plik, o);
  closefile(plik);
  close;
  showmessage('Ustawienia zosta³y zapisane');
end;

procedure TForm2.Edit1Click(Sender: TObject);
begin
  opentextfiledialog1.Execute;
  if opentextfiledialog1.FileName<>'' then
  begin
    edit1.Text:=opentextfiledialog1.FileName;
  end;
end;

procedure TForm2.Edit2Click(Sender: TObject);
begin
  opentextfiledialog2.Execute;
  if opentextfiledialog2.FileName<>'' then
  begin
    edit2.Text:=opentextfiledialog2.FileName;
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
var
  b, n : textfile;
begin
  p:=ExtractFilePath(ParamStr(0))+'ustawienia.dat';
  assignfile(plik, p);
  if not fileexists(p) then
  begin
    rewrite(plik);
    reset(plik);
    seek(plik,0);
    with o do
    begin
      baza:=ExtractFilePath(ParamStr(0))+'baza.txt';
      notatki:=ExtractFilePath(ParamStr(0))+'notatki.txt';
    end;
    write(plik,o);
    closefile(plik);
    if not fileexists(o.baza) then
    begin
      assignfile(b,o.baza);
      rewrite(b);
      closefile(b);
    end;
    if not fileexists(o.notatki) then
    begin
      assignfile(n,o.notatki);
      rewrite(n);
      closefile(n);
    end;
  end;
  reset(plik);
  seek(plik,0);
  read(plik,o);
  with o do
  begin
    edit1.Text:=baza;
    edit2.Text:=notatki;
  end;
  closefile(plik);
  form1.pbaza:=o.baza;
  form1.pnotatki:=o.notatki;
  form1.wczytajnauczycieli;
end;

end.
