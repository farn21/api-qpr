## QPR - Backend - Modificado por Luca C. Mitas

### Requisitos previos

- Conocimientos prácticos del framework Django y de cómo utilizarlo con venv en un entorno Linux.
- Python 2.7.18
- PostgreSQL 14.5
- virtualenv
- NPM >= 6.14.8

### Instalación

- Inicializar un virtualenv con Python 2.7.18 (virtualenv --python="/usr/bin/python2.7" , por ejemplo )
- Activar el venv y cargar el archivo de requirements.txt
- Crear una DB en PSQL y colocar sus datos de conexión en el archivo settings_local.py , a partir de línea 35.
- Ejecutar las migrations y creación de superuser de modo habitual.
- El archivo dump_12_07_2022.sql puede utilizarse en caso de querer respaldar estructura o información.




