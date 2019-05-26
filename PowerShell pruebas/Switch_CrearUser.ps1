cls
echo "1: Crear usuario"
echo "2: Eliminar usuario"

switch(Read-Host "selecciona un numero")
{
    1{$nombre = read-host "Nombre de Usuario" 
    $pass = read-host "Escribe una contraseña" -AsSecureString
    New-LocalUser $nombre -Password $pass
    echo "Se ha creado el usuario: $nombre"}
    2{$nombre = read-host "Se eliminara el usuario $nombre"
    Remove-LocalUser -Name $nombre}
}


net user

