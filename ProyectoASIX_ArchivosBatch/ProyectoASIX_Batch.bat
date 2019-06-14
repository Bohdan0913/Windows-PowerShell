@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

rem Proyecto de fin de curso ASIX - Kyfchuk Bohdan - Menú de herramientas en archivos Batch
rem El proyecto trata de un menú con opciones donde cada opción permite realizar configuraciones en el sistema


TITLE Menu de herramientas en archivos Batch

rem Creamos la etiqueta "menu" a la cuál iremos con el comando GOTO 
:menu

cls
echo Menu de herramientas en archivos Batch:
echo.
echo --------------------------------
rem Con el comando "echo" mostramos por pantalla estas 10 opciones.
echo 1  - Saber direccion IP:
echo 2  - Abrir calculadora:
echo 3  - Exit:
echo 4  - Crear un nuevo usuario:
echo 5  - Borrar un usuario:
echo 6  - Establecer una IP Estatica:
echo 7  - Establecer una IP Dinamica:
echo 8  - Realizar Copia de seguridad COMPLETA:
echo 9  - Usar DISKPART para administrar Discos:
echo 10 - Ver los usuarios existentes:
echo --------------------------------
echo.
rem Con el comando set /p var, se mostrará un texto por pantalla donde el usuario tendrá que escribir un número de la lista anterior
set /p var= Elige una opcion: 

rem Dependiendo del número que ha elegido el usuario usaremos el comando GOTO para ir a una línea determinada del código
rem La condicional IF nos permite elegir dependiendo del número que ha escrito el usuario anteriormente y que se ha guardado en la variable
rem usar el comando GOTO para movernos por las etiquetas creadas en todo el código permitiéndonos ejecutar líneas de código específicas
if %var%==1 ( goto ip ) 
if %var%==2 ( goto calc )
if %var%==3 ( goto exit )
if %var%==4 ( goto crearuser )
if %var%==5 ( goto borraruser )
if %var%==6 ( goto cambiarIP )
if %var%==7 ( goto IPdinamica )
if %var%==8 ( goto backup )
if %var%==9 ( goto diskpart )
if %var%==10 ( goto veruser ) else ( goto error )

rem Creamos la etiqueta :ip que nos permite ejecutar el código que hay a continuación de esta etiqueta si el usuario ha escrito el número 1
:ip
cls
ipconfig
echo.
echo ----------------------------------------------
echo Pulsa cualquier tecla para regresar al menu...
rem Una vez que se ejecuta la línea del código "ipconfig" usamos el comando pause para congelar la pantalla y poder observar los resultados.
pause>nul
rem Al terminar la pausa se va a usar el comando "cls" para limpiar la pantalla y se ejecutará el comando GOTO "menu" que nos permite
rem volver a la pantalla de inicio volviéndonos a mostrar todas las opciones para poder volver a elegir otra opción o salir del script.
cls
goto menu

:calc
cls
rem Con el comando "start" y la ruta del ejecutable de la calculadora, abrimos la calculadora del sistema
start C:\Windows\system32\calc.exe
rem msg * Ha elegido la opción 2: Calculadora
goto menu
pause>nul

rem En caso de que el usuario escribe cualquier otro texto que NO sea uno de los números del menú le aparecerá el siguiente mensaje
rem diciendo que tiene que seleccionar uno de los números del menú.
:error
cls
echo Error, seleccione un numero del menu...
echo pulse cualquier tecla para continuar:
pause>nul
goto menu


:crearuser
cls
rem Al seleccionar el número 4 el comando GOTO nos llevará a esta parte de código, lo primero que se ejecutará será el comando set /p user
rem mostrando por pantalla el siguiente texto: Elige un nombre del usuario que desea CREAR, el usuario tendrá que responder a esta pregunta
rem escribiendo un nombre de usuario, que será guardado en la variable "user" que posteriormente se usará para crear dicho usuario
rem usando el comando net user "nombreDeLaVariable" (donde está guardado el nombre proporcionado por el usuario anteriormente).
set /p user= Elige un nombre del usuario que desea CREAR:
net user %user% * /add
echo usuario %user% se ha CREADO correctamente...
echo ----------------------------------------------
echo pulse cualquier boton para regresar al menu...
pause>nul
goto menu

rem En este caso se repite lo mismo que las líneas anteriores pero en lugar de crear el usuario se usará el comando de borrarlo.
:borraruser
cls
set /p user= Elige un nombre del usuario que desea BORRAR:
net user %user% /delete
echo usuario %user% se ha BORRADO correctamente...
echo ----------------------------------------------
echo pulse cualquier boton para regresar al menu...
pause>nul
goto menu

:veruser
cls
rem Con el comando net user podemos ver los usuarios existentes en el sistema.
net user
echo --------------------------------------------
echo Pulse cualquier tecla para volver al menu...
pause>nul
goto menu

