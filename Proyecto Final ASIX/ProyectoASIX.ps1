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
Write-Host "1: Crear usuario"
Write-Host "2: Eliminar usuario"
Write-Host "3: Ver usuarios existentes"
Write-Host "4: Salir"

<# Cmdlet Read-Host muestra por pantalla un texto y el usuario tiene que
escribir #>
$opcion = read-Host "Desea continuar? si/no"

while ($opcion -eq "si")
{

    $respuesta = read-Host "Seguir? si/no"

    if ($respuesta -eq "si")
    {

        switch(Read-Host "selecciona un número")
        {
            1{Write-Host ""
            $nombre = read-host "Nombre de Usuario a crear" 
            $pass = read-host "Escribe una contraseña" -AsSecureString
            Write-Host "Se ha creado el usuario: $nombre"
            New-LocalUser $nombre -Password $pass
            Write-Host "-----------------------------------------------------------------------"}
        
            2{Write-Host ""
            $nombre = read-host "Nombre de usuario a borrar"
            Write-Host "Se ha eliminado el usuario $nombre"
            Remove-LocalUser -Name $nombre
            Write-Host "-----------------------------------------------------------------------"}

            3{Write-Host ""
            Write-Host "Ha seleccionado la opción 3 'Ver usuarios existentes'"
            net user
            Write-Host "-----------------------------------------------------------------------"}
        
            4{Write-Host ""
            Write-Host "Ha seleccionado la opción 'Salir'"
            Write-Host "-----------------------------------------------------------------------"
            break}
         
            default{write-Host "Error, seleccione un número de la lista"}
        }
    } else {break}
}
Clear-Host