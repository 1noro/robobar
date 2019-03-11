<?php
    include 'dbdt.php';

    $conn = mysqli_connect($HOST, $USER, $PS, $DB);
    // Check connection
    if (mysqli_connect_errno()) {
        echo "Failed to connect to MySQL: " . mysqli_connect_error();
    }
?>
