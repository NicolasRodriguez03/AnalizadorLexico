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
  seek(arch, control);
  read(arch,dato);
  case  dato of
  '.' :  begin
    complex:='punto';
    Lexema:='.';
  end;
  '=': begin
    complex:='signoigual';
    Lexema:='=';
  end;
  ':': begin
    complex:='opasig';
    Lexema:=':';
  end;
   ',': begin
    complex:='coma';
    Lexema:=',';
  end;
   ';': begin
    complex:='puntoycoma';
    Lexema:=';';
  end;
   '(': begin
    complex:='p1';
    Lexema:='(';
  end;
   ')': begin
    complex:='p2';
    Lexema:=')';
  end;
end;
end;

end.

