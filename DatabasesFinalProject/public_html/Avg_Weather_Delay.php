<head><title>Weather Delay</title></head>
<body>
<?php
        //open a connection to dbase server 
        include 'open.php';

	$yr1 = $_POST['Year1'];
	$yr2 = $_POST['Year2'];
	

	if (!empty($yr1) or !empty($yr2)) {
       	if ($yr1 != $yr2) { 
        $weather = $conn->query("CALL AvgWeatherDelay('".$yr1."', '".$yr2."');");

	if ($yr1 >= 1987 and $yr1 <= 2021 and $yr2 >= 1987 and $yr2 <= 2021 and $yr1 < $yr2) {

	if ($weather->num_rows > 0){
			echo "Start year inputted: $yr1 <br>";
			echo "End year inputted: $yr2 <br>";

                        echo "<table border=\"2px solid black\">";
                        echo "<tr><th>Average Weather Delay between 2 given Years</th>";

                        echo"</tr>";
                        echo"<tr>";

                        foreach($weather as $row1) {
                                echo "<td>".$row1["AverageWeatherDelay"]."</td>";
                                echo"</tr>";
                                echo"<tr>";
                        }

                        echo "</tr";
                        echo "</table>";

		} else {
                  	echo "ERROR: Invalid years inputted<br>";
		}
	}else {
                        echo "ERROR: Invalid years inputted<br>";
                }
        } else {
                echo "The same year cannot be compared<br>";
	}
	} else {
		echo "No years inputted<br>";
	}


   // close the connection opened by open.php
        $conn->close();
?>
</body>
