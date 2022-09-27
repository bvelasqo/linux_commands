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

create_folder(){
    read -p "Ingrese el nombre para el directorio a crear " nombredir
    if test -d $nombredir
    then
        echo -e "\033[31mError\033[0m creando el directorio $nombredir, el directorio ya existe"
    else
        mkdir $nombredir
        echo "El directorio $nombredir se ha creado correctamente"
    fi;
    pause
}

delete_folder(){
    read -p "Ingrese el nombre del directorio a borrar " nombredirborrar
    if test -d $nombredirborrar
    then
        rmdir --ignore-fail-on-non-empty $nombredirborrar
        echo "El directorio $nombredirborrar se ha eliminado correctamente"
    else
        echo -e "\033[31mError\033[0m eliminando el directorio $nombredirborrar, el directorio no existe"
    fi;
    pause
}

copy_file(){
    read -p "Ingrese el nombre del archivo a copiar " nombrearchivo
    cp $nombrearchivo $PWD
    if test -e $nombrearchivo
    then
        echo "$nombrearchivo copiado correctamente en la ruta $PWD"
    else
        echo -e "\033[31mError\033[0m copiando el archivo $nombrearchivo en $PWD"
    fi;
    pause
}

delete_file(){
    read -p "Ingrese el nombre del archivo a borrar " nombrearchivo
    if test -e $nombrearchivo
    then
        rm -r $nombrearchivo
        echo "El archivo $nombrearchivo se ha eliminado correctamente"
    else
        echo -e "\033[31mError\033[0m eliminando el archivo $nombrearchivo, el archivo no existe"
    fi;
    pause
}

move_file(){
    read -p "Digite el nombre del archivo a mover o cambiar nombre y luego enter " archivo
    read -p "Digite el nombre del nuevo archivo y luego enter (si no desea cambiar el nombre deje este espacio en blanco y luego enter) " nuevoarchivo
    clear
    read -p "Digite la nueva direccion del archivo si desea cambiarlo de lugar y luego enter (si no desea cambiar el lugar deje este espacio en blanco y luego enter) " direccion

    if test -z $nuevoarchivo
    then
        if test -z $direccion
        then
            mv $archivo $PWD
            echo "El archivo $archivo se ha movido a $PWD"
        else
            mv $archivo $direccion
            echo "El archivo $archivo se ha movido a $direccion"
        fi
    else
        if test -z $direccion
        then
            mv $archivo $PWD/$nuevoarchivo
            echo "El nombre del archivo $archivo ahora es $nuevoarchivo y se encuentra en $PWD"
        else
            mv $archivo $direccion/$nuevoarchivo
            echo "El archivo $archivo se ha movido a $direccion/$nuevoarchivo"
        fi
    fi;
    pause
}

update_permissions(){
    read -p "Ingrese el nombre del archivo " nombrearchivo
    read -p "Ingrese los permisos a asignar en octal (Ej: 733) " permisos
    chmod $permisos $nombrearchivo;
    pause
}

show_files_by_character(){
    read -p "Ingrese un carácter para mostrar archivos según el carácter " caracter
    ls -d $caracter*;
    pause
}

lines_files(){
    read -p "Ingrese el nombre del primer archivo " nombrearchivo1
    read -p "Ingrese el nombre del segundo archivo " nombrearchivo2
    cmp $nombrearchivo1 $nombrearchivo2;
    pause
}

lines_joins(){
    read -p "Ingrese el nombre del primer archivo " nombrearchivo1
    read -p "Ingrese el nombre del segundo archivo " nombrearchivo2
    comm -1 -2 $nombrearchivo1 $nombrearchivo2;
    pause
}

show_file(){
    read -p "Ingrese nombre del archivo a visualizar contenido " nombrearchivo
    if test -f $nombrearchivo
    then
        cat $nombrearchivo
    else
        echo -e "\033[31mError\033[0m el archivo $nombrearchivo no existe"
    fi;
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
    echo "Menú Sistema de archivos"
    echo "---------------------------------"
    echo "1. Crear directorio."
    echo "2. Borrar un directorio."
    echo "3. Copiar archivos."
    echo "4. Cambiar el nombre o lugar a un archivo y/o directorio."
    echo "5. Borrar un archivo."
    echo "6. Modificar permisos a un archivo."
    echo "7. Mostrar nombres de archivos que empiecen por un (OS) caracter específico."
    echo "8. Que retorne la primera línea y carácter donde difieren dos archivos."
    echo "9. Que retorne las lineas comunes entre dos archivos."
    echo "10. Visualizar el contenido de un archivo."
    echo "99. Regresar al menu principal."

    # Leer los datos del usuario - capturar información
    read -p "Ingrese una opción [1-10] o si quiere regresar al menu principal ingrese 99 y presioine enter: " option

    # Validar la opción ingresada
    case $option in
        1) create_folder ;break;;
        2) delete_folder ;break;;
        3) copy_file ;break;;
        4) move_file ;break;;
        5) delete_file ;break;;
        6) update_permissions ;break;;
        7) show_files_by_character ;break;;
        8) lines_files ;break;;
        9) lines_joins ;break;;
        10) show_file ;break;;
        99) back ;break;;
        *) echo "Seleccionar una de las opciones"
    esac
done