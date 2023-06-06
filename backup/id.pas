unit id;
interface
USES ARCHIVO;
Const
  q0=0;
  F=[3];
Type
  Q=0..3;
  SigmaID=(letra,digito, otro);
  TipoDelta=Array[Q,SigmaID] of Q;
Function CarASimb(Car:Char):SigmaID;
Function identificador(var arch:t_arch; var control:longint;var Lexema:string):Boolean;

implementation
Function identificador(var arch:t_arch; var control:longint;var Lexema:string):Boolean;   //(Fuente,Control,Lexema)
Var
  EstadoActual:Q;
  Delta:TipoDelta; X:CHAR; I:LONGINT;
Begin
  I:=CONTROL;
   Lexema:='';
  Delta[0,letra]:=1;
  Delta[0,digito]:=2;
  Delta[0,otro]:=2;
  Delta[1,letra]:=1;
  Delta[1,digito]:=1;
  Delta[1,otro]:=3;
  EstadoActual:=q0;
  while (EstadoActual <> 3) and (EstadoActual <> 2) do
  begin
  leer_dato(ARCH,i,x);
    EstadoActual:=Delta[EstadoActual,CarASimb(X)];
    I:=I+1;
     IF EstadoActual = 1 then
      lexema:= lexema +x;
     END;
    IF EstadoActual in F THEN
     BEGIN
       IDENTIFICADOR:= TRUE;
       CONTROL:=I-1;
     end;
End;

Function CarASimb(Car:Char):SigmaID;
Begin
  Case Car of
  'a'..'z', 'A'..'Z':CarASimb:=letra;
    '0'..'9'	     :CarASimb:=digito;
  else
   CarASimb:=otro
  End;
End;


end.

