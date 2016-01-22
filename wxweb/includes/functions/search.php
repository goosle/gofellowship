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

/*
* 清除一些敏感符号
*/
function clean_words($mode, &$entry, &$stopword_list, &$synonym_list)
{
	static $drop_char_match =   array('^', '$', '&', '(', ')', '<', '>', '`', '\'', '"', '|', ',', '@', '_', '?', '%', '-', '~', '+', '.', '[', ']', '{', '}', ':', '\\', '/', '=', '#', '\'', ';', '!');
	static $drop_char_replace = array(' ', ' ', ' ', ' ', ' ', ' ', ' ', '',  '',   ' ', ' ', ' ', ' ', '',  ' ', ' ', '',  ' ',  ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' , ' ', ' ', ' ', ' ',  ' ', ' ');

	$entry = ' ' . strip_tags(strtolower($entry)) . ' ';

	if ( $mode == 'post' )
	{
		$entry = preg_replace('/[\n\r]/is', ' ', $entry); 
		$entry = preg_replace('/\b&[a-z]+;\b/', ' ', $entry); 
		$entry = preg_replace('/\b[a-z0-9]+:\/\/[a-z0-9\.\-]+(\/[a-z0-9\?\.%_\-\+=&\/]+)?/', ' ', $entry); 
		$entry = preg_replace('/\[img:[a-z0-9]{10,}\].*?\[\/img:[a-z0-9]{10,}\]/', ' ', $entry); 
		$entry = preg_replace('/\[\/?url(=.*?)?\]/', ' ', $entry);
		$entry = preg_replace('/\[\/?[a-z\*=\+\-]+(\:?[0-9a-z]+)?:[a-z0-9]{10,}(\:[a-z0-9]+)?=?.*?\]/', ' ', $entry);
	}
	else if ( $mode == 'search' ) 
	{
		$entry = str_replace(' +', ' and ', $entry);
		$entry = str_replace(' -', ' not ', $entry);
	}
	for($i = 0; $i < count($drop_char_match); $i++)
	{
		$entry =  str_replace($drop_char_match[$i], $drop_char_replace[$i], $entry);
	}

	if ( $mode == 'post' )
	{
		$entry = str_replace('*', ' ', $entry);

		// 'words' that consist of <3 or >20 characters are removed.
		$entry = preg_replace('/[ ]([\S]{1,2}|[\S]{21,})[ ]/',' ', $entry);
	}

	if ( !empty($stopword_list) )
	{
		for ($j = 0; $j < count($stopword_list); $j++)
		{
			$stopword = trim($stopword_list[$j]);

			if ( $mode == 'post' || ( $stopword != 'not' && $stopword != 'and' && $stopword != 'or' ) )
			{
				$entry = str_replace(' ' . trim($stopword) . ' ', ' ', $entry);
			}
		}
	}

	if ( !empty($synonym_list) )
	{
		for ($j = 0; $j < count($synonym_list); $j++)
		{
			list($replace_synonym, $match_synonym) = explode(' ', trim(strtolower($synonym_list[$j])));
			if ( $mode == 'post' || ( $match_synonym != 'not' && $match_synonym != 'and' && $match_synonym != 'or' ) )
			{
				$entry =  str_replace(' ' . trim($match_synonym) . ' ', ' ' . trim($replace_synonym) . ' ', $entry);
			}
		}
	}

	return $entry;
}

/*
* 分隔文字
*/
function split_words($entry, $mode = 'post')
{

	return explode(' ', trim(preg_replace('#\s+#', ' ', $entry)));
}

function add_search_words($mode, $post_id, $post_text, $post_title = '')
{
	global $db, $board_config;

	$stopword_array				= @file(ROOT_PATH . 'language/lang_' . $board_config['default_lang'] . "/search_stopwords.txt"); 
	$synonym_array 				= @file(ROOT_PATH . 'language/lang_' . $board_config['default_lang'] . "/search_synonyms.txt"); 
	$word 						= array();
	$word_insert_sql 			= array();	
	$search_raw_words 			= array();
	$search_raw_words['text'] 	= split_words(clean_words('post', $post_text, $stopword_array, $synonym_array));
	$search_raw_words['title'] 	= split_words(clean_words('post', $post_title, $stopword_array, $synonym_array));
	
	@set_time_limit(0);
	
	foreach ($search_raw_words as $word_in => $search_matches)
	{
		$word_insert_sql[$word_in] = '';
		if ( !empty($search_matches) )
		{
			for ($i = 0; $i < count($search_matches); $i++)
			{ 
				$search_matches[$i] = trim($search_matches[$i]);

				if( $search_matches[$i] != '' ) 
				{
					$word[] = $search_matches[$i];
					if ( !strstr($word_insert_sql[$word_in], "'" . $search_matches[$i] . "'") )
					{
						$word_insert_sql[$word_in] .= ( $word_insert_sql[$word_in] != "" ) ? ", '" . $search_matches[$i] . "'" : "'" . $search_matches[$i] . "'";
					}
				} 
			}
		}
	}

	if ( count($word) )
	{
		sort($word);

		$prev_word = '';
		$word_text_sql = '';
		$temp_word = array();
		for($i = 0; $i < count($word); $i++)
		{
			if ( $word[$i] != $prev_word )
			{
				$temp_word[] = $word[$i];
				$word_text_sql .= ( ( $word_text_sql != '' ) ? ', ' : '' ) . "'" . $word[$i] . "'";
			}
			$prev_word = $word[$i];
		}
		
		$word = $temp_word;

		$value_sql = '';
		$match_word = array();
		for ($i = 0; $i < count($word); $i++)
		{ 
			$new_match = true;
			if ( isset($check_words[$word[$i]]) )
			{
				$new_match = false;
			}

			if ( $new_match )
			{
				$value_sql .= ( ( $value_sql != '' ) ? ', ' : '' ) . '(\'' . $word[$i] . '\', 0)';
			}
		}

		if ( $value_sql != '' )
		{
			$sql = "INSERT IGNORE INTO " . SEARCH_WORD_TABLE . " (word_text, word_common) 
				VALUES $value_sql";

			if ( !$db->sql_query($sql) )
			{
				trigger_error('Could not insert new word', E_USER_WARNING);
			}
		}
	}

	foreach($word_insert_sql as $word_in => $match_sql)
	{
		$title_match = ( $word_in == 'title' ) ? 1 : 0;

		if ( $match_sql != '' )
		{
			$sql = "INSERT INTO " . SEARCH_MATCH_TABLE . " (post_id, word_id, title_match) 
				SELECT $post_id, word_id, $title_match  
					FROM " . SEARCH_WORD_TABLE . " 
					WHERE word_text IN ($match_sql)"; 
			if ( !$db->sql_query($sql) )
			{
				trigger_error('Could not insert new word matches', E_USER_WARNING);
			}
		}
	}

	if ($mode == 'single')
	{
		remove_common('single', 4/10, $word);
	}

	return;
}

function remove_common($mode, $fraction, $word_id_list = array())
{
	global $db;

	$sql = "SELECT COUNT(post_id) AS total_posts 
		FROM " . POSTS_TABLE;
	if ( !($result = $db->sql_query($sql)) )
	{
		trigger_error('Could not obtain post count', E_USER_WARNING);
	}

	$row = $db->sql_fetchrow($result);

	if ( $row['total_posts'] >= 100 )
	{
		$common_threshold = floor($row['total_posts'] * $fraction);

		if ( $mode == 'single' && count($word_id_list) )
		{
			$word_id_sql = '';
			for($i = 0; $i < count($word_id_list); $i++)
			{
				$word_id_sql .= ( ( $word_id_sql != '' ) ? ', ' : '' ) . "'" . $word_id_list[$i] . "'";
			}

			$sql = "SELECT m.word_id 
				FROM " . SEARCH_MATCH_TABLE . " m, " . SEARCH_WORD_TABLE . " w 
				WHERE w.word_text IN ($word_id_sql)  
					AND m.word_id = w.word_id 
				GROUP BY m.word_id 
				HAVING COUNT(m.word_id) > $common_threshold";
		}
		else 
		{
			$sql = "SELECT word_id 
				FROM " . SEARCH_MATCH_TABLE . " 
				GROUP BY word_id 
				HAVING COUNT(word_id) > $common_threshold";
		}

		if ( !($result = $db->sql_query($sql)) )
		{
			trigger_error('Could not obtain common word list', E_USER_WARNING);
		}

		$common_word_id = '';
		while ( $row = $db->sql_fetchrow($result) )
		{
			$common_word_id .= ( ( $common_word_id != '' ) ? ', ' : '' ) . $row['word_id'];
		}
		$db->sql_freeresult($result);

		if ( $common_word_id != '' )
		{
			$sql = "UPDATE " . SEARCH_WORD_TABLE . "
				SET word_common = " . TRUE . " 
				WHERE word_id IN ($common_word_id)";
			if ( !$db->sql_query($sql) )
			{
				trigger_error('Could not delete word list entry', E_USER_WARNING);
			}

			$sql = "DELETE FROM " . SEARCH_MATCH_TABLE . "  
				WHERE word_id IN ($common_word_id)";
			if ( !$db->sql_query($sql) )
			{
				trigger_error('Could not delete word match entry', E_USER_WARNING);
			}
		}
	}

	return;
}

function remove_search_post($post_id_sql)
{
	global $db;

	$words_removed = false;

	$sql = "SELECT word_id 
		FROM " . SEARCH_MATCH_TABLE . " 
		WHERE post_id IN ($post_id_sql) 
		GROUP BY word_id";
	if ( $result = $db->sql_query($sql) )
	{
		$word_id_sql = '';
		while ( $row = $db->sql_fetchrow($result) )
		{
			$word_id_sql .= ( $word_id_sql != '' ) ? ', ' . $row['word_id'] : $row['word_id']; 
		}

		$sql = "SELECT word_id 
			FROM " . SEARCH_MATCH_TABLE . " 
			WHERE word_id IN ($word_id_sql) 
			GROUP BY word_id 
			HAVING COUNT(word_id) = 1";
		if ( $result = $db->sql_query($sql) )
		{
			$word_id_sql = '';
			while ( $row = $db->sql_fetchrow($result) )
			{
				$word_id_sql .= ( $word_id_sql != '' ) ? ', ' . $row['word_id'] : $row['word_id']; 
			}

			if ( $word_id_sql != '' )
			{
				$sql = "DELETE FROM " . SEARCH_WORD_TABLE . " 
					WHERE word_id IN ($word_id_sql)";
				if ( !$db->sql_query($sql) )
				{
					trigger_error('Could not delete word list entry', E_USER_WARNING);
				}

				$words_removed = $db->sql_affectedrows();
			}
		}
	}

	$sql = "DELETE FROM " . SEARCH_MATCH_TABLE . "  
		WHERE post_id IN ($post_id_sql)";
	if ( !$db->sql_query($sql) )
	{
		trigger_error('Error in deleting post', E_USER_WARNING);
	}

	return $words_removed;
}

/**
* 搜索用户名
**/
function username_search($search_match)
{
	global $db, $board_config, $template, $userdata, $runtime, $modules;
	global $starttime, $gen_simple_header;
	
	$gen_simple_header = false;

	$username_list = '';
	if ( !empty($search_match) )
	{
		$username_search = preg_replace('/\*/', '%', phpbb_clean_username($search_match));

		$sql = "SELECT username, user_id 
			FROM " . USERS_TABLE . " 
			WHERE username LIKE '" . str_replace("\'", "''", $username_search) . "' AND user_id <> " . ANONYMOUS . "
			ORDER BY username";
		if ( !($result = $db->sql_query($sql)) )
		{
			trigger_error('Could not obtain search results', E_USER_WARNING);
		}

		if ( $row = $db->sql_fetchrow($result) )
		{
			do
			{
				$username_list .= '<option value="' . $row['user_id'] . '">' . $row['username'] . '</option>';
			}
			while ( $row = $db->sql_fetchrow($result) );
		}
		else
		{
			$username_list .= '<option>没有找到匹配项</option>';
		}
		$db->sql_freeresult($result);
	}

	$page_title = '搜索用户';
	page_header($page_title);

	$template->set_filenames(array(
		'search_user_body' => 'search/search_username.tpl')
	);

	$template->assign_vars(array(
		'USERNAME' 				=> (!empty($search_match)) ? phpbb_clean_username($search_match) : '', 
		'S_USERNAME_OPTIONS' 	=> $username_list)
	);

	if ( $username_list != '' )
	{
		$template->assign_block_vars('switch_select_name', array());
	}

	$template->pparse('search_user_body');

	page_footer();
}

?>