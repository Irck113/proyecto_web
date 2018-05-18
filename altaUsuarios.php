<!DOCTYPE html>

<html>
        <head>
                <meta charset = "utf-8"/>
                <meta name = "viewport" content = "width=device-width"/>
                <link rel = "stylesheet" href = "css/main.css"/>
                <link rel = "stylesheet" href = "css/formulario.css"/>
                <script src="jquery-3.3.1.js"></script>
                <script src="jquery.validate.js"></script>
                <script>
                        $("#formulario").validate();
                </script>
        </head>
        <body>
		<form>
			<label>Nombre:</label><input type="text" nombre="nombre" required> <br>
			<label>Apellido Paterno:</label><input type="text" ap_paterno="Apellido Paterno" required> <br>
			<label>Apellido Materno:</label><input type="text" ap_materno="Apellido Materno"> <br>
			<label>Direcci&oacuten:</label><input type="text" direccion="Direcci&oacuten" required> <br>
			<label>Tel&eacutefono:</label><input type="text" telefono="tel&eacutefono" required> <br>
			<label>Correo:</label> <input type="text" correo="correo" required> <br>
			<label>Usuario:</label><input type="text" usuario="Usuario"> <br>
			<label>Contrasena:</label><input type="text" contrasena="Contraseña"> <br>
		<input type="submit">
		</form>
        </body>
</html>

