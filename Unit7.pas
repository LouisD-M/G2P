unit Unit7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, unit2, FireDAC.Comp.Client, FireDAC.Stan.Param, // <--- ajout important
  System.UITypes;

type
  TForm7 = class(TForm)
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
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Panel6: TPanel;
    Shape5: TShape;
    Label12: TLabel;
    ComboBox3: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure Label12Click(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form7: TForm7;


implementation

{$R *.dfm}






procedure TForm7.FormCreate(Sender: TObject);
var
  Qry: TFDQuery;
begin
  ComboBox2.Clear;

  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := Form2.FDConnection1;
    Qry.SQL.Text := 'SELECT titre FROM projet ORDER BY titre';
    Qry.Open;

    while not Qry.Eof do
    begin
      ComboBox2.Items.Add(Qry.FieldByName('titre').AsString);
      Qry.Next;
    end;

  finally
    Qry.Free;
  end;
end;

procedure TForm7.Label10Click(Sender: TObject);
var
  Qry: TFDQuery;
begin
  if ComboBox2.Text = '' then
  begin
    ShowMessage('Aucun projet sélectionné.');
    Exit;
  end;

  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := Form2.FDConnection1;
    Qry.SQL.Text :=
      'UPDATE projet SET ' +
      'responsable = :responsable, ' +
      'date_debut = :date_debut, ' +
      'statut = :statut, ' +
      'priorite = :priorite, ' +
      'cout_reel = :cout_reel, ' +
      'description = :description, ' +
      'commentaires = :commentaires ' +
      'WHERE titre = :titre';

    Qry.ParamByName('responsable').AsString := Edit2.Text;
    Qry.ParamByName('date_debut').AsString := Edit3.Text;
    Qry.ParamByName('statut').AsString := ComboBoxStatut.Text;
    Qry.ParamByName('priorite').AsString := Edit5.Text;
    Qry.ParamByName('cout_reel').AsString := Edit6.Text;
    Qry.ParamByName('description').AsString := Edit7.Text;
    Qry.ParamByName('commentaires').AsString := Edit8.Text;
    Qry.ParamByName('titre').AsString := ComboBox2.Text;

    Qry.ExecSQL;

    ShowMessage('Modifications enregistrées avec succès.');

  finally
    Qry.Free;
    self.Close;
  end;
end;

procedure TForm7.Label11Click(Sender: TObject);
begin
self.close;
end;

procedure TForm7.Label12Click(Sender: TObject);
var
  Qry: TFDQuery;
begin
  // Vérifie si un titre est bien sélectionné
  if ComboBox2.Text = '' then
  begin
    ShowMessage('Aucun projet sélectionné.');
    Exit;
  end;

  // Demande confirmation
  if MessageDlg('Voulez-vous vraiment supprimer "' + ComboBox2.Text + '" ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  // Création de la requête
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := Form2.FDConnection1; // Utilise la même connexion que Form2
    Qry.SQL.Text := 'DELETE FROM projet WHERE titre = :titre';
    Qry.ParamByName('titre').AsString := ComboBox2.Text;
    Qry.ExecSQL;

    ShowMessage('Projet supprimé avec succès.');

    // Optionnel : vider les champs
    ComboBox2.ItemIndex := -1;
    Edit2.Clear;
    Edit3.Clear;
    Edit5.Clear;
    Edit6.Clear;
    Edit7.Clear;
    Edit8.Clear;
    ComboBox1.ItemIndex := -1;
    ComboBoxStatut.ItemIndex := -1;

  finally
    Qry.Free;
  end;
  self.close;
end;

procedure TForm7.ComboBox2Change(Sender: TObject);
var
  Qry: TFDQuery;
begin
  if ComboBox2.Text = '' then Exit;

  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := Form2.FDConnection1;
    Qry.SQL.Text := 'SELECT * FROM projet WHERE titre = :titre';
    Qry.ParamByName('titre').AsString := ComboBox2.Text;
    Qry.Open;

    if not Qry.IsEmpty then
    begin
      Edit2.Text := Qry.FieldByName('responsable').AsString;
      Edit3.Text := Qry.FieldByName('date_debut').AsString;
      ComboBoxStatut.Text := Qry.FieldByName('statut').AsString;
      Edit5.Text := Qry.FieldByName('priorite').AsString;
      Edit6.Text := Qry.FieldByName('cout_reel').AsString;
      Edit7.Text := Qry.FieldByName('description').AsString;
      Edit8.Text := Qry.FieldByName('commentaires').AsString;
    end;

  finally
    Qry.Free;
  end;
end;

end.
