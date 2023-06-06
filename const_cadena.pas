unit const_cadena;

interface
USES ARCHIVO;
Const
  q0=0;
  F=[4];
Type
  Q=0..4;
  SigmaR=(letra,digito,otro,comilla);
  TipoDelta=Array[Q,SigmaR] of Q;

Function CarASimb(Car:Char):SigmaR;
Function constanteCADENA(var arch:t_arch; var control:longint;var Lexema:string):Boolean;
implementation
Function constanteCADENA(var arch:t_arch; var control:longint;var Lexema:string):Boolean;   //(Fuente,Control,Lexema)
Var
  EstadoActual:Q;
  Delta:TipoDelta;
  X:CHAR; I:LONGINT;
  LEXEMA_AUX:STRING;
Begin
  I:=CONTROL;
  WRITELN('SSS');
  Delta[0,letra]:=3;
  Delta[0,digito]:=3;
  Delta[0,comilla]:=1;
  Delta[0,otro]:=3;
  Delta[1,letra]:=1;
  Delta[1,comilla]:=2;
  Delta[1,digito]:=1;
  Delta[1,otro]:=1;
  Delta[2,otro]:=4;
  EstadoActual:=q0;
  while (EstadoActual <> 3) and (EstadoActual <> 4)  do
  begin
    LEER_DATO(ARCH,I,X);
    EstadoActual:=Delta[EstadoActual,CarASimb(X)];
    I:=I+1;
    IF (ESTADOACTUAL = 1) or (ESTADOACTUAL = 2)  THEN
      LEXEMA_AUX:= LEXEMA_AUX + X;
  END;
  IF EstadoActual in F then
     BEGIN
      CONSTANTECADENA:= TRUE;
      LEXEMA:=LEXEMA_AUX;
       CONTROL:=I-1;
     end;
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
