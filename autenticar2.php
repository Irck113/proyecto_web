<?php
	session_start();

	$usuario=$_POST['usuario'];
	$contrasena=$_POST['contrasena'];

	include 'model/conexion.php';
	$con=conectar();
	$usuarios="SELECT nombre,tipo_usuario FROM usuarios WHERE usuario='$usuario' AND contrasena='$contrasena'";
	$res=pg_query($con,$usuarios);
	$usuario=pg_fetch_array($res);

	if($usuario>0){
		$tipo_usuario = $usuario['tipo_usuario'];
		$_SESSION['tipo_usuario']=$tipo_usuario;
		header('Location:index.php');
	} else {
		$_SESSION['tipo_usuario']='';
		header('Location:autenticar.php');
	}
	pg_free_result($res);
	pg_close($con);
?>


