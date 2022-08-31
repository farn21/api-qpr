docker network create my-net

docker run --net my-net -e POSTGRES_HOST_AUTH_METHOD=trust --name postgres2 -p5432:5432 -d postgres

Enable PostGis

docker exec -it postgres2 bash

apt-get update

apt-get install postgresql-14-postgis-3

# Dockerfile
https://github.com/postgis/docker-postgis/blob/4eb614133d6aa87bfc5c952d24b7eb1f499e5c7c/12-3.0/Dockerfile

# init postgis
https://github.com/postgis/docker-postgis/blob/4eb614133d6aa87bfc5c952d24b7eb1f499e5c7c/12-3.0/initdb-postgis.sh

su postgres

docker build . --tag mapseedapi

docker run --name mapseedapi -p8010:8010 --net my-net -e DEBUG=True -e HOST=postgres2 -d mapseedapi


docker stop mapseedapi && docker rm mapseedapi


docker exec mapseedapi python src/manage.py migrate

docker exec -it mapseedapi python src/manage.py createsuperuser


----

CUSTOM MASTER Table

CREATE TABLE  sa_api_v2_master  (
    id  SERIAL PRIMARY KEY,
    data VARCHAR(250) NOT NULL,
    visitas VARCHAR(250) NOT NULL,
    nivel_agua_cuerpo VARCHAR(250) NOT NULL,
    referencia_cercana VARCHAR(250) NOT NULL,
    entorno_cuerpo_agua VARCHAR(250) NOT NULL,
    fuentes_opcion VARCHAR(250) NOT NULL,
    subbasin_name_nombre VARCHAR(250) NOT NULL,
    datetime_field timestamp NOT NULL,
    estado_agua_registro VARCHAR(250) NOT NULL,
    estado_color_agua VARCHAR(250) NOT NULL,
    estado_olores_agua VARCHAR(250) NOT NULL,
    estado_materiales_flotantes VARCHAR(250) NOT NULL,
    estado_materiales_cuales VARCHAR(250) NOT NULL,
    fuente_contaminacion_cercana VARCHAR(250) NOT NULL,
    lluvias_observacion_opcion VARCHAR(250) NOT NULL,
    vegetacion_cuerpo_agua VARCHAR(250) NOT NULL,
    cuerpo_agua VARCHAR(250) NOT NULL,
    subbasin_name BOOLEAN NOT NULL,
    vegetacion_margenes_cuerpo VARCHAR(250) NOT NULL,
    location_type VARCHAR(250) NOT NULL,
    vegetacion_opcion VARCHAR(250) NOT NULL,
    vientos_fuertes VARCHAR(250) NOT NULL,
    private_address VARCHAR(250) NOT NULL,
    report_time TIME NOT NULL,
    info_finaltext VARCHAR(250) NOT NULL,
    info_finalarea VARCHAR(250) NOT NULL,
    info_finalenlace VARCHAR(250) NOT NULL,
    title VARCHAR(250) NOT NULL,
    visible BOOLEAN NOT NULL,
    image VARCHAR(250) NOT NULL,
    dataset_id INTEGER NOT NULL references sa_api_submission(submittedthing_ptr_id)
);
