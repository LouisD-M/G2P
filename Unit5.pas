unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,   Vcl.Printers, Unit11,
  Vcl.ExtCtrls;

type
  TForm5 = class(TForm)
    Image1: TImage;
    LabelTitre: TLabel;
    LabelResponsable: TLabel;
    LabelStatut: TLabel;
    LabelPriorite: TLabel;
    LabelCout_Reel: TLabel;
    LabelDescription: TLabel;
    LabelCommentaire: Tlabel;
    BtnImprimer: TButton;
    PrintDialog1: TPrintDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    LabelDate: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Shape2: TShape;
    Shape3: TShape;
    procedure BtnImprimerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.BtnImprimerClick(Sender: TObject);
begin
  if PrintDialog1.Execute then
  begin
    Printer.BeginDoc;
    try
      // PaintTo nécessite des coordonnées entières
      Self.PaintTo(Printer.Canvas.Handle, 0, 0);
    finally
      Printer.EndDoc;
    end;
  end;
   begin
  if not Assigned(Form11) then
    Form11 := TForm11.Create(Application); // ou Self selon le contexte

  Form11.AjoutDansLog('L’utilisateur a cliqué sur le bouton "Imprimer de exporter la liste"');
  end;


end;
procedure TForm5.FormCreate(Sender: TObject);
begin
Shape2.SendToBack;
Shape3.SendToBack;

end;

end.
