unit s_especial;

{$mode ObjFPC}{$H+}
interface
uses
  Classes, SysUtils, ARCHIVO;
function EsSimboloEspecial(var arch:t_arch; var control:longint;var Lexema:string; var complex:string): boolean;


implementation

function EsSimboloEspecial(var arch:t_arch; var control:longint;var Lexema:string; var complex:string): boolean;
VAR DATO:CHAR;
begin
  leer_dato(ARCH,i,x);
  case  dato of
  '.' :  begin
    complex:='punto';
    Lexema:='.';
    CONTROL:=CONTROL+1;
  end;
  '=': begin
    complex:='signoigual';
    Lexema:='=';
    CONTROL:=CONTROL+1;
  end;
  ':': begin
    complex:='opasig';
    Lexema:=':';
    CONTROL:=CONTROL+1;
  end;
   ',': begin
    complex:='coma';
    Lexema:=',';
    CONTROL:=CONTROL+1;
  end;
   ';': begin
    complex:='puntoycoma';
    Lexema:=';';
    CONTROL:=CONTROL+1;
  end;
   '(': begin
    complex:='p1';
    Lexema:='(';
    CONTROL:=CONTROL+1;
  end;
   ')': begin
    complex:='p2';
    Lexema:=')';
    CONTROL:=CONTROL+1;
  end;
end;
end;

end.

