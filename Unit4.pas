unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm4 = class(TForm)
    StringGrid1: TStringGrid;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure filtruj(a : shortstring; f : byte);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1CloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses unit1;

function rozmiar(FileName : String) : Integer;
var
  Plik : TSearchRec;
begin
  if FindFirst(FileName, faAnyFile, Plik) = 0 then
    Result := Plik.Size
  else
    Result := -1;
  FindClose(Plik);
end;

procedure TForm4.BitBtn1Click(Sender: TObject);
begin
  if (combobox1.ItemIndex=1) or (combobox1.ItemIndex=2) then
  begin
    if length(edit1.Text)>0 then filtruj(edit1.Text,combobox1.ItemIndex)
    else showmessage('Uzupe³nij pole wyszukiwania');
  end
  else
  begin
    if rozmiar(form1.pbaza)>0 then filtruj('a',combobox1.ItemIndex)
    else
    begin
      showmessage('Brak nauczycieli w bazie');
      stringgrid1.rowcount:=2;
    end;
  end;
end;

procedure TForm4.ComboBox1CloseUp(Sender: TObject);
begin
  if combobox1.ItemIndex=1 then edit1.NumbersOnly:=true
  else edit1.NumbersOnly:=false;
end;

procedure tform4.filtruj(a: ShortString; f: Byte);
var
  p : textfile;
  s : shortstring;
  i, z : byte;
  nazw, idn, akt : shortstring;
  iln : integer;
  naucz, ids, akts : tstringlist;
begin
  assignfile(p,form1.pbaza);
  reset(p);
  if f=0 then
  begin
    edit1.Clear;
    iln:=0;
    naucz:=tstringlist.Create;
    ids:=tstringlist.Create;
    akts:=tstringlist.Create;
    while not eof(p) do
    begin
      inc(iln);
      nazw:='';
      idn:='';
      readln(p,s);
      for I := 1 to length(s) do if s[i]='|' then z:=i;
      for I := 1 to z-1 do idn:=idn+s[i];
      for I := z+1 to length(s)-2 do nazw:=nazw+s[i];
      if s[length(s)]='a' then akt:='Aktywny'
      else akt:='Nieaktywny';
      naucz.Add(nazw);
      ids.Add(idn);
      akts.Add(akt);
    end;
    stringgrid1.RowCount:=iln+1;
    for I := 0 to iln-1 do
    begin
      stringgrid1.Cells[0,i+1]:=ids[i];
      stringgrid1.Cells[1,i+1]:=naucz[i];
      stringgrid1.Cells[2,i+1]:=akts[i];
    end;
    akts.Free;
    naucz.Free;
    ids.Free;
  end;
  if f=1 then
  begin
    stringgrid1.RowCount:=2;
    while not eof(p) do
    begin
      readln(p,s);
      for I := 1 to length(s) do if s[i]='|' then z:=i;
      idn:='';
      for I := 1 to z-1 do idn:=idn+s[i];
      nazw:='';
      for I := z+1 to length(s)-2 do nazw:=nazw+s[i];
      if s[length(s)]='a' then akt:='Aktywny'
      else akt:='Nieaktywny';
      if a=idn then
      begin
        stringgrid1.Cells[0,1]:=idn;
        stringgrid1.Cells[1,1]:=nazw;
        stringgrid1.Cells[2,1]:=akt;
      end;
    end;
  end;
  if f=2 then
  begin
    iln:=0;
    naucz:=tstringlist.Create;
    ids:=tstringlist.Create;
    akts:=tstringlist.Create;
    while not eof(p) do
    begin
      nazw:='';
      idn:='';
      readln(p,s);
      for I := 1 to length(s) do if s[i]='|' then z:=i;
      for I := 1 to z-1 do idn:=idn+s[i];
      for I := z+1 to length(s)-2 do nazw:=nazw+s[i];
      if s[length(s)]='a' then akt:='Aktywny'
      else akt:='Nieaktywny';
      if nazw=a then
      begin
        inc(iln);
        naucz.Add(nazw);
        ids.Add(idn);
        akts.Add(akt);
      end;
    end;
    if iln>0 then
    begin
      stringgrid1.RowCount:=iln+1;
      for I := 0 to iln-1 do
      begin
        stringgrid1.Cells[0,i+1]:=ids[i];
        stringgrid1.Cells[1,i+1]:=naucz[i];
        stringgrid1.Cells[2,i+1]:=akts[i];
      end;
    end
    else showmessage('Nic nie znaleziono');
    akts.Free;
    naucz.Free;
    ids.Free;
  end;
  if f=3 then
  begin
    iln:=0;
    naucz:=tstringlist.Create;
    ids:=tstringlist.Create;
    akts:=tstringlist.Create;
    while not eof(p) do
    begin
      nazw:='';
      idn:='';
      readln(p,s);
      for I := 1 to length(s) do if s[i]='|' then z:=i;
      for I := 1 to z-1 do idn:=idn+s[i];
      for I := z+1 to length(s)-2 do nazw:=nazw+s[i];
      if s[length(s)]='a' then akt:='Aktywny'
      else akt:='Nieaktywny';
      if akt='Aktywny' then
      begin
        inc(iln);
        naucz.Add(nazw);
        ids.Add(idn);
        akts.Add(akt);
      end;
    end;
    if iln>0 then
    begin
      stringgrid1.RowCount:=iln+1;
      for I := 0 to iln-1 do
      begin
        stringgrid1.Cells[0,i+1]:=ids[i];
        stringgrid1.Cells[1,i+1]:=naucz[i];
        stringgrid1.Cells[2,i+1]:=akts[i];
      end;
    end
    else showmessage('Nic nie znaleziono');
    akts.Free;
    naucz.Free;
    ids.Free;
  end;
  if f=4 then
  begin
    iln:=0;
    naucz:=tstringlist.Create;
    ids:=tstringlist.Create;
    akts:=tstringlist.Create;
    while not eof(p) do
    begin
      nazw:='';
      idn:='';
      readln(p,s);
      for I := 1 to length(s) do if s[i]='|' then z:=i;
      for I := 1 to z-1 do idn:=idn+s[i];
      for I := z+1 to length(s)-2 do nazw:=nazw+s[i];
      if s[length(s)]='a' then akt:='Aktywny'
      else akt:='Nieaktywny';
      if akt='Nieaktywny' then
      begin
        inc(iln);
        naucz.Add(nazw);
        ids.Add(idn);
        akts.Add(akt);
      end;
    end;
    if iln>0 then
    begin
      stringgrid1.RowCount:=iln+1;
      for I := 0 to iln-1 do
      begin
        stringgrid1.Cells[0,i+1]:=ids[i];
        stringgrid1.Cells[1,i+1]:=naucz[i];
        stringgrid1.Cells[2,i+1]:=akts[i];
      end;
    end
    else showmessage('Nic nie znaleziono');
    akts.Free;
    naucz.Free;
    ids.Free;
  end;
  closefile(p);
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  stringgrid1.ColWidths[0]:=100;
  stringgrid1.ColWidths[1]:=200;
  stringgrid1.ColWidths[2]:=105;
  stringgrid1.Cells[0,0]:='ID Nauczyciela';
  stringgrid1.Cells[1,0]:='Nazwisko i imiê nauczyciela';
  stringgrid1.Cells[2,0]:='Aktywnoœæ w bazie';
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  if rozmiar(form1.pbaza)>0 then filtruj('a',0)
  else
  begin
    showmessage('Brak nauczycieli w bazie');
    stringgrid1.rowcount:=2;
  end;
end;

end.
