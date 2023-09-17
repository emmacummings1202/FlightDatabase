<head><title>Airline Departure Drops</title></head>
<body>
<?php
        //open a connection to dbase server 
        include 'open.php';

	$sYear = $_POST['Year1'];
	$eYear = $_POST['Year2'];
	$title = "Airlines with the largest drop in departures from $sYear and $eYear";
	$dataPoints = array();

	if (!empty($sYear) and !empty($eYear)) {
		if ($sYear != $eYear and $sYear < $eYear) {

        $dropDeparts = $conn->query("CALL airlineDropDepartures('".$sYear."', '".$eYear."');");


	if ($dropDeparts->num_rows > 0){

                        echo "<table border=\"2px solid black\">";
                        echo "<tr><th>Airline Name</th><th>Airline Code</th><th>Drop in Total Departures</th>";
			echo"</tr>";
			echo"<tr>";

                        foreach($dropDeparts as $row1) {
                               	echo "<td>".$row1["airlineName"]."</td>";
                               	echo "<td>".$row1["airlineCode"]."</td>";
				echo "<td>".$row1["dropInTotalDepartures"]."</td>";
				echo"</tr>";
                        	echo"<tr>";
				$dataPoints[] = array( "y" => $row1["dropInTotalDepartures"], "label" => $row1["airlineCode"]);
			}

			

                        echo "</tr";
			echo "</table>";
		

		} else {
                echo "ERROR: years not found<br>";
		}
		} else {
			echo "ERROR: cannot compare years<br>";
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
        theme: "light2", // "light1", "light2", "dark1", "dark2"
        title: {
                text: "<?php echo $title; ?>"
        },
        axisY: {
                title: "Drop in Arrivals"
	},
        data: [{
                type: "column",
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


