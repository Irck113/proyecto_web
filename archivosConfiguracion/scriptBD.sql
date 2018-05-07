CREATE USER super_admin with encrypted password '34SUser21';
CREATE USER administrador with encrypted password '12Admin34';
CREATE USER cliente with encrypted password '$contrasena';
CREATE USER ventas with encrypted password '$contrasena';

DROP DATABASE proyecto_web;
CREATE DATABASE proyecto_web OWNER super_admin;

\c proyecto_web;

CREATE TABLE tipo_usuario
(
	id_tipo_usuario		serial		PRIMARY KEY,
	nom_tipo_usuario	VARCHAR(30)	NOT NULL 
);

CREATE TABLE usuarios
(
	id_usuario	serial		PRIMARY KEY,
	nombre		VARCHAR(35)	NOT NULL,
	ap_paterno	VARCHAR(35)	NOT NULL,
	ap_materno	VARCHAR(35),
	direccion	VARCHAR(50)	NOT NULL,
	telefono	VARCHAR(10)	NOT NULL,
	correo 		VARCHAR(30)	NOT NULL,
	usuario		VARCHAR(15)	NOT NULL	UNIQUE,
	contrasena	VARCHAR(30)	NOT NULL,
	FOREIGN KEY(id_tipo_usuario) references tipo_usuarios(id_tipo_usuario)
);

CREATE TABLE marca
(
        id_marca        serial          PRIMARY KEY,
        nombre_marca    VARCHAR(30)     NOT NULL
);

CREATE TABLE oferta
(
	id_oferta 	serial		PRIMARY KEY,
	nombre		VARCHAR(30)	NOT NULL,
	descuento	INT(2)		NOT NULL,
	fecha_inicio	DATE		NOT NULL,
	fecha_fin	DATE		NOT NULL,
	FOREIGN KEY (id_marca) references marca (id_marca)
);

CREATE TABLE mochilas
(
	id_mochila	serial		PRIMARY KEY,
	nombre		VARCHAR(35)	NOT NULL,
	descuento	INT(2)		NOT NULL,
	tamano		CHAR(1)		NOT NULL,
	precio		FLOAT		NOT NULL,
	existencia	BOOLEAN		NOT NULL,
	FOREIGN KEY(id_marca) references marca(id_marca),
	FOREIGN KEY(id_oferta) references oferta(id_oferta)
);

CREATE TABLE forma_pago
(
	id_forma_pago	serial		NOT NULL,
	nombre_pago	VARCHAR(20)	NOT NULL
);

CREATE TABLE ventas
(
	id_venta		serial		PRIMARY KEY,
	fecha			DATE		NOT NULL,
	precio_unitario		FLOAT		NOT NULL,
	FOREIGN KEY(id_usuario) references usuarios(id_usuario),
	FOREIGN KEY(id_forma_pago) references forma_pago(id_forma_pago)
);

CREATE TABLE mochilasXventas
(
	id_mochila	serial		PRIMARY KEY,
	id_venta	serial		PRIMARY KEY,
	cantidad	INT(3)		NOT NULL
);

CREATE TABLE tipo_envio
(
	id_tipo_envio	serial		PRIMARY KEY,
	forma_envio	CHAR(2)		NOT NULL
);
