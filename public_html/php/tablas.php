<!DOCTYPE html>
<html lang="es-ES">
    <head>
    	<meta charset="UTF-8"/>
    	<title>TABLAS</title>
    </head>
    <body>
<?php

    include 'connect.php';

    ### BOBT_CAMARERO ##########################################################
    $query = "SELECT * FROM BOBT_CAMARERO";

    if ($result = $conn->query($query)) {

        echo '
            <table border="1">
                <tr><th colspan="3">BOBT_CAMARERO</th></tr>
        ';
        /* fetch associative array */
        while ($row = $result->fetch_assoc()) {
            $id = $row["id"];
            $nombre = $row["nombre"];
            $img = $row["img"];

            echo '
                <tr>
                    <td>'.$id.'</td>
                    <td>'.$nombre.'</td>
                    <td>'.$img.'</td>
                </tr>
            ';
        }
        echo '</table>';

        /* free result set */
        $result->free();
    }

    ### BOBT_CAMARERO ##########################################################
    $query = "SELECT * FROM BOBT_TIPO_PRODUCTO";

    if ($result = $conn->query($query)) {

        echo '
            <table border="1">
                <tr><th colspan="3">BOBT_TIPO_PRODUCTO</th></tr>
        ';
        /* fetch associative array */
        while ($row = $result->fetch_assoc()) {
            $id = $row["id"];
            $nombre = $row["nombre"];
            $precio_por_defecto = $row["precio_por_defecto"];
            $descripcion = $row["descripcion"];
            $img = $row["img"];

            echo '
                <tr>
                    <td>'.$id.'</td>
                    <td>'.$nombre.'</td>
                    <td>'.$precio_por_defecto.'</td>
                    <td>'.$descripcion.'</td>
                    <td>'.$img.'</td>
                </tr>
            ';
        }
        echo '</table>';

        /* free result set */
        $result->free();
    }
?>
    </body>
</html>
