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

--
-- Name: sa_api_v2_master; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sa_api_v2_master (
    id integer NOT NULL,
    data character varying(250),
    visitas character varying(250),
    nivel_agua_cuerpo character varying(250),
    referencia_cercana character varying(250),
    entorno_cuerpo_agua character varying(250),
    fuentes_opcion character varying(250),
    subbasin_name_nombre character varying(250),
    datetime_field character varying(255),
    estado_agua_registro character varying(250),
    estado_color_agua character varying(250),
    estado_olores_agua character varying(250),
    estado_materiales_flotantes character varying(250),
    estado_materiales_cuales character varying(250),
    fuente_contaminacion_cercana character varying(250),
    lluvias_observacion_opcion character varying(250),
    vegetacion_cuerpo_agua character varying(250),
    cuerpo_agua character varying(250),
    subbasin_name character varying(255),
    vegetacion_margenes_cuerpo character varying(250),
    location_type character varying(250),
    vegetacion_opcion character varying(250),
    vientos_fuertes character varying(250),
    private_address character varying(250),
    report_time time without time zone,
    info_finaltext character varying(250),
    info_finalarea character varying(250),
    info_finalenlace character varying(250),
    title character varying(250),
    visible boolean,
    image character varying(250),
    dataset_id integer,
    agua_calidad character varying(255),
    biodiversidad_especies character varying(250),
    estado_agua_clara character varying(250),
    lluvias_observacion character varying(250),
    reportes_estado_area character varying(250),
    vegetacion_cuerpo_agua_option character varying(250)
);
