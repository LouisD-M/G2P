unit Unit9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    PaintBox1: TPaintBox;
    procedure FormCreate(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
  private
    FNombre: Integer;
  public
    procedure SetNombre(Value: Integer);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FNombre := 12; // Valeur initiale à afficher
  PaintBox1.Width := 120;
  PaintBox1.Height := 120;
end;

procedure TForm1.PaintBox1Paint(Sender: TObject);
var
  CentreX, CentreY: Integer;
  Texte: string;
  TexteWidth, TexteHeight: Integer;
begin
  with PaintBox1.Canvas do
  begin
    // Dessin du cercle
    Brush.Color := clSkyBlue;
    Pen.Color := clTeal;
    Pen.Width := 2;
    Ellipse(0, 0, PaintBox1.Width, PaintBox1.Height);

    // Préparation du texte
    Font.Size := 14;
    Font.Style := [fsBold];
    Font.Color := clBlack;
    Texte := IntToStr(FNombre);

    TexteWidth := TextWidth(Texte);
    TexteHeight := TextHeight(Texte);

    // Centrage du texte
    CentreX := (PaintBox1.Width - TexteWidth) div 2;
    CentreY := (PaintBox1.Height - TexteHeight) div 2;

    TextOut(CentreX, CentreY, Texte);
  end;
end;

procedure TForm1.SetNombre(Value: Integer);
begin
  FNombre := Value;
  PaintBox1.Repaint;
end;





end.
