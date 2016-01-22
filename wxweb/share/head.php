<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="description" content=" 来玩吧，休闲、娱乐、玩游戏的好地方。"/>
    <meta name="keywords" content="来玩吧 休闲 娱乐 游戏 博客 "/>
    <meta name="author" content="goosle.li@gmail.com"/>
    <link href="/static/css/gslall.css" rel="stylesheet" type="text/css"/>
<title>来玩吧，休闲、娱乐、玩游戏</title>

<body style="background: white url(/static/img/bk-sky.png) repeat-x;">
<div class="page-profile">
<div class="page-head">
    <div id="head-config-menu"  >
    <h1>UnderBanyan</h1>
    <ul >
      <li ><a href="/" >心灵之窗</a></li>
      <li  ><a href="/tag/tagcontrol.php" >发现之旅</a></li>
   
   
 <?php
  $uid=getUserID();
  if(empty($uid))
    {
    echo '</ul>';
   
   echo '<div id="head-menu-right-part">';
    echo '<a href="/user/usercontrol.php" >登陆</a> ';
    echo '&nbsp|&nbsp<a href="/user/usercontrol.php?action=register" >  注册 </a>';
    echo '  </div>';
    echo '</div>';
    }
  else
    {  
   echo '<li  ><a href="/user/usercontrol.php?action=usercfg" >我的家</a></li>';
   echo '</ul>';
   echo '</div>';
    }
?>
</div>
