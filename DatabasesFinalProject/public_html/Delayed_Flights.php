<head><title>Months of Delay</title></head>
<body>
<?php
        //open a connection to dbase server 
        include 'open.php';

	$code = $_POST['airportCode'];
	echo "The airportCode collected is $code";
$dataPoints = array();
	$title = "Months with the most delayed departures at $code airport";


        if (!empty($code)) {

	        $delay = $conn->query("CALL departDelay('".$code."');");
		echo "The airport code inputted is $code<br>";

	if ($delay->num_rows > 0){

                        echo "<table border=\"2px solid black\">";
                        echo "<tr><th>Year</th><th>Month</th><th>Departure 15 minute Delay</th><th>Airport Code</th>";
			echo"</tr>";
			echo"<tr>";

                        foreach($delay as $row1) {
                               	echo "<td>".$row1["year"]."</td>";
                               	echo "<td>".$row1["month"]."</td>";
				echo "<td>".$row1["depart15MinDelay"]."</td>";
				echo "<td>".$row1["airportCode"]."</td>";
				echo"</tr>";
                        	echo"<tr>";

				$dataPoints[] = array( "y" => $row1["depart15MinDelay"], "label" => $row1["month"]."/".$row1["year"]);
			}

			

                        echo "</tr";
			echo "</table>";
		

	} else {
		echo "ERROR: code not found<br>";
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


