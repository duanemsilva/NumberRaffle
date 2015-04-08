unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,Rpdevice, Vcl.Buttons,
   RpDefine, FileCtrl , RpBase, RpSystem, Data.DB, Datasnap.DBClient, Unit1,
  Vcl.Samples.Spin;

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    BitBtn4: TBitBtn;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    cds: TClientDataSet;
    cdsnumero: TIntegerField;
    RvSystem1: TRvSystem;
    BitBtn2: TBitBtn;
    GroupBox3: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    BalloonHint1: TBalloonHint;
    cdsFotos: TClientDataSet;
    cdsFotosid: TIntegerField;
    cdsFotosnome: TStringField;
    cdsFotosverificado: TBooleanField;
    cdsN: TClientDataSet;
    cdsNId: TIntegerField;
    Edit1: TEdit;
    UpDown1: TUpDown;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure RvSystem1Print(Sender: TObject);
    procedure bloqueio;
    procedure preencherNumeros;
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure UpDown1ChangingEx(Sender: TObject; var AllowChange: Boolean;
      NewValue: SmallInt; Direction: TUpDownDirection);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Localizar(Local: string);
  end;

var
  Form2: TForm2;

implementation

uses
  frxClass;

{$R *.dfm}
procedure TForm2.RadioButton1Click(Sender: TObject);
begin
  bloqueio;
end;

procedure TForm2.RadioButton2Click(Sender: TObject);
begin
  bloqueio;
end;

procedure TForm2.RvSystem1Print(Sender: TObject);
 Var Factor      : Double;
    CurLabel    : Integer;
    CurCol      : Double;
    CurRow      : Double;
    MarginTop   : Double;
    MarginLeft  : Double;
    LabelRow    : Integer;
    LabelRows   : Integer;
    LabelCols   : Integer;
    LabelWidth  : Double;
    LabelHeight : Double;

begin

   MarginLeft  := 1;
   MarginTop   := 1;
   LabelWidth  := 2;
   LabelHeight := 2;
   LabelRows   := 15;
   LabelCols   := 10;

   CurLabel := 0;
   LabelRow := 0;

   cds.Open;
   RVSystem1.BaseReport.SetFont('Arial',12);

   cds.First;
   While not cds.Eof do Begin
       Factor   := (CurLabel Mod LabelCols);
       CurCol   := (Factor*LabelWidth)+MarginLeft;
       CurRow   := (LabelRow * LabelHeight) + MarginTop;

       RVSystem1.BaseReport.GotoXY(CurCol,CurRow-0.04);
       RVSystem1.BaseReport.Bold := True;
       RVSystem1.BaseReport.PrintLeft( cds.FieldByName('numero').AsString,CurCol);
       RVSystem1.BaseReport.Bold := False;

       RVSystem1.BaseReport.GotoXY(CurCol,CurRow);
       Inc(CurLabel);
       If Factor=LabelCols-1 Then Inc(LabelRow);
       If LabelRow>=LabelRows Then Begin
          LabelRow := 0;
          RVSystem1.BaseReport.NewPage;
       End;
       cds.Next;
   End;
end;

procedure TForm2.UpDown1ChangingEx(Sender: TObject; var AllowChange: Boolean;
  NewValue: SmallInt; Direction: TUpDownDirection);
  var  numero : integer;
begin
  numero := strtoint(trim(Edit1.Text));
    if numero <= 1 then
        Edit1.Text := '2';
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
//  OpenDialog1.Execute();
//  CaminhoFoto := OpenDialog1.FileName;
var
Dir: string;
begin
Dir := 'C:';
if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt],1000) then
   Edit2.Text := Dir;
   CaminhoFoto := Dir;
   Localizar(dir);
   Edit1.Text := IntToStr(cdsFotos.RecordCount);
end;


