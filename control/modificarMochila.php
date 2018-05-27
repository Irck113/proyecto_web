<?php
	include_once("../model/conexion.php");

	$id_marca=$_POST["id_marca"];
	$nombre=$_POST["nombre"];

	if(!empty($id_marca)){
		$mochila="UPDATE marcas SET nombre = '$nombre' WHERE id_marca = '$id_marca';";
		vConsulta($mochila);

        header('Location:../visual/gestionarMarcas.php');
	} else{
        header('Location:../visual/gestionarMarcas.php');
	}
?>