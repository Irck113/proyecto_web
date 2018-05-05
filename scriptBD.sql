CREATE USER super_admin with encrypted password '1234';

CREATE DATABASE proyecto_web OWNER super_admin;

\c proyecto_web;

CREATE TABLE tipo_usuario
(
	id_tipo_usuario		serial		primary key,
	tipo_usuario		VARCHAR(30)	NOT NULL 
);
