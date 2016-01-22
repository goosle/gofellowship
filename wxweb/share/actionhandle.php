<?php


function callAction($actionList,$action)
{                          
  if(isset($actionList[$action]))
  {
	$actionList[$action]();
	return 0;
  }
  return -1;
}
function handleAction($actionList)
  {
  $action=@$_GET["action"];  
 
  if(isset($action))
  {
    if(0!=callAction($actionList,$action))
    {    
      log_err($action." is error action paramer"); 	
      return -2;
    }
    return 0;  
  }
  else
  {
    log_err("no action paramer");
    return -1;
  }
}  

?>