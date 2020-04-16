unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Math, Controls, Graphics, Dialogs, StdCtrls, Menus,
  ExtCtrls;

type

  { TZ11b }

  TZ11b = class(TForm)
    Button: TButton;
    Image1: TImage;
    MainMenu1: TMainMenu;
    Memo: TMemo;
    FileMenu: TMenuItem;
    Help: TMenuItem;
    Open: TMenuItem;
    FOpenDialog: TOpenDialog;
    Save: TMenuItem;
    FSaveDialog: TSaveDialog;
    SaveResult: TMenuItem;
    N1: TMenuItem;
    Quit: TMenuItem;
    XE: TEdit;
    YE: TEdit;
    ZE: TEdit;
    XL: TLabel;
    YL: TLabel;
    ZL: TLabel;
    procedure ButtonClick(Sender: TObject);
    procedure HelpClick(Sender: TObject);
    procedure OpenClick(Sender: TObject);
    procedure QuitClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure SaveResultClick(Sender: TObject);
  private

  public

  end;

var
  Z11b: TZ11b;

implementation

{$R *.lfm}

{ TZ11b }

procedure TZ11b.ButtonClick(Sender: TObject);
var x, y, z, a, b: real;
begin
x:= StrToFloat(XE.Text);
y:= StrToFloat(YE.Text);
z:= StrToFloat(ZE.Text);
a:=(3 + Exp(y - 1))/(1 + x * x * Abs(y - Sin(z)/Cos(z)));
b:= 1 + Abs(y - x) + Power(y - x, 2)/2 + Power(Abs(x - y), 3)/3;
Memo.Lines.Add('При X= '+FloatToStr(x)+', Y= '+FloatToStr(y)+', Z= '+FloatToStr(z)+', A= '+FloatToStr(round(a*100)/100)+', B= '+FloatToStr(round(b*100)/100));
end;

procedure TZ11b.HelpClick(Sender: TObject);
begin
ShowMessage('Программа считает A и B, используя X, Y, Z, по формулам. Автор: Пляскин В. В.');
end;

procedure TZ11b.OpenClick(Sender: TObject);
var f: textfile;
  FName, s1, s2, s3: string;
begin
  if FOpenDialog.Execute then
begin
FName := FOpenDialog.FileName;
AssignFile(f,FName);
Reset(f);
readln(f,s1);
readln(f,s2);
readln(f,s3);
XE.Text:= s1;
YE.Text:= s2;
ZE.Text:= s3;
end;
closeFile(f);
end;

procedure TZ11b.QuitClick(Sender: TObject);
begin
 close;
end;

procedure TZ11b.SaveClick(Sender: TObject);
var f: textfile;
  FName, s1, s2, s3: string;
begin
if FSaveDialog.Execute then
FName := FSaveDialog.FileName;
AssignFile(f,FName);
Rewrite(f);
s1:=XE.Text;
s2:=YE.Text;
s3:=ZE.Text;
writeln(f,s1);
writeln(f,s2);
writeln(f,s3);
closeFile(f);
end;

procedure TZ11b.SaveResultClick(Sender: TObject);
begin
  Memo.Lines.SaveToFile('Result.txt');
end;

end.

