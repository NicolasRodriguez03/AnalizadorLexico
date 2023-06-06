program Project1;

uses id, const_real, const_cadena, s_especial, unit5, ARCHIVO,Lista, crt;


var
  arch:t_arch; control:longint;    complex, Lexema:string;     TS:T_LISTA;


  begin
    WRITELN('1');
    CREAR_ABRIR(ARCH);
    CREARLISTA (TS);
    //Cargar_TS(TS);
    control:=0;
   SALTO(arch,control);
   repeat
   begin
    ObtenerSiguienteCompLex(arch, control, complex, Lexema,TS);
    writeln('COMPONENTE: ',complex);
    writeln('LEXEMA: ',Lexema);
    readkey;
    //SALTO(arch,control);
   end;
   until eof(arch);


end.

