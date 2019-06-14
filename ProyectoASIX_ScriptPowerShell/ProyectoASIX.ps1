<# Windows PowerShell | Proyecto final de curso ASIX | Kyfchuk Bohdan

#-----------------------------------------------------------------------------------------#

- He utilizado la aplicaci�n Windows PowerShell ISE para la creaci�n del proyecto.

- El proyecto trata de crear un men� de herramientas utilizando el bucle: While
y las sentencias IF/ELSEIF/ELSE y SWITCH

- Con estas declaraciones condicionales he creado un men� de multiples opciones
que el usuario puede seleccionar dependiendo de los cambios que necesite realizar en el sistema.

- Para seleccionar las opciones, el usuario debe escribir los n�meros de 1 al 10.

- Para poder ejecutar este script tenemos que: abrir "Inicio" escribir "Windows Powershell" hacemos
clic derecho sobre la aplicaci�n "Windows PowerShell" ejecutar como administrador, se abrir� la
ventana de PowerShell con un fondo azul por defecto, usaremos los comandos "cd" para entrar en los
directorios, "cd .." para volver al directorio anterior y "ls" para listar los elementos del
directorio actial, con estos comandos nos tendremos que situar en la carpeta donde tenemos
guardados los Scripts de PowerShell que llevar�n la extensi�n .ps1 y por �ltimo para ejecutar
el script que deseemos solamente tendremos que escribir:
powershell.exe -ExecutionPolicy Bypass .\NombreDelScript.ps1
#>

#-----------------------------------------------------------------------------------------#

# El cmdlet "Clear-Host" limpia la pantalla.
Clear-Host

# He utilizado el cmdlet "Write-Host" que equivale a un "Echo" para mostrar por pantalla las opciones
# que el usuario puede utilizar.

<#
Write-Host "1: Crear usuario"
Write-Host "2: Eliminar usuario"
Write-Host "3: Ver usuarios existentes"
Write-Host "4: Ver la configuraci�n de la red"
Write-Host "5: Salir"
#>

<# Cmdlet Read-Host muestra por pantalla un texto y el usuario tiene que responder con otro texto,
en este caso tendr� que escribir "si o no", la respuesta del usuario la guardaremos en una variable
llamada "$opcion" usando el cmdlet "Read-Host", y dependiendo de la respuesta que se ha guardado en
la varieble proporcionada por el usuario, el script seguir� adelante o se cerrar�.#>

#$opcion = read-Host "Desea continuar? si/no"

<# Lo primero que he hecho es crear un bucle "While", para que una vez seleccionada una opci�n por
el usuario y realizados los cambios que se tienen que realizar, el c�digo nos devolover� al
principio del programa d�ndonos la posibilidad de volver a elegir otra opci�n del men�.#>

