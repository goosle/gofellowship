<?php
/*
define("G_SERVER","mysql-g");
define("G_DATABASE","g255057_prjman");
define("G_DBUSER","g255057rw");
define("G_DBPWD","lsrw");
*/
define("G_SERVER","localhost");
define("G_DATABASE","prjman");
define("G_DBUSER","");
define("G_DBPWD","");


function selectDB()
  {
  static $database;
  if(isset($database))
    return $database;
  $database=mysqli_connect(G_SERVER,G_DBUSER,G_DBPWD)
       or err_log("can't connect the database",__FILE__,__LINE__);
  mysqli_select_db($database,G_DATABASE)
      or err_log("can't select db",__FILE__,__LINE__);
  return $database;
  }

function closeDB($database)
  {
  if(is_resource($database))
    mysqli_close($database);
    
  }
  
function selectImproveDB()
  {
  $conn=mysqli_connect(G_SERVER,G_DBUSER,G_DBPWD,G_DATABASE)
       or err_log("can't connect the database",__FILE__,__LINE__);
  return $conn;
  }
 function closeImproveDB($conn)
  {
  if(is_resource($conn))
    $conn->close();
  } 
  
 function last_insert_id($conn)
   {
   $recordset=$conn->query("select last_insert_id() ");
   if(!$recordset || mysqli_num_rows($recordset)!=1) 
     return 0;
   $row=$recordset->fetch_array();
   return $row[0];
   }
?>