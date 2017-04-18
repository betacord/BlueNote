unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses unit1;

procedure TForm3.BitBtn1Click(Sender: TObject);
var
  p : textfile;
  iln : integer;
  s : shortstring;
begin
  if edit1.Text<>'' then
  begin
    iln:=0;
    if fileexists(form1.pbaza) then
    begin
      assignfile(p,form1.pbaza);
      reset(p);
      while not eof(p) do
      begin
        readln(p,s);
        inc(iln);
      end;
      append(p);
      inc(iln);
      writeln(p,inttostr(iln)+'|'+string(edit1.text)+' a');
      closefile(p);
      showmessage('Doda³em nauczyciela do bazy');
      edit1.Clear;
      form1.wczytajnauczycieli;
    end
    else showmessage('Plik z baz¹ nauczycieli nie istnieje');
  end
  else showmessage('Uzupe³nij nazwisko i imiê nauczyciela');
end;

procedure TForm3.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then bitbtn1.Click;

end;

end.
