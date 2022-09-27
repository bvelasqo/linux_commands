# menu principal en shell script

# Variables
option=0

# Funciones
pause(){
    read -p "Presione [Enter] para continuar..." fakeEnter
}

show_menu_users(){
    echo "Entrando al menu de usuarios..."
    pause;
    sh menuUsers.sh
}

show_menu_general_commands(){
    echo "Entrando al menu general de comandos..."
    pause
    sh menuGeneralCommands.sh
}

show_menu_file_system(){
    echo "Entrando al menu del sistema de archivos..."
    pause;
    sh menuFileSystem.sh
}

finish(){
    echo ""
    echo "Vuelve pronto <3..."
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
    echo "Menú principal"
    echo "---------------------------------"
    echo "1. Comandos generales"
    echo "2. Usuarios"
    echo "3. Sistema de archivos"
    echo "99. Terminar"

    # Leer los datos del usuario - capturar información
    read -p "Ingrese una opción [1-3] o 99 para salir y presiona enter: " option

    # Validar la opción ingresada
    case $option in
        1) show_menu_general_commands ;break;;
        2) show_menu_users ;break;;
        3) show_menu_file_system ;break;;
        99) finish ;break;;
        *) echo "Seleccionar una de las opciones";pause;
    esac
done