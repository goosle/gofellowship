<?php
/**
  * wechat php test
  */
define('ROOT_PATH', '../');
define('IN_PHPBB', true);
require(ROOT_PATH ."share/logutils.php");
include(ROOT_PATH . 'common.php');

//define your token
define("TOKEN", "followjesus");
$g_my_site_name = 'goosle.sf.net';

$wechatObj = new WechatCallback($db,$session);
//if($wechatObj->checkSignature())
{
	//the first the qq company check valid() ,give it a same message.
	// now start response message
	$wechatObj->responseMsg();
}

class WechatCallback
{
	var $_db;
	var $_session ;
	
	function WechatCallback($db,$session)
	{
		$this->_db = $db;
        $this->_session = $session;		
	}		

		
	function checkMessType($recvMess)
	{
		global $g_forum_module_names;
		global  $g_my_site_name;
		$forumKey = -1;
		$siteName = "";
		foreach($g_forum_module_names as $keyword => $siteName)
		{
			if(strstr($recvMess,$siteName))
			{			
				$forumKey = $keyword;
				$siteName = $g_my_site_name.'/viewforum.php?f='.$forumKey;
				return $siteName;
			}
		}
		
		$MessageKeyWords = array ('团契'=>'','平台'=>'');
		foreach($MessageKeyWords as $keyword => $sitepath)
		{
			if(strstr($recvMess,$keyword))
			{			
				$siteName = $g_my_site_name.$sitepath;
				return $siteName;
			}
		}
		
		return $g_my_site_name;
		
	}
	

	function checkSignature()
	{
        // you must define TOKEN by yourself
        if (!defined("TOKEN")) {
            throw new Exception('TOKEN is not defined!');
        }
        
        $signature = $_GET["signature"];
        $timestamp = $_GET["timestamp"];
        $nonce = $_GET["nonce"];
        		
		$token = TOKEN;
		$tmpArr = array($token, $timestamp, $nonce);
        // use SORT_STRING rule
		sort($tmpArr, SORT_STRING);
		$tmpStr = implode( $tmpArr );
		$tmpStr = sha1( $tmpStr );
		
		if( $tmpStr == $signature ){
			return true;
		}else{
			return false;
		}
	}
	
		
	/*
<xml>
<ToUserName><![CDATA[toUser]]></ToUserName>
<FromUserName><![CDATA[fromUser]]></FromUserName>
<CreateTime>12345678</CreateTime>
<MsgType><![CDATA[news]]></MsgType>
<ArticleCount>2</ArticleCount>
<Articles>
<item>
<Title><![CDATA[title1]]></Title> 
<Description><![CDATA[description1]]></Description>
<PicUrl><![CDATA[picurl]]></PicUrl>
<Url><![CDATA[url]]></Url>
</item>
<item>
<Title><![CDATA[title]]></Title>
<Description><![CDATA[description]]></Description>
<PicUrl><![CDATA[picurl]]></PicUrl>
<Url><![CDATA[url]]></Url>
</item>
</Articles>
</xml>
*/ 
    function outputWXMedia($fromUsername,$toUsername,$medias)
	{
		 $time = time();
		 $cItem = count($medias);
		$textTpl = "<xml>
					<ToUserName><![CDATA[%s]]></ToUserName>
		    		<FromUserName><![CDATA[%s]]></FromUserName>
					<CreateTime>%s</CreateTime>
					<MsgType><![CDATA[news]]></MsgType>
					<ArticleCount>%s</ArticleCount>
	                <Articles> ";
        $resultStr = sprintf($textTpl, $fromUsername, $toUsername, $time,$cItem);
		foreach($medias as $aitem)
		{
			$textTpl = "<item>
			<Title><![CDATA[%s]]></Title> 
			<Description><![CDATA[%s]]></Description>
			<PicUrl><![CDATA[%s]]></PicUrl>
			<Url><![CDATA[%s]]></Url>
			</item>";
			$item = sprintf($textTpl,$aitem["Title"],$aitem["Description"],$aitem["PicUrl"],$aitem["Url"]);
		    $resultStr.=$item;
		}
		$resultStr.="</Articles></xml>";
		
        echo $resultStr;
	}		
		
