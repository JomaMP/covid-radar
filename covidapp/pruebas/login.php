<?php

    $db = mysqli_connect('localhost','root','','prueba');
    
    $email = $_POST['email'];
    $contrasena = $_POST['contrasena'];
    
    // PRUEBAS
    //$usuario = "sergio";
    //$contrasena = "sergio";
    
    $sql = "SELECT * FROM usuarios WHERE email='$email' AND contrasena='$contrasena'";
    
    $result = mysqli_query($db,$sql);
	$count = mysqli_num_rows($result);

	if ($count == 1) {
		echo json_encode("Success");
	}else{
		echo json_encode("Error");
	}
    
?>
