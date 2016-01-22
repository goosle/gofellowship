<?php

		/*
		send: {"Uin":"","Msg":"","FromUin":""}
		resp:
		 RespType:0 not handle;
                          1: send to user
                          {Ret:0,RespType:1,FromUin:"",Data:""}
		*/
function recvMsg()
{
	global $g_forum_module_sites;
	global $db;
	global $session ;
	$strjson = file_get_contents("php://input") ; 
	if(!empty($strjson))
    {
		$msg = json_decode($strjson,true);
    }
	if(empty($msg))
	{
	    gsl_log_err("RecvMsg handle msg =NULL");
	    echo  '{"Ret":-1,RespType:0,FromUin:"",Data:""}';
		return -1;
	}	
	
	$uin = $msg["Uin"];
	$fromUin = $msg["FromUin"];
	$recvMess = $msg["Msg"];
	//check msg match
	$matchKey = 0;
	$siteName;
	foreach($g_forum_module_sites as $keyword => $siteName)
	{
		if(strstr($recvMess,$keyword))
		{			
			$matchKey = 1;
			break;
		}
	}
	gsl_log_info("sitename=$siteName,key=$matchKey");
	if(0 == $matchKey)
	{
		gsl_log_err("the message is not a key word  message uin =$recvMess");
		echo  '{"Ret":-11,RespType:0,FromUin:"",Data:"error keyword"}';
		return -11;
	}
	//fetch uin
	gsl_log_info("recv msg : fromUin:".$fromUin." msg = ".$recvMess);
	$ContextList = getContexts();	
	$fromUser =$ContextList[$fromUin];
	$nickName = "";
	if(!empty($fromUser))
	   $nickName = $fromUser["NickName"]; 
    //fetch uid 
    $sql = "select user_id  from ".USERS_TABLE." where User_Uin=$fromUin";
	if ( !($result = $db->sql_query($sql)) )
	{
		gsl_log_err("error message uin =$fromUin");
		echo  '{"Ret":-2,RespType:0,FromUin:"",Data:"error uin"}';
		return -2;
	}		
	if ( !($row = $db->sql_fetchrow($result)) )
	{
		gsl_log_err("error message uin =$fromUin");
		return -3;
	}		
	$uid = $row["user_id"];
	
	$sql = "select session_id,session_logged_in   from tqsh_sessions where session_user_id = $uid";
	if ( !($result = $db->sql_query($sql)) )
	{
		gsl_log_err("error fetch sessione uid =$uid");
		echo  '{"Ret":-4,RespType:0,FromUin:"",Data:"can not found session id "}';
		return -4;
	}
	
    //login 	fetch sid	
	if ( !($row = $db->sql_fetchrow($result)) )
	{
		gsl_log_info("start update ");
		$session->update($uid, $user_ip,PAGE_INDEX);
		gsl_log_info("end update ");
		$sid = $session->SID;		
	}
	else
	{	
        $sid ='sid=' .$row["session_id"];
	}
	echo  '{"Ret":0,"RespType":1,"FromUin":'.$msg["FromUin"].',"Data":"'.'欢迎'.$nickName.'进入“团契生活”网\n'.$siteName."&$sid".'"}';
	return 0;
}


/*
   send: {Uin:,UpdateTime:}
   resp:{Ret:,Uin:,UpdateTime:,UpdateModuleCount:,UpdateModules:["EventHint","Pray","Reading","Activety"]}
   
*/
function heartBeat()
{
   $strjson = file_get_contents("php://input") ; 
    $msg = json_decode($strjson,true);
    if(empty($msg))
	{
	    log_err("RecvMsg handle msg =NULL");
	    echo  '{"Ret":1,"Uin":"","UpdateTime":0,"UpdateModuleCount":0,"UpdateModules":[]}';
		return ;
	}
   echo  '{"Ret":0,"Uin":'.$msg["Uin"].',"UpdateTime":0,"UpdateModuleCount":1,"UpdateModules":["EventHint","Pray"]}';
}
?>