object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Configura'#231#245'es'
  ClientHeight = 269
  ClientWidth = 365
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    365
    269)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 73
    Width = 349
    Height = 65
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Sorteio Atraves de Numeros'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      349
      65)
    object Label1: TLabel
      Left = 17
      Top = 29
      Width = 65
      Height = 13
      Caption = 'Sortear at'#233
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BitBtn4: TBitBtn
      Left = 167
      Top = 24
      Width = 173
      Height = 25
      Hint = 'Imprimir n'#250'meros para sorteio'
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Imprimir N'#250'meros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFF9D98989A95959A95959A95959A95959A95959A95959D9898FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7C7A797C7A799A9595FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF9A95957C7A797C7A79FFFFFFFFFFFFFFFFFFFFFFFF
        7C7A792424269A9595FFFFFFF9F9F9F9F9F9F9F9F9F9F9F9FFFFFF9A95952424
        267C7A79FFFFFFFFFFFF7C7A797C7A797C7A792424269A9595FFFFFFF7F7F7F7
        F7F7F7F7F7F7F7F7FFFFFF9A95952424267C7A797C7A797C7A797C7A79F5F5F5
        7C7A792424269A9696E3E3E3DADADADADADADADADADADADAE3E3E39C97972424
        267C7A79F5F5F57C7A797C7A79F0F0F07C7A797C7A797C7A797C7A797C7A797C
        7A797C7A797C7A797C7A797C7A797C7A797C7A79EEEEEE7C7A797C7A79F8F8F8
        EBEBECF6F7FAC7BDB0CAC2B5CAC2B5CAC2B5CAC2B5CAC2B5CAC2B5C7BEAFF5F5
        F7EBECEDF6F6F67C7A797C7A79FFFFFFFAFDFF93703893703893703893703893
        7038937038937038937038937038937038FAFEFFFDFDFD7C7A797C7A79FFFFFF
        FEFFFF937038E6D592E0D091E0D091E0D091E0D091E0D091E0D091E6D6939370
        38FFFFFFFFFFFF7C7A797C7A79FFFFFFFFFFFF937038ECDE99E6D897E6D897E6
        D897E6D897E6D897E6D897EDDE9A937038FFFFFFFFFFFF7C7A797C7A79FFFFFF
        FFFFFF937038DCC680D7C180D7C180D7C180D7C180D7C180D7C180DDC6819370
        38FFFFFFFFFFFF7C7A797C7A797C7A797C7A7993703893703893703893703893
        703893703891713B92723C9370389370387C7A797C7A797C7A79FFFFFFFFFFFF
        FFFFFFFFFFFF7C7A79FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7C7A79FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7C7A79FFFFFFF9F9F9F9
        F9F9F9F9F9F9F9F9FFFFFF7C7A79FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF7C7A79FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7C7A79FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7C7A797C7A797C7A797C
        7A797C7A797C7A797C7A797C7A79FFFFFFFFFFFFFFFFFFFFFFFF}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn4Click
    end
    object Edit1: TEdit
      Left = 88
      Top = 26
      Width = 57
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 4
      NumbersOnly = True
      ParentFont = False
      TabOrder = 1
      Text = '2'
      OnKeyUp = Edit1KeyUp
    end
    object UpDown1: TUpDown
      Left = 145
      Top = 26
      Width = 16
      Height = 21
      Associate = Edit1
      Min = 2
      Max = 99999
      Position = 2
      TabOrder = 2
      OnChangingEx = UpDown1ChangingEx
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 142
    Width = 349
    Height = 90
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Sorteio Atraves de Fotos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      349
      90)
    object Label2: TLabel
      Left = 17
      Top = 24
      Width = 292
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Aten'#231#227'o '#233' necess'#225'rio que as fotos sejam do barramento jpg '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label3: TLabel
      Left = 17
      Top = 43
      Width = 95
      Height = 13
      Caption = 'Pasta das Imagens:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Edit2: TEdit
      Left = 17
      Top = 62
      Width = 291
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TextHint = 'Pasta da Foto'
    end
    object BitBtn1: TBitBtn
      Left = 314
      Top = 59
      Width = 26
      Height = 25
      Hint = 'Fotos|Selecione a pasta onde se encontram as fotos|4'
      CustomHint = BalloonHint1
      Anchors = [akTop, akRight]
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object BitBtn2: TBitBtn
    Left = 282
    Top = 236
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 8
    Width = 349
    Height = 60
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Tipo do Sorteio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    DesignSize = (
      349
      60)
    object RadioButton1: TRadioButton
      Left = 17
      Top = 28
      Width = 113
      Height = 17
      Caption = 'Por Numeros'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 267
      Top = 28
      Width = 66
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Por Fotos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = RadioButton2Click
    end
  end
  object cds: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'numero'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 8
    Top = 224
    Data = {
      290000009619E0BD0100000018000000010000000000030000002900066E756D
      65726F04000100000000000000}
    object cdsnumero: TIntegerField
      FieldName = 'numero'
    end
  end
  object RvSystem1: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'Rave Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    OnPrint = RvSystem1Print
    Left = 192
    Top = 224
  end
  object BalloonHint1: TBalloonHint
    Images = Form1.ImageList1
    Left = 128
    Top = 224
  end
  object cdsFotos: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'nome'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'verificado'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 40
    Top = 224
    Data = {
      510000009619E0BD010000001800000003000000000003000000510002696404
      00010000000000046E6F6D65020049000000010005574944544802000200F401
      0A7665726966696361646F02000300000000000000}
    object cdsFotosid: TIntegerField
      FieldName = 'id'
    end
    object cdsFotosnome: TStringField
      FieldName = 'nome'
      Size = 500
    end
    object cdsFotosverificado: TBooleanField
      FieldName = 'verificado'
    end
  end
  object cdsN: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 80
    Top = 224
    Data = {
      250000009619E0BD010000001800000001000000000003000000250002496404
      000100000000000000}
    object cdsNId: TIntegerField
      FieldName = 'Id'
    end
  end
end
