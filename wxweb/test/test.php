<?php
define('ROOT_PATH', '../');
require_once ROOT_PATH.'share/logutils.php';
gsl_log_info("the first log ");
$x="t14";

if(preg_match("/(\w+)=(\d+)/i",$x,$a))
echo $a[1].",".$a[2];
?>