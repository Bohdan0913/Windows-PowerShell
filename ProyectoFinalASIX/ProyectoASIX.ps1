<# Windows PowerShell | Proyecto final de curso ASIX | Kyfchuk Bohdan

#-----------------------------------------------------------------------------------------#

- He utilizado la aplicación Windows PowerShell ISE para la creación del proyecto.

- El proyecto trata de crear un menú de herramientas utilizando el bucle: While
y las sentencias IF/ELSEIF/ELSE y SWITCH

- Con estas declaraciones condicionales he creado un menú de multiples opciones
que el usuario puede seleccionar dependiendo de los cambios que necesite realizar en el sistema.

- Para seleccionar las opciones, el usuario debe escribir los números de 1 al 10.

- Para poder ejecutar este script tenemos que: abrir "Inicio" escribir "Windows Powershell" hacemos
clic derecho sobre la aplicación "Windows PowerShell" ejecutar como administrador, se abrirá la
ventana de PowerShell con un fondo azul por defecto, usaremos los comandos "cd" para entrar en los
directorios, "cd .." para volver al directorio anterior y "ls" para listar los elementos del
directorio actial, con estos comandos nos tendremos que situar en la carpeta donde tenemos
guardados los Scripts de PowerShell que llevarán la extensión .ps1 y por último para ejecutar
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
Write-Host "4: Ver la configuración de la red"
Write-Host "5: Salir"
#>

<# Cmdlet Read-Host muestra por pantalla un texto y el usuario tiene que responder con otro texto,
en este caso tendrá que escribir "si o no", la respuesta del usuario la guardaremos en una variable
llamada "$opcion" usando el cmdlet "Read-Host", y dependiendo de la respuesta que se ha guardado en
la varieble proporcionada por el usuario, el script seguirá adelante o se cerrará.#>

#$opcion = read-Host "Desea continuar? si/no"

<# Lo primero que he hecho es crear un bucle "While", para que una vez seleccionada una opción por
el usuario y realizados los cambios que se tienen que realizar, el código nos devoloverá al
principio del programa dándonos la posibilidad de volver a elegir otra opción del menú.#>

