<html>
    </main>
        <body>
            <?php

            $HOSTNAME = "mariadb";
            $USERNAME = "cs332t32";
            $PASSWORD = "Mov4ZULO";
            $DBNAME = "cs332t32";

            if (isset($_POST['classes'])) {

                $link = mysqli_connect($HOSTNAME, $USERNAME, $PASSWORD, $DBNAME);
                
                if (!$link) {
                    die('ERROR: Could not connect to MySQL ' . mysqli_connect_error());
                }

                $ssn = $_POST['ssn'];

                $query = "SELECT S.CLASSROOM, S.DAYS, S.BEGIN_TIME, S.END_TIME, C.TITLE
                        FROM SECTION S, PROFESSOR P, COURSE C
                        WHERE S.PROFESSOR=P.SSN AND P.SSN=$ssn AND C.CNUM=S.CNUM";
                $result = $link->query($query);
                $rows = $result->num_rows;

                echo '<link rel="stylesheet" type="text/css" href="indexStyle.css?v=<?php echo time(); ?>">';
                echo "<title>cs332t32 $ssn</title>";
                echo '<button><a href="index.html"> Home </a></button>';
                echo '<button><a href="professor.html"> Professor </a></button><br>';
                echo "<br><br><br><h2>Classes for $ssn:</h2><br>";
                echo '<table class="tables">';
                echo '<tr><th>Title</th><th>Room</th><th>Days</th><th>Begins</th><th>Ends</th></tr>';

                for ($i = 0; $i < $rows; $i++) {
                    $row = $result->fetch_assoc();

                    echo '<tr>';
                    echo "<td>" . $row['TITLE'] . "</td>";
                    echo "<td>" . $row['CLASSROOM'] . "</td>";
                    echo "<td>" . $row['DAYS'] . "</td>";
                    echo "<td>" . $row['BEGIN_TIME'] . "</td>";
                    echo "<td>" . $row['END_TIME'] . "</td>";
                    echo '</tr>';
                }
                echo "</table>";

                $result->free();
                $link->close();

            } else if (isset($_POST['grades'])) {
                $link = mysqli_connect($HOSTNAME, $USERNAME, $PASSWORD, $DBNAME);
                if (!$link) {
                    die('ERROR: Could not connect to MySQL ' . mysqli_connect_error());
                }

                $cnum = $_POST['cnum'];
                $snum = $_POST['snum'];

                $query = "SELECT E.Grade, COUNT(*)
                        FROM SECTION S, COURSE C, ENROLLMENT E
                        WHERE C.CNUM=$cnum AND S.SNUM=$snum AND
                                S.CNUM=C.CNUM AND S.SNUM=E.SNUM AND S.CNUM=E.CNUM
                        GROUP BY E.Grade";
                $result = $link->query($query);
                $rows = $result->num_rows;

                $cnum = substr($cnum, 1, -1);

                echo '<link rel="stylesheet" type="text/css" href="indexStyle.css?v=<?php echo time(); ?>">';
                echo "<title>cs332t32 $cnum-$snum</title><br>";
                echo '<button><a href="index.html"> Home </a></button>';
                echo '<button><a href="professor.html"> Professor </a></button><br>';
                echo "<br><br><br><h2>Grades for $cnum-$snum:</h2><br>";
                echo '<table class="tables">';
                echo '<tr><th>Grade</th><th>Count</th></tr>';

                for ($i = 0; $i < $rows; $i++) {
                    $row = $result->fetch_assoc();
                    echo "<tr>";
                    echo "<td>" . $row['Grade'] . "</td>";
                    echo "<td>" . $row['COUNT(*)'] . "</td>";
                    echo "</tr>";
                }
                echo "</table>";

                $result->free();
                $link->close();
                
            } else {
                echo "<title>cs32t13 | ERROR</title>";
                echo '<a href="index.html"> Home </a>';
                echo '<a href="professor.html"> Professor </a> <br>';
                echo "ERROR: Forms not submitted correctly <br>";
                print_r($_POST);
            }

            ?>
    </body>
</html>