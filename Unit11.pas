unit Unit11;

interface

uses
 Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm11 = class(TForm)
    Memo1: TMemo;


  private

    { Déclarations privées }
  public
   procedure AfficherLogDepuisFichier(const NomFichier: string);
       procedure AjoutDansLog(const Texte: string);
    { Déclarations publiques }
  end;

var
  Form11: TForm11;

implementation

{$R *.dfm}


procedure TForm11.AfficherLogDepuisFichier(const NomFichier: string);
begin
  if FileExists(NomFichier) then
    Memo1.Lines.LoadFromFile(NomFichier)
  else
    Memo1.Text := 'Fichier introuvable : ' + NomFichier;
end;

procedure TForm11.AjoutDansLog(const Texte: string);
var
  Fichier: TextFile;
  NomFichier: string;
  NomPoste, NomUtilisateur: string;
  Ligne: string;
begin
  NomFichier := '\\pinas03\uf0330-com\G2P\log.txt'; // 🔁 tu peux aussi le rendre configurable
  NomPoste := GetEnvironmentVariable('COMPUTERNAME');
  NomUtilisateur := GetEnvironmentVariable('USERNAME');

  Ligne := FormatDateTime('yyyy-mm-dd hh:nn:ss', Now) + ' - ' +
           NomPoste + '\' + NomUtilisateur + ' - ' + Texte;

  AssignFile(Fichier, NomFichier);
  if FileExists(NomFichier) then
    Append(Fichier)
  else
    Rewrite(Fichier);

  Writeln(Fichier, Ligne);
  CloseFile(Fichier);
end;
end.
