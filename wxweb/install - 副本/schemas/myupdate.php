<?php   
        define(ROOT_PATH,'../../' );    
		$table_prefix = 'tqsh';
        
		require(ROOT_PATH . 'includes/constants.php');
		require(ROOT_PATH . 'includes/functions/common.php');
		require(ROOT_PATH . 'includes/class/session.php');

		require(ROOT_PATH . 'includes/class/mysql.php');

		require(ROOT_PATH.'/config.php');
		
		$db = new sql_db($dbhost, $dbuser, $dbpasswd, $dbname, false);

		if(!$db->db_connect_id)
		{
			die('无法链接到数据库，请检查您的数据库配置文件是否正确');
		}

		include(ROOT_PATH.'includes/functions/sql_parse.php');
		
		$db->sql_query('SET NAMES utf8');

		$update_sql = 'myupdate.sql';

		$sql_query = @fread(@fopen($update_sql, 'r'), @filesize($update_sql));

		$sql_query = preg_replace('/phpbb_/', $table_prefix, $sql_query);

		$sql_query = remove_remarks($sql_query);
		$sql_query = split_sql_file($sql_query, ';');

		
		$update_error = false;
		$sql_list = '';
		for ($i = 0; $i < count($sql_query); $i++)
		{
		
			if (trim($sql_query[$i]) != '')
			{
				if (!$db->sql_query($sql_query[$i]))
				{
					$sql_list .=  '<p>' . $sql_query[$i] . '</p>';
					$update_error = true;
					break;
				}
			}
		}
		if($update_error)
		{
			echo "happen error :\n$sql_list";
		}
?>