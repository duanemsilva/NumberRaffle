unit Unit1;

interface

uses
  Winapi.Windows,shellapi, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ImgList, Vcl.ExtCtrls, Data.DB,Rpdevice, Datasnap.DBClient, frxClass, frxDBSet,
  RpDefine, RpBase, RpSystem, Vcl.XPMan, Vcl.Menus;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    BalloonHint1: TBalloonHint;
    ImageList1: TImageList;
    Label2: TLabel;
    Timer1: TTimer;
    XPManifest1: TXPManifest;
    Label3: TLabel;
    MainMenu1: TMainMenu;
    help1: TMenuItem;
    Image1: TImage;
    Configuraes1: TMenuItem;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    ProgressBar1: TProgressBar;
    Button1: TButton;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
//    procedure RvSystem1Print(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure Reiniciarsorteio1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure SetJustify(Menu: TMenu; MenuItem: TMenuItem;
   Justify: Byte);
    procedure FormCreate(Sender: TObject);
    procedure help1Click(Sender: TObject);
    procedure Configuraes1Click(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
  private
    { Private declarations }
    numerosSorteados : array[1..10000] of integer;
    qtde : Integer;
  public
    { Public declarations }
    procedure MouseParaControle(Controle: TControl);
  end;


var
  Form1: TForm1;
  painel : Boolean;
  CaminhoFoto : string;
  nSorteio, nTipo, codFoto : integer;
  prog : Real;

implementation

{$R *.dfm}

uses Unit2;


procedure TForm1.BitBtn1Click(Sender: TObject);
var
  I,a,b,x: integer;
  numero : Integer;
  parar : Boolean;
begin
        Timer1.Enabled := false;


         if nSorteio = 0 then
         raise Exception.Create('Informe um valor para sortear!');

        Label2.Visible := true;
        Randomize;

        {
        if qtde>=StrToInt(Edit1.Text) then begin
           label3.Visible := true;
           raise Exception.Create('Atenção todos numero foram sorteados!');
        end;
        }

        numero := Random(nSorteio);
        inc(numero);
        x := 1;
        while (x<=qtde) do
        begin
          if (numero = numerosSorteados[x]) then
             begin
               numero := Random(nSorteio);
               inc(numero);
               x:= 1;
             end
          else
             inc(x);
        end;
        inc(qtde);
        numerosSorteados[qtde] := numero;

        Label2.Caption := inttostr(numero);
        if Memo1.Text = '' then
           Memo1.Text:= inttostr(numero)
        else
        Memo1.Text:= Memo1.Text+','+inttostr(numero);

        painel := true;

end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
i :integer;
begin
 for I := 1 to 1000 do
 begin
  numerosSorteados[i]:= 0;
 end;
  qtde := 0;
  Label2.Caption:='';
  label2.Visible := false;
  label3.Visible := false;
  Image1.Visible := false;
  Memo1.Clear;
  Timer1.Enabled := false;
  StatusBar1.Panels[1].Text := '';
  Statusbar1.Panels[2].Text := '';
  if nTipo = 2 then
     Form2.Localizar(CaminhoFoto)
  else
     Form2.preencherNumeros;

  Button1.Enabled := true;
  BitBtn2.Enabled := false;

  ProgressBar1.Position := 0;
  ProgressBar1.Max := 100;
  prog := 0;

end;

procedure TForm1.Button1Click(Sender: TObject);
var
num :integer;
relatorio : TfrxReport;
I,a,b,x: integer;
numero: Integer;
parar,bSortear : Boolean;
begin

 if nSorteio < 1  then
             raise Exception.Create('Informe um valor valido para o sorteio!');

 if ( ( Button1.ImageIndex = 2 ) and (form2.cdsFotos.RecordCount > 1) ) or
    ( ( Button1.ImageIndex = 2 ) and (nTipo = 1) and (form2.cdsN.RecordCount > 1) ) then
 Begin

            if qtde>= nSorteio then
            begin
                     label3.Visible := true;
                     raise Exception.Create('Atenção todos número foram sorteados!');
            end;

              Timer1.Enabled := true;
              Button1.Caption := 'Parar';
              Button1.ImageIndex := 1;
              BitBtn2.Enabled := false;

 end
 else if (form2.cdsFotos.RecordCount > 1) or ( ( nTipo = 1 ) and (form2.cdsN.RecordCount > 1) )  then
 begin

            Timer1.Enabled := false;
            Button1.Caption := 'Sortear';
            Button1.ImageIndex := 2;
            BitBtn2.Enabled := true;

            if nSorteio = 0 then
            raise Exception.Create('Informe um valor para sortear!');

            Randomize;

            numero := Random(nSorteio);
            inc(numero);
            x := 1;

            while (x<=qtde) do
            begin

              if (numero = numerosSorteados[x]) then
                 begin

                   numero := Random(nSorteio);
                   inc(numero);
                   x:= 1;

                 end
              else
                 inc(x);

            end;

           inc(qtde);
           numerosSorteados[qtde] := numero;

           if prog = 0 then
                 prog := 100 / nSorteio
           else
                 prog := prog+(100 / nSorteio);

           if pos(',',FloatToStr(prog))-1 > 0 then
                 ProgressBar1.Position := StrToInt(copy(FloatToStr(prog),0,pos(',',FloatToStr(prog))-1))
           else
                 ProgressBar1.Position := StrToInt(FloatToStr(prog));



           if nTipo <> 2  then
           begin
              Label2.Caption := inttostr(numero);
              form2.cdsN.Locate('id',numero,[]);
              form2.cdsN.Delete;

              if Memo1.Text = '' then
                 Memo1.Text:= inttostr(numero)
              else
                 Memo1.Text:= Memo1.Text+','+inttostr(numero);

              StatusBar1.Panels[1].Text := ' Total de valores sorteados: '+IntToStr(nSorteio-form2.cdsN.RecordCount);

           end
           else
           begin


             Form2.cdsFotos.Locate('id',numero,[]);

             if (Pos('.jpg',form2.cdsFotosnome.AsString) >= 1)  OR
                (Pos('.jpeg',form2.cdsFotosnome.AsString) >= 1) OR
                (Pos('.JPG',form2.cdsFotosnome.AsString) >= 1)  OR
                (Pos('.JPEG',form2.cdsFotosnome.AsString) >= 1) OR
                (Pos('.Jpg',form2.cdsFotosnome.AsString) >= 1)  OR
                (Pos('.Jpeg',form2.cdsFotosnome.AsString) >= 1) THEN
             begin

                Image1.Picture.LoadFromFile(CaminhoFoto+'\'+form2.cdsFotosnome.AsString);

                if Memo1.Text = '' then
                   Memo1.Text:= Copy(form2.cdsFotosnome.AsString,0,pos('.',form2.cdsFotosnome.AsString)-1)//,Length(form2.cdsFotosnome.AsString))
                else
                   Memo1.Text:= Memo1.Text+', '+Copy(form2.cdsFotosnome.AsString,0,pos('.',form2.cdsFotosnome.AsString)-1);
                Form2.cdsFotos.Delete;
                StatusBar1.Panels[1].Text := ' Total de valores sorteados: '+IntToStr(nSorteio-form2.cdsFotos.RecordCount);
             end;

           end;


 end
 else  if (form2.cdsFotos.RecordCount = 1) then
 begin
              Timer1.Enabled := false;
              Button1.Caption := 'Sortear';
              Button1.ImageIndex := 2;
              BitBtn2.Enabled := true;

              Form2.cdsFotos.Locate('id',numero,[]);

             if (Pos('.jpg',form2.cdsFotosnome.AsString) >= 1) or
                (Pos('.jpeg',form2.cdsFotosnome.AsString) >= 1) or
                (Pos('.JPG',form2.cdsFotosnome.AsString) >= 1) OR
                (Pos('.JPEG',form2.cdsFotosnome.AsString) >= 1) OR
                (Pos('.Jpg',form2.cdsFotosnome.AsString) >= 1) OR
                (Pos('.Jpeg',form2.cdsFotosnome.AsString) >= 1)then
             begin

                Image1.Picture.LoadFromFile(CaminhoFoto+'\'+form2.cdsFotosnome.AsString);

                if Memo1.Text = '' then
                   Memo1.Text:= Copy(form2.cdsFotosnome.AsString,0,pos('.',form2.cdsFotosnome.AsString)-1)//,Length(form2.cdsFotosnome.AsString))
                else
                   Memo1.Text:= Memo1.Text+', '+Copy(form2.cdsFotosnome.AsString,0,pos('.',form2.cdsFotosnome.AsString)-1);

                StatusBar1.Panels[1].Text := ' Sorteio Concluido! Foram sorteados '+IntToStr(nSorteio)+' Fotos.';
                Form2.cdsFotos.Delete;
                ProgressBar1.Position := 100;
                Application.MessageBox('Sorteio Concluido','Atenção',MB_OK+MB_ICONINFORMATION);
                Button1.Enabled := false;
             end;
 end
 else if (Form2.cdsN.RecordCount = 1) then
 begin
            label3.Visible := true;
            Label2.Caption := form2.cdsNId.AsString;
            Memo1.Text:= Memo1.Text+','+form2.cdsNId.AsString;
            form2.cdsN.Delete;
            StatusBar1.Panels[1].Text := ' Sorteio Concluido! Foram sorteados '+IntToStr(nSorteio)+' Numeros.';
            ProgressBar1.Position := 100;
            Application.MessageBox('Sorteio Concluido','Atenção',MB_OK+MB_ICONINFORMATION);
            //ShowMessage('Sorteio Concluido');
            BitBtn2.Enabled := true;
            Button1.Enabled := false;
 end
 else
 begin
            label3.Visible := true;
            BitBtn2.Enabled := true;
            Button1.Enabled := false;
            raise Exception.Create('Atenção todos número foram sorteados!');
 end;

        painel := true;



end;

procedure TForm1.Configuraes1Click(Sender: TObject);
begin

	 Form2.cdsFotos.EmptyDataSet;
   Form2.cdsN.EmptyDataSet;
   form2.cds.EmptyDataSet;

   if Image1.Visible or Label2.Visible then
   begin
     if  Application.MessageBox('É necessario parar o sorteio para alterar configurações!','Sorteio',MB_OKCANCEL+MB_ICONEXCLAMATION) = IDOK then
     begin
        BitBtn2Click(Self);
        Button1.Caption := 'Sortear';
        Button1.ImageIndex := 2;
        Form2.ShowModal;
     end;
   end
   else
     Form2.ShowModal;

end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    BitBtn1Click(Sender);
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    Button1Click(nil);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  ProgressBarStyle: integer;
begin
  StatusBar1.Panels[0].Style := psOwnerDraw;
  ProgressBar1.Parent := StatusBar1;
  ProgressBarStyle := GetWindowLong(ProgressBar1.Handle,GWL_EXSTYLE);
  ProgressBarStyle := ProgressBarStyle - WS_EX_STATICEDGE;
  SetWindowLong(ProgressBar1.Handle, GWL_EXSTYLE,ProgressBarStyle);

  SetJustify(MainMenu1,help1,1);

  ProgressBar1.Position := 0;
  ProgressBar1.Max := 100;

  BitBtn2.Enabled := false;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  qtde := 0;
  Memo1.Text := '';
  label3.Visible  := false;
  Timer1.Enabled  := false;

  Form2.ShowModal;

end;

procedure TForm1.help1Click(Sender: TObject);
begin
ShellAbout(Handle, 'Sorteio', 'Desenvolvedor:Duane de Moura Silva,contato: duane.silva@outlook.com', Application.Icon.Handle);
end;

procedure TForm1.MouseParaControle(Controle: TControl);
var
IrPara: TPoint;
begin
IrPara.X := Controle.Left + (Controle.Width div 2);
IrPara.Y := Controle.Top + (Controle.Height div 2);
if Controle.Parent <> nil then
IrPara := Controle.Parent.ClientToScreen(IrPara);
SetCursorPos(IrPara.X, IrPara.Y);
end;



procedure TForm1.Reiniciarsorteio1Click(Sender: TObject);
begin
BitBtn2.Click;
end;


procedure TForm1.Sair1Click(Sender: TObject);
begin
close;
end;

procedure TForm1.SetJustify(Menu: TMenu; MenuItem: TMenuItem; Justify: Byte);
  var
  ItemInfo: TMenuItemInfo;
  Buffer: array[0..80] of Char;
begin
  ItemInfo.cbSize := SizeOf(TMenuItemInfo);
  ItemInfo.fMask := MIIM_TYPE;
  ItemInfo.dwTypeData := Buffer;
  ItemInfo.cch := SizeOf(Buffer);
// Pega o TMenuItemInfo da opção desejada
  GetMenuItemInfo(Menu.Handle, MenuItem.Command, False,
    ItemInfo);
  if Justify = 1 then
    ItemInfo.fType := ItemInfo.fType or MFT_RIGHTJUSTIFY;
// Seta o novo TMenuItemInfo
  SetMenuItemInfo(Menu.Handle, MenuItem.Command, False,
    ItemInfo);
end;

procedure TForm1.StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
  const Rect: TRect);
begin

if Panel = StatusBar.Panels[0] then

  with ProgressBar1 do

  begin

    Top := Rect.Top;

    Left := Rect.Left;

    Width := Rect.Right - Rect.Left - 15;

    Height := Rect.Bottom - Rect.Top;

  end;

end;

procedure TForm1.Timer1Timer(Sender: TObject);
var foto,numero,x : integer;
begin

 if nTipo = 2 then begin

  Label2.Visible := false;

  Image1.Visible := true;

  if not Form2.cdsFotos.Eof then
     Form2.cdsFotos.next
  else
     Form2.cdsFotos.First;


         if (Pos('.jpg',form2.cdsFotosnome.AsString) >= 1) or
            (Pos('.jpeg',form2.cdsFotosnome.AsString) >= 1) or
            (Pos('.JPG',form2.cdsFotosnome.AsString) >= 1) OR
            (Pos('.JPEG',form2.cdsFotosnome.AsString) >= 1) OR
            (Pos('.Jpg',form2.cdsFotosnome.AsString) >= 1) OR
            (Pos('.Jpeg',form2.cdsFotosnome.AsString) >= 1)then
         begin
               Image1.Picture.LoadFromFile(CaminhoFoto+'\'+form2.cdsFotosnome.AsString);
         end;



 end
 else begin

  Label2.Visible := true;

  if Form2.cdsN.RecordCount > 1 then
  begin

    Randomize;
	numero := Random(nSorteio);
    inc(numero);
    x := 1;

    while (x<=qtde) do
    begin

              if (numero = numerosSorteados[x]) then
                 begin

                   numero := Random(nSorteio);
                   inc(numero);
                   x:= 1;

                 end
              else
                 inc(x);

    end;

    Label2.Caption := IntToStr(numero);
  end
  else
  begin
    Label2.Caption :=  IntToStr( Random(nSorteio));
  end;



  Image1.Visible := false;

 end;
end;

end.
