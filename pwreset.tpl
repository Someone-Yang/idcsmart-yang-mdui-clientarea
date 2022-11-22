
{if $ErrorMsg}
{include file="error/alert" value="$ErrorMsg"}
{/if}

{if $SuccessMsg}
{include file="error/notifications" value="$SuccessMsg" url="/clientarea"}
{/if}

<script src="/themes/clientarea/default/assets/js/public.js?v={$Ver}"></script>
<style>
	.input-group-prepend { 
		width: 100px;  
	}
	.auth-full-bg .bg-overlay {
		background: url(/themes/clientarea/default/assets_custom/img/new-background.jpg)no-repeat left top / 100% 1400px;
		background-size: cover;
		opacity:1;
	}
  .form-control,.input-group-append{
    height: 46px;
  }
</style>
<script>
    var mk = '{$Setting.msfntk}';

</script>
      <div class="mdui-container mdui-color-white">
        <div class="login_right mx-auto">
          <div class="d-flex flex-column h-100">
            <div class="my-auto">
				<div class="mdui-typo-display-1">重置密码</div>
                    <div class="mdui-typo-subheading">森林会记住一切——除了大慈树王的故事，和你的密码</div>
				<ul class="affs-nav nav nav-tabs nav-tabs-custom nav-justified" role="tablist">

					{if $Pwreset.allow_login_phone}
						<li class="nav-item">
							<a class="nav-link fs-14 bg-transparent active" data-toggle="tab" href="#phone" role="tab" aria-selected="false">{$Lang.mobile_phone_retrieval}</a>
						</li>
					{/if}

					{if $Pwreset.allow_login_email}
						<li class="nav-item">
							<a class="nav-link fs-14 bg-transparent {if $Pwreset.allow_login_email && !$Pwreset.allow_login_phone}active{/if}" data-toggle="tab" href="#email" role="tab" aria-selected="true">{$Lang.email_retrieval}</a>
						</li>
					{/if}

				</ul>

				<div class="mt-4">
					<div class="tab-content">
						{if $Pwreset.allow_login_email}
						<div id="email" class="tab-pane {if $Pwreset.allow_login_email && !$Pwreset.allow_login_phone}active{/if}" role="tabpanel">
							<form method="post"  action="/pwreset?action=email">
								<div class="form-group">
									<div class="mdui-textfield mdui-textfield-floating-label">
                                          <label class="mdui-textfield-label">电子邮箱</label>
                                          <input class="mdui-textfield-input" type="email" id="emailInp" name="email" value="{$Post.email}" required/>
                                          <div class="mdui-textfield-error">邮箱格式有误，请检查。</div>
                                          <div class="mdui-textfield-helper">想一想，需要重置密码的账户绑定的邮箱</div>
                                    </div>
								</div>
								{if $Verify.allow_email_forgetpwd_captcha==1}
								{include file="includes/verify"  type="allow_email_forgetpwd_captcha" positon="top"}
								{/if}
								<div class="form-group">
									<label for="code">{$Lang.verification_code}</label>
									<div class="input-group">
										<input type="text" class="form-control" id="code" name="code" placeholder="{$Lang.please_enter_code}" required>
										<div class="input-group-append">
											<button class="btn btn-primary" type="button"  style="line-height:33px;" onclick="getCode(this,'reset_email_send','allow_email_forgetpwd_captcha')">{$Lang.get_code}</button>
										</div>
									</div>
								</div> 
								<div class="form-group">
									<div class="mdui-textfield mdui-textfield-floating-label">
                                          <label class="mdui-textfield-label">重置为新密码</label>
                                          <input class="mdui-textfield-input" type="password" name="password"
											id="emailPwd" pattern="^.*(?=.{8,})(?=.*[a-z])(?=.*[A-Z]).*$" required/>
                                          <div class="mdui-textfield-error">密码填写有误</div>
                                          <div class="mdui-textfield-helper">设置您的密码，请保证密码强度，至少为8位包含大小写及数字</div>
                                        </div>
								</div>
								<div class="form-group">
									<div class="mdui-textfield mdui-textfield-floating-label">
                                          <label class="mdui-textfield-label">确认密码</label>
                                          <input class="mdui-textfield-input" type="password" name="checkPassword"
											id="emailPwdCheck" pattern="^.*(?=.{8,})(?=.*[a-z])(?=.*[A-Z]).*$" required/>
                                          <div class="mdui-textfield-error">请再次输入正确的密码</div>
                                          <div class="mdui-textfield-helper">再次输入您的密码</div>
                                        </div>
								</div>
								<div class="mt-3">
									<button class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent mdui-center mdui-btn-block mdui-color-blue-a400" type="submit">检查信息并重置密码</button>
								</div>
							</form>
						</div>
						{/if}
						{if $Pwreset.allow_login_phone}
						<div id="phone" class="tab-pane active" role="tabpanel">
							<form method="post"  action="/pwreset?action=phone">
								<div class="form-group">
									<label for="username">{$Lang.phone_number}</label>
									<div class="input-group">
										{if $Pwreset.allow_login_register_sms_global==1}
										<div class="input-group-prepend">
											<select class="form-control select2 select2-hidden-accessible" data-select2-id="1" tabindex="-1" aria-hidden="true" name="phone_code" id="phoneCodeSel">
												{foreach $SmsCountry as $list}
												<option value="{$list.phone_code}" {if $list.phone_code=="+86"}selected {/if}>{$list.link}</option>
												{/foreach}
											</select>
										</div> 
										{/if}
										<input type="text" class="form-control" id="phoneInp" name="phone" placeholder="{$Lang.please_enter_your_mobile_phone_number}" required>
									</div>
								</div>
								{if $Verify.allow_phone_forgetpwd_captcha==1}
								{include file="includes/verify"  type="allow_phone_forgetpwd_captcha" positon="top"}
								{/if}
								<div class="form-group">
									<label for="code">{$Lang.verification_code}</label>
									<div class="input-group">
										<input type="text" class="form-control" id="code" name="code" placeholder="{$Lang.please_enter_code}" required>
										<div class="input-group-append">
											<button class="btn btn-primary" type="button" style="line-height:33px;" onclick="getCode(this,'reset_phone_send','allow_phone_forgetpwd_captcha')">{$Lang.get_code}</button>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="userpassword">{$Lang.password}</label>
									<input type="password" class="form-control" name="password" id="phonePwd" placeholder="{$Lang.please_enter_password}" required>
								</div>
								<div class="form-group">
									<label for="userpassword">{$Lang.confirm_password}</label>
									<input type="password" class="form-control" name="checkPassword" id="phonePwdCheck"  placeholder="{$Lang.please_password_again}" required>
								</div>

								<div class="mt-3">
									<button class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent mdui-center mdui-btn-block mdui-color-blue-a400" type="submit">检查信息并重置密码</button>
								</div>

							</form>
						</div>
						{/if}
					</div>
                <div class="mt-5 text-center">
                  <p>{$Lang.there_already_account} <a href="login" class="font-weight-medium text-primary"> {$Lang.sign_in}</a> </p>
                </div>
              </div>
            </div>
          </div>


        </div>
      </div>