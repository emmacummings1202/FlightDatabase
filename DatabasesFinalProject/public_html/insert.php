<head><title>Insert an Airport</title></head>
<body>
<?php
        //open a connection to dbase server
        include 'open.php';

	      $city = $_POST['nearestCity'];
        $state = $_POST['stateName'];
	$code = $_POST['airportCode'];
	$name = $_POST['airportName'];


       if (!empty($city)) {

                $delay = $conn->query("CALL insert_airport('".$city."','".$state."', '".$code."', '".$name."');");
                echo "The airport code inputted is $code<br>";

        } else {
                echo "ERROR: code not found<br>";

        } 

   // close the connection opened by open.php
        $conn->close();



?>
