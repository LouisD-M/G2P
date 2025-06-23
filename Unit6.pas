unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Comp.Client, Unit2, Data.DB;

type
  TForm6 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Shape1: TShape;
    Label1: TLabel;
    Panel3: TPanel;
    Shape2: TShape;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Panel4: TPanel;
    Shape3: TShape;
    Label10: TLabel;
    Panel5: TPanel;
    Shape4: TShape;
    Label11: TLabel;
    ComboBoxStatut: TComboBox;
    Edit1: TEdit;
    LabelLierA: TLabel;
    ComboBoxLierA: TComboBox;
    procedure Label11Click(Sender: TObject);
    procedure Label10Click(Sender: TObject);

    procedure FormCreate(Sender: TObject);

  private
    procedure ChargerTitresDansComboBoxLierA; // <- bien déclarée ici
  public
    procedure InsererProjet(conn: TFDConnection);
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}



procedure TForm6.FormCreate(Sender: TObject);
begin
  ChargerTitresDansComboBoxLierA;
end;

procedure TForm6.InsererProjet(conn: TFDConnection);
var
  qry, qryID: TFDQuery;
  titreLie: string;
  projetID: Integer;
begin
  qry := TFDQuery.Create(nil);
  qryID := TFDQuery.Create(nil);
  try
    qry.Connection := conn;
    qryID.Connection := conn;

    // 1. Déterminer l'ID du projet sélectionné dans ComboBoxLierA
    projetID := 0;
    titreLie := ComboBoxLierA.Text;

    if (titreLie <> '') and (titreLie <> 'Aucun projet') then
    begin
      qryID.SQL.Text := 'SELECT id FROM projet WHERE titre = :titre';
      qryID.ParamByName('titre').AsString := titreLie;
      qryID.Open;

      if not qryID.IsEmpty then
        projetID := qryID.FieldByName('id').AsInteger
      else
        raise Exception.Create('Projet lié introuvable en base.');
    end;

    // 2. Insérer le projet avec lier_a = projetID (ou 0 si Aucun)
    qry.SQL.Text :=
      'INSERT INTO projet (titre, responsable, date_debut, statut, priorite, cout_reel, description, commentaires, lier_a) ' +
      'VALUES (:titre, :responsable, :date_debut, :statut, :priorite, :cout_reel, :description, :commentaires, :lier_a)';

    qry.ParamByName('titre').AsString := Edit1.Text;
    qry.ParamByName('responsable').AsString := Edit2.Text;
    qry.ParamByName('date_debut').AsString := Edit3.Text;
    qry.ParamByName('statut').AsString := ComboBoxStatut.Text;
    qry.ParamByName('priorite').AsString := Edit5.Text;
    qry.ParamByName('cout_reel').AsString := Edit6.Text;
    qry.ParamByName('description').AsString := Edit7.Text;
    qry.ParamByName('commentaires').AsString := Edit8.Text;

 if projetID = 0 then
begin
  qry.ParamByName('lier_a').DataType := ftInteger;
  qry.ParamByName('lier_a').Clear;
end
else
  qry.ParamByName('lier_a').AsInteger := projetID;

    qry.ExecSQL;

    ShowMessage('Projet ajouté avec succès.');
    Self.Close;
  finally
    qry.Free;
    qryID.Free;
  end;
end;


procedure TForm6.Label10Click(Sender: TObject);
begin
  InsererProjet(Form2.FDConnection1);
end;

procedure TForm6.Label11Click(Sender: TObject);
begin
  Self.Close;
end;

// ✅ AJOUT : Code manquant – Chargement des titres dans la ComboBox
procedure TForm6.ChargerTitresDansComboBoxLierA;
var
  Qry: TFDQuery;
begin
  ComboBoxLierA.Clear;
  ComboBoxLierA.Items.Add('Aucun projet');

  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := Form2.FDConnection1;
    Qry.SQL.Text := 'SELECT titre FROM projet ORDER BY titre';
    Qry.Open;

    while not Qry.Eof do
    begin
      ComboBoxLierA.Items.Add(Qry.FieldByName('titre').AsString);
      Qry.Next;
    end;

  finally
    Qry.Free;
  end;

  ComboBoxLierA.ItemIndex := 0;
end;

end.

