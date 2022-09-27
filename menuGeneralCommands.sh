# menu principal en shell script

# Variables
option=0

# Funciones
pause(){
    read -p "Presione [Enter] para continuar..." fakeEnter
}

back(){
    echo "Regresando al menu principal..."
    pause;
    sh main.sh
}

kill_process(){
    read -p "Digite número del proceso y luego enter" numeroproceso
    kill -9 $numeroproceso;
    pause
}

help_command(){
    read -p "Digite el nombre del comando y luego enter " comando
    man $comando;
    pause
}

show_calendar(){
    read -p "Digite el número del mes deseado y luego enter " mes
    read -p "Digite el año deseado y luego enter " anio
    cal $mes $anio;
    pause
}

finish(){
    exit 0
}

# Menu
while true
do
    # Limpiar la pantalla
    clear
    # Desplegar el menu de optiones
    echo "---------------------------------"
    echo "Práctica S.O - Brandon velasquez"
    echo "---------------------------------"
    echo "Menú comandos generales"
    echo "---------------------------------"
    echo "1. Visualizar fecha y hora del sistema"
    echo "2. Visualizar path o ruta actual"
    echo "3. cambio de password"
    echo "4. Mostrar disco libre"
    echo "5. Mostrar disco utilizado"
    echo "6. Visualizar procesos activos"
    echo "7. Matar un proceso"
    echo "8. Visualizar ayuda sobre un comando especifico"
    echo "9. Mostrar el calendario de un mes determinado"
    echo "99. Regresar al menú principal"

    # Leer los datos del usuario - capturar información
    read -p "Ingrese una opción [1-9] o si quiere regresar al menu principal ingrese 99 y presioine enter:  " option

    # Validar la opción ingresada
    case $option in
        1) date;pause;;
        2) pwd;pause;;
        3) passwd;pause;;
        4) df -h;pause;;
        5) du -h -s;pause;;
        6) ps -e;pause;;
        7) kill_process;;
        8) help_command;;
        9) show_calendar;;
        99) back;break;;
        *) echo "Seleccionar una de las opciones"
    esac
done