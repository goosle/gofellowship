<?php
/**
* @package phpBB-WAP
* @copyright (c) phpBB Group
* @Оптимизация под WAP: Гутник Игорь ( чел ).
* @简体中文：中文phpBB-WAP团队
* @license http://opensource.org/licenses/gpl-license.php
**/

/**
* 这是一款自由软件, 您可以在 Free Software Foundation 发布的
* GNU General Public License 的条款下重新发布或修改; 您可以
* 选择目前 version 2 这个版本（亦可以选择任何更新的版本，由
* 你喜欢）作为新的牌照.
**/

define('IN_PHPBB', true);
define('ROOT_PATH', './');
include(ROOT_PATH . 'common.php');
//获取forum_id
 $forum_id = FORUM_GROUP_ID;
//获取group_id
if ( isset($_GET[POST_GROUPS_URL]) || isset($_POST[POST_GROUPS_URL]) )
{
	$group_id = ( isset($_POST[POST_GROUPS_URL]) ) ? intval($_POST[POST_GROUPS_URL]) : intval($_GET[POST_GROUPS_URL]);
}
else
{
	$group_id = '';
	trigger_error(“非小组成员无权查看”, E_USER_ERROR);
}

$userdata = $session->start($user_ip, $forum_id);
init_userprefs($userdata);

$start = get_pagination_start($board_config['topics_per_page']);

//检查是否用户在这个组
$user_id = $userdata["user_id"];
$sql = " select g.group_id,g.group_name FROM ".USER_GROUP_TABLE. " ug ,".GROUPS_TABLE." g where ug.group_id=g.group_id and ug.group_id = $group_id and ug.user_id= $user_id  ";
if ( !($result = $db->sql_query($sql)) )
{
	trigger_error('Could not obtain topic information', E_USER_WARNING);
}
 if(!($row = $db->sql_fetchrow($result)) )
 {
	 trigger_error(“非小组成员无权查看”, E_USER_ERROR);
 }
$group_name=$row["group_name"];
//@2 获取帖子*******************************************************

$islogin = $userdata['session_logged_in'] ;

$sql ='select t.* ,u.username  from  '.TOPICS_TABLE ." t ,".USERS_TABLE." u  where topic_group_id=".$group_id. " AND t.forum_id =".$forum_id." AND u.user_id = t.topic_poster ";	

if ( !($result = $db->sql_query($sql)) )
{
	trigger_error('Could not obtain topic information', E_USER_WARNING);
}
$total_topics = 0;
while( $row = $db->sql_fetchrow($result) )
{
	$topic_rowset[] = $row;
	$total_topics++;
}

$db->sql_freeresult($result);

//获取帖子end***************************************************************************

$orig_word = array();
$replacement_word = array();
obtain_word_list($orig_word, $replacement_word);

$u_modcp = '';
if ($is_auth['auth_mod'])
{
	$u_modcp = append_sid('modcp.php?' . POST_FORUM_URL . '=' . $forum_id . '&amp;start=' . $start . '&amp;sid=' . $userdata['session_id']);
	$template->assign_block_vars('modcp', array('U_MODCP' => $u_modcp,) );
}

$template->assign_vars(array(
	'U_FORUMCP'			=> append_sid('forumcp.php?' . POST_FORUM_URL . '=' . $forum_id),
	'FORUM_ID' 			=> $forum_id,
	'FORUM_NAME' 		=> $forum_row['forum_name'],
	'GROUP_ID'          => $group_id,
	'U_GROUP_VIEW'      =>"groupcp.php",
	'GROUP_NAME'        =>$group_name,
	'U_POST_NEW_TOPIC' 	=> append_sid("posting.php?mode=newtopic&amp;" . POST_FORUM_URL . "=$forum_id&amp;".POST_GROUPS_URL."=$group_id"),
	'U_CLASS'			=> append_sid('viewclass.php?mode=list&' . POST_FORUM_URL . '=' . $forum_id),
	'U_MARROW'			=> append_sid('viewforum.php?' . POST_FORUM_URL . '=' . $forum_id . '&marrow'),
	'U_VIEW_FORUM' 		=> append_sid("viewforum.php?" . POST_FORUM_URL ."=$forum_id"),
	'S_SEARCH_ACTION' 	=> append_sid('bbs/search_topic.php?' . POST_FORUM_URL . '=' . $forum_id."&amp;".POST_GROUPS_URL."=$group_id"),
	'U_MY_FORUM'        => append_sid("viewforum.php?" . POST_FORUM_URL ."=$forum_id&me"),
	'U_JOIN_FORUM' 		=> append_sid("viewforum.php?" . POST_FORUM_URL ."=$forum_id&join"),
	'MY_FORUM_NAME'     => '我的'.$g_forum_module_names[$forum_id],
	'MY_JOIN_NAME'      => '我加入的'.$g_forum_module_names[$forum_id]
));

define('SHOW_ONLINE', true);
$page_title = $forum_row['forum_name'];

page_header($page_title);

page_jump();

// 使用论坛的模块
require_once ROOT_PATH . 'includes/class/forum_module.php';

$forum_module = new Forum_module($forum_id);

// 显示论坛的顶部
$forum_module->display_top();

