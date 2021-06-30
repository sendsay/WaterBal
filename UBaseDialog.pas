unit UBaseDialog;

{
  author: krapotkin

  * modified by ZuBy, 2016
}

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts, FMX.Objects, FMX.Ani;

type
  TfBaseDialog = class(TForm)
    r1: TRectangle;
    r2: TRectangle;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure r2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fBaseDialog: TfBaseDialog;

implementation

{$R *.fmx}

procedure TfBaseDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.cafree;
  StyleBook := nil;
end;

procedure TfBaseDialog.FormCreate(Sender: TObject);
const
{$IF defined(MACOS)}
  Rad = 8;
{$ELSEIF defined(ANDROID)}
  Rad = 2;
{$ELSE}
  Rad = 5;
{$ENDIF}
begin
  r1.XRadius := Rad;
  r1.YRadius := Rad;
end;

procedure TfBaseDialog.r2Click(Sender: TObject);
begin
  Close;
end;

end.
