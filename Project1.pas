program Project1;

uses id, const_real, const_cadena, s_especial, unit5, ARCHIVO,Lista, crt;


var
  arch:t_arch; control:longint;    complex, Lexema:string;     TS:T_LISTA;
  c:boolean;

  begin
    WRITELN('1');
    CREAR_ABRIR(ARCH);
    CREARLISTA (TS);
    Cargar_TS(TS);
    writeln('cargada');
    control:=0;
    c:=true;
   SALTO(arch,control);
   while not eof(arch) do
   begin
   Lexema:='';
    ObtenerSiguienteCompLex(arch, control, complex, Lexema,TS);
    writeln('COMPONENTE: ',complex);
    writeln('LEXEMA: ',Lexema);
    SALTO(arch,control);
   end;
   readkey;
end.

