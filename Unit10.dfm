object Form10: TForm10
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Exporter un projet'
  ClientHeight = 350
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 20
    Top = 20
    Width = 136
    Height = 15
    Caption = 'S'#195#169'lectionnez un projet :'
  end
  object ComboBoxProjets: TComboBox
    Left = 20
    Top = 45
    Width = 300
    Height = 23
    Style = csDropDownList
    TabOrder = 0
  end
  object MemoExport: TMemo
    Left = 20
    Top = 85
    Width = 460
    Height = 180
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object BtnExporter: TButton
    Left = 20
    Top = 280
    Width = 150
    Height = 30
    Caption = 'Exporter le projet'
    TabOrder = 2
    OnClick = BtnExporterClick
  end
  object BtnFermer: TButton
    Left = 330
    Top = 280
    Width = 150
    Height = 30
    Caption = 'Fermer'
    TabOrder = 3
    OnClick = BtnFermerClick
  end
end
