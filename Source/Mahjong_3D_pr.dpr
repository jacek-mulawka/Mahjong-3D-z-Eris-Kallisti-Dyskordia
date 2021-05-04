program Mahjong_3D_pr;

uses
  Vcl.Forms,
  Mahjong_3D in 'Mahjong_3D.pas' {Mahjong_3D_Form};

{$R *.res}

begin

  ReportMemoryLeaksOnShutdown := DebugHook <> 0;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.HintHidePause := 30000;

  Application.CreateForm( TMahjong_3D_Form, Mahjong_3D_Form );
  Application.Run();

end.
