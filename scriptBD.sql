CREATE USER super_admin with encrypted password '34SUser21';
CREATE USER administrador with encrypted password '12Admin34';
CREATE USER ventas with encrypted password '$contrasena';

CREATE DATABASE proyecto_web OWNER super_admin;

\c proyecto_web;

CREATE TABLE tipo_usuarios
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
	usuario		VARCHAR(15)	NOT NULL,
	contrasena	VARCHAR(30)	NOT NULL,
	id_tipo_usuario	serial		NOT NULL,

	FOREIGN KEY(id_tipo_usuario) references tipo_usuarios(id_tipo_usuario)
);

CREATE TABLE marcas
(
        id_marca        serial          PRIMARY KEY,
        nombre_marca    VARCHAR(30)     NOT NULL
);

CREATE TABLE mochilas
(
	id_mochila	serial		PRIMARY KEY,
	nombre		VARCHAR(35)	NOT NULL,
	descuento	FLOAT	 	NOT NULL,
	tamano		CHAR(1)		NOT NULL,
	precio		FLOAT		NOT NULL,
	existencia	BOOLEAN		NOT NULL,
	imagen		VARCHAR(20)	NOT NULL,
	id_marca	serial		NOT NULL,

	FOREIGN KEY(id_marca) references marcas(id_marca)
);

CREATE TABLE formas_pago
(
	id_forma_pago	serial		PRIMARY KEY,
	nombre_pago	VARCHAR(20)	NOT NULL
);

CREATE TABLE ventas
(
	id_venta		serial			PRIMARY KEY,
	fecha			DATE			NOT NULL,
	precio_unitario		FLOAT			NOT NULL,
	id_usuario		serial			NOT NULL,
	id_forma_pago		serial			NOT NULL,

	FOREIGN KEY(id_usuario) references usuarios(id_usuario),
	FOREIGN KEY(id_forma_pago) references formas_pago(id_forma_pago)
);

CREATE TABLE mochilasXventas
(
	id_mochila	serial		NOT NULL,
	id_venta	serial		NOT NULL,
	cantidad	INT		NOT NULL,

	PRIMARY KEY(id_mochila, id_venta),
	
	FOREIGN KEY(id_mochila) references mochilas(id_mochila),
	FOREIGN KEY(id_venta) references ventas(id_venta)
);

CREATE TABLE tipo_envio
(
	id_tipo_envio	serial		PRIMARY KEY,
	forma_envio	CHAR(2)		NOT NULL
);
