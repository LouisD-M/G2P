unit Unit8;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

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
    procedure Label11Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}

procedure TForm8.Label11Click(Sender: TObject);
begin
self.close;
end;

end.
