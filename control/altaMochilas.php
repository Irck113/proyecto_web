<?php
include_once("../model/conexion.php");

$nombre = filter_var($_POST['nombre'], FILTER_SANITIZE_STRING);
$descuento = filter_var($_POST['descuento'], FILTER_SANITIZE_STRING, [0-9]);
$tamano = $_POST['tamano'];
$precio = filter_var($_POST['precio'], FILTER_SANITIZE_STRING, [0-9]);
$existencia = $_POST['existencia'];
$imagen = $_POST['imagen'];
$id_marca = $_POST['id_marca'];

if(!empty($nombre)||!empty($descuento)||!empty($tamano)||!empty($precio)||!empty($existencia)||!empty($imagen)||!empty($id_marca)){
        $marca = "insert into mochilas (nombre,descuento,tamano,precio,existencia,imagen,id_marca) values('$nombre', '$descuento', '$tamano', '$precio', '$existencia', '$imagen', '$id_marca')";
        $guarda_marca = consulta($marca);
        if($guarda_marca == false){
               	echo "Gracias por ingresar tus datos";
        } else {
                echo "Hubo un error al intentar guardar tus, intenta mas tarde";
        }
} else{
        echo "Los valores ingresados no son v&aacute;lidos";
}
?>