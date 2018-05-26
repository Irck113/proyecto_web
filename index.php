<?php 
	session_start();
	$tipo_usuario = $_SESSION['tipo_usuario'];
	header('Location:visual/inicio.php');
?>