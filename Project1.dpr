program Project1;

uses
  Vcl.Forms,
  Unit2 in '..\Gestion2projet2.0\Unit2.pas' {Form2},
  Unit3 in '..\Gestion2projet2.0\Unit3.pas' {Frame3: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  // Ceci lance ton dashboard
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.

