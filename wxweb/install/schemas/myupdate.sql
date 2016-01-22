
delete from phpbb_modules;

INSERT INTO phpbb_modules (module_id, module_title, module_text, module_param, module_hide, module_br, module_type, module_sort, module_page, module_needle) VALUES (1, '', '', '', 0, 0, -2, 0, 0, 0);
INSERT INTO phpbb_modules (module_id, module_title, module_text, module_param, module_hide, module_br, module_type, module_sort, module_page, module_needle) VALUES (2, '', '[html]&amp;lt;div class=&amp;quot;index-cat&amp;quot;&amp;gt;&amp;lt;a href=&amp;quot;guestbook.php&amp;quot;&amp;gt;留言建议&amp;lt;/a&amp;gt;|&amp;lt;a href=&amp;quot;memberlist.php?admin&amp;quot;&amp;gt;管理团队&amp;lt;/a&amp;gt;|&amp;lt;a href=&amp;quot;links.php&amp;quot;&amp;gt;友情链接&amp;lt;/a&amp;gt;&amp;lt;/div&amp;gt;\n[/html]', '', 0, 0, -3, 0, 0, 0);
INSERT INTO phpbb_modules (module_id, module_title, module_text, module_param, module_hide, module_br, module_type, module_sort, module_page, module_needle) VALUES (3, '', '[html]&amp;lt;img src=&amp;quot;[LOGO]&amp;quot; alt=&amp;quot;.&amp;quot; title=&amp;quot;.&amp;quot; border=&amp;quot;0&amp;quot;/&amp;gt;[/html]', '', 0, 0, -1, 0, 0, 0);
INSERT INTO phpbb_modules (module_id, module_title, module_text, module_param, module_hide, module_br, module_type, module_sort, module_page, module_needle) VALUES (4, '', '[html]&amp;lt;div class=&amp;quot;index_bottom&amp;quot;&amp;gt;版权所有 (c) phpBB-WAP 2012-2014&amp;lt;/div&amp;gt;[/html]', '', 0, 0, -4, 0, 0, 0);
INSERT INTO phpbb_modules (module_id, module_title, module_text, module_param, module_hide, module_br, module_type, module_sort, module_page, module_needle) VALUES (5, '', '[html]&amp;lt;meta name=&amp;quot;viewport&amp;quot; content=&amp;quot;width=device-width; initial-scale=1.0; minimum-scale=1.0; maximum-scale=2.0&amp;quot; /&amp;gt;\n    &amp;lt;meta name=&amp;quot;apple-mobile-web-app-capable&amp;quot; content=&amp;quot;yes&amp;quot; /&amp;gt;\n    &amp;lt;meta name=&amp;quot;apple-mobile-web-app-status-bar-style&amp;quot; content=&amp;quot;black&amp;quot; /&amp;gt;\n		&amp;lt;script type=&amp;quot;text/javascript&amp;quot;&amp;gt;\n$(function () {\n	$(&amp;quot;img&amp;quot;).attr(&amp;quot;border&amp;quot;, &amp;quot;0&amp;quot;);\n});\n\nif (!+[1,]) document.write(&#039;亲，当你看到这句提示时，赶紧换个浏览器吧！&#039;);&amp;lt;/script&amp;gt;[/html]', '', 0, 0, -5, 0, 0, 0);
INSERT INTO phpbb_modules (module_id, module_title, module_text, module_param, module_hide, module_br, module_type, module_sort, module_page, module_needle) VALUES (6, '导航隐藏模块', '[html]&amp;lt;div class=&amp;quot;index_top&amp;quot;&amp;gt;[/html]', '', 1, 0, 0, 0, 0, 1);
INSERT INTO phpbb_modules (module_id, module_title, module_text, module_param, module_hide, module_br, module_type, module_sort, module_page, module_needle) VALUES (7, '导航隐藏模块2', '[html]&amp;lt;a href=&amp;quot;forum.php&amp;quot;&amp;gt;论坛&amp;lt;/a&amp;gt;\n&amp;lt;a href=&amp;quot;mods.php&amp;quot;&amp;gt;应用&amp;lt;/a&amp;gt;\n&amp;lt;a href=&amp;quot;guestbook.php&amp;quot;&amp;gt;留言&amp;lt;/a&amp;gt;\n&amp;lt;a href=&amp;quot;memberlist.php&amp;quot;&amp;gt;会员&amp;lt;/a&amp;gt;\n&amp;lt;a href=&amp;quot;[MOD=wadou]&amp;quot;&amp;gt;挖豆&amp;lt;/a&amp;gt;[br]\n&amp;lt;a href=&amp;quot;groupcp.php&amp;quot;&amp;gt;小组&amp;lt;/a&amp;gt;\n&amp;lt;a href=&amp;quot;rules.php&amp;quot;&amp;gt;规则&amp;lt;/a&amp;gt;\n&amp;lt;a href=&amp;quot;viewonline.php&amp;quot;&amp;gt;在线&amp;lt;/a&amp;gt;\n&amp;lt;a href=&amp;quot;[MOD=sign]&amp;quot;&amp;gt;签到&amp;lt;/a&amp;gt;\n&amp;lt;a href=&amp;quot;[MOD=bbchat]&amp;quot;&amp;gt;聊天&amp;lt;/a&amp;gt;[/html]', '', 1, 0, 0, 0, 0, 2);
INSERT INTO phpbb_modules (module_id, module_title, module_text, module_param, module_hide, module_br, module_type, module_sort, module_page, module_needle) VALUES (8, '导航隐藏模块3', '[html]&amp;lt;/div&amp;gt;[/html]', '', 1, 0, 0, 0, 0, 3);
INSERT INTO phpbb_modules (module_id, module_title, module_text, module_param, module_hide, module_br, module_type, module_sort, module_page, module_needle) VALUES (9, '论坛帖子隐藏模块', '[html]\n&amp;lt;div class=&amp;quot;index-cat&amp;quot;&amp;gt;&amp;lt;a href=&amp;quot;forum.php&amp;quot;&amp;gt;论坛&amp;lt;/a&amp;gt; - 最新帖子&amp;lt;/div&amp;gt;\n&amp;lt;div class=&amp;quot;index-row index-topic&amp;quot;&amp;gt;\n[调用帖子_0_1_2_1_5]\n&amp;lt;/div&amp;gt;\n&amp;lt;div class=&amp;quot;clear&amp;quot;&amp;gt;&amp;lt;/div&amp;gt;[/html]', '', 1, 0, 0, 0, 0, 4);


