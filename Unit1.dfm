object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 200
  ClientWidth = 400
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
    Width = 300
    Height = 23
    Margins.Left = 50
    Margins.Top = 20
    Margins.Right = 50
    Align = alTop
    TabOrder = 0
  end
  object Button1: TButton
    AlignWithMargins = True
    Left = 20
    Top = 106
    Width = 360
    Height = 74
    Margins.Left = 20
    Margins.Right = 20
    Margins.Bottom = 20
    Align = alClient
    Caption = 'JE RECHERCHE '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 1
    ExplicitHeight = 72
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 400
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel1'
    Color = 5254402
    ParentBackground = False
    TabOrder = 2
    object Shape1: TShape
      Left = 0
      Top = 0
      Width = 400
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
      Width = 400
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
end
