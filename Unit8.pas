unit Unit8;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Comp.Client, FireDAC.Stan.Param,
  System.UITypes, ShellAPI, Data.DB, Vcl.Printers, Math; // <- ajouté pour éviter l'avertissement H2443

type
  TForm8 = class(TForm)
    Panel1: TPanel;
    ComboBox1: TComboBox;
    Panel2: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel5: TPanel;
    Shape4: TShape;
    Label11: TLabel;
    LabelProjetSelectionne: TLabel;
    Panel3: TPanel;
    Shape3: TShape;
    Label4: TLabel;
    Panel4: TPanel;
    Shape5: TShape;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel6: TPanel;
    Shape6: TShape;
    Label8: TLabel;
    Panel7: TPanel;
    Shape7: TShape;
    Label9: TLabel;
    Label10: TLabel;
    Panel8: TPanel;
    Shape10: TShape;
    Label13: TLabel;
    Shape8: TShape;
    Shape9: TShape;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Panel9: TPanel;
    Shape11: TShape;
    Label16: TLabel;
    Panel10: TPanel;
    PaintBox1: TPaintBox;
    Label17: TLabel;
    procedure Impr(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure Label16Click(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);

  private
    procedure RemplirComboBoxProjets;
    procedure AfficherProjetPrincipal(const titreProjet: string);
    procedure AfficherProjetsLiesRecursive(parentID: Integer; niveau: Integer);
    procedure AfficherProjetsLies(const titreProjet: string);
    procedure AfficherHierarchieProjet(const titreProjet: string);
    procedure MettreAJourBarreAvancement;
    procedure MettreAJourStatsEnAttenteGlobale;
    procedure MettreAJourStatsTerminesGlobale;
    procedure MettreAJourStatsEnCoursGlobale;
    procedure MettreAJourBarreGlobaleStatut;
    procedure ImprimerFormulaire;
    procedure RecuperationPourcentage(sender: TObject);




  public

  end;

var
  Form8: TForm8;
  PourcentageGlobal: integer;


implementation

uses
  Unit2;

{$R *.dfm}

// Remplit ComboBox1 avec les titres de projets
procedure TForm8.RemplirComboBoxProjets;
var
  Qry: TFDQuery;
begin
  ComboBox1.Clear;
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := Form2.FDConnection1;
    Qry.SQL.Text := 'SELECT titre FROM projet ORDER BY titre';
    Qry.Open;
    while not Qry.Eof do
    begin
      ComboBox1.Items.Add(Qry.FieldByName('titre').AsString);
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TForm8.ComboBox1Change(Sender: TObject);
var
  titreProjet: string;
begin
  if ComboBox1.ItemIndex >= 0 then
  begin
    titreProjet := ComboBox1.Text;
    LabelProjetSelectionne.Caption := 'Projet selectionné : ' + titreProjet;
    AfficherProjetPrincipal(titreProjet);
    AfficherProjetsLies(titreProjet);
    AfficherHierarchieProjet(titreProjet);
    MettreAJourBarreAvancement;
    MettreAJourStatsTerminesGlobale;
    MettreAJourStatsEnCoursGlobale;
    MettreAJourBarreGlobaleStatut;



    //affectation de la valeur au courbestats
    RecuperationPourcentage(nil);

  end
  else
  begin
    LabelProjetSelectionne.Caption := 'Aucun projet sélectionné';
    Label1.Caption := '';
    Label2.Caption := '';
  end;
end;

procedure TForm8.AfficherProjetPrincipal(const titreProjet: string);
var
  Qry: TFDQuery;
  idParent: integer;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := Form2.FDConnection1;
    Qry.SQL.Text := 'SELECT lier_a FROM projet WHERE titre = :titre';
    Qry.ParamByName('titre').AsString := titreProjet;
    Qry.Open;

    if Qry.IsEmpty or Qry.FieldByName('lier_a').IsNull then
      Label2.Caption := 'Ce projet est le projet principal'
   else
begin
  // 🟢 Sauvegarde de la valeur AVANT de modifier la requête
  idParent := Qry.FieldByName('lier_a').AsInteger;

  Qry.Close;
  Qry.SQL.Text := 'SELECT titre FROM projet WHERE id = :id';
  Qry.ParamByName('id').AsInteger := idParent;
  Qry.Open;

      if not Qry.IsEmpty then
        Label2.Caption := 'Ce projet est lié au projet principal : ' + Qry.FieldByName('titre').AsString
      else
        Label2.Caption := 'Projet principal introuvable';
    end;
  finally
    Qry.Free;
  end;
end;

procedure TForm8.AfficherProjetsLiesRecursive(parentID: Integer; niveau: Integer);
var
  Qry: TFDQuery;
  indent, titre: string;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := Form2.FDConnection1;
    Qry.SQL.Text := 'SELECT id, titre FROM projet WHERE lier_a = :id ORDER BY titre';
    Qry.ParamByName('id').AsInteger := parentID;
    Qry.Open;

    indent := StringOfChar(' ', niveau * 2);

    while not Qry.Eof do
    begin
      titre := Qry.FieldByName('titre').AsString;
      Label1.Caption := Label1.Caption + indent + '- ' + titre + sLineBreak;
      AfficherProjetsLiesRecursive(Qry.FieldByName('id').AsInteger, niveau + 1);
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TForm8.AfficherProjetsLies(const titreProjet: string);
var
  Qry: TFDQuery;
  idProjet: Integer;
begin
  Label1.Caption := '';
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := Form2.FDConnection1;
    Qry.SQL.Text := 'SELECT id FROM projet WHERE titre = :titre';
    Qry.ParamByName('titre').AsString := titreProjet;
    Qry.Open;

    if Qry.IsEmpty then
    begin
      Label1.Caption := 'Projet introuvable';
      Exit;
    end;

    idProjet := Qry.FieldByName('id').AsInteger;
    AfficherProjetsLiesRecursive(idProjet, 0);

    if Label1.Caption = '' then
      Label1.Caption := 'Aucun projet lié';
  finally
    Qry.Free;
  end;
end;

procedure TForm8.AfficherHierarchieProjet(const titreProjet: string);
var
  Qry: TFDQuery;
  chaine, titreActuel: string;
  idParent: Integer;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := Form2.FDConnection1;
    chaine := titreProjet;
    titreActuel := titreProjet;

    while True do
    begin
      Qry.Close;
      Qry.SQL.Text := 'SELECT lier_a FROM projet WHERE titre = :titre';
      Qry.ParamByName('titre').AsString := titreActuel;
      Qry.Open;

      if Qry.IsEmpty or Qry.FieldByName('lier_a').IsNull then
        Break;

      // Lire et stocker immédiatement l'ID parent avant de changer le SQL
      idParent := Qry.FieldByName('lier_a').AsInteger;

      Qry.Close;
      Qry.SQL.Text := 'SELECT titre FROM projet WHERE id = :id';
      Qry.ParamByName('id').AsInteger := idParent;
      Qry.Open;

      if Qry.IsEmpty then Break;

      titreActuel := Qry.FieldByName('titre').AsString;
      chaine := titreActuel + ' > ' + chaine;
    end;

    Label2.Caption := 'Hiérarchie : ' + chaine;
  finally
    Qry.Free;
  end;
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
  RemplirComboBoxProjets;
  MettreAJourStatsEnAttenteGlobale;
  PaintBox1.Invalidate;





  if ComboBox1.Items.Count > 0 then
  begin
    ComboBox1.ItemIndex := 0;
    ComboBox1Change(nil);
  end;
end;

procedure TForm8.Impr(Sender: TObject);
begin
  self.Close;
end;



procedure TForm8.MettreAJourBarreAvancement;
var
  lignes: TStringList;
  i, total, score, pourcentage: Integer;
  titresConcat: string;
  Qry: TFDQuery;
  statut: string;
begin
  lignes := TStringList.Create;
  Qry := TFDQuery.Create(nil);
  try
    // Extraire les lignes du Label1 (projets liés)
    lignes.Text := StringReplace(Label1.Caption, sLineBreak, #13#10, [rfReplaceAll]);

    // Ajouter le projet sélectionné (en tête)
    lignes.Insert(0, ComboBox1.Text);

    // Nettoyer les lignes pour ne garder que les titres
    for i := 0 to lignes.Count - 1 do
      lignes[i] := Trim(StringReplace(lignes[i], '- ', '', []));

    // Construire la clause IN
    titresConcat := '';
    for i := 0 to lignes.Count - 1 do
    begin
      if i > 0 then
        titresConcat := titresConcat + ', ';
      titresConcat := titresConcat + QuotedStr(lignes[i]);
    end;

    // Préparer la requête SQL
    Qry.Connection := Form2.FDConnection1;
    Qry.SQL.Text := 'SELECT statut FROM projet WHERE titre IN (' + titresConcat + ')';
    Qry.Open;

    // Calculer le score
    total := 0;
    score := 0;

    while not Qry.Eof do
    begin
      Inc(total);
      statut := LowerCase(Trim(Qry.FieldByName('statut').AsString));

      if statut = 'en attente' then
        score := score + 0
      else if statut = 'en cours' then
        score := score + 1
      else if statut = 'terminé' then
        score := score + 2;

      Qry.Next;
    end;

    // Calcul du pourcentage
    if total = 0 then
      pourcentage := 0
    else
      pourcentage := Round((score / (total * 2)) * 100);

    // Appliquer la largeur du Shape3
    Shape3.Width := Round((pourcentage / 100) * Panel3.Width);

    // Afficher dans Label4
    Label4.Caption := IntToStr(pourcentage) + ' %';

  finally
    lignes.Free;
    Qry.Free;
  end;
end;

procedure TForm8.MettreAJourStatsEnAttenteGlobale;
var
  Qry: TFDQuery;
  total, enAttente, pourcentage: Integer;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := Form2.FDConnection1;

    // Total de projets
    Qry.SQL.Text := 'SELECT COUNT(*) FROM projet';
    Qry.Open;
    total := Qry.Fields[0].AsInteger;

    // Total de projets en attente
    Qry.Close;
    Qry.SQL.Text := 'SELECT COUNT(*) FROM projet WHERE LOWER(TRIM(statut)) = ''en attente''';
    Qry.Open;
    enAttente := Qry.Fields[0].AsInteger;

    // Calcul du pourcentage
    if total > 0 then
      pourcentage := Round((enAttente / total) * 100)
    else
      pourcentage := 0;

    // Mise à jour visuelle (exemple avec Shape5 et Label6)
    Shape5.Width := Round((Panel4.Width * pourcentage) / 100);
    Label5.Caption := IntToStr(pourcentage) + ' % des projets avec le statut en cours  ';

  finally
    Qry.Free;
  end;
end;

procedure TForm8.MettreAJourStatsTerminesGlobale;
var
  Qry: TFDQuery;
  total, Termines, pourcentage: Integer;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := Form2.FDConnection1;

    // Total de projets
    Qry.SQL.Text := 'SELECT COUNT(*) FROM projet';
    Qry.Open;
    total := Qry.Fields[0].AsInteger;

    // Total de projets en attente
    Qry.Close;
    Qry.SQL.Text := 'SELECT COUNT(*) FROM projet WHERE statut = ''Terminé''';
    Qry.Open;
    Termines := Qry.Fields[0].AsInteger;

    // Calcul du pourcentage
    if total > 0 then
      pourcentage := Round((Termines / total) * 100)
    else
      pourcentage := 0;

    // Mise à jour visuelle (exemple avec Shape5 et Label6)
    Shape6.Width := Round((Panel6.Width * pourcentage) / 100);
    Label8.Caption := IntToStr(pourcentage) + ' % des projets avec le statut terminé  ';

  finally
    Qry.Free;
  end;
end;



procedure TForm8.PaintBox1Paint(Sender: TObject);
var
  R: TRect;
  Center: TPoint;
  Radius, InnerRadius: Integer;
  AngleStart, AngleEnd: Double;
  StartX, StartY, EndX, EndY: Integer;
begin
  // Définir la zone du cercle principal
  R := Rect(10, 10, 210, 210);
  Center.X := (R.Left + R.Right) div 2;
  Center.Y := (R.Top + R.Bottom) div 2;
  Radius := (R.Right - R.Left) div 2;
  InnerRadius := Radius - 40;

  // Effacer le fond
  PaintBox1.Canvas.Brush.Color := clWhite;
  PaintBox1.Canvas.FillRect(PaintBox1.ClientRect);

  // Dessiner le fond gris (cercle complet)
  PaintBox1.Canvas.Pen.Style := psClear;
  PaintBox1.Canvas.Brush.Color := clSilver;
  PaintBox1.Canvas.Ellipse(R);

  // Dessiner la portion verte si FPourcentage > 0
  if PourcentageGlobal > 0 then
  begin
    AngleStart := DegToRad(-90); // départ en haut
    AngleEnd := DegToRad(-90 + (360 * PourcentageGlobal / 100));

    StartX := Center.X + Round(Radius * Cos(AngleStart));
    StartY := Center.Y + Round(Radius * Sin(AngleStart));
    EndX := Center.X + Round(Radius * Cos(AngleEnd));
    EndY := Center.Y + Round(Radius * Sin(AngleEnd));

    PaintBox1.Canvas.Brush.Color := clGreen;
        PaintBox1.Canvas.Pie(R.Left, R.Top, R.Right, R.Bottom,
                         EndX, EndY, StartX, StartY);

  end;

  // Dessiner le cercle intérieur blanc (effet "donut")
  PaintBox1.Canvas.Brush.Color := clWhite;
  PaintBox1.Canvas.Ellipse(
    Center.X - InnerRadius, Center.Y - InnerRadius,
    Center.X + InnerRadius, Center.Y + InnerRadius
  );
  label17.caption := IntToStr(PourcentageGlobal) + '%';
end;

procedure TForm8.MettreAJourStatsEnCoursGlobale;
var
  Qry: TFDQuery;
  total, Termines, pourcentage: Integer;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := Form2.FDConnection1;

    // Total de projets
    Qry.SQL.Text := 'SELECT COUNT(*) FROM projet';
    Qry.Open;
    total := Qry.Fields[0].AsInteger;

    // Total de projets en attente
    Qry.Close;
    Qry.SQL.Text := 'SELECT COUNT(*) FROM projet WHERE statut = ''En cours''';
    Qry.Open;
    Termines := Qry.Fields[0].AsInteger;

    // Calcul du pourcentage
    if total > 0 then
      pourcentage := Round((Termines / total) * 100)
    else
      pourcentage := 0;

    // Mise à jour visuelle (exemple avec Shape5 et Label6)
    Shape7.Width := Round((Panel7.Width * pourcentage) / 100);
    Label10.Caption := IntToStr(pourcentage) + ' % des projets avec le statut en cours  ';

  finally
    Qry.Free;
  end;
end;



procedure TForm8.MettreAJourBarreGlobaleStatut;
var
  Qry: TFDQuery;
  nbAttente, nbCours, nbTermines, nbTotal: Integer;
  wAttente, wCours, wTermines: Integer;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := Form2.FDConnection1;

    // 1. Nombre de projets "En attente"
    Qry.SQL.Text := 'SELECT COUNT(*) FROM projet WHERE LOWER(TRIM(statut)) = ''en attente''';
    Qry.Open;
    nbAttente := Qry.Fields[0].AsInteger;

    // 2. Nombre de projets "En cours"
    Qry.SQL.Text := 'SELECT COUNT(*) FROM projet WHERE statut = ''En cours''';
    Qry.Open;
    nbCours := Qry.Fields[0].AsInteger;

    // 3. Nombre de projets "Terminé"
    Qry.SQL.Text := 'SELECT COUNT(*) FROM projet WHERE statut = ''Terminé''';
    Qry.Open;
    nbTermines := Qry.Fields[0].AsInteger;

    // Total
    nbTotal := nbAttente + nbCours + nbTermines;
    if nbTotal = 0 then nbTotal := 1;

    // Largeurs (en pixels, selon la largeur du Panel)
    wAttente := Round((nbAttente / nbTotal) * Panel8.Width);
    wCours   := Round((nbCours / nbTotal) * Panel8.Width);
    wTermines:= Panel8.Width - wAttente - wCours;

    // Position et taille des formes
    Shape8.Width := wAttente;
    Shape9.Width := wCours;
    Shape10.Width := wTermines;

    Shape8.Left := 0;
    Shape9.Left := Shape8.Left + wAttente;
    Shape10.Left := Shape9.Left + wCours;

    // Shape8 = En attente
Label12.Caption := 'Attente ';
Label12.Left := (Shape8.Left + Shape9.left) div 2 - 15;
//Label12.Top := Shape8.Top + (Shape8.Height - Label12.Height) div 2;

// Shape9 = En cours
Label14.Caption := 'En cours ';
Label14.Left := (Shape9.Left + Shape10.left) div 2 - 15;
//Label14.Top := Shape9.Top + (Shape9.Height - Label14.Height) div 2;

// Shape10 = Terminé
Label15.Caption := 'Terminé ';
Label15.Left := Shape10.Left + (Shape10.Width - Label15.Width) div 2;
//Label15.Top := Shape10.Top + (Shape10.Height - Label15.Height) div 2;


  finally
    Qry.Free;
  end;
end;



procedure TForm8.ImprimerFormulaire;    //Modification en save vers un pdf horizontal
var
  bmp: TBitmap;
  SaveDialog: TSaveDialog;
  PDFPath: string;
  R: TRect;
begin
  SaveDialog := TSaveDialog.Create(nil);
  try
    SaveDialog.Filter := 'Fichier PDF|*.pdf';
    SaveDialog.DefaultExt := 'pdf';
    SaveDialog.FileName := 'Export_Projet_G2P.pdf';

    if SaveDialog.Execute then
    begin
      PDFPath := SaveDialog.FileName;

      // Sélectionner "Microsoft Print to PDF"
      Printer.PrinterIndex := Printer.Printers.IndexOf('Microsoft Print to PDF');
      if Printer.PrinterIndex = -1 then
      begin
        ShowMessage('"Microsoft Print to PDF" est introuvable.');
        Exit;
      end;

      // Mode paysage
      Printer.Orientation := poLandscape;

      // Démarre l’impression
      Printer.Title := PDFPath;
      Printer.BeginDoc;
      try
        bmp := TBitmap.Create;
        try
          bmp.Width := Self.ClientWidth;
          bmp.Height := Self.ClientHeight;
          Self.PaintTo(bmp.Canvas.Handle, 0, 0);

          // Ajuste le dessin à la page entière
          R := Rect(0, 0, Printer.PageWidth, Printer.PageHeight);
          Printer.Canvas.StretchDraw(R, bmp);

        finally
          bmp.Free;
        end;
      finally
        Printer.EndDoc;
      end;

      // Ouvre le PDF généré
      ShellExecute(0, 'open', PChar(PDFPath), nil, nil, SW_SHOWNORMAL);
    end;
  finally
    SaveDialog.Free;
  end;
end;
procedure TForm8.Label11Click(Sender: TObject);
begin
ImprimerFormulaire;
end;

procedure TForm8.Label16Click(Sender: TObject);
begin
self.close;
end;


procedure TForm8.RecuperationPourcentage(sender: TObject);
var
  valStr: string;
  val: Integer;
begin
  // Nettoyage du texte : suppression de l'espace et du symbole %
  valStr := StringReplace(Label4.Caption, '%', '', [rfReplaceAll]);
  valStr := Trim(valStr);

  // Conversion en entier
  if TryStrToInt(valStr, val) then

    PourcentageGlobal := val;
    PaintBox1.Invalidate;
   // ShowMessage(IntToStr(PourcentageGlobal));
  //  ShowMessage('Valeur entière récupérée : ' + IntToStr(val));
end;



end.

