unit Courbestats;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, Math;

type
  TFormCourbeStats = class(TForm)
    PaintBox1: TPaintBox;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);

    procedure PaintBox1Paint(Sender: TObject);
  private
    FPourcentage: Integer;
  public
  procedure MettreAJourPourcentage(valeur: Integer);
  procedure AfficherPourcentage(val: Integer);
  end;

var
  FormCourbeStats: TFormCourbeStats;

implementation

{$R *.dfm}

procedure TFormCourbeStats.FormCreate(Sender: TObject);
begin
 // FPourcentage := 0;

  Label1.Caption := 'Remplissage : 0 %';
end;

procedure TFormCourbeStats.PaintBox1Paint(Sender: TObject);
var
  R: TRect;
  Center: TPoint;
  Radius, InnerRadius: Integer;
  EndAngleDeg: Double;
  StartX, StartY, EndX, EndY: Integer;
begin
  // Zone du cercle principal
  R := Rect(10, 10, 210, 210);

  // Efface tout le fond
  PaintBox1.Canvas.Brush.Color := clWhite;
  PaintBox1.Canvas.FillRect(PaintBox1.ClientRect);

  // Centre et rayon
  Center.X := (R.Left + R.Right) div 2;
  Center.Y := (R.Top + R.Bottom) div 2;
  Radius := (R.Right - R.Left) div 2;

  // ✅ 1. Cercle de fond gris clair
  PaintBox1.Canvas.Pen.Style := psClear;
  PaintBox1.Canvas.Brush.Color := clYellow;
  PaintBox1.Canvas.Ellipse(R);


  if FPourcentage = 0 then
   begin
    // Cas spécial : on dessine un cercle complet
    PaintBox1.Canvas.Brush.Color := clSilver;
    PaintBox1.Canvas.Ellipse(R);
  end
  else if FPourcentage > 0 then
  begin
    EndAngleDeg := -90 + (360 * FPourcentage / 100);

    StartX := Center.X + Round(Radius * Cos(DegToRad(-90)));
    StartY := Center.Y + Round(Radius * Sin(DegToRad(-90)));

    EndX := Center.X + Round(Radius * Cos(DegToRad(EndAngleDeg)));
    EndY := Center.Y + Round(Radius * Sin(DegToRad(EndAngleDeg)));

    PaintBox1.Canvas.Brush.Color := clSilver;
    PaintBox1.Canvas.Pie(R.Left, R.Top, R.Right, R.Bottom,
                         StartX, StartY, EndX, EndY);
  end;
    if FPourcentage = 100 then
   begin
    // Cas spécial : on dessine un cercle complet
    PaintBox1.Canvas.Brush.Color := clYellow;
    PaintBox1.Canvas.Ellipse(R);
  end;

  // ✅ 3. Cercle intérieur blanc (effet roue)
  InnerRadius := Radius - 30;
  PaintBox1.Canvas.Brush.Color := clWhite;
  PaintBox1.Canvas.Ellipse(
    Center.X - InnerRadius, Center.Y - InnerRadius,
    Center.X + InnerRadius, Center.Y + InnerRadius
  );
end;


procedure TFormCourbeStats.MettreAJourPourcentage(valeur: Integer);
begin
  FPourcentage := EnsureRange(valeur, 0, 100);
  PaintBox1.Invalidate;
end;


procedure TFormCourbeStats.AfficherPourcentage(val: Integer);
begin
  FPourcentage := EnsureRange(val, 0, 100);
  PaintBox1.Invalidate;
end;



end.

