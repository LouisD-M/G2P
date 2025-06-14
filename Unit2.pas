﻿unit Unit2;

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
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, Unit1, unit5;

type
  // Déclaration de la fenêtre principale
  TForm2 = class(TForm)

  //déclaration des labels projets
  Label1: TLabel;
  Label2: TLabel;
  Label3: TLabel;
  Label4: TLabel;


    // ScrollBox pour afficher plusieurs projets avec barre de défilement
    PanelProjets: TScrollBox;

    // Connexion à la base de données SQLite
    FDConnection1: TFDConnection;
    Panel16: TPanel;
    Label12: TLabel;
    Panel8: TPanel;
    Label5: TLabel;

    // Événement : lorsqu'on clique sur un label (ex: bouton de test)
    procedure Label11Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure Label12Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);


  private
     ProjetSelectionne: string;  // le titre du projet cliqué pour suppression

    // Zone privée pour ajouter plus tard des variables ou fonctions internes

  public
    // Fonction publique qui affiche tous les projets visuellement
    procedure ChargerTousLesProjets;
    procedure ChargerStatutsProjets;


    procedure AfficherProjetsParStatut(const StatutFiltre: string);

  end;

var
  Form2: TForm2;


implementation

{$R *.dfm}

uses Unit6, Unit7; // Lie le fichier visuel .dfm avec ce code

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

      if Qry.FieldByName('statut').AsString = 'En cours' then
          ProjetCard.Panel1.Color := $00502D02
        else if Qry.FieldByName('statut').AsString = 'Terminé' then
          ProjetCard.Panel1.Color := $00FFA90A
        else if Qry.FieldByName('statut').AsString = 'En attente' then
          ProjetCard.Panel1.Color := $004E5C60;



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

 ChargerTousLesProjets;


  // on charge automatiquement les stats des projets
  ChargerStatutsProjets;


end;

procedure TForm2.Label10Click(Sender: TObject);
var
  Qry: TFDQuery;
  ProjetCard: TFrame3;
  Y: Integer;
begin
  // Nettoyage du ScrollBox
  while PanelProjets.ControlCount > 0 do
    PanelProjets.Controls[0].Free;

  Y := 10;

  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FDConnection1;
    Qry.SQL.Text := 'SELECT * FROM projet ORDER BY responsable';
    Qry.Open;

    while not Qry.Eof do
    begin
      ProjetCard := TFrame3.Create(Self);
      ProjetCard.Name := '';
      ProjetCard.Parent := PanelProjets;
      ProjetCard.Top := Y;
      ProjetCard.Left := 10;
      ProjetCard.Width := PanelProjets.ClientWidth - 20;
      ProjetCard.Height := 80;
      Y := Y + ProjetCard.Height + 10;

      ProjetCard.Label1.Caption := Qry.FieldByName('titre').AsString;
      ProjetCard.Label2.Caption := 'Responsable : ' + Qry.FieldByName('responsable').AsString;
      ProjetCard.Label3.Caption := Format('%s → %s', [
        Qry.FieldByName('date_debut').AsString,
        Qry.FieldByName('date_fin').AsString
      ]);
      ProjetCard.Label4.Caption := Qry.FieldByName('statut').AsString;

         if Qry.FieldByName('statut').AsString = 'En cours' then
          ProjetCard.Panel1.Color := $00502D02
        else if Qry.FieldByName('statut').AsString = 'Terminé' then
          ProjetCard.Panel1.Color := $00FFA90A
        else if Qry.FieldByName('statut').AsString = 'En attente' then
          ProjetCard.Panel1.Color := $004E5C60;


      Qry.Next;
    end;

    PanelProjets.VertScrollBar.Position := 0;
    PanelProjets.AutoScroll := False;
    PanelProjets.AutoScroll := True;
    PanelProjets.Realign;
    PanelProjets.Invalidate;

  finally
    Qry.Free;
  end;
end;

procedure TForm2.Label11Click(Sender: TObject);
begin
 self.close();
end;

procedure TForm2.Label2Click(Sender: TObject);
begin
  AfficherProjetsParStatut('En cours');
end;

procedure TForm2.Label3Click(Sender: TObject);
begin
  AfficherProjetsParStatut('Terminé');
end;

procedure TForm2.Label4Click(Sender: TObject);
begin
  AfficherProjetsParStatut('En attente');
end;

procedure TForm2.Label5Click(Sender: TObject);
begin
  Form7.ShowModal;
  ChargerStatutsProjets;

end;

procedure TForm2.Label12Click(Sender: TObject);
begin
  Form6.ShowModal;
  ChargerStatutsProjets;

end;

procedure TForm2.Label6Click(Sender: TObject);
begin

ChargerStatutsProjets;
ChargerTousLesProjets;
end;

procedure TForm2.Label7Click(Sender: TObject);
var
  Qry: TFDQuery;
  ProjetCard: TFrame3;
  Y: Integer;
