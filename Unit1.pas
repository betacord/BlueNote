unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ImgList;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    Plik1: TMenuItem;
    Opcje1: TMenuItem;
    Koniec1: TMenuItem;
    Ustawienia1: TMenuItem;
    Memo1: TMemo;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    GroupBox2: TGroupBox;
    ComboBox2: TComboBox;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    Memo2: TMemo;
    CheckBox1: TCheckBox;
    DateTimePicker2: TDateTimePicker;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    Dodajnauczycieladobazy1: TMenuItem;
    Przejrzyjwszystkichnauczycieliwbazie1: TMenuItem;
    Importujlistnauczycieli1: TMenuItem;
    Pomoc1: TMenuItem;
    Oprogramie1: TMenuItem;
    ImageList1: TImageList;
    procedure Koniec1Click(Sender: TObject);
    procedure Ustawienia1Click(Sender: TObject);
    procedure wczytajnauczycieli;
    procedure ComboBox1CloseUp(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Dodajnauczycieladobazy1Click(Sender: TObject);
    procedure Przejrzyjwszystkichnauczycieliwbazie1Click(Sender: TObject);
    procedure Importujlistnauczycieli1Click(Sender: TObject);
    procedure Oprogramie1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    pbaza : shortstring;
    pnotatki : shortstring;
  end;

var
  Form1: TForm1;
  nauczyciele : tstringlist;
  ilnauczycieli : integer=0;
  ids : tstringlist;

implementation

{$R *.dfm}

uses Unit2, Unit3, Unit4, Unit5;

procedure tform1.wczytajnauczycieli;
var
  p : textfile;
  s : string;
  nazw : shortstring;
  idn : shortstring;
  i : integer;
  z : byte;
begin
  nauczyciele:=tstringlist.Create;
  ids:=tstringlist.Create;
  if fileexists(form1.pbaza) then
  begin
    assignfile(p,form1.pbaza);
    reset(p);
    while not eof(p) do
    begin
      readln(p,s);
      if s[length(s)]='a' then
      begin
        ilnauczycieli:=ilnauczycieli+1;
        idn:='';
        nazw:='';
        for I := 1 to length(s) do if s[i]='|' then z:=i;
        for I := 1 to z-1 do idn:=idn+s[i];
        for I := z+1 to length(s)-2 do nazw:=nazw+s[i];
        nauczyciele.Add(nazw);
        ids.Add(idn);
      end;
    end;
    combobox1.Items.Assign(nauczyciele);
    combobox2.Items.Assign(nauczyciele);
    closefile(p);
  end
  else
  begin
    showmessage('Plik bazy nauczycieli nie istnieje');
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  p : textfile;
  idn, iln, i : integer;
  nazw, dat : shortstring;
  t : shortstring;
  note, note1 : string;
  e : boolean;
begin
  if (combobox2.ItemIndex>-1) and (memo2.Text<>'') then
  begin
    e:=false;
    idn:=combobox2.ItemIndex+1;
    nazw:=nauczyciele[idn-1];
    note1:='';
    if checkbox1.Checked=true then dat:=datetostr(datetimepicker1.Date)
    else dat:=datetostr(datetimepicker1.Date)+' - '+datetostr(datetimepicker2.Date);
    if fileexists(form1.pnotatki) then
    begin
      note:=memo2.Text;
      for I := 1 to length(note) do if (note[i]=#13) or (note[i]=#13#10) then e:=true;
      if e=true then for I := 1 to length(note)-2 do note1:=note1+note[i]
      else note1:=note;
      iln:=0;
      assignfile(p,form1.pnotatki);
      reset(p);
      while not eof(p) do
      begin
        readln(p,t);
        iln:=iln+1;
      end;
      append(p);
      iln:=iln+1;
      writeln(p,inttostr(iln)+'|'+inttostr(idn)+'|'+nazw+'|'+dat+'|'+note1+' a');
      closefile(p);
      showmessage('Notatka zosta³a dodana');
      memo2.Clear;
      combobox2.itemindex:=-1;
      combobox2.Text:='Wybierz z listy';
    end;
  end
  else showmessage('Uzupe³nij wszystkie pola');
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if checkbox1.Checked=true then datetimepicker2.Enabled:=false;
  if checkbox1.Checked=false then datetimepicker2.Enabled:=true;

end;

procedure TForm1.ComboBox1CloseUp(Sender: TObject);
var
  idn, i, iln : integer;
  z : array[1..4] of byte;
  p : textfile;
  s : string;
  idz : byte;
  idn1, dat, note : shortstring;
begin
  memo1.Clear;
  iln:=0;
  idn:=combobox1.ItemIndex+1;
  if fileexists(form1.pnotatki) then
  begin
    assignfile(p,form1.pnotatki);
    reset(p);
    while not eof(p) do
    begin
      idn1:='';
      idz:=0;
      readln(p,s);
      for I := 1 to length(s) do
      if s[i]='|' then
      begin
        idz:=idz+1;
        z[idz]:=i;
      end;
      for I := z[1]+1 to z[2]-1 do idn1:=idn1+s[i];
      if (strtoint(idn1)=idn) and (s[length(s)]='a') then
      begin
        dat:='';
        note:='';
        for I := z[3]+1 to z[4]-1 do dat:=dat+s[i];
        for I := z[4]+1 to length(s)-2 do note:=note+s[i];
        iln:=iln+1;
        memo1.Lines.Add('Data: '+dat+': '+note);
      end;
    end;
    if iln=0 then memo1.Lines.Add('Brak uwag');
    closefile(p);
  end
  else showmessage('Plik z notatkami nie istnieje');
end;

procedure TForm1.Dodajnauczycieladobazy1Click(Sender: TObject);
begin
  form3.show;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  formatsettings.ShortDateFormat:='dd.MM.yyyy';
  formatsettings.LongDateFormat:='dd.MM.yyyy';
  datetimepicker1.Date:=now;
  datetimepicker2.Date:=now;
  memo2.Lines.Delete(0);
end;

procedure TForm1.Importujlistnauczycieli1Click(Sender: TObject);
begin
  form5.show;
end;

procedure TForm1.Koniec1Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.Oprogramie1Click(Sender: TObject);
begin
  showmessage('© 2014 Tomasz Krzywicki '+#13+'www.krzywicki.pro'+#13+'Aplikacja rozpowszechniana jest na licencji freeware z mo¿liwoœci¹ zastosowania komercyjnego.'+#13+'Rozpowszechnianie mile widziane.');
end;

procedure TForm1.Przejrzyjwszystkichnauczycieliwbazie1Click(Sender: TObject);
begin
  form4.show;
end;

procedure TForm1.Ustawienia1Click(Sender: TObject);
begin
  form2.show;
end;

end.
