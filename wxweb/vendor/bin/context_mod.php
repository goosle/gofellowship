<?php
//**********
/*
[uin=>[nickname]]
*/
//*************
//format : $s_contexts[$context["Uin"]] = array("NickName"=>$context["NickName"],"IsGroup"=>$context["IsGroup"],"GroupID"=>$context["GroupID"]);
static $s_contexts;
static $s_user;

function saveContextToDb()
{
	global $db;
	$contextList = getContexts();
	$user = getUser();
	//fetch max user id to insert
	
	$sql = "select max(user_id) as maxuid from ".USERS_TABLE;
	if ( !($result = $db->sql_query($sql)) )		                     
	{
		return -11;
	}
	$maxuid = 0;
	if ( $row = $db->sql_fetchrow($result) )
	{		 
		 $maxuid = $row['maxuid'];	
	}
	gsl_log_info("max uid = $maxuid");
	//insert user table and group table ,and set userID and group	
	foreach($contextList as $key=>&$rec )
	{
		$sql = "select user_id  from ".USERS_TABLE." where User_Uin=$key";
		if ( !($result = $db->sql_query($sql)) )
		{
			return -1;
			
		}
		
		if ( !($row = $db->sql_fetchrow($result)) )
		{
				++$maxuid;
				$upsql = " insert into ".USERS_TABLE." (user_id,user_Uin,user_is_group,username,user_nickName,user_password,user_regdate) values($maxuid,$key,"
					."{$rec['IsGroup']},'{$rec['NickName']}','{$rec['NickName']}','".md5('888888')."',".time().")"; 

				if ( !($result = $db->sql_query($upsql)) )
				{
					gsl_log_info("insert user_table fail ,sql=$upsql");
					return -2;
				}
				$rec["UserUid"]=$maxuid;
				$rec["IsNew"]= 1;
		}
		else
		{
				$rec["UserUid"]=$row["user_id"];
				$rec["IsNew"]=0;
		}
		
	    		
		if($rec["IsGroup"])
		{
				$sql = "select group_id  from ".GROUPS_TABLE." where group_Uin=$key";
				if ( !($result = $db->sql_query($sql)) )
				{
					return -4;
				}
				if ( !($row = $db->sql_fetchrow($result)) )
				{
					$upsql = " insert into ".GROUPS_TABLE." (group_uin,group_type,group_name,group_description,group_moderator,group_single_user)".
                 				" values($key,0,'${rec['NickName']}','${rec['NickName']}',1,0)"; 
					if ( !($result = $db->sql_query($upsql)) )
					{
						gsl_log_info("insert group table fail ,sql=$upsql");
						return -5;
					}			
					$rec["GroupUid"]=$db->last_insert_id();
					$rec["IsNewGroup"]= 1;
				}
				else
				{
					$rec["GroupUid"]=$row["group_id"];
					$rec["IsNewGroup"]= 0;				
				}
		}
	}	
	
	//update group -user map
	foreach($contextList as $key=>&$rec )
	{
		if(!$rec["IsGroup"])
		{
			$grouplist = $rec["GroupID"];
			if(empty($grouplist))
				continue;
			$uid = $rec["UserUid"];
			$isNew= $rec["IsNew"];
			//delete all uid user -group map
			if(!$isNew)
			{
				$upsql = "delete from ".USER_GROUP_TABLE." where user_id = $uid";	            	
     			if ( !($result = $db->sql_query($upsql)) )
				{
					 gsl_log_info("delete user_group table ,sql=$upsql");	
					return -6;
				}
			}
			//insert each user-group map	
			$groups = explode(",",$grouplist);
			foreach($groups as $key )
			{
				$grow =$contextList[$key];				
				$gid = $grow["GroupUid"];
				$upsql = " insert into ".USER_GROUP_TABLE."(user_id,group_id,user_pending)values($uid,$gid,0)";
				if ( !($result = $db->sql_query($upsql)) )
				{
					gsl_log_info("insert user_group_table fail ,sql=$upsql");
					return -7;
				}				
			}
		}
	}
	return 0;
}

