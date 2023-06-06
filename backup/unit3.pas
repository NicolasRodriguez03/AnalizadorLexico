unit Unit3;

interface
USES ARCHIVO;
Const
  q0=0;
  F=[2];
Type
  Q=0..3;
  SigmaR=(letra,digito,otro,comilla);
  TipoDelta=Array[Q,SigmaR] of Q;

Function CarASimb(Car:Char):SigmaR;
Function constanteCADENA(var arch:t_arch; var control:longint;var Lexema:string):Boolean;
implementation
Function constanteCADENA(var arch:t_arch; var control:longint;var Lexema:string):Boolean;   //(Fuente,Control,Lexema)
Var
  EstadoActual:Q;
  Delta:TipoDelta;
  DATO,CAR:CHAR;
Begin
  Delta[0,letra]:=3;
  Delta[0,digito]:=3;
  Delta[0,comilla]:=1;
  Delta[0,otro]:=3;
  Delta[1,letra]:=1;
  Delta[1,comilla]:=2;
  Delta[1,digito]:=1;
  Delta[1,otro]:=1;
  EstadoActual:=q0;
  seek(arch, control);
  read(arch,dato);
  while (EstadoActual <> 2)  and (EstadoActual <> 3)  do
    begin
     control:=control +1;
    EstadoActual:=Delta[EstadoActual,CarASimb(CAR)];
    end;
    constanteCADENA:=EstadoActual in F;
End;

Function CarASimb(Car:Char):SigmaR;
Begin
  Case Car of
     'a'..'z', 'A'..'Z':CarASimb:=letra;
    '0'..'9'	     :CarASimb:=digito;
    '"'          :CarASimb:=comilla;
  else
   CarASimb:=otro
  End;
End;


end.
