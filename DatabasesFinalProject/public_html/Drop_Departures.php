<head><title>Drop in Airport Departures</title></head>
<body>
<?php
        //open a connection to dbase server 
        include 'open.php';

	$sYear = $_POST['Year1'];
	$eYear = $_POST['Year2'];

	$departs_change = array();

        if (!empty($sYear) and !empty($eYear)) {

	if ($sYear != $eYear) {	
        $dropDeparts = $conn->query("CALL dropDepartures('".$sYear."', '".$eYear."');");
	echo "The years inputted are $sYear and $eYear<br>";

	if ($dropDeparts->num_rows > 0){

                        echo "<table border=\"2px solid black\">";
                        echo "<tr><th>Airport Name</th><th>Airport Code</th><th>Drop in Total Departures</th>";
			echo"</tr>";
			echo"<tr>";

                        foreach($dropDeparts as $row1) {
                               	echo "<td>".$row1["airportName"]."</td>";
                               	echo "<td>".$row1["airportCode"]."</td>";
				echo "<td>".$row1["dropInTotalDepartures"]."</td>";
				echo"</tr>";
                        	echo"<tr>";

				$departs_change[] = array( "y" => $row1["dropInTotalDepartures"], "label" => $row1["airportCode"]);


			}

			

                        echo "</tr";
			echo "</table>";
		} else {
                echo "ERROR: years not found<br>";
		}
	}else {
		echo "ERROR: the same year can not be compared<br>";
	}
	}else {
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
                text: "Drop in Departures"
        },
        axisY:{
                includeZero: true
        },
        data: [{
                type: "column", //change type to bar, line, area, pie, etc
                //indexLabel: "{y}", //Shows y value on all Data Points
                indexLabelFontColor: "#FFFFFF",
                indexLabelPlacement: "outside",
                dataPoints: <?php echo json_encode($departs_change, JSON_NUMERIC_CHECK); ?>
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