function getContexts()
{
    global $s_contexts;
	global $s_user;
	if(isset($s_contexts))
	     return $s_contexts;
    $cachePath=dirname(__FILE__)."/ContextList.bin";
    $data = file_get_contents($cachePath);	
	if(isset($data))
	{	
	      gsl_log_info("fetch contexts");
	      $saveobj = unserialize($data);
		  $s_user = $saveobj["User"];
		  $s_contexts = $saveobj["List"];
		  return $s_contexts;
	}				
	return NULL;
}

function getUser()
{
    global $s_contexts;
	global $s_user;
	if(isset($s_user))
	     return $s_user;
    $cachePath=dirname(__FILE__)."/ContextList.bin";
    $data = file_get_contents($cachePath);	
	if(isset($data))
	{	
	      gsl_log_info("fetch user");   
	      $saveobj = unserialize($data);
		  $s_user = $saveobj["User"];
		  $s_contexts = $saveobj["List"];
		  return $s_user;
	}				
	return NULL;
}
/*
//**************************
json format
{"UpdateType":1,"UpdateCount":1,"UpdateList":
[{"Uin\":123456,"UserName":"@123sdfdsfs3213","NickName":"a alias name"}]
}
//****************************
*/

function saveContexts($strContexts)
{
    global $s_contexts;
    global $s_user;
	$contexts = json_decode($strContexts,true);
	$updateType =$contexts["UpdateType"];
	$contextList = $contexts["UpdateList"];
	$s_user = $contexts["User"];
    if(isset($contextList))
	{
    	////updatetype 0,init 1,batch update ,2 append context 3,delete context
        // init data   
	    switch($updateType )
		{
		case 0:
		{//init
            foreach($contextList as $context)
			{		
				$s_contexts[$context["Uin"]] = array("NickName"=>$context["NickName"],"IsGroup"=>$context["IsGroup"],"GroupID"=>$context["GroupID"]);
			}  
         }
		 case 1,2:
		{//apend
		    getContexts();
            foreach($contextList as $context)
			{		
				$s_contexts[$context["Uin"]] = array("NickName"=>$context["NickName"],"IsGroup"=>$context["IsGroup"],"GroupID"=>$context["GroupID"]);
			} 			  
		}
		case  3 :
		{//del
			getContexts();
            foreach($contextList as $context)
			{		
				unset($s_contexts[$context["Uin"]]);
			}
		}
		 //save  data 
		 {
			$cachePath=dirname(__FILE__)."/ContextList.bin";
			$saveobj["User"] = $s_user;
			$saveobj["List"]=$s_contexts;
			$data = serialize($saveobj);
			gsl_log_info("cache context paht:$cachePath");
			file_put_contents($cachePath,$data);
	    }
		  

		return 0;
	}	
    else
	{
		gsl_log_err("parse context list json code error:$strContexts"); 
		return -1;
	}		
	
}



function showContexts()
{
	$contextList = getContexts();
	$user = getUser();
	if(empty($contextList))
	{
	    echo "<p>NULL Contexts</p>";
		return ;
	}	
	echo "<p>"."uin=".$user["Uin"]."       nickname=".$user["NickName"]."</p>";
	echo '<table>';
	foreach($contextList as $key=>$rec )
	{
		echo '<tr>';
		echo '<td>'.$key.'</td><td>'.$rec["NickName"].'</td><td>'.$rec["IsGroup"].'</td><td>'.$rec["GroupID"].'</td>';
		echo '</tr>';
	}
	echo '</table>';
	
}



function updateContexts()
{
    global $s_contexts;
	$strjson = file_get_contents("php://input") ;  
	gsl_log_info("recv context json:$strjson");
	if(0==saveContexts($strjson))
	{
     	if(0 != ($ret=saveContextToDb()))
		{
			$count = count($s_contexts);
			gsl_log_info("Update Context save to database fail.");
			echo "{\"Ret\":$ret,\"ErrorMsg\":\"save to database fail.\",\"Count\":$count}";
			return ret ;
		}			
		else
		{
			$count = count($s_contexts);
			gsl_log_info("update Context succeed");
			echo "{\"Ret\":0,\"ErrorMsg\":\"ok\",\"Count\":$count}";
			return 0;
		}
	}
	else
	{
    	$count = count($s_contexts);
	    gsl_log_info("Update Context fail.");
		echo "{\"Ret\":-1,\"ErrorMsg\":save to local contexts file fail.\"\",\"Count\":$count}";
		return -1;
	}	
}
?>