#while ($opcion -eq "si")
while ($true)
{

#Con el cmdlet Write-Host se mostrar�n por pantalla las opciones del men� que el usuario
#podr� elegir
Write-Host "MENU DE HERRAMIENTAS EN POWERSHELL"
Write-Host "Seleccione una de las siguientes opciones:"
Write-Host "-------------------------------------------"
Write-Host " 1: Crear usuario"
Write-Host " 2: Eliminar usuario"
Write-Host " 3: Ver usuarios existentes"
Write-Host " 4: Ver la configuraci�n de la red"
Write-Host " 5: Abrir el explorador"
Write-Host " 6: Establecer una Direcci�n IP Est�tica"
Write-Host " 7: Establecer una Direcci�n IP Din�mica"
Write-Host " 8: Borrar una direcci�n IP"
Write-Host " 9: Establecer el DNS"

Write-Host "-------------------------------------------" 

    Write-Host ""
    #Escribiendo una variable + Read-Host + un texto que se mostrar� por pantalla conseguimos que
    #la respuesta del usuario se guarde en la variable en este caso la variable se llama "respuesta"
    $respuesta = read-Host "Continuar? si/no"

    #Usaremos la condicional "IF" para que dependiendo de la respuesta que ha proporcionado el
    #usuario anteriormente se ejecute el c�digo dentro del "IF" o se salga del "IF" y de esta forma
    #tambi�n salir del script.
    if ($respuesta -eq "si")
    {
        #Si la respuesta del usuario es "si" entraremos en la condicional "IF" ejecutando el c�digo
        #del "Switch", un switch se usa para agilizar la toma de decisiones m�ltiples, es decir
        #en este switch hay m�ltiples opciones que dependiendo del n�mero que escribir� el usuario
        #se ejecutar� las l�neas del n�mero permitiendo ejecutar solo las l�neas que necesitamos
        #para realizar una configuraci�n espec�fica del sistema.
        switch(Read-Host "selecciona un n�mero")
        {
            1{Write-Host ""
            $nombre = read-host "Nombre de Usuario a crear" 
            $pass = read-host "Escribe una contrase�a" -AsSecureString
            Write-Host "Se ha creado el usuario: $nombre"
            New-LocalUser $nombre -Password $pass
            Write-Host "-----------------------------------------------------------------------"
            pause
            Clear-Host}
        
            2{Write-Host ""
            $nombre = read-host "Nombre de usuario a borrar'"
            Write-Host "Se ha eliminado el usuario $nombre"
            Remove-LocalUser -Name $nombre
            Write-Host "-----------------------------------------------------------------------"
            pause
            Clear-Host}

            3{Write-Host ""
            Write-Host "Ha seleccionado la opci�n 3 'Ver usuarios existentes'"
            net user
            Write-Host "-----------------------------------------------------------------------"
            pause
            Clear-Host}

            4{Write-Host ""
            Write-Host "Ha seleccionado la opci�n 4 'Ver la configuraci�n de la red'"
            #Get-NetIPConfiguration
            #Usaremos el comando ipcondif -all para visualizar la configuraci�n actual de la red.
            ipconfig -all
            Write-Host "-----------------------------------------------------------------------"
            pause
            Clear-Host}
        
            5{Write-Host ""
            Write-Host "Ha seleccionado la opci�n 5 'Abrir el explorador'"
            #Con el comando "start" podemos abrir el navegador.
            start https://www.google.com/
            Write-Host "-----------------------------------------------------------------------"
            pause
            Clear-Host}

            6{Write-Host ""
            Write-Host "Ha seleccionado la opci�n 6 'Establecer una direcci�n IP est�tica'"
            Write-Host ""
            Write-Host "Para establecer una IP est�tica necesitas introducir 4 campos:"
            Write-Host ""
            Write-Host "Direcci�n IP (establecer una IP, ej: 192.168.1.10)"
            Write-Host "InterfaceAlias (El nombre de la interfaz, ej: Ethernet)"
            Write-Host "DefaultGateway (La puerta de enlace, ej: 192.168.1.1)"
            Write-Host "PrefixLength (Mascara: 8,16,24,32 )"
            Write-Host ""
            Write-Host "---------------------------------------------------------------------------------------"
            pause
            #Esta opci�n del switch nos permite establecer una IP est�tica, para ello antes de nada le mostraremos
            #al usuario la configuraci�n actual de la red con el cmdlet "Get-NetIpAddress".
            Get-NetIPAddress
            Write-Host ""
            
            #Se mostrar�n 4 preguntas al usuario a las cuales tendr� que contestar con unos par�metros
            #que le permitir�n realizar configuraciones en la red, el usuario tendr� que escribir
            #una direcci�n IP, nombre de la Interfaz, puerta de enlace y m�scara.
            $ip = Read-Host "Escribe la IP est�tica"
            $nom = Read-Host "Escribe el nombre de la Interfaz"
            $puerta = Read-Host "Escribe la Puerta de enlace"
            $mascara = Read-Host "Establece la m�scara (8,16,24,32)"

            #Despues de proporcionar los datos necesarios para realizar cambios en la red aparecer� un
            #texto por pantalla pidi�ndole confirmaci�n al usuario de seguir y realizar los cambios
            #o cancelar y no aplicar los cambios.
            $decision = Read-Host "Se va a establecer la IP $ip con la m�scara $mascara, quieres continuar? si/no"

            if ($decision -eq "si")
            {
                #Con el siguiente cmdlet, m�s las variables con la informaci�n que el usuario ha proporcionado
                #posteriormente se realizar�n cambios en la red aplicando dicha informaci�n.
                New-NetIPAddress $ip -InterfaceAlias $nom -DefaultGateway $puerta -PrefixLength $mascara

                #En caso de que el usuario contest� "no" a la pregunta de confirmaci�n NO se ejecutar�
                #la condicional IF, directamente el c�digo saltar� al "ELSE" que tenemos a continuaci�n
                #cancelando los cambios y saliendo de la configuraci�n de la red.
            }else{Write-Host "No se realizar�n cambios en la direcci�n IP"
            pause}
            Clear-Host}

            #Al elegir el n�mero 7 del switch se ejecutar�n las l�neas que tenemos a continuaci�n
            #siguiendo el ejemplo usado en el n�mero 6 de crear un IP pero en este caso, se usar�
            #el cmdlet "Get-Adapter" m�s las variables con la informaci�n que el usuario proporcionar�
            #para establecer una direcci�n IP din�mica. 
            7{Write-Host ""
            Write-Host "Ha seleccionado la opci�n 7 'Establecer una direcci�n IP Din�mica'"
            Get-NetIPInterface
            $dinamico = Read-Host "Escribe el InterfaceAlias (nombre de la interfaz) que quiere establecer como din�mica"
            $preg = Read-Host "Se cambiar� el estado de la interfaz $dinamico a Din�mica, Continuar? si/no"
            if ($preg -eq "si")
            {
                Get-NetAdapter -Name $dinamico | Set-NetIPInterface -Dhcp Enabled
                Set-DnsClientServerAddress -InterfaceAlias $dinamico -ResetServerAddresses
            }else{Write-Host "No se realizar�n cambios"}
            Write-Host "------------------------------------------------------------------------------------------------"
            pause
            Clear-Host}

            #Usaremos el n�mero 8, para borrar una direcci�n IP, ya que al crear una IP, no se borran
            #las existentes de tal forma que podemos tener muchas IPs secundarias, si NO nos interesa
            #tener tantas direcciones IP las podemos eliminar con el cmdlet "Remove-NetIpAddress" eligiendo
            #el n�mero 8 de la lista del men�.
            8{Write-Host ""
            Write-Host "Ha seleccionado la opci�n 7 'borrar una direcci�n IP'"
            pause
            Get-NetIPAddress
            Write-Host ""
            $borrar = Read-Host "Introduce la direcci�n IP que quieres eliminar"
            Write-Host "Se eliminara la direcci�n IP: $borrar"
            $confirmar = Read-Host "Continuar? si/no"

            if ($confirmar -eq "si")
            {
                Remove-NetIPAddress -IPAddress $borrar
            }else{Write-Host "No se eliminar� ninguna direcci�n IP"}
            Write-Host "-----------------------------------------------------------------------"
            pause
            Clear-Host}

            #Al seleccionar el n�mero 9, usando el cmdlet "Set-DnsClientServerAddress" podremos
            #establecer un DNS primario y un DNS secundario.
            9{Write-Host ""
            Write-Host "Ha seleccionado la opci�n 8 'Establecer el DNS'"
            pause
            Get-NetIPAddress
            Write-Host ""
            $nombreinter = Read-Host "Introduce el nombre de la interfaz 'InterfaceAlias'"
            $dns1 = Read-Host "Establece el primer DNS"
            $dns2 = Read-Host "Establece el segundo DNS"
            Write-Host "Se establecer� como primer DNS: $dns1 y como segundo $dns2"
            $confir = Read-Host "Continuar? si/no"

            if ($confir -eq "si")
            {
                Set-DnsClientServerAddress -InterfaceAlias $nombreinter -ServerAddress $dns1, $dns2
            }else{Write-Host "No se realizar� ning�n cambio"}
            Write-Host "---------------------------------------------------------------------------"
            pause
            Clear-Host}

            #En el caso de que el usuario escriba cualquier otro texto que NO sea uno de los n�meros
            #indicados en el men� el bucle switch nos llevar� a la siguiente l�nea que mostrar�
            #un mensaje de error al usuario dici�ndole que tiene que seleccionar un n�mero de
            #la lista, con estas l�neas de texto nos aseguramos de que el usuario no pueda escribir
            #cualquier otro texto que no sea uno de los n�meros de la lista y as� evitando errores.
            default{Clear-host
            write-Host "Error, seleccione un n�mero de la lista:"
            Write-Host ""}
        }
        #La pregunta que se le har� a usuario al principio de ejecutar el script la tendr�
        #que contestar con un "si" para continuar o con un "no" para salir del script, al
        #escribir "no" no se ejecutar� la condicional "IF" por lo tanto NO entrar� en ejecuci�n
        #el bucle Switch si no que el c�digo saltar� directamente a la siguiente l�nea
        #rompiendo el bucle y saliendo del script.
    } else {break}
}
Clear-Host