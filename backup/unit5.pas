unit Unit5;

{$mode ObjFPC}{$H+}

interface
USES ARCHIVO, Lista, id,const_real, const_cadena,s_especial;
procedure SALTO(Var arch:t_arch;Var control:Longint);
Procedure ObtenerSiguienteCompLex(Var arch:t_arch;Var control:Longint; Var complex:string;Var Lexema:String;Var TS:T_LISTA);
Procedure InstalarEnTS(Lexema: string;var TS:T_LISTA;CompLex: string);
Procedure Cargar_TS(var TS:T_LISTA);
var TS:T_LISTA;

implementation
procedure SALTO(Var arch:t_arch;Var control:Longint);
var X:CHAR;
begin
if not eof(arch) then
begin
leer_dato(ARCH,control,x);
 while(X in [#1..#32])  do
 BEGIN            
writeln('salto');
 CONTROL:=CONTROL+1;
 leer_dato(ARCH,control,x);
 end;
 end;
end;

Procedure ObtenerSiguienteCompLex(Var arch:t_arch;Var control:Longint; Var complex:string;Var Lexema:String;Var TS:T_LISTA);
Begin {La TS ya ingresa cargada con las Palabras Reservadas}
{Avanzar el Control salteando todos los caracteres de control y espacios, hasta
el primer carácter significativo}
If Identificador(ARCH,Control,Lexema) then
BEGIN
  Complex:='Identificador';
  InstalarEnTS(Lexema,TS,CompLex);
end
else If ConstanteReal(ARCH,Control,Lexema) then
     begin
      complex:='ConstanteReal';
      InstalarEnTS(Lexema,TS,CompLex);
    end
else If ConstanteCADENA(ARCH,Control,Lexema) then
     begin
      complex:='ConstanteCADENA'; 
      InstalarEnTS(Lexema,TS,CompLex);
    end
else if EsSimboloEspecial(ARCH,Control,Lexema,complex) then
     begin
      //complex:='SimboloEspecial'; 
      InstalarEnTS(Lexema,TS,CompLex);
    end
else complex:='Error Lexico'
End;

Procedure Cargar_TS(var TS:T_LISTA);
var X:T_DATO1;
begin
PRIMERO(TS);
if NOT LISTA_LLENA(TS) then
BEGIN
X.LEXEMA:='PROGRAM';
X.COMPLEX:='PROGRAMA';
AGREGAR(TS,X);
X.LEXEMA:='BEGIN';
X.COMPLEX:='begin';
AGREGAR(TS,X);
X.LEXEMA:='END';
X.COMPLEX:='end';
AGREGAR(TS,X);
X.LEXEMA:='WHILE';
X.COMPLEX:='while';
AGREGAR(TS,X);
X.LEXEMA:='IF';
X.COMPLEX:='if';
AGREGAR(TS,X);
X.LEXEMA:='READ';
X.COMPLEX:='read';
AGREGAR(TS,X);
END;
end;

Procedure InstalarEnTS(Lexema: string;var TS:T_LISTA;CompLex: string);
VAR ENC:BOOLEAN;
  X:T_DATO1;
begin
BUSCAR_L(TS, Lexema, ENC);
if not enc and not lista_llena(TS)then
begin
SIGUIENTE(TS);
 X.LEXEMA:=Lexema;
X.COMPLEX:=CompLex;
AGREGAR(TS,X);
end;
  end;
end.






