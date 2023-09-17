<head><title>High Rank</title></head>
<body>
<?php
        //open a connection to dbase server 
        include 'open.php';

	$highRank = $conn->query("CALL RankNumPass");

	if ($highRank->num_rows > 0){


                        echo "<table border=\"2px solid black\">";
                        echo "<tr><th>Airport Name</th><th>Airport Code</th><th>Airport Rank</th><th>Number of times Ranked</th>";

                        echo"</tr>";
                        echo"<tr>";

                        foreach($highRank as $row1) {
                                echo "<td>".$row1["airportName"]."</td>";
                                echo "<td>".$row1["airportCode"]."</td>";
                                echo "<td>".$row1["airportRank"]."</td>";
                                echo "<td>".$row1["NumTimesRanked"]."</td>";
                                echo"</tr>";
                                echo"<tr>";
                        }

                        echo "</tr";
                        echo "</table>";


         }


   // close the connection opened by open.php
        $conn->close();
?>
</body>
