			<div id="main">
			<div class="nav"><a href="./">首页</a>&gt;<a href="{U_FORUM}">论坛中心</a>&gt;<a href="{U_VIEW_FORUM}">{FORUM_NAME}</a>
				{FORUM_TOP}
				<div class="title">
					<a href="{U_POST_NEW_TOPIC}">发帖</a>
					. <a href="{U_CLASS}">专题</a>
					. <a href="{U_MARROW}">精华</a>
                    . <a href="{U_MY_FORUM}">{MY_FORUM_NAME}</a>
					. <a href="{U_JOIN_FORUM}">{MY_JOIN_NAME}</a>
					. <a href="{U_FORUMCP}">版务</a>
				</div>
				<div class="module">
					<form action="{S_SEARCH_ACTION}" method="post">
						<input type="text" name="k" value="" />
						<input type="submit" value="搜索">
					</form>
					
				</div>
<!-- BEGIN topicrow -->
				<a href="{topicrow.U_VIEW_TOPIC}" style="display:block;border-top: 1px solid #ccc;" class="module {topicrow.ROW_COLOR}">
					<div class="{topicrow.ROW_CLASS}">{topicrow.TOPIC_MARROW}{topicrow.TOPIC_FOLDER}{topicrow.TOPIC_ATTACHMENT_IMG}{topicrow.TOPIC_TYPE}{topicrow.TOPIC_TITLE}</div>
					<div class="small" style="color:#555555;">
						<div class="left">{topicrow.USER_NAME}</div>
						<div class="right">{topicrow.VIEWS} / {topicrow.REPLIES}</div>
					</div>
					<div class="clear"></div>
				</a>
<!-- END topicrow -->
				<div class="clear"></div>
<!-- BEGIN switch_no_topics -->
				<div class="module">该论坛没有任何帖子</div>
<!-- END switch_no_topics -->
				<div class="nav"><a href="./">首页</a>&gt;<a href="{U_FORUM}">论坛中心</a>&gt;<a href="{U_VIEW_FORUM}">{FORUM_NAME}</a>
				{PAGINATION}
				
<!-- BEGIN modcp -->
				<div>【<a href="{modcp.U_MODCP}">帖子管理面板</a>】</div>
<!-- END modcp -->
			</div>