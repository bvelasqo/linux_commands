# menu principal en shell script

# Variables
option=0

# Funciones
pause(){
    read -p "Presione [Enter] para continuar..." fakeEnter
}
true
back(){
    echo "Regresando al menu principal..."
    pause;
    sh main.sh
}

users_connected(){
    who
    pause
}

users_connected_len(){
    who --count;
    pause
}

user_is_connect(){
    read -p "Digite el usuario a buscar y presione enter: " usuario
    last $usuario -n 1;
    pause
}

send_message(){
    read -p "Ingrese el destinatario del mensaje y presione enter: " destinatario
    echo "Digite el mensaje a enviar, presione enter y presione tecla control al mismo tiempo de la tecla D: ";
    write $destinatario
    echo "Mensaje enviado";
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
    echo "Menú Varios usuarios"
    echo "---------------------------------"
    echo "1. Mostrar nombre de usuarios conectados(solo el nombre y hora de conexión)"
    echo "2. Mostrar número de usuarios conectados"
    echo "3. Averiguar si un usuario está conectado"
    echo "4. Enviar Mensaje a un usuario"
    echo "9. Regresar"

    # Leer los datos del usuario - capturar información
    read -p "Ingrese una opción [1-4] o si quiere regresar al menu principal ingrese 99 y presioine enter:  " option

    # Validar la opción ingresada
    case $option in
        1) users_connected ;;
        2) users_connected_len ;;
        3) user_is_connect ;;
        4) send_message ;;
        9) back ;break;;
        *) echo "Seleccionar una de las opciones indicadas"
    esac
done