#while ($opcion -eq "si")
while ($true)
{

Write-Host "MENU DE HERRAMIENTAS EN POWERSHELL"
Write-Host "Seleccione una de las siguientes opciones:"
Write-Host "-------------------------------------------"
Write-Host " 1: Crear usuario"
Write-Host " 2: Eliminar usuario"
Write-Host " 3: Ver usuarios existentes"
Write-Host " 4: Ver la configuración de la red"
Write-Host " 5: Abrir el explorador"
Write-Host " 6: Establecer una Dirección IP Estática"
Write-Host " 7: Establecer una Dirección IP Dinámica"
Write-Host " 8: Borrar una dirección IP"
Write-Host " 9: Establecer el DNS"

Write-Host "-------------------------------------------" 

    Write-Host ""
    $respuesta = read-Host "Continuar? si/no"

    if ($respuesta -eq "si")
    {
        
        switch(Read-Host "selecciona un número")
        {
            1{Write-Host ""
            $nombre = read-host "Nombre de Usuario a crear" 
            $pass = read-host "Escribe una contraseña" -AsSecureString
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
            Write-Host "Ha seleccionado la opción 3 'Ver usuarios existentes'"
            net user
            Write-Host "-----------------------------------------------------------------------"
            pause
            Clear-Host}

            4{Write-Host ""
            Write-Host "Ha seleccionado la opción 4 'Ver la configuración de la red'"
            #Get-NetIPConfiguration
            ipconfig -all
            Write-Host "-----------------------------------------------------------------------"
            pause
            Clear-Host}
        
            5{Write-Host ""
            Write-Host "Ha seleccionado la opción 5 'Abrir el explorador'"
            start https://www.google.com/
            Write-Host "-----------------------------------------------------------------------"
            pause
            Clear-Host}

            6{Write-Host ""
            Write-Host "Ha seleccionado la opción 6 'Establecer una dirección IP estática'"
            Write-Host ""
            Write-Host "Para establecer una IP estática necesitas introducir 4 campos:"
            Write-Host ""
            Write-Host "Dirección IP (establecer una IP, ej: 192.168.1.10)"
            Write-Host "InterfaceAlias (El nombre de la interfaz, ej: Ethernet)"
            Write-Host "DefaultGateway (La puerta de enlace, ej: 192.168.1.1)"
            Write-Host "PrefixLength (Mascara: 8,16,24,32 )"
            Write-Host ""
            Write-Host "---------------------------------------------------------------------------------------"
            pause
            Get-NetIPAddress
            Write-Host ""
            $ip = Read-Host "Escribe la IP estática"
            $nom = Read-Host "Escribe el nombre de la Interfaz"
            $puerta = Read-Host "Escribe la Puerta de enlace"
            $mascara = Read-Host "Establece la máscara (8,16,24,32)"

            $decision = Read-Host "Se va a establecer la IP $ip con la máscara $mascara, quieres continuar? si/no"

            if ($decision -eq "si")
            {
                New-NetIPAddress $ip -InterfaceAlias $nom -DefaultGateway $puerta -PrefixLength $mascara
            }else{Write-Host "No se realizarán cambios en la dirección IP"
            pause}
            Clear-Host}

            7{Write-Host ""
            Write-Host "Ha seleccionado la opción 7 'Establecer una dirección IP Dinámica'"
            Get-NetIPInterface
            $dinamico = Read-Host "Escribe el InterfaceAlias (nombre de la interfaz) que quiere establecer como dinámica"
            $preg = Read-Host "Se cambiará el estado de la interfaz $dinamico a Dinámica, Continuar? si/no"
            if ($preg -eq "si")
            {
                Get-NetAdapter -Name $dinamico | Set-NetIPInterface -Dhcp Enabled
                Set-DnsClientServerAddress -InterfaceAlias $dinamico -ResetServerAddresses
            }else{Write-Host "No se realizarán cambios"}
            Write-Host "------------------------------------------------------------------------------------------------"
            pause
            Clear-Host}

            8{Write-Host ""
            Write-Host "Ha seleccionado la opción 7 'borrar una dirección IP'"
            pause
            Get-NetIPAddress
            Write-Host ""
            $borrar = Read-Host "Introduce la dirección IP que quieres eliminar"
            Write-Host "Se eliminara la dirección IP: $borrar"
            $confirmar = Read-Host "Continuar? si/no"

            if ($confirmar -eq "si")
            {
                Remove-NetIPAddress -IPAddress $borrar
            }else{Write-Host "No se eliminará ninguna dirección IP"}
            Write-Host "-----------------------------------------------------------------------"
            pause
            Clear-Host}

            9{Write-Host ""
            Write-Host "Ha seleccionado la opción 8 'Establecer el DNS'"
            pause
            Get-NetIPAddress
            Write-Host ""
            $nombreinter = Read-Host "Introduce el nombre de la interfaz 'InterfaceAlias'"
            $dns1 = Read-Host "Establece el primer DNS"
            $dns2 = Read-Host "Establece el segundo DNS"
            Write-Host "Se establecerá como primer DNS: $dns1 y como segundo $dns2"
            $confir = Read-Host "Continuar? si/no"

            if ($confir -eq "si")
            {
                Set-DnsClientServerAddress -InterfaceAlias $nombreinter -ServerAddress $dns1, $dns2
            }else{Write-Host "No se realizará ningún cambio"}
            Write-Host "---------------------------------------------------------------------------"
            pause
            Clear-Host}


            default{Clear-host
            write-Host "Error, seleccione un número de la lista:"
            Write-Host ""}
        }
    } else {break}
}
Clear-Host