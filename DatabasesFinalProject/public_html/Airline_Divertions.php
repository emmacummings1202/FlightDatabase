<head><title>Divertions</title></head>
<body>
<?php
        //open a connection to dbase server 
        include 'open.php';

        // collect the posted value in a variable called $code
	$code = $_POST['airlineCode'];
	$title = "Months with the highest number of divertions for $code";
	$dataPoints = array();
	
        if (!empty($code)) {

        $diverts = $conn->query("CALL airlineCancels('".$code."');");
	echo "The airline code inputted is $code<br>";

	if ($diverts->num_rows > 0){

                        echo "<table border=\"2px solid black\">";
                        echo "<tr><th>Airline Name</th><th>Airline Code</th><th>Year</th><th>Month</th><th>ArrivalCancellations</th>";
			echo"</tr>";
			echo"<tr>";

                        foreach($diverts as $row1) {
                               	echo "<td>".$row1["airlineName"]."</td>";
                               	echo "<td>".$row1["airlineCode"]."</td>";
				echo "<td>".$row1["year"]."</td>";
				echo "<td>".$row1["month"]."</td>";
				echo "<td>".$row1["arrivalCancellations"]."</td>";

				echo"</tr>";
                                echo"<tr>";

				$dataPoints[] = array( "y" => $row1["arrivalCancellations"], "label" => $row1["month"] . "/" . $row1["year"]);

			

				}

			

                        echo "</tr";
			echo "</table>";
		

	} else {
                echo "ERROR: airline code not found<br>";
	}
	} else {
		echo "ERROR: collection failed<br>";
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
		text: "<?php echo $title; ?>"
	},
	axisY:{
		includeZero: true
	},
	data: [{
		type: "column", //change type to bar, line, area, pie, etc
		//indexLabel: "{y}", //Shows y value on all Data Points
		indexLabelFontColor: "#5A5757",
		indexLabelPlacement: "outside",   
		dataPoints: <?php echo json_encode($dataPoints, JSON_NUMERIC_CHECK); ?>
	}]
});
chart.render();
 
}
</script>
</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>          