$template->set_filenames(array(
	'body' => 'viewforum_group_body.tpl')
);

if( $total_topics )
{
	for($i = 0; $i < $total_topics; $i++)
	{
		$topic_id 		= $topic_rowset[$i]['topic_id'];
		$topic_title 	= ( count($orig_word) ) ? str_replace($orig_word, $replacement_word, $topic_rowset[$i]['topic_title']) : $topic_rowset[$i]['topic_title'];		
		$views			= $topic_rowset[$i]['topic_views'];
		$replies 		= $topic_rowset[$i]['topic_replies'];
		$topic_type 	= $topic_rowset[$i]['topic_type'];
		//$topic_time		= $topic_rowset[$i]['topic_time'];

		// 公告帖子
		if( $topic_type == POST_ANNOUNCE )
		{
			$topic_type = make_style_image('topic_announcement', '公告帖子', '【告】');
			$row_class = 'bold';
		}
		// 置顶帖子
		else if( $topic_type == POST_STICKY )
		{
			$topic_type = make_style_image('topic_sticky', '置顶帖子', '【顶】');
			$row_class = 'bold';
		}
		// 普通贴子
		else
		{
			$topic_type = '';
			$row_class = 'medium';
		}

		// 投票
		if( $topic_rowset[$i]['topic_vote'] )
		{
			$topic_type = make_style_image('topic_poll', '投票帖子', '【投】');
		}
		
		// 从其他论坛移动过来的帖子
		if( $topic_rowset[$i]['topic_status'] == TOPIC_MOVED )
		{
			$topic_type = make_style_image('topic_move', '移动过来的帖子', '【移】');
			$topic_id = $topic_rowset[$i]['topic_moved_id'];
		}
		
		// 附件图标
		if (intval($topic_rowset[$i]['topic_attachment']) == 0 || (!($is_auth['auth_download'] && $is_auth['auth_view'])) || intval($board_config['disable_mod']) || $board_config['topic_icon'] == '')
		{
			$attachment_image = '';
		}
		else
		{

			$attachment_image = '<img src="' . $board_config['topic_icon'] . '" alt="附" title="带有附件的帖子"/>';
		}

		if ($topic_rowset[$i]['topic_marrow'] == POST_MARROW)
		{
			$topic_marrow = make_style_image('topic_marrow', '精华帖子', '【精】');
		}
		else
		{
			$topic_marrow = '';
		}

		$view_topic_url 	= append_sid("viewtopic.php?" . POST_TOPIC_URL . "=$topic_id");
		//$last_post_author 	= ( $topic_rowset[$i]['id2'] == ANONYMOUS ) ? ( ($topic_rowset[$i]['post_username2'] != '' ) ? $topic_rowset[$i]['post_username2'] . ' ' : '匿名用户' . ' ' ) :  $topic_rowset[$i]['user2']  ;
		//$s_last_post 		= '<a href="' . append_sid("viewtopic.php?"  . POST_POST_URL . '=' . $topic_rowset[$i]['topic_last_post_id']) . '#' . $topic_rowset[$i]['topic_last_post_id'] . '">»</a>';
        $username 	=  ($topic_rowset[$i]["topic_hide_author"]==1)?"匿名":$topic_rowset[$i]['username'];
		$s_username 	= '<a href="' . append_sid("viewtopic.php?"  . POST_POST_URL . '=' . $topic_rowset[$i]['user_id'])  . '">'.$username .'</a>';
			

	$nomer_posta 		= $i + $start + 1;
		$row_color = ( !($i % 2) ) ? 'row1' : 'row2';

		$template->assign_block_vars('topicrow', array(		    
			'ROW_CLASS'				=> $row_class,
			'ROW_COLOR'				=> $row_color,
			'REPLIES' 				=> $replies,
			'VIEWS'					=> $views,
			'TOPIC_ATTACHMENT_IMG' 	=> $attachment_image,
			'TOPIC_TITLE' 			=> $topic_title,
			'TOPIC_TYPE' 			=> $topic_type,
			'TOPIC_MARROW'			=> $topic_marrow,
			'NOMER_POSTA' 			=> $nomer_posta,
			'USER_NAME'             => $username,
			'S_USER_NAME'           => $s_username,
			//'LAST_POST_AUTHOR' 		=> $last_post_author, 
			//'S_LAST_POST' 			=> $s_last_post, 
			'U_VIEW_TOPIC' 			=> $view_topic_url)
		);
	}

	$template->assign_vars(array(
		'PAGINATION' 		=> generate_pagination("viewforum.php?" . POST_FORUM_URL . "=$forum_id", $topics_count, $board_config['topics_per_page'], $start))
	);
}
else
{
	$no_topics_msg = ( $forum_row['forum_status'] == FORUM_LOCKED ) ? '该论坛已经锁定，不能发表新主题、帖子、回复主题和编辑发贴' : '论坛中还没有贴子，点击 发表新贴 链接发表贴子';
	$template->assign_vars(array(
		'L_NO_TOPICS' => $no_topics_msg)
	);

	$template->assign_block_vars('switch_no_topics', array() );

}

// 显示论坛的底部
$forum_module->display_bottom();

$template->pparse('body');

page_footer();

?>