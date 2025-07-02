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
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, Unit1, unit5,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, Unit8, unit11;

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
    Panel11: TPanel;
    Label13: TLabel;
    FDQuery1: TFDQuery;
    Panel17: TPanel;
    Label14: TLabel;

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
    procedure Label13Click(Sender: TObject);
    procedure Label14Click(Sender: TObject);


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
  Y: Integer;
  responsable, dateDebut, dateFin, statut: string;
begin
  // Bloque les redessins de la ScrollBox
  LockWindowUpdate(PanelProjets.Handle);

  try
    PanelProjets.Visible := False;
    PanelProjets.DestroyComponents;
    Y := 10;

    Qry := TFDQuery.Create(nil);
    try
      Qry.Connection := FDConnection1;
      Qry.SQL.Text := 'SELECT * FROM projet';
      Qry.Open;

      while not Qry.Eof do
      begin
        // Création de la carte projet (hors écran, pas encore parentée)
        ProjetCard := TFrame3.Create(nil);
        ProjetCard.Name := '';

        // Récupération et sécurisation des données
        responsable := Qry.FieldByName('responsable').AsString;
        if Trim(responsable) = '' then responsable := 'Non spécifié';

        dateDebut := Qry.FieldByName('date_debut').AsString;
        if Trim(dateDebut) = '' then dateDebut := '??';

        dateFin := Qry.FieldByName('date_fin').AsString;
        if Trim(dateFin) = '' then dateFin := '??';

        statut := Qry.FieldByName('statut').AsString;
        if Trim(statut) = '' then statut := 'Non défini';

        // Remplissage complet
        ProjetCard.Label1.Caption := Qry.FieldByName('titre').AsString;
        ProjetCard.Label2.Caption := 'Responsable : ' + responsable;
        ProjetCard.Label3.Caption := Format('%s → %s', [dateDebut, dateFin]);
        ProjetCard.Label4.Caption := statut;

        if statut = 'En cours' then
          ProjetCard.Panel1.Color := $00502D02
        else if statut = 'Terminé' then
          ProjetCard.Panel1.Color := $00FFA90A
        else if statut = 'En attente' then
          ProjetCard.Panel1.Color := $004E5C60
        else
          ProjetCard.Panel1.Color := clGray;

        // Dimensions (avant affichage)
        ProjetCard.Top := Y;
        ProjetCard.Left := 10;
        ProjetCard.Width := PanelProjets.ClientWidth - 20;
        ProjetCard.Height := 80;
        ProjetCard.Constraints.MinWidth := 500;

        // Maintenant seulement : affichage dans la ScrollBox
        ProjetCard.Parent := PanelProjets;

        // Incrément de la position verticale
        Y := Y + ProjetCard.Height + 10;

        Qry.Next;
      end;

    finally
      Qry.Free;
    end;

  finally
    LockWindowUpdate(0); // Réactivation des redessins
    PanelProjets.Visible := True;
    PanelProjets.Realign;
    PanelProjets.Invalidate;
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
      ProjetCard.Label5.Caption := Qry.FieldByName('description').AsString;
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
     begin
  if not Assigned(Form11) then
    Form11 := TForm11.Create(Application); // ou Self selon le contexte

  Form11.AjoutDansLog('L’utilisateur a cliqué sur le bouton "Pilotes"');
end;

  finally
    Qry.Free;
  end;
end;

procedure TForm2.Label11Click(Sender: TObject);
begin
 begin
  if not Assigned(Form11) then
    Form11 := TForm11.Create(Application); // ou Self selon le contexte

  Form11.AjoutDansLog('L’utilisateur a cliqué sur le bouton "Quitter"');
end;
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
   begin
  if not Assigned(Form11) then
    Form11 := TForm11.Create(Application); // ou Self selon le contexte

  Form11.AjoutDansLog('L’utilisateur a cliqué sur le bouton "Modifier"');
end;

end;

procedure TForm2.Label12Click(Sender: TObject);
begin
  Form6.ShowModal;
  ChargerStatutsProjets;
 begin
  if not Assigned(Form11) then
    Form11 := TForm11.Create(Application); // ou Self selon le contexte

  Form11.AjoutDansLog('L’utilisateur a cliqué sur le bouton "Ajouté"');
end;

end;

procedure TForm2.Label13Click(Sender: TObject);
begin
Form8.ShowModal;
 begin
  if not Assigned(Form11) then
    Form11 := TForm11.Create(Application); // ou Self selon le contexte

  Form11.AjoutDansLog('L’utilisateur a cliqué sur le bouton "Stats"');
end;
end;

procedure TForm2.Label14Click(Sender: TObject);
begin
  Form11 := TForm11.Create(Self);
  try
    Form11.AfficherLogDepuisFichier('\\pinas03\uf0330-com\G2P\log.txt'); // à adapter selon ton chemin
    Form11.ShowModal;
     begin
  if not Assigned(Form11) then
    Form11 := TForm11.Create(Application); // ou Self selon le contexte

  Form11.AjoutDansLog('L’utilisateur a cliqué sur le bouton "Logs"');
end;
  finally
    Form11.Free;
  end;
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
      ProjetCard.Label5.Caption := Qry.FieldByName('description').AsString;
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
     begin
  if not Assigned(Form11) then
    Form11 := TForm11.Create(Application); // ou Self selon le contexte

  Form11.AjoutDansLog('L’utilisateur a cliqué sur le bouton "Projets"');
end;

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

          Form5.LabelDescription.Caption := 'Description ' + Qry.FieldByName('description').AsString;


          Form5.ShowModal;
        end;
      end;
    end;
  finally
   begin
  if not Assigned(Form11) then
    Form11 := TForm11.Create(Application); // ou Self selon le contexte

  Form11.AjoutDansLog('L’utilisateur a cliqué sur le bouton "Export"');
end;
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
       begin
  if not Assigned(Form11) then
    Form11 := TForm11.Create(Application); // ou Self selon le contexte

  Form11.AjoutDansLog('L’utilisateur a cliqué sur le bouton "recherche"');
end;

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
      ProjetCard.Label5.Caption := Qry.FieldByName('description').AsString;
      ProjetCard.Label4.Caption := Qry.FieldByName('statut').AsString;
  
          if Qry.FieldByName('statut').AsString = 'En cours' then
          ProjetCard.Panel1.Color := $00502D02
        else if Qry.FieldByName('statut').AsString = 'Terminé' then
          ProjetCard.Panel1.Color := $00FFA90A
        else if Qry.FieldByName('statut').AsString = 'En attente' then
          ProjetCard.Panel1.Color := $004E5C60;

          ProjetCard.Parent := PanelProjets;

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

