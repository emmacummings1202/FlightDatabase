<head><title>High Delay Profit</title></head>
<body>
<?php
        //open a connection to dbase server 
        include 'open.php';

        // collect the posted value in a variable called $yr
        $yr = $_POST['Year'];

	$dataPoints = array();
	$dataPoints2= array();
	if (!empty($yr)) {
		echo "The year inputted is $yr<br>";
        
        $profit = $conn->query("CALL highDelay('".$yr."');");

	if ($profit->num_rows > 0){


                        echo "<table border=\"2px solid black\">";
                        echo "<tr><th>Year</th><th>Airline Name</th><th>Operating Revenue</th><th>Total Delay</th>";

                        echo"</tr>";
                        echo"<tr>";

                        foreach($profit as $row1) {
                                echo "<td>".$row1["year"]."</td>";
                                echo "<td>".$row1["airlineName"]."</td>";
                                echo "<td>".$row1["opRev"]."</td>";
                                echo "<td>".$row1["TotalDelay"]."</td>";

				$dataPoints[] = array( "y" => $row1["opRev"], "label" => $row1["airlineName"]);
				$dataPoints2[] = array ("label"=>$row1["airlineName"], "y"=>$row1["TotalDelay"]);
				echo"</tr>";
                                echo"<tr>";
				
				
				}

                        echo "</tr";
                        echo "</table>";

		} else {
                  	echo "ERROR: Invalid year<br>";
                }
        } else {
                echo "No year inputted<br>";
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
	theme: "dark1", // "light1", "light2", "dark1", "dark2"
	title:{
		text: "Operating Revenue (in thousands) for Airlines with Most Delays"
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




</body>