:cambiarIP
cls
rem En esta parte del código se le harán 6 preguntas al usuario que tendrá que contestar, las 6 preguntas son para configurar
rem la red del sistema: Nombre de la interfaz, IP, máscara, Puerta de enlace, DNS primario y DNS secundario.
set /p interfaz= Nombre de Interfaz: 
echo.
set /p ip= IP: 
echo.
set /p mascara= Msscara: 
echo.
set /p puerta= Puerta de enlace: 
echo.
set /p dnsp= DNS primario: 
echo.
set /p dnss= DNS secundario: 
echo ----------------------------
rem En esta parte del código se mostrará por pantalla al usuario los parámetros que se van a cambiar en la red.
echo Se estableceran los siguientes cambios:
echo.
echo Nombre interfaz:	%interfaz%
echo.
echo Direccion IP:		%ip%
echo Mascara:		%mascara%
echo Puerta enlace:		%puerta%
echo.
echo DNS primario:		%dnsp%
echo DNS secundario:		%dnss%
:pregunta
echo.
rem Se le hará una pregunta de confirmación al usuario que tendrá que contestar con un "si" o con un "no" dependiendo si
rem quiere que se realicen los cambios en la configuración de la red o no.
set /p respuesta= Escribe si para continuar o no para salir: 
if %respuesta%==si ( goto aplicar ) 
if %respuesta%==no ( goto menu ) else ( goto pregunta )
pause>nul
:aplicar
rem Si el usuario responde que "si" a la pregunta de confirmación se ejecutará el siguiente código realizando dichos cambios en la red.
netsh interface ip set address name = "%interfaz%" source = static %ip% %mascara% %puerta%
netsh interface ip set dns "%interfaz%" static %dnsp%
netsh interface ip add dns name = "%interfaz%" addr = %dnss%
goto menu


rem Cuando el usuario selecciona el número 7 del menú se ejecutarán las líneas de abajo, el usuario tendrá que escribir el
rem nombre de la interfaz de la cual quiere establecer una dirección IP dinámica. 
:IPdinamica
cls
echo Se establecera la IP a Dinamica de la siguiente interfaz:
echo.
set /p int= Nombre de Interfaz: 

netsh interface ip set dns name = "%int%" dhcp
netsh interface ip set wins name = "%int%" dhcp
netsh interface ip set address name = "%int%" dhcp
rem ipconfig /renew
goto menu

rem En esta parte del código se le mostrará al usuario un ejemplo de cómo realizar una copia de los archivos.
:backup
cls
echo Se realizara una copia de TODOS los archivos del origen:
echo ---------------------------------------------------
echo Ejemplo de origen: C:\Users\alumne\Documents
echo Ejemplo de destino: C:\Users\alumne\Desktop\BACKUP
echo.
echo BACKUP es el nombre de la carpeta NUEVA que se creara al hacer la copia
echo.
echo El ejemplo creara una carpeta llamada BACKUP en el escritorio de todos los archivos guardados en Documentos
echo ---------------------------------------------------
echo.
rem El usuario tendrá que proporcionar la ruta de Origen del archivo a copiar y la ruta del Destino donde se va a copiar.
set /p copiaorigen= Escribe la ruta completa del ORIGEN del directorio: 
set /p copiadestino= Escribe la ruta completa del DESTINO del directorio: 
echo.
echo Se copiaran todos los archivos de: %copiaorigen%
echo Y se guardaran en: %copiadestino%
echo.
rem Se le hará una pregunta al usuario de confirmación, si desea continuar y realizar la copia o cancelar.
:confirmarcopia
set /p confirmar= Desea continuar? (si/no):  
if %confirmar%==si ( goto copiar ) 
if %confirmar%==no ( goto nocopiar ) else ( goto error2 )
pause>nul
goto menu

rem En caso de que el usuario responda "si" se realizará la copia de los archivos con el comando "xcopy"
:copiar
cls
xcopy %copiaorigen%\*.* %copiadestino%\*.* /d/e/y/c/i
echo.
echo Se ha creado la copia de seguridad con exito.
pause>nul
goto menu

rem En caso de que el usuario responda "no" se cancelará la creación de la copia.
:nocopiar
cls
echo Se ha cancelado la copia de seguridad.
pause>nul
goto menu

rem En el caso de que el usuario no conteste con un "si" o con un "no" le aparecerá un mensaje diciendo que tiene que escribir "si" o "no"
rem no puede escribir otro texto.
:error2
echo Seleccione: si o no
goto confirmarcopia

rem Y la última opción del menú nos llevará a estas líneas del código, que se mostrará por pantalla un tutorial de los pasos a seguir
rem para usar el comando Diskpart que nos permite realizar cambios en el disco duro como por ejemplo en este caso eliminar particiones.
:diskpart
cls
echo Diskpart es una utilidad para administrar discos.
echo.
echo Comandos para formatear un disco duro:
echo.
echo  list disk			- Muestra los discos disponibles.
echo  select disk 1			- Selecciona el disco 1.
echo  list part			- Muestra las particiones.
echo  select part 1			- Selecciona la particion 1.
echo  delete partition override	- Borra la particion.
echo.
echo Escribimos "1" u otro numero dependiendo del disco/particion que vayamos a usar
pause>nul
rem Después del tutorial se ejecutará la herramienta Diskpart con el comando "start diskpart.exe" donde el usuario podrá realizar
rem cambios en el disco basándose en la información adquirida en el tutorial.
start diskpart.exe
echo -----------------------------------------------
echo Presiona cualquier tecla para volver al menu...
pause>nul
goto menu

rem En el caso de que el usuario escriba el número 3 del menú de opciones el comando GOTO nos llevara hasta esta última línea del código
rem donde saldremos del script.
:exit