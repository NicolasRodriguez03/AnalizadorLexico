unit const_real;

interface
USES ARCHIVO;
Const
  q0=0;
  F=[5];
Type
  Q=0..5;
  SigmaR=(signo,digito,otro,punto);
  TipoDelta=Array[Q,SigmaR] of Q;

Function CarASimb(Car:Char):SigmaR;
Function constanteREAL(var arch:t_arch; var control:longint;var Lexema:string):Boolean;

implementation
Function constanteREAL(var arch:t_arch; var control:longint;var Lexema:string):Boolean;   //(Fuente,Control,Lexema)
Var
  EstadoActual:Q;
  Delta:TipoDelta;
  X:CHAR; I:LONGINT;
Begin
  I:=CONTROL;
  Delta[0,signo]:=4;
  Delta[0,digito]:=1;
  Delta[0,punto]:=3;
  Delta[0,otro]:=3;
  Delta[1,punto]:=2;
  Delta[1,signo]:=3;
  Delta[1,digito]:=1;
  Delta[1,otro]:=5;
  Delta[2,digito]:=2;
  Delta[2,punto]:=3;
  Delta[2,signo]:=3;
  Delta[2,otro]:=5;
  Delta[4,digito]:=1;
  Delta[4,otro]:=3;
  Delta[4,punto]:=3;
  Delta[4,signo]:=3;
  EstadoActual:=q0;
  while (EstadoActual <> 3)  and (EstadoActual <> 5) do
    begin
     LEER_DATO(ARCH,I,X);
     X:=#0;
    EstadoActual:=Delta[EstadoActual,CarASimb(X)];
    I:=I+1;
    IF (ESTADOACTUAL = 1) OR (ESTADOACTUAL = 2)  THEN
      LEXEMA:= LEXEMA + X;
    END;
  IF EstadoActual in F THEN
     BEGIN
       IDENTIFICADOR:= TRUE;
       CONTROL:=I;
     end;
    end;

Function CarASimb(Car:Char):SigmaR;
Begin
  Case Car of
  '.'               :CarASimb:=punto;
    '0'..'9'	     :CarASimb:=digito;
    '+','-'          :CarASimb:=signo;
  else
   CarASimb:=otro
  End;
End;


end.

