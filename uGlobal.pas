unit UGlobal;

{
  author: krapotkin
}

interface

uses FMX.Forms, FMX.Types;

function GetParentForm(O: TFmxObject): TForm;

implementation

function GetParentForm(O: TFmxObject): TForm;
var
  P: TFmxObject;
begin
  Result := nil;
  P := O.Parent;
  while (P <> nil) and (not(P is TForm)) do
    P := P.Parent;
  if P <> nil then
    Result := P as TForm;
end;

end.
