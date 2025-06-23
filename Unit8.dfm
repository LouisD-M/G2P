object Form8: TForm8
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form8'
  ClientHeight = 1080
  ClientWidth = 1920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 622
    Width = 1920
    Height = 458
    Align = alBottom
    BevelOuter = bvNone
    Color = 13758703
    ParentBackground = False
    TabOrder = 0
    object Shape2: TShape
      AlignWithMargins = True
      Left = 20
      Top = 5
      Width = 1880
      Height = 433
      Margins.Left = 20
      Margins.Top = 5
      Margins.Right = 20
      Margins.Bottom = 20
      Align = alClient
      Pen.Style = psClear
      Shape = stRoundRect
      ExplicitLeft = 928
      ExplicitTop = 320
      ExplicitWidth = 65
      ExplicitHeight = 65
    end
    object Label3: TLabel
      Left = 58
      Top = 24
      Width = 254
      Height = 33
      Caption = 'Statistique avanc'#233's :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -27
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel5: TPanel
      Left = 120
      Top = 616
      Width = 121
      Height = 57
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object Shape4: TShape
        AlignWithMargins = True
        Left = 10
        Top = 10
        Width = 101
        Height = 37
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        Brush.Color = clRed
        Pen.Style = psClear
        Shape = stRoundRect
        ExplicitLeft = 74
        ExplicitTop = 18
        ExplicitWidth = 142
        ExplicitHeight = 50
      end
      object Label11: TLabel
        Left = 0
        Top = 0
        Width = 121
        Height = 57
        Align = alClient
        Alignment = taCenter
        Caption = 'Quitter'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -27
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        OnClick = Label11Click
        ExplicitWidth = 82
        ExplicitHeight = 33
      end
    end
    object Panel3: TPanel
      Left = 58
      Top = 63
      Width = 1000
      Height = 41
      BevelOuter = bvNone
      Color = clSilver
      ParentBackground = False
      TabOrder = 1
      object Shape3: TShape
        Left = 0
        Top = 0
        Width = 65
        Height = 41
        Align = alLeft
        Brush.Color = clMoneyGreen
        Pen.Style = psClear
        ExplicitLeft = 24
        ExplicitTop = 16
        ExplicitHeight = 65
      end
      object Label4: TLabel
        Left = 384
        Top = 0
        Width = 169
        Height = 48
        Alignment = taCenter
        Caption = 'Label4'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -40
        Font.Name = 'Roboto'
        Font.Style = [fsBold, fsItalic]
        ParentColor = False
        ParentFont = False
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1920
    Height = 622
    Align = alClient
    BevelOuter = bvNone
    Color = 13758703
    ParentBackground = False
    TabOrder = 1
    ExplicitHeight = 380
    object Shape1: TShape
      AlignWithMargins = True
      Left = 20
      Top = 20
      Width = 1880
      Height = 582
      Margins.Left = 20
      Margins.Top = 20
      Margins.Right = 20
      Margins.Bottom = 20
      Align = alClient
      Pen.Style = psClear
      Shape = stRoundRect
      ExplicitLeft = 336
      ExplicitTop = 104
      ExplicitWidth = 65
      ExplicitHeight = 65
    end
    object Label1: TLabel
      Left = 58
      Top = 104
      Width = 151
      Height = 33
      Caption = 'Projet Li'#233's : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -27
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 602
      Top = 104
      Width = 208
      Height = 33
      Caption = 'Projet Principal : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -27
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelProjetSelectionne: TLabel
      Left = 58
      Top = 65
      Width = 232
      Height = 33
      Caption = 'Projet selectionn'#233' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -27
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ComboBox1: TComboBox
      Left = 58
      Top = 42
      Width = 1799
      Height = 23
      TabOrder = 0
      OnChange = ComboBox1Change
    end
  end
end
