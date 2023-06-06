program Project1;

uses id, const_real, const_cadena, s_especial, unit5, ARCHIVO,Lista, crt;


var
  arch:t_arch; control:longint;    complex, Lexema:string;     TS:T_LISTA;
  c:boolean;
  dato:T_DATO1;

  begin
    WRITELN('1');
    CREAR_ABRIR(ARCH);
    CREARLISTA (TS);
    Cargar_TS(TS);
    writeln('cargada');
    control:=0;
    c:=true;
   SALTO(arch,control);
   while c do
   begin
   if eof(arch) then
       begin
       c:=false;
       writeln(c);
       readkey;
       end;
   Lexema:='';
    ObtenerSiguienteCompLex(arch, control, complex, Lexema,TS);
    writeln('COMPONENTE: ',complex);
    writeln('LEXEMA: ',Lexema);
    SALTO(arch,control);
   end;

   primero(ts);
   while not fin(ts) do
   begin
        recuperar(ts,dato);
        siguiente(ts);
        writeln('lexema ', dato.lexema);
        writeln('comp lexico ', dato.complex);
        writeln();
   end;


   readkey;
end.

