object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form1'
  ClientHeight = 239
  ClientWidth = 416
  Color = 13758703
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Edit1: TEdit
    AlignWithMargins = True
    Left = 50
    Top = 77
    Width = 316
    Height = 23
    Margins.Left = 50
    Margins.Top = 20
    Margins.Right = 50
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 300
  end
  object Button1: TButton
    AlignWithMargins = True
    Left = 20
    Top = 106
    Width = 376
    Height = 66
    Margins.Left = 20
    Margins.Right = 20
    Margins.Bottom = 20
    Align = alTop
    Caption = 'JE RECHERCHE '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = 15
    ExplicitTop = 119
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 416
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel1'
    Color = 5254402
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 400
    object Shape1: TShape
      Left = 0
      Top = 0
      Width = 416
      Height = 57
      Align = alClient
      Brush.Color = 5254402
      ExplicitLeft = 32
      ExplicitTop = -24
      ExplicitWidth = 65
      ExplicitHeight = 65
    end
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 416
      Height = 57
      Align = alClient
      Alignment = taCenter
      Caption = 'Rechercher un projet , un responsable ?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 340
      ExplicitHeight = 28
    end
  end
  object Button2: TButton
    Left = 0
    Top = 208
    Width = 416
    Height = 31
    Align = alBottom
    Caption = 'Quitter'
    TabOrder = 3
    OnClick = Button2Click
  end
end
