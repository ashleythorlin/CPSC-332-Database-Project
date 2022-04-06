<html>
    <body>
		<?php
		$HOSTNAME = "mariadb";
		$USERNAME = "cs332t32";
		$PASSWORD = "Mov4ZULO";
		$DBNAME = "cs332t32";

		if (isset($_POST['section'])) {

			$link = mysqli_connect($HOSTNAME, $USERNAME, $PASSWORD, $DBNAME);

			if (!$link) {
				die('ERROR: Could not connect to MySQL ' . mysqli_connect_error());
			}

			$cnum = $_POST['cnum'];

			$query = "SELECT S.SNUM, S.CLASSROOM, S.DAYS, S.BEGIN_TIME, S.END_TIME, COUNT(*)
					FROM SECTION S, ENROLLMENT E
					WHERE S.CNUM=$cnum AND S.SNUM=E.SNUM AND S.CNUM=E.CNUM
					GROUP BY S.SNUM";

			$result = $link->query($query);
			$rows = $result->num_rows;

			$cnum = substr($cnum, 1, -1);

			echo '<link rel="stylesheet" type="text/css" href="indexStyle.css?v=<?php echo time(); ?>">';
			echo "<title>cs332t32 $cnum</title>";
			echo '<button><a href="index.html"> Home </a></button>';
			echo '<button><a href="student.html"> Student </a></button>';
			echo "<br><br><br><br><h2>Sections for $cnum:</h2><br>";
			echo '<table class="tables">';
			echo '<tr><th>Section</th><th>Room</th><th>Days</th><th>Begins</th><th>Ends</th></tr>';

			for ($i = 0; $i < $rows; $i++) {
				$row = $result->fetch_assoc();
				echo "<tr>";
				echo "<td>" . $row['SNUM'] . "</td>";
				echo "<td>" . $row['CLASSROOM'] . "</td>";
				echo "<td>" . $row['DAYS'] . "</td>";
				echo "<td>" . $row['BEGIN_TIME'] . "</td>";
				echo "<td>" . $row['END_TIME'] . "</td>";
				echo '</tr>';
			}

			echo "</table>";

			$result->free();
			$link->close();

		} else if (isset($_POST['transcript'])) {
			$link = mysqli_connect($HOSTNAME, $USERNAME, $PASSWORD, $DBNAME);
			
			if (!$link) {
				die('ERROR: Could not connect to MySQL ' . mysqli_connect_error());
			}

			$cwid = $_POST['cwid'];

			$query = "SELECT C.TITLE, E.GRADE
					FROM ENROLLMENT E, COURSE C
					WHERE E.CWID=$cwid AND E.CNUM=C.CNUM";
			$result = $link->query($query);
			$rows = $result->num_rows;

			echo '<link rel="stylesheet" type="text/css" href="indexStyle.css?v=<?php echo time(); ?>">';
			echo "<title>cs332t32 $cwid</title>";
			echo '<button><a href="index.html"> Home </a></button>';
			echo '<button><a href="student.html"> Student </a></button>';
			echo "<br><br><br><br><h2>Grade History for $cwid:</h2><br>";
			echo '<table class="tables">';
			echo '<tr><th>Course</th><th>Grade</th></tr>';

			for ($i = 0; $i < $rows; $i++) {
				$row = $result->fetch_assoc();
				echo "<tr>";
				echo "<td>" . $row['TITLE'] . "</td>";
				echo "<td>" . $row['GRADE'] . "</td>";
				echo "</tr>";
			}
			echo "</table>";

			$result->free();
			$link->close();
			
		} else {
			echo "<title>cs32t13 | ERROR</title>";
			echo '<a href="index.html"> Home </a>';
			echo '<a href="student.html"> Student </a>';
			echo "ERROR: Forms not submitted correctly <br>";
			print_r($_POST);
		}
		?>

    </body>

</html>