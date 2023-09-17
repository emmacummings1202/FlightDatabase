<head><title>Ratio of Airports</title></head>
<body>
<?php
        //open a connection to dbase server 
        include 'open.php';

	$fCode = $_POST['Code1'];
	$sCode = $_POST['Code2'];
	$yr = $_POST['Year'];

	 $dataPoints1 = array();
        $dataPoints2 = array();

	$title = "Ratio of Arrivals to Departures for $fCode & $sCode in $yr";



	if (!empty($fCode) and !empty($sCode) and !empty($yr)) {

	
		$finalRatio = $conn->query("CALL finalRatio('".$fCode."', '".$sCode."', '".$yr."');");

	if ($finalRatio->num_rows > 0){

			echo "<table border=\"2px solid black\">";
                        echo "<tr><th>Year</th><th>Month</th><th>First Airport Code</th><th>First Airport Ratio</th><th>Second Airport Code</th><th>Second Airport Ratio</th>";
			echo"</tr>";
			echo"<tr>";

                        foreach($finalRatio as $row1) {
                               	echo "<td>".$row1["year"]."</td>";
                               	echo "<td>".$row1["month"]."</td>";
				echo "<td>".$row1["FirstAirport"]."</td>";
				echo "<td>".$row1["FirstAirportRatio"]."</td>";
				echo "<td>".$row1["SecondAirport"]."</td>";
				echo "<td>".$row1["SecondAirportRatio"]."</td>";
				echo"</tr>";
                        	echo"<tr>";

				$dataPoints1[] = array( "y" => $row1["FirstAirportRatio"], "label" => $row1["month"] );
				$dataPoints2[] = array( "y" => $row1["SecondAirportRatio"], "label" => $row1["month"] );
			}

			

                        echo "</tr";
			echo "</table>";
		

		} else {
                	echo "ERROR: input not found<br>";
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
	theme: "light2",
	title:{
		text: "<?php echo $title; ?>"
	},
	axisY:{
		includeZero: true
	},
	legend:{
		cursor: "pointer",
		verticalAlign: "top",
		horizontalAlign: "center",
		itemclick: toggleDataSeries
	},
	data: [{
		type: "column",
		name: "<?php echo $fCode; ?>",
		indexLabel: "{y}",
		yValueFormatString: "#0.###",
		showInLegend: true,
		dataPoints: <?php echo json_encode($dataPoints1, JSON_NUMERIC_CHECK); ?>
	},{
		type: "column",
		name: "<?php echo $sCode; ?>",
		indexLabel: "{y}",
		yValueFormatString: "#0.###",
		showInLegend: true,
		dataPoints: <?php echo json_encode($dataPoints2, JSON_NUMERIC_CHECK); ?>
	}]
});
chart.render();
 
function toggleDataSeries(e){
	if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
		e.dataSeries.visible = false;
	}
	else{
		e.dataSeries.visible = true;
	}
	chart.render();
}
 
}
</script>
</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>                              

