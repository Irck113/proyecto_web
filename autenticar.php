<?php
session_start();
$_SESSION['pag']=1;
?>

<p>Autentícate</p>
<br />

<form action="autenticar2.php" method="post">

<label>Usuario:</label>
<br />
<input type="text" name="usuario" id="usuario">
<br />

<label>Contraseña:</label>
<br />
<input type="password" name="contrasena" id="contrasena">
<br />
<br />

<input type="submit" name"entrar" value="Entrar">

</form>
