<?php
	session_start();

	$usuario=$_POST['usuario'];
	$contrasena=$_POST['contrasena'];

	include '../model/conexion.php';
	$con=aConectar();
	$usuarios="SELECT id_tipo_usuario FROM usuarios WHERE usuario='$usuario' AND contrasena='$contrasena'";
	$res=pg_query($con,$usuarios);
	$usuario=pg_fetch_array($res);
	$id_tipo_usuario=$usuario['id_tipo_usuario'];

	if($usuario>0){
		$tipo_usuario = "SELECT tipo FROM tipo_usuarios WHERE id_tipo_usuario = '$id_tipo_usuario'";
		$_SESSION['tipo_usuario']=$tipo_usuario;
		header('Location:../index.php');
	} else {
		$_SESSION['tipo_usuario']='';
		header('Location:../visual/iniciarSesion.php');
	}
	pg_free_result($res);
	pg_close($con);
?>


