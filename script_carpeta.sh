#!/bin/bash

# Definir la carpeta y el archivo base
CARPETA=${1:-"/root/IRC9.1_Jasso_Jaramillo_Jose_Luis"}
ARCHIVO="cualquiera.txt"

# Verifica si la carpeta existe, si no, la crea
if [ -d "$CARPETA" ]; then
    echo "La carpeta '$CARPETA' ya existe."
else
    echo "La carpeta '$CARPETA' no existe. Creándola ahora..."
    mkdir -p "$CARPETA"
    if [ $? -eq 0 ]; then
        echo "La carpeta '$CARPETA' fue creada exitosamente."
    else
        echo "Hubo un error al crear la carpeta '$CARPETA'."
        exit 1
    fi
fi

# Ruta completa del archivo
RUTA_ARCHIVO="$CARPETA/$ARCHIVO"

# Verifica si el archivo existe en la carpeta
if [ -f "$RUTA_ARCHIVO" ]; then
    # Si existe, crea una copia con la fecha de hoy
    FECHA=$(date +"%Y-%m-%d")
    ARCHIVO_COPIA="$CARPETA/cualquiera_$FECHA.txt"
    cp "$RUTA_ARCHIVO" "$ARCHIVO_COPIA"
    echo "El archivo '$ARCHIVO' ya existía. Se ha creado una copia: '$ARCHIVO_COPIA'."
else
    # Si no existe, lo crea
    touch "$RUTA_ARCHIVO"
    echo "Archivo creado el $(date)" > "$RUTA_ARCHIVO"
    echo "El archivo '$ARCHIVO' no existía. Se ha creado en '$CARPETA'."
fi

