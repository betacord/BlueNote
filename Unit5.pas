unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.ExtDlgs;

type
  TForm5 = class(TForm)
    RadioGroup1: TRadioGroup;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    RadioGroup2: TRadioGroup;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    OpenTextFileDialog1: TOpenTextFileDialog;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    procedure Edit2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure excel(o : byte);
    procedure access(o : byte);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

uses unit1;

procedure tform5.excel(o : byte);
var
  nazw, ids : tstringlist;
  import, p : textfile;
  idn, nn : shortstring;
  l, i, z : integer;
  s : string;
begin
  l:=0;
  z:=0;
  nazw:=tstringlist.Create;
  ids:=tstringlist.Create;
  assignfile(import,opentextfiledialog1.FileName);
  reset(import);
  while not eof(import) do
  begin
    idn:='';
    nn:='';
    inc(l);
    readln(import,s);
    for I := 1 to length(s) do if s[i]=#9 then z:=i;
    for I := 1 to z-1 do idn:=idn+s[i];
    for I := z+1 to length(s) do nn:=nn+s[i];
    nazw.Add(nn);
    ids.Add(idn);
  end;
  closefile(import);
  assignfile(p,form1.pbaza);
  if o=0 then
  begin
    rewrite(p);
    for I := 0 to l-1 do writeln(p,ids[i]+'|'+nazw[i]+' a');
    showmessage('Wczytano now¹ listê '+inttostr(l)+' nauczycieli');
  end;
  if o=1 then
  begin
    z:=0;
    reset(p);
    while not eof(p) do
    begin
      readln(p,s);
      inc(z);
    end;
    append(p);
    for I := 0 to l-1 do writeln(p,inttostr(z+i+1)+'|'+nazw[i]+' a');
    showmessage('Dodano do bazy '+inttostr(l)+' nowych nauczycieli');
  end;
  closefile(p);
  form1.wczytajnauczycieli;
  nazw.Free;
  ids.Free;
  radiogroup1.ItemIndex:=-1;
  radiogroup2.ItemIndex:=-1;
  edit1.Clear;
  edit2.Clear;
  form5.Close;
end;

procedure tform5.access(o : byte);
var
  import, p : textfile;
  l, i, z : integer;
  ogr : array[1..2] of integer;
  ilo : byte;
  ids, nazw : tstringlist;
  nn, idn : shortstring;
  s : string;
begin
  l:=0;
  assignfile(import,opentextfiledialog1.FileName);
  nazw:=tstringlist.Create;
  ids:=tstringlist.Create;
  reset(import);
  while not eof(import) do
  begin
    ilo:=0;
    idn:='';
    nn:='';
    inc(l);
    readln(import,s);
    for I := 1 to length(s) do
    begin
      if s[i]=edit1.Text[1] then z:=i;
      if s[i]=edit3.Text[1] then
      begin
        inc(ilo);
        ogr[ilo]:=i;
      end;
    end;
    for I := 1 to z-1 do idn:=idn+s[i];
    for I := ogr[1]+1 to ogr[2]-1 do nn:=nn+s[i];
    nazw.Add(nn);
    ids.Add(idn);
  end;
  closefile(import);
  assignfile(p,form1.pbaza);
  if o=0 then
  begin
    rewrite(p);
    for I := 0 to l-1 do writeln(p,ids[i]+'|'+nazw[i]+' a');
    showmessage('Wczytano now¹ listê '+inttostr(l)+' nauczycieli');
  end;
  if o=1 then
  begin
    reset(p);
    z:=0;
    while not eof(p) do
    begin
      readln(p,s);
      inc(z);
    end;
    append(p);
    for I := 0 to l-1 do writeln(p,inttostr(z+i+1)+'|'+nazw[i]+' a');
    showmessage('Dodano do bazy '+inttostr(l)+' nowych nauczycieli');
  end;
  closefile(p);
  form1.wczytajnauczycieli;
  nazw.Free;
  ids.Free;
  radiogroup1.ItemIndex:=-1;
  radiogroup2.ItemIndex:=-1;
  edit1.Clear;
  edit2.Clear;
  form5.Close;
end;

procedure TForm5.BitBtn1Click(Sender: TObject);
begin
  if (opentextfiledialog1.FileName<>'') and (radiogroup1.ItemIndex>-1) and (radiogroup2.ItemIndex>-1) then
  begin
    case radiogroup1.ItemIndex of
      0 : excel(radiogroup2.ItemIndex);
      1 :
      begin
        if (edit1.text<>'') and (edit3.Text<>'') then access(radiogroup2.ItemIndex)
        else showmessage('Uzupe³nij ogranicznik tekstu i znak separatora');
      end;
    end;
  end
  else showmessage('Uzupe³nij wszystkie pola');

end;

procedure TForm5.Edit2Click(Sender: TObject);
begin
  opentextfiledialog1.Execute;
  if opentextfiledialog1.FileName<>'' then edit2.Text:=opentextfiledialog1.FileName;
end;

procedure TForm5.RadioGroup1Click(Sender: TObject);
begin
  if (radiogroup1.ItemIndex=1) then groupbox2.Enabled:=true
  else groupbox2.Enabled:=false;
end;

end.
