<?php
session_start();

function getUserID()
  {
  return @$_SESSION['uid'];
  }

function setUserID($uid)
  {
  $_SESSION["uid"]=$uid;
  }
?>