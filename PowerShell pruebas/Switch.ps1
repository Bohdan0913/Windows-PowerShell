$num = read-host "introduce un número entre 1 y 4"

switch($num)
{
    1 {"Ha elegido el numero 1"}
    2 {"Ha elegido el numero 2"}
    3 {"Ha elegido el numero 3"}
    4 {"Ha elegido el numero 4"}
    Default {"Error, elija un número entre 1 y 4"}
}