	function outputWXText($fromUsername,$toUsername,$content)
	{
		 $time = time();
		$textTpl = "<xml>
					<ToUserName><![CDATA[%s]]></ToUserName>
		    		<FromUserName><![CDATA[%s]]></FromUserName>
					<CreateTime>%s</CreateTime>
					<MsgType><![CDATA[text]]></MsgType>
					<Content><![CDATA[%s]]></Content>
					<FuncFlag>0</FuncFlag>
					</xml>";             
        $resultStr = sprintf($textTpl, $fromUsername, $toUsername, $time, $content);
        echo $resultStr;
	}		
		
	
	function valid()
    {
        $echoStr = $_GET["echostr"];

        //valid signature , option
        if($this->checkSignature()){
        	echo $echoStr;
        	exit;
        }
		else
		{
			echo "<p>error signature</p>";
			exit;
		}
    }

		
    public function responseMsg()
    {
		global $g_my_site_name ;
		global $user_ip;
		//get post data, May be due to the different environments
		$postStr = file_get_contents("php://input") ; //$GLOBALS["HTTP_RAW_POST_DATA"];
		//extract post data
		if (empty($postStr))
		{
			echo "";
        	exit;
		}
             
    	 /* libxml_disable_entity_loader is to prevent XML eXternal Entity Injection,
        the best way is to check the validity of xml by yourself */
        libxml_disable_entity_loader(true);
       	$postObj = simplexml_load_string($postStr, 'SimpleXMLElement', LIBXML_NOCDATA);
        $fromUsername = $postObj->FromUserName;
        $toUsername = $postObj->ToUserName;
		$MsgType = trim($postObj->MsgType);
		
		if($MsgType == "event")
		{
			$eventType = trim($postObj->Event);
			if($eventType = "subscribe")
			{//定阅
		    $helpTitle = "欢迎来团契生活网，可以回复 ('1'=>'灵修','2'=>'祷告','3'=>'赞美','4'=>'问答','5'=>'读书','6'=>'交通','7'=>'灌水')。点击连接注册后可发表帖子";
			$url = append_sid($g_my_site_name.'/ucp.php?mode=register&agreed=true', true);        
             $medias = array();
             $medias[] = array("Title"=>"团契生活网","Description"=>$helpTitle,"PicUrl"=>"","Url"=>$url);
			 $this->outputWXMedia($fromUsername,$toUsername,$medias);
             //$this->outputWXText($fromUsername,$toUsername,$url);
             return ;			 
			}
			
		}
		if($MsgType != "text")
		{
			echo "";
			exit;
		}
		
        $keyword = trim($postObj->Content);
		
		$surl = ($this->checkMessType($keyword));
		
		$openID = $fromUsername;
		$this->_session->setOpenID($openID);
		/*
		通过openID fetch sid 
		*/
		$sql = "select session_id from ".SESSIONS_TABLE." where session_open_id = '$openID'";
		if ( !($result = $this->_db->sql_query($sql)) )
		{
			gsl_log_err("error message session_openID =$openID");
			echo "";
			exit;
		}	
        $isLoggedIn = 0;	
        $userID = ANONYMOUS;		
		if ( ($row = $this->_db->sql_fetchrow($result)) )
		{
			$this->_session->session_id = $row['session_id'];
			
		}		
		$userdata = $this->_session->start($user_ip, PAGE_INDEX);//open_id will be setted in session
		$isLoggedIn = $userdata['session_logged_in'];
		$userID = $userdata['session_user_id'];
		/*
		//检查是否该openID 是否注册
		//1,是 
		      1.1 获取sid
              1.2 没有sid ,登录获取sid
			  url 含 sid 
         // 2,否
              把openID加入session ,session 含 oid		 
              当用户注册时在session 中获取oid 注册 		
		*/
		//fetch uid 
		$sql = "select user_id  from ".USERS_TABLE." where user_openID='$openID'";
	
		if ( !($result = $this->_db->sql_query($sql)) )
		{
			gsl_log_err("error message user_openID =$openID");
			echo "";
			exit;
		}		
		if ( !($row = $this->_db->sql_fetchrow($result)) )
		{
		   // the second case , the user not regisger			
			$helpTitle = "欢迎来团契生活网，可以回复 ('1'=>'灵修','2'=>'祷告','3'=>'赞美','4'=>'问答','5'=>'读书','6'=>'交通','7'=>'灌水')。注册后即可发表帖子";
			$url = (append_sid($surl, true));        
             $medias = array();
             $medias[] = array("Title"=>"团契生活网","Description"=>$helpTitle,"PicUrl"=>"","Url"=>$url);
			 $this->outputWXMedia($fromUsername,$toUsername,$medias);
             //$this->outputWXText($fromUsername,$toUsername,$url);			 
			return ;
		}
		
	    $userID = $row["user_id"];
	    $sid = $userdata['session_id'];
        $sql = "select session_id,session_logged_in   from ".SESSIONS_TABLE." where session_user_id = $uid";
	    if ( !($result = $this->_db->sql_query($sql)) )
	    {
		    gsl_log_err("error fetch sessione uid =$uid");
		    exit; 
		}
	   //login 	fetch sid	
	    if ( !($row = $this->_db->sql_fetchrow($result)) || $row['session_logged_in']== 0 )
	    {// login from wx ,auto loginged
			$userdata = $this->_session->update($userID, $user_ip,PAGE_INDEX);
			
        }
	    $url = (appendsid($surl,true));
		$medias = array();
        $medias[] = array("Title"=>"团契生活网","Description"=>$keyword,"PicUrl"=>"","Url"=>$url);
		$this->outputWXMedia($fromUsername,$toUsername,$medias);
        //$this->outputWXText($fromUsername,$toUsername,$url);
	}
		
}

?>