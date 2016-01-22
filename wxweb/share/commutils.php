<?php
function isIntStr($strvalue)
  {
  if(!is_string($strvalue))
     return false;
  $str=trim($strvalue);
  $l=strlen($str);
  if($l==0)
    return false;
  for($i=0;$i<$l;++$i)
     {
      $c=$str{$i};
     if($c<'0' || $c >'9')
       return false;
     }
  return true;
  }

function strToIntBool($checkValue)
  {
  if(empty($checkValue)||$checkValue=="0"||$checkValue=="false"||$checkValue=="off" )
    return "0";
  if($checkValue)
    return "1";
  return "0";
  }
  

function strWebDate()
 {
 return gmdate("Y-m-d");
 }
  
function strWebTime()
 {
 return gmdate("Y-m-d H:i:s");
 }
?>