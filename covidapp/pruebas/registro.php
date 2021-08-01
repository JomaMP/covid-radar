<?php

	$db = mysqli_connect('localhost','root','','prueba');

	$usuario = $_POST['usuario'];
    $telefono = $_POST['telefono'];
    $email = $_POST['email'];
    $contrasena = $_POST['contrasena'];


	$sql = "SELECT usuarios FROM login WHERE  email = '$email'";

	$result = mysqli_query($db,$sql);
	$count = mysqli_num_rows($result);

	if ($count == 1) {
		echo json_encode("Error");
	}else{
		$insert = "INSERT INTO usuarios(usuario,telefono,email,contrasena)VALUES('$usuario ','$telefono','$email','$contrasena')";
		$query = mysqli_query($db,$insert);
		if ($query) {
			echo json_encode("Success");
		}
	}
    
?>
