<?php
session_start();
if(($_SESSION['pag']==1)&&(!empty($_POST['nombre']))){
        $nombre = $_POST['nombre'];
        echo "Bienvenido".$nombre;
} else {
        header("location: autenticar.php");
} 
?>


