unit UMyMsgDlg;

{
  author: krapotkin

  * modified by ZuBy, 2016
}

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UBaseDialog, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts;

type
  TMyMsgDlg = class(TfBaseDialog)
    Layout1: TLayout;
    bOk: TSpeedButton;
    bCancel: TSpeedButton;
    Title: TText;
    Line1: TLine;
    procedure bOkClick(Sender: TObject);
  private
    aParentForm: TForm;
    OKProc: TThreadProcedure;
    OKHandler: TNotifyEvent;
    { Private declarations }
    procedure Init(const aPrompt: string; AOwner: TComponent);
    procedure myResize;
  public
    constructor Create(const aPrompt: string; AOwner: TComponent; const AOKHandler: TNotifyEvent = nil); overload;
    constructor Create(const aPrompt: string; AOwner: TComponent; const AOKProc: TThreadProcedure = nil); overload;
    procedure ShowMe;
  end;

implementation

{$R *.fmx}

uses UGlobal;

{ TMyMsgDlg }

procedure TMyMsgDlg.bOkClick(Sender: TObject);
begin
  if Assigned(OKHandler) then
    OKHandler(Self);
  if Assigned(OKProc) then
    OKProc;
end;

procedure TMyMsgDlg.Init(const aPrompt: string; AOwner: TComponent);
begin
  if AOwner <> nil then
  begin
    if AOwner is TForm then
      aParentForm := AOwner as TForm
    else
      aParentForm := GetParentForm(AOwner as TFmxObject);
    StyleBook := aParentForm.StyleBook;
  end;
  if aParentForm = nil then
    aParentForm := TForm(Screen.ActiveForm);

{$IF defined (ANDROID)} Title.Font.Size := 18; {$ENDIF}
  Title.Text := aPrompt;

  bOk.Size.PlatformDefault := true;
  bCancel.Size.PlatformDefault := true;

  myResize;
end;

procedure TMyMsgDlg.myResize;
begin
  inherited Resize;
  if Assigned(aParentForm) then
  begin
    ClientHeight := aParentForm.ClientHeight;
    ClientWidth := aParentForm.ClientWidth;
  end;
  Position := TFormPosition.OwnerFormCenter;

  Layout1.Height := bOk.Height;
  r1.Width := ClientWidth - (ClientWidth * 0.15);
  r1.Height := 10 + r1.Padding.Top + Layout1.Height + Title.Height + Title.Margins.Bottom;

  case TOSVersion.Platform of
    pfWindows, pfMacOS:
      begin
        bOk.Align := TAlignLayout.Left;
        bCancel.Align := TAlignLayout.Right;
      end;
  else
    begin
      bOk.Align := TAlignLayout.Right;
      bCancel.Align := TAlignLayout.Left;
    end;
  end;

  bOk.Width := (Layout1.Width / 2) - 7.5;
  bCancel.Width := bOk.Width;

  if Title.AutoSize then
  begin
    Title.Margins.Left := (r1.Width - Title.Width) / 2;
  end;
end;

procedure TMyMsgDlg.ShowMe;
begin
  Self.ShowModal(
    procedure(AResult: TModalResult)
    begin
    end);
end;

constructor TMyMsgDlg.Create(const aPrompt: string; AOwner: TComponent; const AOKHandler: TNotifyEvent = nil);
begin
  inherited Create(AOwner);
  OKHandler := AOKHandler;
  Init(aPrompt, AOwner);
end;

constructor TMyMsgDlg.Create(const aPrompt: string; AOwner: TComponent; const AOKProc: TThreadProcedure);
begin
  inherited Create(AOwner);
  OKProc := AOKProc;
  Init(aPrompt, AOwner);
end;

end.
