					<div>
						<div class="title">已上传附件</div>
<!-- BEGIN attach_row -->
						<div class="{attach_row.ROW_CLASS} module">
							<a href="{attach_row.U_VIEW_ATTACHMENT}">{attach_row.FILE_NAME}</a>
							<input class="subbutton" type="submit" name="del_attachment[{attach_row.ATTACH_FILENAME}]" value="删除"/>
							<a href="javascript:void(0);" onclick="bbcode('{attach_row.ATTACH_BBCODE_TYPE}','{attach_row.U_VIEW_ATTACHMENT}');">插入帖子</a>
	<!-- BEGIN switch_update_attachment -->
							<input class="subbutton" type="submit" name="update_attachment[{attach_row.ATTACH_ID}]" value="更新"/>
	<!-- END switch_update_attachment -->
	<!-- BEGIN switch_thumbnail -->
							<input class="subbutton" type="submit" name="del_thumbnail[{attach_row.ATTACH_FILENAME}]" value="删除缩略图"/>
	<!-- END switch_thumbnail -->

							{attach_row.S_HIDDEN}
						</div>
<!-- END attach_row -->
					</div>