<?php

require_once ROOT_PATH."vendor/monolog/vendor/autoload.php";
 date_default_timezone_set("Asia/Shanghai");

// create a log channel
use Monolog\Logger;
use Monolog\Handler\StreamHandler;

$g_myLogger = new Logger('wxweb');
$g_myLogger->pushHandler(new StreamHandler(ROOT_PATH.'log/wxweb.log', Logger::DEBUG));


function gsl_log_info($mess,$context=Array())
{
    global $g_myLogger;	
    $g_myLogger->info($mess,$context);   
}



function gsl_log_err($mess,$context=Array())
{
    global $g_myLogger;	
    $g_myLogger->error($mess,$context);   
}

/*
function gsl_log_info($mess)
   {
  // $logpath=$_SERVER["DOCUMENT_ROOT"];
   //$logpath="/home/project-web/goosle/htdocs";
   $logpath=dirname(__FILE__)."/../log/gsltrace.log";
   $fp=fopen($logpath,"a");
   fputs($fp,'['.gmdate('Y-m-d H:i').']  '."info:$mess.\n");
   fclose($fp);
   

   } 
   
   function gsl_log_err($mess)
{
	$logpath=dirname(__FILE__);
   $fp=fopen($logpath."/../log/gsltrace.log","a");
   fputs($fp,'['.gmdate('Y-m-d H:i').']  '."error:$mess.\n");
   fclose($fp);
}
*/
?>