#--tail
update phpbb_modules set  module_text=
'[html]&amp;lt;div class=&amp;quot;index-cat&amp;quot;&amp;gt;&amp;lt;a href=&amp;quot;guestbook.php&amp;quot;&amp;gt;留言&amp;lt;/a&amp;gt;
|&amp;lt;a href=&amp;quot;memberlist.php&amp;quot;&amp;gt;会员&amp;lt;/a&amp;gt;
|&amp;lt;a href=&amp;quot;groupcp.php&amp;quot;&amp;gt;小组&amp;lt;/a&amp;gt;
|&amp;lt;a href=&amp;quot;viewonline.php&amp;quot;&amp;gt;在线&amp;lt;/a&amp;gt;
|&amp;lt;a href=&amp;quot;links.php&amp;quot;&amp;gt;友情链接&amp;lt;/a&amp;gt;&amp;lt;/div&amp;gt;\n[/html]'
                      where   module_id= 2;
					 
					 #--head
		
			 update phpbb_modules set  module_text= 
'[html] &amp;lt;div class =&amp;quot;index-cat&amp;quot; &amp;gt;&amp;lt;br&amp;gt;&amp;lt;h1&amp;gt;团契&amp;lt;/h1&amp;gt;&amp;lt;br&amp;gt;&amp;lt;a href=&amp;quot;index.php&amp;quot;&amp;gt;我们的家&amp;lt;/a&amp;gt; &amp;lt;/div&amp;gt;[/html]'         
          where   module_id= 3;

						#--copy right 
update phpbb_modules set  module_text='[html]&amp;lt;div class=&amp;quot;index_bottom&amp;quot;&amp;gt;一切荣耀归于神 &amp;lt;/div&amp;gt;[/html]'
                
where   module_id= 4;

#--main
update phpbb_modules set  module_text=
     '[html]&amp;lt;a href=&amp;quot;viewforum.php?f=1&amp;quot;&amp;gt;灵修&amp;lt;/a&amp;gt;\n
            &amp;lt;a href=&amp;quot;viewforum.php?f=2&amp;quot;&amp;gt;祷告&amp;lt;/a&amp;gt;\n
			&amp;lt;a href=&amp;quot;viewforum.php?f=3&amp;quot;&amp;gt;赞美&amp;lt;/a&amp;gt;[br/]\n
			&amp;lt;a href=&amp;quot;viewforum.php?f=4&amp;quot;&amp;gt;圣经问答&amp;lt;/a&amp;gt;\n
			&amp;lt;a href=&amp;quot;viewforum.php?f=5&amp;quot;&amp;gt;读书&amp;lt;/a&amp;gt;\n
			&amp;lt;a href=&amp;quot;viewforum.php?f=6&amp;quot;&amp;gt;交通&amp;lt;/a&amp;gt;\n
			&amp;lt;a href=&amp;quot;viewforum.php?f=7&amp;quot;&amp;gt;其他&amp;lt;/a&amp;gt;
			[/html]'
         
where   module_id= 7;

#--new topic
update phpbb_modules set  module_text='[html]\n&amp;lt;div class=&amp;quot;index-cat&amp;quot;&amp;gt;--最新帖子&amp;lt;/div&amp;gt;\n&amp;lt;div class=&amp;quot;index-row index-topic&amp;quot;&amp;gt;\n[调用帖子_0_1_2_1_5]\n&amp;lt;/div&amp;gt;\n&amp;lt;div class=&amp;quot;clear&amp;quot;&amp;gt;&amp;lt;/div&amp;gt;[/html]'
where   module_id= 9;


#-- create topic-user table

CREATE TABLE `phpbb_topics_join` (
  `user_id` mediumint(8) NOT NULL,
  `topic_id` mediumint(8) NOT NULL,
  PRIMARY KEY (`user_id`,`topic_id`),
  KEY `tid` (`topic_id`),
  KEY `uid` (`user_id`)
) ;
