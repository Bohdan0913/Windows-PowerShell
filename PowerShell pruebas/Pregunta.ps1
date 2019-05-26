cls

$name = Read-Host "Escribe un nombre de usuario"
$pass = Read-Host "Escribe una Contraseña" -AsSecureString
echo "Se creara el usuario: $name"

New-LocalUser $name -Password $pass

pause

net user

pause

