<?php
/**
  * wechat php test
  */
define('ROOT_PATH', '../');
define('IN_PHPBB', true);

include(ROOT_PATH . 'common.php');

//define your token
define("TOKEN", "followjesus2013");
$g_my_site_name = 'www.gofellowship.cn';

$wechatObj = new WechatCallback($db,$session);

//$wechatObj->valid();

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

	/*
	$accessType = f = forum
	              t = topic
				  i =  index
    */	
	function checkMessType($recvMess,&$accessType,&$accessValue)
	{
		global $g_forum_module_names;
		global  $g_my_site_name;
		$forumKey = -1;
		$siteName = "";
		$accessType = "i";
		foreach($g_forum_module_names as $keyword => $siteName)
		{
			if(strstr($recvMess,$siteName))
			{			
				$forumKey = $keyword;
				$siteName = $g_my_site_name.'/viewforum.php?f='.$forumKey;
				$accessType = "f";
				$accessValue = $forumKey;
				return $siteName;
			}
		}
		
		$MessageKeyWords = array ('团契'=>'','去团契'=>'','平台'=>'');
		foreach($MessageKeyWords as $keyword => $sitepath)
		{
			if(strstr($recvMess,$keyword))
			{	
                $accessValue ="";		
				$siteName = $g_my_site_name.$sitepath;
				return $siteName;
			}
		}
		if(preg_match("/(\w+)=(\d+)/i",$recvMess,$a))
        {
			$accessValue = $a[2];
			if($a[1]=="t")
			{
				$accessType = "t";
				
				$siteName = $g_my_site_name."/viewtopic.php?t=".$a[2];
				return $siteName;				
			}
			else
			if($a[1]=="f")
			{
				$accessType = "f";
				$siteName = $g_my_site_name.'/viewforum.php?f='.$a[2];
				return $siteName;
			}
			else
			{
				$accessValue = "";
				return $g_my_site_name;
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
			gsl_log_info("receive a non text message");
			echo "";
			exit;
		}
		
        $keyword = trim($postObj->Content);
		$accessType = "i";
		$surl = ($this->checkMessType($keyword,$accessType,$accessValue));
		
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
		$userdata = $this->_session->startByOid($user_ip, PAGE_INDEX);//open_id will be setted in session
		$isLoggedIn = $userdata['session_logged_in'];
		$userID = $userdata['session_user_id'];

		$picUrl = "https://mmbiz.qlogo.cn/mmbiz/F43odNw2JZk007MWNG793f3DroKEiabkhuAJLHq0EbtHjrGGpiaDEw0T82YWPn41KwOIbNwhU3lhy5Vxic3zTM79g/0?wx_fmt=jpeg";	 
		if (  $accessType=="i")
		{
		   // the second case , the user not regisger			
			$helpDesc = "去团契(gofellowship.cn)，可以回复 ('1'=>'灵修','2'=>'祷告','3'=>'赞美','4'=>'问答','5'=>'读书','6'=>'交通','7'=>'灌水')。注册后即可发表帖子";
			$url = (append_sid($surl, true));        
             $medias = array();
             $medias[] = array("Title"=>"团契生活网","Description"=>$helpDesc,"PicUrl"=>$picUrl,"Url"=>$url);
			 $this->outputWXMedia($fromUsername,$toUsername,$medias);
             //$this->outputWXText($fromUsername,$toUsername,$url);			 
			return ;
		}
		
        
	    $url = append_sid($surl,true);
			
		$medias = array();
		$desc =  $keyword;
		if($accessType=="t")
		{
			$sql = "select topic_title from ".TOPICS_TABLE." where topic_id = $accessValue";
			if ( !($result = $this->_db->sql_query($sql)) )
			{
				$desc = "贴子不存在";
				$url = $g_my_site_name;
			}	
			else
			{
				if ( ($row = $this->_db->sql_fetchrow($result)) )
				{
					$desc = $row["topic_title"];
				}
				else
				{
					$desc = "贴子不存在";
					$url = $g_my_site_name;
				}
				
			}   
			
		}
        $medias[] = array("Title"=>"去团契(gofellowship.cn)","Description"=>$desc,"PicUrl"=>$picUrl,"Url"=>$url);
		$this->outputWXMedia($fromUsername,$toUsername,$medias);
        //$this->outputWXText($fromUsername,$toUsername,$url);
	}
		
}

?>