unit Unit10;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, FireDAC.Comp.Client;

type
  TForm10 = class(TForm)
    ComboBoxProjets: TComboBox;
    MemoExport: TMemo;
    BtnExporter: TButton;
    BtnFermer: TButton;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BtnExporterClick(Sender: TObject);
    procedure BtnFermerClick(Sender: TObject);
  private
    procedure ChargerProjets;
  public
  end;

var
  Form10: TForm10;

implementation

{$R *.dfm}

uses Unit2;

procedure TForm10.ChargerProjets;
var
  Q: TFDQuery;
begin
  ComboBoxProjets.Clear;
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := Form2.FDConnection1;
    Q.SQL.Text := 'SELECT titre FROM projet';
    Q.Open;
    while not Q.Eof do
    begin
      ComboBoxProjets.Items.Add(Q.FieldByName('titre').AsString);
      Q.Next;
    end;
  finally
    Q.Free;
  end;
end;

procedure TForm10.FormShow(Sender: TObject);
begin
  ChargerProjets;
end;

procedure TForm10.BtnExporterClick(Sender: TObject);
var
  Q: TFDQuery;
  titre: string;
  contenu: TStringList;
begin
  titre := ComboBoxProjets.Text;
  if titre = '' then
  begin
    ShowMessage('Veuillez sélectionner un projet.');
    Exit;
  end;

  Q := TFDQuery.Create(nil);
  contenu := TStringList.Create;
  try
    Q.Connection := Form2.FDConnection1;
    Q.SQL.Text := 'SELECT * FROM projet WHERE titre = :titre';
    Q.ParamByName('titre').AsString := titre;
    Q.Open;
    if not Q.IsEmpty then
    begin
      contenu.Add('Titre : ' + Q.FieldByName('titre').AsString);
      contenu.Add('Responsable : ' + Q.FieldByName('responsable').AsString);
      contenu.Add('Date d’ebut : ' + Q.FieldByName('date_debut').AsString);
      contenu.Add('Statut : ' + Q.FieldByName('statut').AsString);
      contenu.Add('Priorite : ' + Q.FieldByName('priorite').AsString);
      contenu.Add('Cout reel : ' + Q.FieldByName('cout_reel').AsString);
      contenu.Add('Description : ' + Q.FieldByName('description').AsString);
      contenu.Add('Commentaires : ' + Q.FieldByName('commentaires').AsString);
      MemoExport.Lines := contenu;

      contenu.SaveToFile('export_' + titre + '.txt');
      ShowMessage('Projet exporté dans le fichier : export_' + titre + '.txt');
    end;
  finally
    Q.Free;
    contenu.Free;
  end;
end;

procedure TForm10.BtnFermerClick(Sender: TObject);
begin
  Close;
end;

end.
