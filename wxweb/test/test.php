<?php
define('ROOT_PATH', '../');
require_once ROOT_PATH.'share/logutils.php';
$uid ="123";
$text = "[img]download/1.jpg[/img],[img=50%]download/2.jpg[/img]";
//$text = preg_replace("#\[img\]([^ \?&=\#\"\n\r\t<]*?(\.(jpg|jpeg|gif|png)))\[/img\]#sie", "'[img:$uid]' . str_replace(' ', '%20', '\\1') . '[/img:$uid]'", $text);
	$patterns[] = "#\[img=([0-9]+%?)?\](.*?)\[/img\]#i";
	$replacements[] = '<img width="\\1" src="\\2" />';
	$patterns[] = "#\[img\](.*?)\[/img\]#i";
	$replacements[] = '<img width="100%" src="\\1" />';
	$text = preg_replace($patterns, $replacements, $text);
	
echo "=".$text;
?>