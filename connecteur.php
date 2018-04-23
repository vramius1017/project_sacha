<?php

/* Connect to a MySQL database using driver invocation */
 $dsn=rhea.lirmm.fr;
 $login=reservation-mate;
 $pwd=20sacha18;
   

try {
    $dbh = new PDO($dsn, $user, $password);
} catch (PDOException $e) {
    echo 'Connection failed: ' . $e->getMessage();
}finally{
    echo 'connection OK';
}

?>
