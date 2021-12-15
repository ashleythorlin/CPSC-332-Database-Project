<?<php>
    define('hostName', 'mariadb');
    define('userName', 'cs332t32');
    define('passWord', 'Mov4ZULO');
    define('dbName', 'cs332t32');

    $link = mysqli_connect($hostName, $userName, $password, $dbName)
    
    if (!$link){
        die('Unable to connect to host $hostName')
    }

</php>