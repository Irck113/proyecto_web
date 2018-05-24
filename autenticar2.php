<?php
	$usuario=$_POST['usuario'];
	$contrasena=$_POST['contrasena'];

	include 'model/conexion.php';
	$con=conectar();
	$usuarios="SELECT * FROM usuarios WHERE usuario='$usuario' AND contrasena='$contrasena'";
	$res=pg_query($con,$usuarios);
	$usuario=pg_fetch_array($res);
	if($usuario>0){
		echo 'holi';
	} else {
		echo 'adios';
	}
	pg_free_result($res);
	pg_close($con);
?>


