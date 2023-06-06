unit s_especial;

{$mode ObjFPC}{$H+}
interface
uses
  Classes, SysUtils, ARCHIVO;
function EsSimboloEspecial(var arch:t_arch; var control:longint;var Lexema:string; var complex:string): boolean;


implementation

function EsSimboloEspecial(var arch:t_arch; var control:longint;var Lexema:string; var complex:string): boolean;
VAR DATO:CHAR;
    i,x:longint;
begin
  i:=control;
  leer_dato(ARCH,i,dato);
  EsSimboloEspecial:=false;
  writeln(control);
  case  dato of
  '.' :  begin
    complex:='punto';
    Lexema:='.';
    CONTROL:=CONTROL+1;  
    EsSimboloEspecial:=true;
  end;
  '=': begin
    complex:='signoigual';
    Lexema:='=';
    CONTROL:=CONTROL+1; 
    EsSimboloEspecial:=true;
  end;
  ':': begin
    complex:='opasig';
    Lexema:=':';
    CONTROL:=CONTROL+1;   
    EsSimboloEspecial:=true;
  end;
   ',': begin
    complex:='coma';
    Lexema:=',';
    CONTROL:=CONTROL+1;  
    EsSimboloEspecial:=true;
  end;
   ';':
    begin
    complex:='puntoycoma';
    Lexema:=';';
    CONTROL:=CONTROL+1; 
    EsSimboloEspecial:=true;
    end;
   '(':
    begin
    complex:='p1';
    Lexema:='(';
    CONTROL:=CONTROL+1; 
    EsSimboloEspecial:=true;
    end;
   ')':
    begin
    complex:='p2';
    Lexema:=')';
    CONTROL:=CONTROL+1;
    EsSimboloEspecial:=true;
    end;
  end;
end;

end.

