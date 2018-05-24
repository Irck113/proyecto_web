<!DOCTYPE html>

<html>
    <head>
        <meta charset = "utf-8"/>
        <meta name = "viewport" content = "width=device-width"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
        <link rel = "stylesheet" href = "css/bootstrap.css"/>
        <link rel = "stylesheet" href = "css/main.css"/>
    </head>
    <body>
        <div class = "container pagina">
            <header>
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="navbar-brand" href="index.php">Mochilas RiMo</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="col-7"></div>
                    <div class="collapse navbar-collapse justify-content-end" id="navbar">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="#">Carrito</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Mochilas</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="autenticar.php">Autenticarse</a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            <main>
                <div class="row">
                    <?php
                        $mochila = $_GET["mochila"];
                        include 'model/conexion.php';
                        $con = conectar();
                        $query=("SELECT * FROM mochilas WHERE id_mochila = $mochila");
                        $res=pg_query($con,$query);
                        while ($f=pg_fetch_array($res)) {
                        ?>
                            <div class="col-3">
                                <img class="imagenMochila" src="img/<?php echo $f['imagen'];?>"/><br>
                                <a href="mochila.php?mochila=<?php echo $f['id_mochila']?>"><?php echo $f['nombre'];?></a><br>
                            </div>
                    <?php
                        }
                    ?>
                </div>
            </main>
            <footer>
                <div class="row">
                    <div class="col">
                        <p>Proyecto final de Web2.0</p>
                    </div>
                    <div class="col">
                        <p>P&aacute;gina creada por: </p>
                        <p>Ricardo Hern&aacute;ndez Garc&iacute;a</p>
                        <p>Karen Padilla Rojas</p>
                    </div>
                    <div class="col">
                        <p>Siguenos en nuestras redes sociales: </p>
                        <a href="https://www.facebook.com"><i class="fab fa-facebook-square"></i></a>
                        <a href="https://www.twitter.com"><i class="fab fa-twitter-square"></i></a>
                    </div>
                </div>
            </footer>
        </div>
        <script src="js/jquery-3.1.1.js"></script>
        <script src="js/bootstrap.js"></script>
    </body>
</html>

