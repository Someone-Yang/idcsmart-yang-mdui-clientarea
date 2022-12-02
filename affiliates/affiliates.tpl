{include file="includes/modal"}
<div class="withdraw" style="display: none;">
	<form>
		<input type="hidden" value="{$Token}" />
		<input type="hidden" name="type" value="1" />
		<div class="form-group row mb-4">
			<label class="col-sm-3 col-form-label text-right">{$Lang.withdrawal_amount}</label>
			<div class="col-sm-8">
				<input type="number" name="num" min="0" class="form-control" placeholder="{$Lang.please_withdrawal_amount}" required />
			</div>
		</div>
	</form>
</div>

        
        <div class="mdui-card mdui-p-a-1">
          <div class="mdui-card-primary">
            <div class="mdui-card-primary-title">推介计划介绍</div>
          </div>
          <div class="mdui-card-content">
          
            <p>通过向您的好友或其他用户发送下方您的推介链接，新用户通过推介链接注册，即可成为您的下属用户。下属用户的<span class="mdui-text-color-red">任何消费</span>，您都可以获取 <span class="mdui-text-color-red">10%</span> 的返利。</p>
            <p>新用户通过推介链接注册玲行云端魔方控制台账户，可<span class="mdui-text-color-red">领取5元无门槛优惠码</span>用于任意消费。</p>
            <p>您的下属用户完成注册，并加入玲行云端官方 QQ 群，您可以额外<span class="mdui-text-color-red">立即获取5元返利</span>。</p>
            <p>您的返利余额达到30元后即可提现。<span class="mdui-text-color-red">支持提现到余额或支付宝，提现无需实名。</span></p>
            <p>如果您是实名认证用户，可额外获取<span class="mdui-text-color-red">5%返利，共15%返利</span>。</p>
          
          </div>
        </div>
        
        <br>
        
        <div class="mdui-card mdui-p-a-1">
          <div class="mdui-card-primary">
            <div class="mdui-card-primary-title">{$Userinfo.user.username} 的推介计划</div>
            <div class="mdui-card-primary-subtitle">推介计划报表</div>
          </div>
          <div class="mdui-card-content">

            <div class="mdui-row-xs-5">
              <div class="mdui-col">
                <h3>返利总金额</h3>{$Affiliates.data.sum}
              </div>

              <div class="mdui-col">
                <h3>未提现金额</h3>{$Affiliates.data.balance}
              </div>

              <div class="mdui-col">
                <h3>下属用户数</h3>{$Affiliates.data.registcount}
              </div>
              
              <div class="mdui-col">
                <h3>访问人数</h3>{$Affiliates.data.visitors}
              </div>
            </div>
            
            

          </div>
          <div class="mdui-card-actions">
            <button onClick="getModal('withdraw', '{$Lang.immediate_withdrawal}',undefined,undefined,
                refresh)" class="mdui-btn" id="withdrawNow" {if $Affiliates.affiliate_withdraw>$Affiliates.data.balance}disabled{/if} style="color: #f7a200;">{$Lang.immediate_withdrawal}</button>
          </div>
        </div>
        
        <br>
        
        
        
        <div class="mdui-card mdui-p-a-1">
          <div class="mdui-card-primary">
            <div class="mdui-card-primary-title">推介链接</div>
            <div class="mdui-card-primary-subtitle">您的推介链接</div>
          </div>
          <div class="mdui-card-content">

            <input class="form-control col-sm-7" id="referralLink" type="text" value="{$Affiliates.data.url}" readonly />
			<button class="mdui-btn mdui-color-blue-a100 mdui-float-right" id="copyBtn" mdui-tooltip="{content: '复制链接'}">
				<i class="mdui-icon material-icons">content_copy</i> 复制链接
			</button>

          </div>
          <div class="mdui-card-actions">
          </div>
        </div>
        
        <br>
        
        <div class="mdui-card mdui-p-a-1">
          <div class="mdui-card-primary">
            <div class="mdui-card-primary-title">详细报表</div>
            <div class="mdui-card-primary-subtitle">您的推介计划详细信息</div>
          </div>
          <div class="mdui-card-content">
            


            <ul class="affs-nav nav nav-tabs nav-tabs-custom" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" data-toggle="tab" href="#affbuyrecord" role="tab" aria-selected="true">
							{$Lang.promotion_record}
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#withdrawrecord" role="tab" aria-selected="false">
							{$Lang.withdrawal_record}
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#useraffilist" role="tab" aria-selected="false">
							{$Lang.registered_users}
						</a>
					</li>
				</ul>
				<div class="tab-content p-3 text-muted">
					<div id="affbuyrecord" class="tab-pane active" role="tabpanel">

					</div>
					<div id="withdrawrecord" class="tab-pane" role="tabpanel">

					</div>
					<div id="useraffilist" class="tab-pane" role="tabpanel">

					</div>
				</div>

          </div>
          <div class="mdui-card-actions">
          </div>
        </div>
        


<script>
	function refresh() { 
		location.reload();
	}
	$(document).ready(function () {
		$('#copyBtn').on('click', function () {
			$('#referralLink').select()
			document.execCommand("Copy")
			toastr.success('{$Lang.copy_succeeded}')
		});
	});
</script>

<script>
	$(document).ready(function () {
		$.ajax({
			type: "get",
			url: '' + '/affiliates',
			data: {
				action: 'affbuyrecord'
			},
			success: function (data) {
				$(data).appendTo('#affbuyrecord');
			}
		});
		$.ajax({
			type: "get",
			url: '' + '/affiliates',
			data: {
				action: 'withdrawrecord'
			},
			success: function (data) {
				$(data).appendTo('#withdrawrecord');
			}
		});
		$.ajax({
			type: "get",
			url: '' + '/affiliates',
			data: {
				action: 'useraffilist'
			},
			success: function (data) {
				$(data).appendTo('#useraffilist');
			}
		});
	});
</script>