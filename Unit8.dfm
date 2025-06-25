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
    Top = 425
    Width = 1920
    Height = 655
    Align = alClient
    BevelOuter = bvNone
    Color = 13758703
    ParentBackground = False
    TabOrder = 0
    object Shape2: TShape
      AlignWithMargins = True
      Left = 20
      Top = 5
      Width = 1880
      Height = 630
      Margins.Left = 20
      Margins.Top = 5
      Margins.Right = 20
      Margins.Bottom = 20
      Align = alClient
      Pen.Style = psClear
      Shape = stRoundRect
      ExplicitLeft = -92
      ExplicitTop = 8
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
    object Label6: TLabel
      Left = 40
      Top = 73
      Width = 148
      Height = 33
      Caption = '% en attente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -27
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 40
      Top = 129
      Width = 133
      Height = 33
      Caption = '% termin'#233's'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -27
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 300
      Top = 129
      Width = 81
      Height = 33
      Alignment = taCenter
      Caption = 'Label5'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Roboto'
      Font.Style = [fsBold, fsItalic]
      ParentColor = False
      ParentFont = False
    end
    object Label5: TLabel
      Left = 300
      Top = 73
      Width = 81
      Height = 33
      Alignment = taCenter
      Caption = 'Label5'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Roboto'
      Font.Style = [fsBold, fsItalic]
      ParentColor = False
      ParentFont = False
    end
    object Label9: TLabel
      Left = 42
      Top = 194
      Width = 131
      Height = 33
      Caption = '% en cours'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -27
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 300
      Top = 194
      Width = 81
      Height = 33
      Alignment = taCenter
      Caption = 'Label5'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Roboto'
      Font.Style = [fsBold, fsItalic]
      ParentColor = False
      ParentFont = False
    end
    object Label13: TLabel
      Left = 42
      Top = 252
      Width = 262
      Height = 33
      Caption = 'Globalit'#233's des projets'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -27
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 170
      Top = 309
      Width = 81
      Height = 33
      Alignment = taCenter
      Caption = 'Label5'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Roboto'
      Font.Style = [fsBold, fsItalic]
      ParentColor = False
      ParentFont = False
    end
    object Label14: TLabel
      Left = 442
      Top = 309
      Width = 81
      Height = 33
      Alignment = taCenter
      Caption = 'Label5'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Roboto'
      Font.Style = [fsBold, fsItalic]
      ParentColor = False
      ParentFont = False
    end
    object Label15: TLabel
      Left = 632
      Top = 309
      Width = 81
      Height = 33
      Alignment = taCenter
      Caption = 'Label5'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Roboto'
      Font.Style = [fsBold, fsItalic]
      ParentColor = False
      ParentFont = False
    end
    object Panel5: TPanel
      Left = 100
      Top = 580
      Width = 300
      Height = 47
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object Shape4: TShape
        AlignWithMargins = True
        Left = 10
        Top = 10
        Width = 280
        Height = 27
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        Brush.Color = clGreen
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
        Width = 300
        Height = 47
        Align = alClient
        Alignment = taCenter
        Caption = 'Sauvegarder en PDF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -27
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        OnClick = Label11Click
        ExplicitWidth = 245
        ExplicitHeight = 33
      end
    end
    object Panel4: TPanel
      Left = 40
      Top = 103
      Width = 1817
      Height = 20
      Margins.Top = 100
      BevelOuter = bvNone
      Color = clSilver
      ParentBackground = False
      TabOrder = 1
      object Shape5: TShape
        Left = 0
        Top = 0
        Width = 65
        Height = 20
        Align = alLeft
        Brush.Color = clMoneyGreen
        Pen.Style = psClear
        ExplicitLeft = 24
        ExplicitTop = 16
        ExplicitHeight = 65
      end
    end
    object Panel6: TPanel
      Left = 40
      Top = 160
      Width = 1817
      Height = 20
      Margins.Top = 100
      BevelOuter = bvNone
      Color = clSilver
      ParentBackground = False
      TabOrder = 2
      object Shape6: TShape
        Left = 0
        Top = 0
        Width = 65
        Height = 20
        Align = alLeft
        Brush.Color = clMoneyGreen
        Pen.Style = psClear
        ExplicitLeft = 24
        ExplicitTop = 16
        ExplicitHeight = 65
      end
    end
    object Panel7: TPanel
      Left = 40
      Top = 226
      Width = 1817
      Height = 20
      Margins.Top = 100
      BevelOuter = bvNone
      Color = clSilver
      ParentBackground = False
      TabOrder = 3
      object Shape7: TShape
        Left = 0
        Top = 0
        Width = 65
        Height = 20
        Align = alLeft
        Brush.Color = clMoneyGreen
        Pen.Style = psClear
        ExplicitLeft = 24
        ExplicitTop = 16
        ExplicitHeight = 65
      end
    end
    object Panel8: TPanel
      Left = 40
      Top = 283
      Width = 1817
      Height = 20
      Margins.Top = 100
      BevelOuter = bvNone
      Color = clSilver
      ParentBackground = False
      TabOrder = 4
      object Shape10: TShape
        Left = 450
        Top = 0
        Width = 65
        Height = 20
        Align = alLeft
        Brush.Color = clGradientActiveCaption
        Pen.Style = psClear
        ExplicitLeft = 24
        ExplicitTop = 16
        ExplicitHeight = 65
      end
      object Shape8: TShape
        Left = 0
        Top = 0
        Width = 385
        Height = 20
        Align = alLeft
        Brush.Color = clMoneyGreen
        Pen.Style = psClear
        ExplicitLeft = 2
      end
      object Shape9: TShape
        Left = 385
        Top = 0
        Width = 65
        Height = 20
        Align = alLeft
        Brush.Color = clOrange
        Pen.Style = psClear
        ExplicitLeft = 24
        ExplicitTop = 16
        ExplicitHeight = 65
      end
    end
    object Panel9: TPanel
      Left = 400
      Top = 580
      Width = 180
      Height = 47
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 5
      object Shape11: TShape
        AlignWithMargins = True
        Left = 10
        Top = 10
        Width = 160
        Height = 27
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
      object Label16: TLabel
        Left = 0
        Top = 0
        Width = 180
        Height = 47
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
        OnClick = Label16Click
        ExplicitLeft = -280
        ExplicitTop = -136
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1920
    Height = 425
    Align = alTop
    BevelOuter = bvNone
    Color = 13758703
    ParentBackground = False
    TabOrder = 1
    object Shape1: TShape
      AlignWithMargins = True
      Left = 20
      Top = 20
      Width = 1880
      Height = 385
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
    object Panel3: TPanel
      Left = 592
      Top = 150
      Width = 1265
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
        Left = 648
        Top = -7
        Width = 121
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
end
