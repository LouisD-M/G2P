unit Unit2;

interface

// On utilise différentes bibliothèques utiles à Delphi pour l'interface et la base de données
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Comp.Client, FireDAC.Stan.Def, FireDAC.Stan.Async, FireDAC.Stan.Intf,
  FireDAC.DApt, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Phys.SQLiteDef,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Stan.Pool, Data.DB,
  Unit3, // On importe le design de la "carte" projet (TFrame3)
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Phys.Intf,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat;

type
  // Déclaration de la fenêtre principale
  TForm2 = class(TForm)

    // ScrollBox pour afficher plusieurs projets avec barre de défilement
    PanelProjets: TScrollBox;

    // Connexion à la base de données SQLite
    FDConnection1: TFDConnection;

    // Événement : lorsqu'on clique sur un label (ex: bouton de test)
    procedure Label11Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    // Zone privée pour ajouter plus tard des variables ou fonctions internes

  public
    // Fonction publique qui affiche tous les projets visuellement
    procedure ChargerTousLesProjets;
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm} // Lie le fichier visuel .dfm avec ce code

{ ==============================================================
  Cette fonction va chercher tous les projets dans la base SQLite
  et créer une "carte" visuelle pour chacun.
  ============================================================== }
procedure TForm2.ChargerTousLesProjets;
var
  Qry: TFDQuery;
  ProjetCard: TFrame3;
  Y: Integer; // Position verticale
begin
  // On efface tout ce qui est affiché dans PanelProjets
  PanelProjets.DestroyComponents;

  // Position de départ pour la première carte
  Y := 10;

  // Création de la requête pour lire la base de données
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FDConnection1; // On connecte la requête à la base
    Qry.SQL.Text := 'SELECT * FROM projet'; // On demande tous les projets
    Qry.Open;

    // On parcourt tous les résultats de la base
    while not Qry.Eof do
    begin
      // Création de la carte projet
      ProjetCard := TFrame3.Create(Self);
      ProjetCard.Name := ''; // Évite les erreurs de noms en double
      ProjetCard.Parent := PanelProjets;

      // Position et taille de la carte
      ProjetCard.Top := Y;
      ProjetCard.Left := 10;
      ProjetCard.Width := PanelProjets.ClientWidth - 20;
      ProjetCard.Height := 80;

      // Mise à jour de la position pour la carte suivante
      Y := Y + ProjetCard.Height + 10;

      // Remplissage des infos à partir des champs de la base
      ProjetCard.Label1.Caption := Qry.FieldByName('titre').AsString;
      ProjetCard.Label2.Caption := 'Responsable : ' + Qry.FieldByName('responsable').AsString;
      ProjetCard.Label3.Caption := Format('%s → %s', [
        Qry.FieldByName('date_debut').AsString,
        Qry.FieldByName('date_fin').AsString
      ]);
      ProjetCard.Label4.Caption := Qry.FieldByName('statut').AsString;

      // Couleur selon le statut
      if Qry.FieldByName('statut').AsString = 'En cours' then
        ProjetCard.Panel1.Color := $0066FF
      else if Qry.FieldByName('statut').AsString = 'Terminé' then
        ProjetCard.Panel1.Color := $99CCFF
      else if Qry.FieldByName('statut').AsString = 'En attente' then
        ProjetCard.Panel1.Color := $CCE5E5;

      Qry.Next; // Passe au projet suivant
    end;
  finally
    Qry.Free; // Libération mémoire
  end;
end;

{ ======================================================
  Ce bouton déclenche l'affichage de tous les projets.
  Tu peux connecter ça à n’importe quel Label ou bouton.
  ====================================================== }
procedure TForm2.FormCreate(Sender: TObject);
begin
 // Quand on clique sur Label11, on charge tous les projets
  ChargerTousLesProjets;
end;

procedure TForm2.Label11Click(Sender: TObject);
begin
 self.close();
end;

end.

