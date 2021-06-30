unit HeaderFooterTemplate;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Effects, FMX.Platform, FMX.DialogService,
  FMX.Layouts;

type
  Tfrm_Main = class(TForm)
    tlb_Header: TToolBar;
    tlb_Footer: TToolBar;
    lbl_HeaderLabel: TLabel;
    btn_Plus: TSpeedButton;
    btn_Params: TSpeedButton;
    lbl_HeaderToday: TLabel;
    lbl_Balance: TLabel;
    pnl_BackGround: TPanel;
    shdwfct_1: TShadowEffect;
    ScrollBox1: TScrollBox;
    procedure btn_PlusClick(Sender: TObject);
  private
    { Private declarations }
  public
    iToDayVolume : Double;
  end;

var
  frm_Main: Tfrm_Main;


implementation

uses
  UMyInputQuery, UMyMsgDlg, vkbdhelper;

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure Tfrm_Main.btn_PlusClick(Sender: TObject);
var
  EnterVolumeDlg : TMyInputQuery;
  i, j : Double;
begin
  EnterVolumeDlg := TMyInputQuery.Create(['Enter volume in mL.'], [''], self,
    procedure
    begin
      iToDayVolume := (iToDayVolume + (EnterVolumeDlg.Values[0].ToInteger()) / 1000);
//      i := (iToDayVolume / 1000);
//      j := (iToDayVolume mod 1000);
//
//      ShowMessage(i.ToString + ' -- '+ j.ToString);





      lbl_Balance.Text := FloatToStr(iToDayVolume) + ' mL.';
    end
  );
  EnterVolumeDlg.ShowMe;
end;

end.
