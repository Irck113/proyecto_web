CREATE USER administrador with encrypted password '12Admin34';
CREATE USER vendedor with encrypted password '$contrasena';
CREATE USER cliente with encrypted password '$contrasena';

CREATE DATABASE proyecto_web OWNER administrador;

\c proyecto_web;

CREATE TABLE tipo_usuarios
(
	id_tipo_usuario		serial		PRIMARY KEY,
	tipo	 			CHAR(1)		NOT NULL 
);

CREATE TABLE usuarios
(
	id_usuario		serial			PRIMARY KEY,
	nombre			VARCHAR(35)		NOT NULL,
	ap_paterno		VARCHAR(35)		NOT NULL,
	ap_materno		VARCHAR(35),
	telefono		VARCHAR(10)		NOT NULL,
	correo 			VARCHAR(30)		NOT NULL,
	usuario			VARCHAR(15)		UNIQUE,
	contrasena		VARCHAR(30)		NOT NULL,
	id_tipo_usuario		serial			NOT NULL,

	FOREIGN KEY(id_tipo_usuario) references tipo_usuarios(id_tipo_usuario)
);

CREATE TABLE marca
(
        id_marca    serial          PRIMARY KEY,
        nombre    	VARCHAR(30)     NOT NULL
);

CREATE TABLE domicilio
(
	id_direccion	serial		PRIMARY KEY,
	calle		VARCHAR(30)	NOT NULL,
	numero		VARCHAR(5)	NOT NULL,
	colonia		VARCHAR(30)	NOT NULL,
	codigo_postal	VARCHAR(5)	NOT NULL,
	delegacion	VARCHAR(25)	NOT NULL,
	estado		VARCHAR(20)	NOT NULL,
	referencia	VARCHAR(50)	NOT NULL,
	id_usuario	serial		NOT NULL,

	FOREIGN KEY(id_usuario) references usuarios(id_usuario)
);

CREATE TABLE oferta
(
	id_oferta	serial		PRIMARY KEY,
	nombre		VARCHAR(30)	NOT NULL,
	descuento	INT		NOT NULL,
	fecha_inicio	DATE		NOT NULL,
	fecha_fin	DATE		NOT NULL,
	id_marca	serial		NOT NULL,

	FOREIGN KEY(id_marca) references marca(id_marca)
);

CREATE TABLE mochilas
(
	id_mochila	serial			PRIMARY KEY,
	nombre		VARCHAR(35)		NOT NULL,
	descripcion	VARCHAR(30)	 	NOT NULL,
	tamano		CHAR(1)			NOT NULL,
	precio		FLOAT			NOT NULL,
	cantidad	INT			NOT NULL,
	imagen		VARCHAR(100)		NOT NULL,
	id_marca	serial			NOT NULL,
	id_oferta	serial			NOT NULL,

	FOREIGN KEY(id_marca) references marcas(id_marca),
	FOREIGN KEY(id_oferta) references oferta(id_oferta)
);

CREATE TABLE formas_pago
(
	id_forma_pago	serial		PRIMARY KEY,
	forma_pago	CHAR(1)		NOT NULL,

);

CREATE TABLE tipo_envio
(
	id_tipo_envio	serial		PRIMARY KEY,
	tipo_envio	CHAR(1)		NOT NULL
);

CREATE TABLE ventas
(
	id_venta		serial			PRIMARY KEY,
	fecha			DATE			NOT NULL,
	precio_unitario		FLOAT			NOT NULL,
	id_usuario		serial			NOT NULL,
	id_forma_pago		serial			NOT NULL,
	id_tipo_envio		serial			NOT NULL,

	FOREIGN KEY(id_usuario) references usuarios(id_usuario),
	FOREIGN KEY(id_forma_pago) references formas_pago(id_forma_pago),
	FOREIGN KEY(id_tipo_envio) references tipo_envio(id_tipo_envio)
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

/***********************PERSMISOS ADMINISTRADOR*************************/
GRANT ALL PRIVILEGES ON tipo_usuarios TO administrador;
GRANT ALL PRIVILEGES ON usuarios TO administrador;
GRANT ALL PRIVILEGES ON marca TO administrador;
GRANT ALL PRIVILEGES ON mochilas TO administrador;
GRANT ALL PRIVILEGES ON formas_pago TO administrador;
GRANT ALL PRIVILEGES ON tipo_envio TO administrador;
GRANT ALL PRIVILEGES ON ventas TO administrador;
GRANT ALL PRIVILEGES ON mochilasXventas TO administrador;
GRANT ALL PRIVILEGES ON domicilio TO administrador;
GRANT ALL PRIVILEGES ON oferta TO administrador;

/***********************PERSMISOS VENDEDOR*************************/
GRANT insert ON ventas TO vendedor;
GRANT select ON ventas TO vendedor;
GRANT delete ON ventas TO vendedor;
GRANT update ON ventas TO vendedor;

/***********************PERSMISOS CLIENTE*************************/
GRANT select ON tipo_usuarios TO cliente;

GRANT insert ON usuarios TO cliente;
GRANT select ON usuarios TO cliente;
GRANT delete ON usuarios TO cliente;
GRANT update ON usuarios TO cliente;

GRANT select ON marcas TO cliente;

GRANT select ON mochilas TO cliente;

GRANT select ON formas_pago TO cliente;

GRANT select ON tipo_envio TO cliente;

GRANT insert ON ventas TO cliente;
GRANT select ON ventas TO cliente;
GRANT delete ON ventas TO cliente;
GRANT update ON ventas TO cliente;

GRANT insert ON mochilasXventas TO cliente;
GRANT select ON mochilasXventas TO cliente;
GRANT delete ON mochilasXventas TO cliente;
GRANT update ON mochilasXventas TO cliente;


INSERT INTO tipo_usuarios(tipo) VALUES('A');
INSERT INTO tipo_usuarios(tipo) VALUES('V');
INSERT INTO tipo_usuarios(tipo) VALUES('C');

INSERT INTO marca(nombre) VALUES('Adidas');
INSERT INTO marca(nombre) VALUES('Kipling');


