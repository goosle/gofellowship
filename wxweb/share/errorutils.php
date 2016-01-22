<?php 
function err_output($errstr="unknown error")
  {
  echo '<p align="center"> <font color="red" size="4">  <b>'
           ."happen error with message: "
           .$errstr."<br/></b> </font>please click here <a href=\"javascript:history.go(-1);\"> back </a>,or notice your adminstrator  .</p>";
 
  }
 
 function err_log($errstr,$file,$lineno,$outMess="")
   {
  // $logpath=$_SERVER["DOCUMENT_ROOT"];
   //$logpath="/home/project-web/goosle/htdocs";
   $logpath=dirname(__FILE__);
   $fp=fopen($logpath."/../gsltrace.log","a");
   fputs($fp,'['.gmdate('Y-m-d H:i').']  '.$file.":".$lineno."  with message : '".$errstr."'\n");
   fclose($fp);
   
   if(empty($outMess))
     {
     //err_output($file.":".$lineno." = ".$errstr);     
     err_output("程序发现错误，我们将尽快解决问题。");
     }
   else
     err_output($errstr);
   } 
   
   function my_error_handler($type, $error, $file, $line)
   {
   if (error_reporting() == 0) {
        // print "(silenced) ";
     return;
     }
   err_log($error,$file,$line);
   if($type==E_ERROR)
     exit();
   }
   
function my_exception_handler(Exception $e)
  {
   err_log($e->getMessage(),$e->getFile(),$e->getLine());
   
  }

set_error_handler("my_error_handler");
set_exception_handler("my_exception_handler"); 


 $_gslErrorMessage;
$_gslErrorUserMessage;
$_gslErrorFile;
$_gslErrorLine;

 function set_err_log($file,$line,$log,$message="")   
   {
   global $_gslErrorMessage;
  global $_gslErrorUserMessage;
  global $_gslErrorFile;
  global $_gslErrorLine;
  $_gslErrorMessage=$log;
  $_gslErrorUserMessage=$message;
  $_gslErrorFile=$file;
  $_gslErrorLine=$line;
   }
 function def_err_log()
   {
   global $_gslErrorMessage;
   global $_gslErrorUserMessage;
   global $_gslErrorFile;
  global $_gslErrorLine;
   err_log($_gslErrorMessage,$_gslErrorFile,$_gslErrorLine,$_gslErrorUserMessage);
   }
?>