begin
  // Nettoyage du ScrollBox
  while PanelProjets.ControlCount > 0 do
    PanelProjets.Controls[0].Free;

  Y := 10;

  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FDConnection1;
    Qry.SQL.Text := 'SELECT * FROM projet';
    Qry.Open;

    while not Qry.Eof do
    begin
      ProjetCard := TFrame3.Create(Self);
      ProjetCard.Name := '';
      ProjetCard.Parent := PanelProjets;
      ProjetCard.Top := Y;
      ProjetCard.Left := 10;
      ProjetCard.Width := PanelProjets.ClientWidth - 20;
      ProjetCard.Height := 80;
      Y := Y + ProjetCard.Height + 10;

      ProjetCard.Label1.Caption := Qry.FieldByName('titre').AsString;
      ProjetCard.Label2.Caption := 'Responsable : ' + Qry.FieldByName('responsable').AsString;
      ProjetCard.Label3.Caption := Format('%s → %s', [
        Qry.FieldByName('date_debut').AsString,
        Qry.FieldByName('date_fin').AsString
      ]);
      ProjetCard.Label4.Caption := Qry.FieldByName('statut').AsString;

      // Coloration selon statut (optionnel)
        if Qry.FieldByName('statut').AsString = 'En cours' then
          ProjetCard.Panel1.Color := $00502D02
        else if Qry.FieldByName('statut').AsString = 'Terminé' then
          ProjetCard.Panel1.Color := $00FFA90A
        else if Qry.FieldByName('statut').AsString = 'En attente' then
          ProjetCard.Panel1.Color := $004E5C60;

      Qry.Next;
    end;

    // Remise à zéro du scroll et mise à jour visuelle
    PanelProjets.VertScrollBar.Position := 0;
    PanelProjets.AutoScroll := False;
    PanelProjets.AutoScroll := True;
    PanelProjets.Realign;
    PanelProjets.Invalidate;

  finally
    Qry.Free;
  end;
end;

procedure TForm2.Label8Click(Sender: TObject);
var
  i: Integer;
  titre: string;
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FDConnection1;

    for i := 0 to PanelProjets.ControlCount - 1 do
    begin
      if PanelProjets.Controls[i] is TFrame3 then
      begin
        // Récupérer le titre depuis la carte projet affichée
        titre := TFrame3(PanelProjets.Controls[i]).Label1.Caption;

        // Rechercher le projet exact dans la base
        Qry.Close;
        Qry.SQL.Text := 'SELECT * FROM projet WHERE titre = :titre';
        Qry.ParamByName('titre').AsString := titre;
        Qry.Open;

        // Si trouvé, ouvrir Form5 avec les données
        if not Qry.IsEmpty then
        begin
          Form5.LabelTitre.Caption := Qry.FieldByName('titre').AsString;
          Form5.LabelResponsable.Caption := 'Responsable : ' + Qry.FieldByName('responsable').AsString;
          Form5.LabelDate.Caption := Format('%s → %s', [
            Qry.FieldByName('date_debut').AsString,
            Qry.FieldByName('date_fin').AsString
          ]);
          Form5.LabelStatut.Caption := 'Statut : ' + Qry.FieldByName('statut').AsString;
          Form5.LabelPriorite.Caption := 'Priorité : ' + Qry.FieldByName('priorite').AsString;
          Form5.LabelCout_Reel.Caption := 'Coût réel : ' + Qry.FieldByName('cout_reel').AsString;
          Form5.LabelCommentaire.Caption := 'Commentaire : ' + Qry.FieldByName('commentaires').AsString;

          Form5.ShowModal;
        end;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TForm2.Label9Click(Sender: TObject);
var
  recherche: string;
  Qry: TFDQuery;
  ProjetCard: TFrame3;
  Y: Integer;
begin
  // Vider la ScrollBox proprement
  while PanelProjets.ControlCount > 0 do
    PanelProjets.Controls[0].Free;

  // Ouvrir le formulaire de recherche
  if Form1.ShowModal = mrOk then
  begin
    recherche := Trim(Form1.Edit1.Text);
    if recherche = '' then Exit;

    Y := 10;

    Qry := TFDQuery.Create(nil);
    try
      Qry.Connection := FDConnection1;
      Qry.SQL.Text :=
        'SELECT * FROM projet ' +
        'WHERE titre LIKE :recherche ' +
        '   OR description LIKE :recherche ' +
        '   OR responsable LIKE :recherche';
      Qry.ParamByName('recherche').AsString := recherche + '%';
      Qry.Open;

      while not Qry.Eof do
      begin
        ProjetCard := TFrame3.Create(Self);
        ProjetCard.Name := '';
        ProjetCard.Parent := PanelProjets;
        ProjetCard.Top := Y;
        ProjetCard.Left := 10;
        ProjetCard.Width := PanelProjets.ClientWidth - 20;
        ProjetCard.Height := 80;
        Y := Y + ProjetCard.Height + 10;

        ProjetCard.Label1.Caption := Qry.FieldByName('titre').AsString;
        ProjetCard.Label2.Caption := 'Responsable : ' + Qry.FieldByName('responsable').AsString;
        ProjetCard.Label3.Caption := Format('%s → %s', [
          Qry.FieldByName('date_debut').AsString,
          Qry.FieldByName('date_fin').AsString
        ]);
        ProjetCard.Label4.Caption := Qry.FieldByName('statut').AsString;

        if Qry.FieldByName('statut').AsString = 'En cours' then
          ProjetCard.Panel1.Color := $00502D02
        else if Qry.FieldByName('statut').AsString = 'Terminé' then
          ProjetCard.Panel1.Color := $00FFA90A
        else if Qry.FieldByName('statut').AsString = 'En attente' then
          ProjetCard.Panel1.Color := $004E5C60;


        Qry.Next;
      end;

      // Rafraîchissement
      PanelProjets.VertScrollBar.Position := 0;
      PanelProjets.AutoScroll := False;
      PanelProjets.AutoScroll := True;
      PanelProjets.Realign;
      PanelProjets.Invalidate;

    finally
      Qry.Free;
    end;
  end;
