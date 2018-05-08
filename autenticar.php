<!DOCTYPE html>
<html>
<head>
        <meta charset="UTF-8">
        <title>Autenticar</title>
</head>
<body>
<?php
        include_once(conexion.php);
        //var_dump($_POST);

        //RECIBIR POST
        $user = $_POST['usuario'];
        $password = $_POST['contrasena'];

        //VALIDAR
        $user = filter_var("$user", FILTER_SANITIZE_STRING);
        $password = md5($password);
      //CONSULTA
        //$consulta ="SELECT password FROM usuarios WHERE user_name='$user';";
        //$valconsulta = consulta($consulta);
        //var_dump ($valconsulta);

        //INSERT
        $insert = "INSERT into usuarios (usuario, contrasena) values ('$user','$password');
        $guarda_ins = consulta("$insert");
        var_dump($insert);

?>
</body>
</html>

