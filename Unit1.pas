unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, unit11;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Shape1: TShape;
    Panel1: TPanel;
    Label1: TLabel;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
 begin
  if not Assigned(Form11) then
    Form11 := TForm11.Create(Application); // ou Self selon le contexte

  Form11.AjoutDansLog('L’utilisateur a cliqué sur le bouton "rechercher depuis la recherche"');
end;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
self.Close;
 begin
  if not Assigned(Form11) then
    Form11 := TForm11.Create(Application); // ou Self selon le contexte

  Form11.AjoutDansLog('L’utilisateur a cliqué sur le bouton "quitter la recherche"');
end;

end;

end.
