
{if $ErrorMsg}
{include file="error/alert" value="$ErrorMsg"}
{/if}

{if $SuccessMsg}
{include file="error/notifications" value="$SuccessMsg" url=""}
{/if}

{include file="includes/modal"}
<link href="/themes/clientarea/default/assets/libs/bootstrap-rating/bootstrap-rating.css?v={$Ver}"
	rel="stylesheet" />
	<script>
		
	function adminScore(rid, type) {
		const star = $(`#starRating${rid}`).val();
		const obj = {
			rid,
			type,
			star,
			tid: '{$Think.get.tid}'
		}
		$.ajax({
			type: "post",
			url: '/ticket/evaluate',
			data: obj,
			success: function (data) {
				if (data.status !== 200) {
					toastr.error(data.msg)
					return
				}
				toastr.success(data.msg)
				$(`#starRating${rid}`).attr("disabled", true);
			}
		});
	}
	</script>
<div class="mdui-row">
	<div class="mdui-col-xs-12">
		<div class="mdui-card mdui-p-a-1 mdui-hoverable">
            <div class="mdui-card-primary">
                <div class="mdui-card-primary-title">
					{$ViewTicket.ticket.title}
                </div>
                <div class="mdui-card-primary-subtitle">
                    <span class="mr-2 px-3 py-2 badge badge-dark"
					style="background-color: {$ViewTicket.ticket.status.color};">{$ViewTicket.ticket.status.title}</span>
                    {$ViewTicket.ticket.tid}
                </div>
            </div>
            <div class="mdui-card-content">
                <p>工单创建时间：{$ViewTicket.ticket.create_time|date="Y-m-d H:i"}</p>
                <p>对接魈组：{$ViewTicket.ticket.department.name}</p>
                {if $ViewTicket.ticket.host}<p>相关产品：{$ViewTicket.ticket.host}</p>{/if}
            </div>
            <div class="mdui-card-actions">
                {if $ViewTicket.ticket.status.id != "4"}
					<a href="javascript: getModal('ticket/close', '关闭工单', '您确认关闭工单{$ViewTicket.ticket.title}吗？请确认运维已为您解决问题，关闭后您将无法再在此工单继续发表回复。', {tid: {$ViewTicket.ticket.tid}, token: '{$Token}'}, function(){location.href = '/supporttickets'});"
						class="mdui-btn mdui-color-red">
						<i class="mdui-icon material-icons">close</i>
						{$Lang.close_work_order}
					</a>
				{/if}
            </div>
		</div>
	</div>
</div>
		
		
{foreach $ViewTicket.list as $reply}
		
<div class="mdui-row mdui-p-a-1">
	<div class="mdui-col-xs-12">
		<div class="mdui-card mdui-hoverable">
            <div class="mdui-card-primary">
                <div class="mdui-card-primary-title">
                    {if $reply.admin}{$reply.realname}{else}您{/if}：
                </div>
                <div class="mdui-card-primary-subtitle">
                    {$reply.format_time}
                </div>
            </div>
            <div class="mdui-card-content">
                {$reply.content}
                {if $reply.attachment}
					<div>{$Lang.enclosure}：</div>
					{foreach $reply.attachment as $attachments}
					<div>
						<a href="http://{$attachments}" target="_blank">{:substr($attachments,strpos($attachments,"^")+1)}</a>
					</div>
					{/foreach}
				{/if}
            </div>
            <div class="mdui-card-actions mdui-card-actions-stacked">
                {if $reply.admin}
					<div class="justify-content-end align-items-center"
						style="display:{$ViewTicket.feedback_request == '0'?none:flex}">
						{if $reply.star !='0' }谢谢评价！{else}评价这条回复：{/if}
						<input type="hidden" class="rating" id="starRating{$reply.id}" data-filled="mdi mdi-star text-warning"
							data-empty="mdi mdi-star-outline text-muted" onchange="adminScore('{$reply.id}','{$reply.type}')" {if
							$reply.star !='0' } disabled {/if} value="{$reply.star}" />
					</div>
				{/if}
            </div>
		</div>
	</div>
</div>
		
{/foreach}

{if $ViewTicket.ticket.status.id != "4"}
<div class="mdui-row mdui-p-a-1">
	<div class="mdui-col-xs-12">
		<div class="mdui-card mdui-hoverable" id="ticketReplyContainer">
			<form method="post" enctype="multipart/form-data">
				<input type="hidden" name="tid" value="{$ViewTicket.ticket.tid}" />
				<input type="hidden" name="c" value="{$ViewTicket.ticket.c}" />
				<div class="card-body">
					<h4 class="card-title">{$Lang.reply}</h4>
					<div class="form-group">
						{include file="includes/summernote" height="200"}
						<textarea class="form-control" id="content" name="content" rows="10"
							placeholder="{$Lang.please_enter_question}"></textarea>
					</div>
					<div class="form-group">
						<label class="form-control-label" for="formrow-firstname-input">{$Lang.enclosure}</label>
						<!-- {include file="supporttickets/supporttickets-customfields"} -->
						<div class="row" id="filelist">
						 	<div class="col-12 mb-2 filebox d-flex justify-content-between">
						 		<input type="file" class="form-control-file w-75" name="attachments[]">
						 		<a class="btn btn-danger deletefileBtn">{$Lang.delete}</a>
						 	</div>
						</div>
						<a class="btn btn-success mt-2" id="addFileBtn" onclick="addFileBtn()">{$Lang.add_more}</a>
					</div>
					<div class="row">
						<div class="col-lg-3 col-xs-6">
							<button type="submit" class="btn btn-primary btn-block">{$Lang.reply_work_order}</button>
						</div>
						<div class="col-lg-3 col-xs-6">
							<a href="supporttickets" class="btn btn-block btn-default">{$Lang.cancel}</a>
						</div>
					</div>

				</div>
			</form>
		</div>
	</div>
</div>

{else}

<div class="mdui-row mdui-p-a-1">
	<div class="mdui-col-xs-12">
		<div class="mdui-card">
            <div class="mdui-card-primary">
                <div class="mdui-card-primary-title">
                    <i class="mdui-icon material-icons">block</i> 此工单已关闭
                </div>
            </div>
            <div class="mdui-card-content">
                此工单已关闭，您不能再在此工单发布回复。如有需要，请<a href="/submitticket">提交新工单</a>。
            </div>
		</div>
	</div>
</div>

{/if}

<script src="/themes/clientarea/default/assets/libs/bootstrap-rating/bootstrap-rating.min.js?v={$Ver}"></script>
<script src="/themes/clientarea/default/assets/js/rating-init.js?v={$Ver}"></script>
<script>

	function addFileBtn()
	{
		// 添加更多附件
		var fileHtml = `
			<div class="col-12 mb-2 filebox d-flex justify-content-between">
				<input type="file" class="form-control-file w-75" name="attachments[]">
						<a class="btn btn-danger deletefileBtn">{$Lang.delete}</a>
			</div>
	`
		$('#filelist').append(fileHtml)

	};

	// 删除附件
	$('#filelist').on('click', '.deletefileBtn', function () {
		$(this).parent('.filebox').remove()
	});
</script>