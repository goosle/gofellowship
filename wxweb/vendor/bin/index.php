<?php
define('ROOT_PATH', '../');
define('IN_PHPBB', true);
require(ROOT_PATH ."share/logutils.php");
include(ROOT_PATH . 'common.php');

require_once "context_mod.php";
require_once  "mess_mod.php";

require_once ROOT_PATH."share/actionhandle.php";

$s_actionList=array("UpdateContexts"=>"updateContexts","ShowContexts"=>"showContexts","ReceiveMsg"=>"recvMsg","HeartBeat"=>"heartBeat");
$ret = handleAction($s_actionList);
?>