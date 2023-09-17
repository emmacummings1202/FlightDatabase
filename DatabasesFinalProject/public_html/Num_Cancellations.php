<head><title>Number of Cancellations for a State</title></head>
<body>
<?php
	//open a connection to dbase server 
	include 'open.php';

	// collect the posted value in a variable called $state and $yr
	$state = $_POST['State'];
	$yr = $_POST['Year'];

	if (!empty($state) and !empty($yr)) {

	$cancel = $conn->query("CALL high_cancel('".$state."', '".$yr."');");
	echo "The state and year inputted are $state and $yr<br>";

	if ($cancel->num_rows != 0){
		

			echo "<table border=\"2px solid black\">";
			echo "<tr><th>State Name</th><th>Number of Cancellations</th>";

			echo"</tr>";
                        echo"<tr>";	
			
			foreach($cancel as $row1) {
				echo "<td>".$row1["stateName"]."</td>";
				echo "<td>".$row1["cancellations"]."</td>";
				echo"</tr>";
                                echo"<tr>";
			}


			echo "</tr";
			echo "</table>";

	} else {
		echo "ERROR: State abbreviation $state not found<br>";
	}
	} else {
		echo "Collection failed<br>";
	}

   // close the connection opened by open.php
	$conn->close();
?>
</body>
