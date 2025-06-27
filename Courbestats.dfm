object FormCourbeStats: TFormCourbeStats
  Left = 0
  Top = 0
  Caption = 'FormCourbeStats'
  ClientHeight = 216
  ClientWidth = 223
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object PaintBox1: TPaintBox
    Left = -7
    Top = 0
    Width = 224
    Height = 210
    OnPaint = PaintBox1Paint
  end
  object Label1: TLabel
    Left = 80
    Top = 88
    Width = 34
    Height = 15
    Caption = 'Label1'
  end
end
