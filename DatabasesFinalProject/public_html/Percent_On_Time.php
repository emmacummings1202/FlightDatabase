<head><title>Percent on Time</title></head>
<body>
<?php
        //open a connection to dbase server 
        include 'open.php';

        // collect the posted value in a variable called $yr
	$yr = $_POST['Year'];



	if (!empty($yr)) {
		echo "The year inputted is $yr<br>";

        $onTime = $conn->query("CALL percentOnTime('".$yr."');");

	if ($onTime->num_rows > 0){

                        echo "<table border=\"2px solid black\">";
                        echo "<tr><th>Airport Code</th><th>Arrivals Percent on Time</th><th>Year</th><th>Airport Rank</th>";
			echo"</tr>";
			echo"<tr>";

                        foreach($onTime as $row1) {
                               	echo "<td>".$row1["airportCode"]."</td>";
                               	echo "<td>".$row1["arrivalsPerctOnTime"]."</td>";
				echo "<td>".$row1["year"]."</td>";
				echo "<td>".$row1["airportRank"]."</td>";
				echo"</tr>";
                        	echo"<tr>";

				}

			

                        echo "</tr";
			echo "</table>";
		

	} else {
		echo "ERROR: $yr not in database<br>";
	}

	} else {
                echo "ERROR: collection failed<br>";
        }

   // close the connection opened by open.php
        $conn->close();



?>





