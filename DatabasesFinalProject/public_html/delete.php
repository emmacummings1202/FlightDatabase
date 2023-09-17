<head><title>Delete Airport Stats</title></head>
<body>
<?php
        //open a connection to dbase server
        include 'open.php';

        $code = $_POST['airportCode'];
        
       if (!empty($code)) {

                $delay = $conn->query("CALL delete_airport_arrival('".$code."');");
                echo "The airport code inputted is $code<br>";

        } else {
                echo "ERROR: code not found<br>";

        }

   // close the connection opened by open.php
        $conn->close();



?>


