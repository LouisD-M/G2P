object Form7: TForm7
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form7'
  ClientHeight = 730
  ClientWidth = 818
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 818
    Height = 730
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 818
      Height = 150
      Align = alTop
      BevelOuter = bvNone
      Color = 13758703
      ParentBackground = False
      TabOrder = 0
      object Shape1: TShape
        AlignWithMargins = True
        Left = 20
        Top = 20
        Width = 778
        Height = 110
        Margins.Left = 20
        Margins.Top = 20
        Margins.Right = 20
        Margins.Bottom = 20
        Align = alClient
        Brush.Color = 5254402
        Pen.Style = psClear
        Shape = stRoundRect
        ExplicitTop = 0
        ExplicitWidth = 640
        ExplicitHeight = 150
      end
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 818
        Height = 150
        Align = alClient
        Alignment = taCenter
        Caption = 'MODIFIER UN PROJET'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -53
        Font.Name = '^'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 575
        ExplicitHeight = 62
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 150
      Width = 818
      Height = 580
      Align = alClient
      BevelOuter = bvNone
      Color = 13758703
      ParentBackground = False
      TabOrder = 1
      object Shape2: TShape
        AlignWithMargins = True
        Left = 20
        Top = 20
        Width = 778
        Height = 540
        Margins.Left = 20
        Margins.Top = 20
        Margins.Right = 20
        Margins.Bottom = 20
        Align = alClient
        Pen.Style = psClear
        Shape = stRoundRect
        ExplicitLeft = 288
        ExplicitTop = 136
        ExplicitWidth = 65
        ExplicitHeight = 65
      end
      object Label2: TLabel
        Left = 50
        Top = 67
        Width = 68
        Height = 39
        Caption = 'Titre'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -33
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 50
        Top = 165
        Width = 172
        Height = 39
        Caption = 'Date D'#233'but '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -33
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 50
        Top = 120
        Width = 191
        Height = 39
        Caption = 'Responsable'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -33
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 50
        Top = 210
        Width = 90
        Height = 39
        Caption = 'Statut'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -33
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 50
        Top = 255
        Width = 108
        Height = 39
        Caption = 'Priorit'#233
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -33
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 50
        Top = 300
        Width = 132
        Height = 39
        Caption = 'Cout r'#233'el'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -33
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 50
        Top = 345
        Width = 169
        Height = 39
        Caption = 'Description'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -33
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 50
        Top = 390
        Width = 200
        Height = 39
        Caption = 'Commentaire'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -33
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object ComboBoxLierA: TLabel
        Left = 50
        Top = 427
        Width = 97
        Height = 39
        Caption = 'Lier '#224' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -33
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Edit2: TEdit
        Left = 287
        Top = 120
        Width = 434
        Height = 23
        TabOrder = 0
      end
      object Edit3: TEdit
        Left = 287
        Top = 165
        Width = 434
        Height = 23
        TabOrder = 1
      end
      object Edit5: TEdit
        Left = 287
        Top = 255
        Width = 434
        Height = 23
        TabOrder = 2
      end
      object Edit6: TEdit
        Left = 287
        Top = 300
        Width = 434
        Height = 23
        TabOrder = 3
      end
      object Edit7: TEdit
        Left = 287
        Top = 345
        Width = 434
        Height = 23
        TabOrder = 4
      end
      object Edit8: TEdit
        Left = 287
        Top = 390
        Width = 434
        Height = 23
        TabOrder = 5
      end
      object Panel4: TPanel
        Left = 592
        Top = 472
        Width = 129
        Height = 65
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 6
        object Shape3: TShape
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 109
          Height = 45
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alClient
          Brush.Color = 5254402
          Pen.Style = psClear
          Shape = stRoundRect
          ExplicitLeft = 74
          ExplicitTop = 18
          ExplicitWidth = 142
          ExplicitHeight = 50
        end
        object Label10: TLabel
          Left = 0
          Top = 0
          Width = 129
          Height = 65
          Align = alClient
          Alignment = taCenter
          Caption = 'Valider'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -27
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          OnClick = Label10Click
          ExplicitWidth = 84
          ExplicitHeight = 33
        end
      end
      object Panel5: TPanel
        Left = 136
        Top = 472
        Width = 114
        Height = 65
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 7
        object Shape4: TShape
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 94
          Height = 45
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
          Width = 114
          Height = 65
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
        object ComboBox1: TComboBox
          AlignWithMargins = True
          Left = 150
          Top = 75
          Width = 0
          Height = 23
          Margins.Left = 150
          Margins.Top = 75
          Margins.Right = 79
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Items.Strings = (
            'En cours'
            'Termin'#233
            'En attente')
        end
      end
      object ComboBoxStatut: TComboBox
        Left = 287
        Top = 216
        Width = 434
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        Items.Strings = (
          'En cours'
          'Termin'#233
          'En attente')
      end
      object ComboBox2: TComboBox
        AlignWithMargins = True
        Left = 150
        Top = 75
        Width = 589
        Height = 32
        Margins.Left = 150
        Margins.Top = 75
        Margins.Right = 79
        Align = alClient
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        OnChange = ComboBox2Change
        Items.Strings = (
          'En cours'
          'Termin'#233
          'En attente')
      end
      object Panel6: TPanel
        Left = 304
        Top = 472
        Width = 217
        Height = 65
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 10
        object Shape5: TShape
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 197
          Height = 45
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
        object Label12: TLabel
          Left = 0
          Top = 0
          Width = 217
          Height = 65
          Align = alClient
          Alignment = taCenter
          Caption = 'Supprimer'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -27
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          OnClick = Label12Click
          ExplicitWidth = 125
          ExplicitHeight = 33
        end
        object ComboBox3: TComboBox
          AlignWithMargins = True
          Left = 150
          Top = 75
          Width = 0
          Height = 23
          Margins.Left = 150
          Margins.Top = 75
          Margins.Right = 79
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Items.Strings = (
            'En cours'
            'Termin'#233
            'En attente')
        end
      end
      object ComboBox4: TComboBox
        Left = 287
        Top = 433
        Width = 434
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        Visible = False
        OnChange = ComboBox4Change
      end
    end
  end
end