end;





procedure TForm2.ChargerStatutsProjets;
var
  encours, termines, enattente, total: Integer;
  qry: TFDQuery;
begin

  // Initialisation des compteurs
  encours := 0;
  termines := 0;
  enattente := 0;

  // Nettoyage complet du ScrollBox
  while PanelProjets.ControlCount > 0 do
  PanelProjets.Controls[0].Free;

  // Création de la requête
  qry := TFDQuery.Create(nil);
  try
    qry.Connection := FDConnection1;

    // Projets en cours
    qry.SQL.Text := 'SELECT * FROM projet WHERE statut = :statut';
    qry.ParamByName('statut').AsString := 'En cours';
    qry.Open;
    while not qry.Eof do
    begin
      Inc(encours);
      qry.Next;
    end;
    qry.Close;

    // Projets terminés
    qry.ParamByName('statut').AsString := 'Terminé';
    qry.Open;
    while not qry.Eof do
    begin
      Inc(termines);
      qry.Next;
    end;
    qry.Close;

    // Projets en attente
    qry.ParamByName('statut').AsString := 'En attente';
    qry.Open;
    while not qry.Eof do
    begin
      Inc(enattente);
      qry.Next;
    end;
    qry.Close;

  finally
    qry.Free;
  end;

  // Calcul du total
  total := encours + termines + enattente;

  // Affichage dans les labels
  Label2.Caption := 'Projets en cours : ' + encours.ToString;
  Label3.Caption := 'Projets terminés : ' + termines.ToString;
  Label4.Caption := 'Projets en attente : ' + enattente.ToString;
  Label1.Caption := 'Total de projets : ' + total.ToString;
end;


procedure TForm2.AfficherProjetsParStatut(const StatutFiltre: string);
var
  Qry: TFDQuery;
  ProjetCard: TFrame3;
  Y: Integer;
begin
  // Nettoyage complet du ScrollBox
  while PanelProjets.ControlCount > 0 do
  PanelProjets.Controls[0].Free;

  Y := 10;

  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FDConnection1;
    Qry.SQL.Text := 'SELECT * FROM projet WHERE statut = :statut';
    Qry.ParamByName('statut').AsString := StatutFiltre;
    Qry.Open;

    while not Qry.Eof do
    begin
      // Création dynamique d'une "carte" projet
      ProjetCard := TFrame3.Create(Self);
      ProjetCard.Name := ''; // éviter les erreurs de nom en double
      ProjetCard.Parent := PanelProjets;

      ProjetCard.Top := Y;
      ProjetCard.Left := 10;
      ProjetCard.Width := PanelProjets.ClientWidth - 20;
      ProjetCard.Height := 80;

      Y := Y + ProjetCard.Height + 10;

      // Remplissage avec les données SQL
      ProjetCard.Label1.Caption := Qry.FieldByName('titre').AsString;
      ProjetCard.Label2.Caption := 'Responsable : ' + Qry.FieldByName('responsable').AsString;
      ProjetCard.Label3.Caption := Format('%s → %s', [
        Qry.FieldByName('date_debut').AsString,
        Qry.FieldByName('date_fin').AsString
      ]);
      ProjetCard.Label4.Caption := Qry.FieldByName('statut').AsString;
  
          if Qry.FieldByName('statut').AsString = 'En cours' then
          ProjetCard.Panel1.Color := $00502D02
        else if Qry.FieldByName('statut').AsString = 'Terminé' then
          ProjetCard.Panel1.Color := $00FFA90A
        else if Qry.FieldByName('statut').AsString = 'En attente' then
          ProjetCard.Panel1.Color := $004E5C60;

      Qry.Next;

    end;
        PanelProjets.VertScrollBar.Position := 0;
PanelProjets.AutoScroll := False;
PanelProjets.AutoScroll := True;
PanelProjets.Realign;
PanelProjets.Invalidate;
  finally
    Qry.Free;
  ;
  end;
end;




end.

