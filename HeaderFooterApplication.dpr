program HeaderFooterApplication;

uses
  System.StartUpCopy,
  FMX.Forms,
  HeaderFooterTemplate in 'HeaderFooterTemplate.pas' {frm_Main},
  UMyInputQuery in 'UMyInputQuery.pas',
  UMyMsgDlg in 'UMyMsgDlg.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrm_Main, frm_Main);
  Application.Run;
end.
