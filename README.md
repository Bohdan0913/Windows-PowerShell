# Proyecto Fin de Curso ASIX  | Kyfchuk Bohdan
#### IES FRANCESC DE BORJA MOLL
##### ---------------------------------------------------------------------------------------------------------------------------------------------------------
## Scripts de Windows en PowerShell

### Como ejecutar el script:

##### Para poder ejecutar el script debemos abrir la carpeta "Proyecto Final ASIX", abrir el archivo llamado ProyectoASIX.ps1, copiar su contenido, pegarlo en por ejemplo un bloc de notas y guardarlo con la extensión "ps1"

##### Una vez tenemos el archivo con todo el contenido del script con la extensión "ps1" procedemos a ejecutarlo para ello abrimos Inicio -> Windows PowerShell -> clic derecho y abrir como administrador, se abrirá una pestaña con fondo azul por defecto, usaremos los comandos "cd" para entrar en un directorio, "cd .." para retroceder al directorio anterior y "ls" para listar el contenido en el directorio actual, debemos situarnos en el directorio donde guardamos el script anteriormente, una vez nos encontramos en dicho directorio, escribiremos el siguiente comando: 

- powershell.exe -ExecutionPolicy Bypass .\NombreDelScript.ps1

Por defecto las políticas de seguridad de Windows para poder ejecutar cualquier script están en modo "Restricted" por lo cual no podremos ejecutar el script sin cambiar dicha política pero en vez de cambiarla de forma permanente usaremos la opción "Bypass" está diseñada para ser utilizada cuando está cambiando temporalmente la política de ejecución durante una ejecución única Powershell.exe para permitir la ejecución de un único script una vez, sin alterar la configuración actual y alterar la seguridad del sistema. 

### En qué consiste el proyecto:

El proyecto consiste en crear un script que al ejecutarse muestra un menú con diferentes opciones, cada opción permite al usuario configurar un aspecto del sistema como por ejemplo crear usuarios, modificar las configuraciones de la red, visualizar el estado actual de la red, etc.

### Instrucciones:

El programa se comporta de la siguiente manera: al ejecutar el script se abrirá un menú con opciones y aparece una pregunta: "Continuar?" que el usuario tiene que contestar con un "si" o "no" dependiendo si quiere continuar con la ejecución del script o salir, al responder "si" el scipr sigue ejecutándose y le hace otra pregunta al usuario: "Elige un número", el usuario tendrá que introducir uno de los números que aparecen en el menú dependiendo de qué aspecto del sistema desea configurar, una vez el usuario introduce un número aparecerán unas instrucciones que se deben seguir para realizar dicha configuración, al finalizar la configuración el programa volverá a mostrar el menú al usuario volviendo a preguntándole si desea continuar con el script o salir.

### Cómo funciona el código:

Para crear el menú he utilizado un bucle **"WHILE"** y los condicionales **"IF"** y **"SWITCH"**. El bucle "While" funciona de tal forma que cuando el usuario elige una opción, al finalizarla se vuelve a mostrar el menú con todas las opciones dándole al usuario la posibilidad de seguir administrando eligiendo otra opción del menú (o la misma) sin la necesidad de volver a ejecutar el script de nuevo.

Para que el script pueda ejecutar el código que el usuario le dice he usado el cmdlet Read-Host que ofrece Windows PowerShell que permite al usuario interactuar con el script dándole la posibilidad de escribir texto por pantalla, dicho texto se guarda en una variable que posteriormente usaremos en los condicionales **"IF"** y **"Switch"** para ejecutar las líneas de código que deseamos, dependiendo de la respuesta que ha proporcionado el usuario se ejecutarán diferentes líneas de código, por ejemplo en la condicional **"Switch"** si el usuario posteriormente escribió el número 1, se ejecutará la línea de código del switch que tiene puesto el número 1 (crear usuario).

La condicional **"IF"** se ha usado para que dependiendo de las respuestas del usuario el programa ejecute una opción u otra, por ejemplo al ejecutar el script aparece una pregunta de si el usuario desea continuar con el script o salir, esta opción se ha creado usando la condicional **"IF"** ya que dependiendo de la respuesta del usuario el script sigue ejecutándose o se cierra, también se ha usado esta condicional para confirmar la respuesta del usuario, por ejemplo cuando elegimos una opción y modificamos alguna configuración del sistema antes de realizarse dicha modificación aparecerá una pregunta de confirmación que el usuario debe contestar con un "si" o "no" dependiendo si desea confirmar que se realice la configuración o no.

Y por último la condicional **"SWITCH"**, se ha usado esta condicional para crear las opciones del menú, cada opción forma parte del **"Switch"** de tal forma que no se necesita crear las condicionales **"if"** para que el script ejecute una opción u otra dependiendo de la respuesta del usuario sino que todas las opciones del menú forman parte del switch y se ejecutan dependiendo de la respuesta del usuario.

### Tecnologías implicadas:

- Windows PowerShell

- Windows PowerShell ISE

- Símbolo del sistema

- Navegador web

- Tres Máquinas Virtuales Windows 10, Windows 10 y Windows 7

- Archivos de texto sin formato con la extensión .bat y .ps1

- Aplicaciones del sistema
