<head><title>Drop in Arrivals for Airports</title></head>
<body>
<?php
        //open a connection to dbase server 
        include 'open.php';

	$sYear = $_POST['Year1'];
	$eYear = $_POST['Year2'];


	$arrivals_change = array();

	if (!empty($sYear) and !empty($eYear)) {

	if ($sYear != $eYear) {
		$dropArrivals = $conn->query("CALL dropArrivals('".$sYear."', '".$eYear."');");
	echo "The years inputted are $sYear and $eYear<br>";

	if ($dropArrivals->num_rows > 0){

                        echo "<table border=\"2px solid black\">";
                        echo "<tr><th>Airport Name</th><th>Airport Code</th><th>Drop in Total Arrivals</th>";
			echo"</tr>";
			echo"<tr>";

                        foreach($dropArrivals as $row1) {
                               	echo "<td>".$row1["airportName"]."</td>";
                               	echo "<td>".$row1["airportCode"]."</td>";
				echo "<td>".$row1["dropInTotalArrivals"]."</td>";
				echo"</tr>";
                        	echo"<tr>";

				$arrivals_change[] = array( "y" => $row1["dropInTotalArrivals"], "label" => $row1["airportCode"]);
			}

			

                        echo "</tr";
			echo "</table>";
		

	}else {
                echo "ERROR: years not found<br>";
	}
	} else {
		echo "ERROR: same year cannot be compared<br>";
	}
	} else {
		echo "ERROR: collection failed <br>";
	}

   // close the connection opened by open.php
        $conn->close();



?>
<!DOCTYPE HTML>
<html>
<head>  
<script>
window.onload = function () {
 
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	exportEnabled: true,
	theme: "light2", // "light1", "light2", "dark1", "dark2"
	title:{
		text: "Drop in Arrivals"
	},
	axisY:{
		includeZero: true
	},
	data: [{
		type: "column", //change type to bar, line, area, pie, etc
		//indexLabel: "{y}", //Shows y value on all Data Points
		indexLabelFontColor: "#FFFFFF",
		indexLabelPlacement: "outside",   
		dataPoints: <?php echo json_encode($arrivals_change, JSON_NUMERIC_CHECK); ?>
	}]
});
chart.render();
 
}
</script>
</head>
<body>
<div id="chartContainer" style="height: 500px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>          
</body>



