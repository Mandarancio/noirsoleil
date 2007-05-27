program NoirSoleil;

{%ToDo 'NoirSoleil.todo'}

uses
  Forms,
  main in 'main.pas' {Form1},
  Rielaboratore in 'Rielaboratore.pas' {Form2},
  ante in 'ante.pas' {form3},
  search in 'search.pas',
  Console in 'Console.pas' {Form4},
  anteRielab in 'anteRielab.pas' {Form5},
  macchieunit in 'macchieunit.pas',
  Grafici in 'Grafici.pas' {Form6},
  GraficoArea in 'GraficoArea.pas' {Form7};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Noir Soleil 1.0B';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(Tform3, form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.Run;
end.