procedure TForm2.BitBtn2Click(Sender: TObject);
begin
 close;
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
var
i,num :integer;
relatorio : TfrxReport;
begin
  cds.EmptyDataSet;

 if Length(trim(Edit1.Text))= 0 then
    raise Exception.Create('Informe a quantidade de números que deseja imprimir!');

 num := strtoint(trim(Edit1.Text));

 for i := 1 to num do
 begin
   cds.Append;
   cdsnumero.AsInteger := i;
   cds.Post;
 end;
   RVSystem1.SystemPrinter.MarginBottom  := 1;
   RVSystem1.SystemPrinter.MarginLeft    := 1;
   RVSystem1.SystemPrinter.MarginTop     := 1;
   RVSystem1.SystemPrinter.MarginBottom  := 1;
   RVSystem1.SystemPrinter.Units         := unCM;
   RVSystem1.SystemPrinter.UnitsFactor   := 2.54;
   rpDev.Copies                          := 1;
   RVSystem1.SystemPrinter.Copies        := rpDev.Copies;
   rpDev.Orientation                     := poPortrait;
   RVSystem1.SystemPrinter.Orientation   := rpDev.Orientation;
   RVSystem1.SystemPreview.FormState     := wsMaximized;
   RVSystem1.SystemSetups := RVSystem1.SystemSetups - [ssAllowSetup];
   rpDev.SelectPaper('A4',false);
   RVSystem1.Execute;
end;

procedure TForm2.bloqueio;
begin
   if RadioButton1.Checked = true then begin
      GroupBox2.Enabled := false;
      BitBtn1.Enabled := false;
      Edit1.Enabled := true;
      BitBtn4.Enabled := true;
   end
   else begin
      GroupBox2.Enabled := true;
      BitBtn1.Enabled := true;
      bitbtn1.SetFocus;
      Edit1.Enabled := false;
      BitBtn4.Enabled := false;

   end;
end;

procedure TForm2.Edit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var numero : integer;
begin
if Length(trim((Sender as TEdit).Text)) = 1 then
  begin
    numero := strtoint(trim((Sender as TEdit).Text));
    if numero <= 1 then
        (Sender as TEdit).Text := '2';
  end;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin

      nSorteio := strtoint(StringReplace(trim(Edit1.Text),'.','',[rfReplaceAll, rfIgnoreCase]));
      if RadioButton1.Checked = true then
      begin
          nTipo := 1;
          if trim(Edit1.Text) = '0' then begin
              Edit1.SetFocus;
              form1.MouseParaControle(Edit1);
              Action := caNone;
              Exit;
          end;
          preencherNumeros;
          Form1.BitBtn2Click(nil);
          form1.StatusBar1.Panels[2].Text := 'Sorteio de Números';
          form1.GroupBox1.Caption := 'Números Sortiados';
      end
      else
      begin
          nTipo := 2;
          if Length(trim(Edit2.Text)) = 0 then begin
                BitBtn1.SetFocus;
                form1.MouseParaControle(BitBtn1);
                Action := caNone;
          end;
          Form1.BitBtn2Click(nil);
          form1.StatusBar1.Panels[2].Text := 'Sorteio de Fotos';
          form1.GroupBox1.Caption := 'Fotos Sortiadas';
      end;

end;

procedure TForm2.FormShow(Sender: TObject);
begin
    if trim(CaminhoFoto) <> '' then
        Edit2.Text := CaminhoFoto;

    if nSorteio  > 1 then
       Edit1.Text := IntToStr(nSorteio)
    else
      Edit1.Text := '2';


    bloqueio;

end;

procedure TForm2.Localizar(Local: string);
var SearchRec: TSearchRec;
  I, II  : integer;
begin

    II := 0;
    I  := 0;
    cdsFotos.Close;
    cdsFotos.Open;
    cdsFotos.EmptyDataSet;

    Local:= Trim(Local);

    if Local[length(Local)] <> '' then
        Local:= Local + '';
        SetCurrentDir(Local);

    if FindFirst('*.*', faAnyFile, SearchRec) = 0 then // modifica aqui Ex: para mp3 '*.mp3'
    Repeat

       inc(II);

       if II >= 3 then begin

         inc(I);
         cdsFotos.Insert;


            cdsFotosid.AsInteger  := i;

            cdsFotosnome.AsString :=  SearchRec.Name;

            cdsFotosverificado.AsBoolean := false;

         cdsFotos.Post;
       end;

    Until FindNext(SearchRec) <> 0; begin
       FindClose(SearchRec);

    end;

end;

procedure TForm2.preencherNumeros;
var i : integer;
begin
	  cdsN.Close;
      cdsn.Open;
      cdsn.EmptyDataSet;

      for i := 1 to nSorteio do
      begin
        cdsn.Insert;
        cdsNId.AsInteger := i;
        cdsn.Post;
      end;
end;

end.

