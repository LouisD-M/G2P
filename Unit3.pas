unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls; // ← ici on a bien Vcl.ExtCtrls

type
  TFrame3 = class(TFrame)
    Panel1: TPanel;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

implementation

{$R *.dfm}

initialization
  // 🔧 Enregistre toutes les classes utilisées dans le .dfm pour que Delphi les reconnaisse à l’exécution
  RegisterClass(TPanel);
  RegisterClass(TLabel);
  RegisterClass(TShape);

end.

