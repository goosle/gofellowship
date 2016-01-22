			<div id="main">	
				<div class="nav"><a href="{U_INDEX}">首页</a>&gt;<a href="{USER_GROUPS}">小组列表</a>&gt;{L_TITLE}</div>
				<div class="title">{L_TITLE}</div>
				<form action="{S_GROUP_ACTION}" method="post" name="post">
					<div>
						<label>小组的名称：</label>
						<div><input type="text" name="group_name" maxlength="40" value="{GROUP_NAME}" /></div>
					</div>
					<div>
						<label>小组的描述：</label>
						<div><textarea name="group_description" rows="5" style="width:99%;">{GROUP_DESCRIPTION}</textarea></div>
					</div>

<!-- BEGIN group_edit -->
					<div><input type="checkbox" name="group_delete" value="1" /> 删除小组</div>
<!-- END group_edit -->
					{S_HIDDEN_FIELDS}
					<input type="submit" name="group_update" value="保存" />
				</form>
			</div>