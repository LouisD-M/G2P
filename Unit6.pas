unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,  FireDAC.Comp.Client, Unit2;

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
    procedure Label11Click(Sender: TObject);
    procedure Label10Click(Sender: TObject);

  private
    { Déclarations privées }
  public
  procedure InsererProjet(conn: TFDConnection);
    { Déclarations publiques }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

procedure TForm6.InsererProjet(conn: TFDConnection);
var
  qry: TFDQuery;
begin
  qry := TFDQuery.Create(nil);
  try
    qry.Connection := conn;
    qry.SQL.Text :=
      'INSERT INTO projet (titre, responsable, date_debut, statut, priorite, cout_reel, description, commentaires) ' +
      'VALUES (:titre, :responsable, :date_debut, :statut, :priorite, :cout_reel, :description, :commentaires)';
    qry.ParamByName('titre').AsString := Edit1.Text;
    qry.ParamByName('responsable').AsString := Edit2.Text;
    qry.ParamByName('date_debut').AsString := Edit3.Text;
    qry.ParamByName('statut').AsString := ComboBoxStatut.Text;
    qry.ParamByName('priorite').AsString := Edit5.Text;
    qry.ParamByName('cout_reel').AsString := Edit6.Text;
    qry.ParamByName('description').AsString := Edit7.Text;
    qry.ParamByName('commentaires').AsString := Edit8.Text;

    qry.ExecSQL;

    ShowMessage('Projet ajouté avec succès.');
    Self.Close;
  finally
    qry.Free;
  end;
end;

procedure TForm6.Label10Click(Sender: TObject);
begin
  InsererProjet(Form2.FDConnection1);  // Appelle la procédure en passant la connexion
end;

procedure TForm6.Label11Click(Sender: TObject);
begin
self.close;
end;

end.
