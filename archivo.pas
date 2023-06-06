unit ARCHIVO;

INTERFACE
CONST
RUTA='C:\Users\Standard\Desktop\PRUEBA.TXT';
TYPE
t_dato=char;
  t_arch= file of t_dato;

PROCEDURE CREAR_ABRIR(VAR ARCH:T_ARCH);
PROCEDURE CERRAR(VAR ARCH:T_ARCH);
procedure leer_dato(VAR ARCH:T_ARCH; i:longint; var x:t_dato);

IMPLEMENTATION

procedure leer_dato(VAR ARCH:T_ARCH; i:longint; var x:t_dato);
begin
if  (not eof(arch)) then
   begin
SEEK(ARCH, I);
READ(ARCH, X);
   end
ELSE
X:=#0;
end;
PROCEDURE CREAR_ABRIR(VAR ARCH:T_ARCH);
BEGIN
 ASSIGN(ARCH,RUTA);
 {$I-}
 RESET(ARCH);
 {$I+}
 IF IORESULT<> 0 THEN
 REWRITE(ARCH);
END;

PROCEDURE CERRAR(VAR ARCH:T_ARCH);
 BEGIN
 CLOSE(ARCH);
 END;

END.
