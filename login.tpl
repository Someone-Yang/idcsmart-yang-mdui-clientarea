{if $ErrorMsg}
{include file="error/alert" value="$ErrorMsg"}
{/if}

{if $SuccessMsg}
{include file="error/notifications" value="$SuccessMsg"}
{/if}

<script src="/themes/clientarea/default/assets/js/public.js?v={$Ver}"></script>
<script>
    var mk = '{$Setting.msfntk}';
</script>

            <div class="mdui-card mdui-color-white mdui-p-a-1">
            <div class="mdui-card-content">
                <div class="my-auto">
                    <div class="mdui-typo-display-1">欢迎回来</div>
                    <div class="mdui-typo-subheading">登录玲行云端魔方控制台</div>
                    <ul class="affs-nav nav nav-tabs nav-tabs-custom nav-justified" role="tablist">

						<!-- 手机 -->
						{if $Login.allow_login_phone==1}
							<li class="nav-item">
								<a class="nav-link fs-14 bg-transparent {if $Get.action=="phone" || $Get.action=="phone_code" || !$Get.action}active{/if}" data-toggle="tab" href="#phone" role="tab" aria-selected="false">{$Lang.mobile_login}
								</a>
							</li>
						{/if}

						{if $Login.allow_login_email==0 && $Login.allow_id==1}
							<li class="nav-item">
								<a class="nav-link fs-14 bg-transparent {if ($Login.allow_login_phone==0 && $Login.allow_id == 1)}active{/if}" data-toggle="tab" href="#email" role="tab" aria-selected="false">{$Lang.id_login}</a>
							</li>
						{/if}

						<!-- 邮箱 -->
                        {if $Login.allow_login_email}
                        <li class="nav-item">
                            <a class="nav-link fs-14 bg-transparent {if ($Login.allow_login_phone==0 && $Login.allow_login_email == 1  && $Login.allow_id == 0) || $Get.action=="email"}active{/if} " data-toggle="tab" href="#email" role="tab" aria-selected="true">{$Lang.email_login}</a>
                        </li>
                        {/if}
                        
                    </ul>

                    <div class="mt-4">
						<div class="tab-content">
							{if $Login.allow_login_email || $Login.allow_id}
							<div id="email" class="tab-pane  {if ($Login.allow_login_phone==0 && ($Login.allow_login_email == 1  || $Login.allow_id == 1)) || $Get.action=="email"}active{/if}" role="tabpanel">
								<form method="post" action="/login?action=email">										
									<div class="form-group">
    									<div class="mdui-textfield mdui-textfield-floating-label">
                                          <label class="mdui-textfield-label">用户中心 ID 或绑定的电子邮箱</label>
                                          <input class="mdui-textfield-input" type="text" id="emailInp" name="email" value="{$Post.email}" required/>
                                          <div class="mdui-textfield-error">用户名不能为空</div>
                                          <div class="mdui-textfield-helper">支持使用玲行云端魔方控制台账户登录，与玲行云端 Consolify 不互通。</div>
                                        </div>
									</div>
									<div class="form-group">
									    <div class="mdui-textfield mdui-textfield-floating-label">
                                          <label class="mdui-textfield-label">密码</label>
                                          <input class="mdui-textfield-input" type="password" id="emailPwdInp" name="password" required/>
                                          <div class="mdui-textfield-error">密码不能为空</div>
                                          <div class="mdui-textfield-helper">您设置的密码。</div>
                                        </div>
									</div>
									{if $Login.allow_login_email_captcha==1 && $Login.is_captcha==1}
									{include file="includes/verify"  type="allow_login_email_captcha" positon="top"}
									{/if}				
              <div class="d-flex justify-content-between">
											<label for="userpassword"></label>
												<a href="pwreset" class="text-primary mr-0">{$Lang.forget_the_password}</a>
										</div>							
									<div class="mt-3">
										{if $Login.second_verify_action_home_login==1}
										<!--二次登录验证-->
										<button class="btn btn-primary py-2 fs-14 btn-block waves-effect waves-light  d-flex justify-content-center align-items-center"
											type="button"  onclick="loginBefore('email');">{$Lang.sign_in}</button>
										{else/}
										<button class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent mdui-center mdui-btn-block mdui-color-blue-a400"
											type="submit">验证登录到魔方控制台</button>
										{/if}												
									</div>
								</form>
							</div>
							{/if}
							{if $Login.allow_login_phone}
							<div id="phone" class="tab-pane {if $Get.action=="phone" || $Get.action=="phone_code" || !$Get.action}active{/if}" role="tabpanel">
								<form method="post" action="/login?action=phone" >
									<div class="form-group">
										<label for="username">{$Lang.phone_number}</label>
										<div class="input-group">
											{if $Login.allow_login_register_sms_global==1}
											<div class="input-group-prepend">
												<select class="form-control select2 select2-hidden-accessible"
													data-select2-id="1" tabindex="-1" aria-hidden="true"
													name="phone_code"  value="{$Post.phone_code}"  id="phoneCodeSel">
													{foreach $SmsCountry as $list}
													<option value="{$list.phone_code}" {if $list.phone_code=="+86"}selected {/if}>
														{$list.link}
													</option>
													{/foreach}
												</select>
											</div>
											{/if}
											<input type="text" class="form-control" id="phoneInp" name="phone"  value="{$Post.phone}"  placeholder="{$Lang.please_enter_your_mobile_phone_number}">
										</div>
									</div>
									<div class="form-group allow_login_phone_captcha">
										<div class="d-flex justify-content-between">
											<label for="userpassword">{$Lang.password}</label>
										</div>
										<input type="password" class="form-control" id="phonePwdInp" name="password" placeholder="{$Lang.please_enter_password}">
									</div>
									{if $Login.allow_login_phone_captcha==1 && $Login.is_captcha==1}
									{include file="includes/verify"  type="allow_login_phone_captcha" positon="top"}
									{/if}
									{if $Login.allow_login_code_captcha==1 && $Login.is_captcha==1}
									{include file="includes/verify"  type="allow_login_code_captcha" positon="top"}
									{/if}
              
									<div class="form-group allow_login_code_captcha">
										<label for="code">{$Lang.verification_code}</label>
										<div class="input-group">
											<input type="text" class="form-control" id="phoneCodeInp" name="code"  value="{$Post.code}" placeholder="{$Lang.please_enter_code}">
											<div class="input-group-append"  style="height:46px;">
												<button class="btn btn-primary" type="button" style="line-height:33px;"  onclick="getCode(this,'login_send','allow_login_code_captcha')">{$Lang.get_code}</button>
											</div>
										</div>
									</div>

									
									
									<div class="d-flex justify-content-between align-items-center">
										<div onclick="phoneCheck(this,'allow_login_phone_captcha')" class="text-primary mr-0 pointer" {if $Get.action=="phone_code"} style="display:none;" {/if}>
											{$Lang.verification_code_login}
										</div>
										<div onclick="phoneCheck(this,'allow_login_code_captcha')" class="text-primary mr-0 pointer" {if $Get.action!="phone_code"} style="display:none;" {/if}>
											{$Lang.password_login}
										</div>
                <a href="pwreset" class="text-primary mr-0">{$Lang.forget_the_password}</a> 
									</div>
									<div class="mt-3">
										{if $Login.second_verify_action_home_login==1}
										<!--二次登录验证-->
										<button class="btn btn-primary py-2 fs-14 btn-block waves-effect waves-light  justify-content-center align-items-center allow_login_phone_captcha" type="button"  onclick="loginBefore('phone');">{$Lang.sign_in}</button>
										<button class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent mdui-center mdui-btn-block mdui-color-blue-a400" type="submit">验证登录到魔方控制台</button>
										{else/}
              
										<button class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent mdui-center mdui-btn-block mdui-color-blue-a400" type="submit">登录</button>
										{/if}												
									</div>
								</form>
							</div>
							{/if}
						</div>
                    </div>

                    {if $Oauth}
                    <div class="mt-4 text-center">
                        <h5 class="font-size-14 mb-3">{$Lang.use_other_login}</h5>

                        <ul class="list-inline">
                            {foreach $Oauth as $list}
                            <li class="list-inline-item">
                                <a href="{$list.url}" class="social-list-item text-white" target="blank">
                                    {$list.img}
                                </a>
                            </li>
                            {/foreach}
                        </ul>
                    </div>
                    {/if}
                    <br />
                    <a class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent mdui-center mdui-btn-block" href="/register">注册新账户</a>
                    <br />
                </div>
            </div>
        
            </div>
            
            <br />
            
            <div class="mdui-card mdui-p-a-1">
          <div class="mdui-card-primary">
            <div class="mdui-card-primary-title">你先别急</div>
            <div class="mdui-card-primary-subtitle">待俺说一句话</div>
          </div>
          <div class="mdui-card-content">
          
              我们知道很多人都在担心业务合规性。玲行云端作为一个内外互补的云提供者，已经坚持数年不跑路。<br />
              对于我们提供或代理的云业务，大多都是完全公益性质的<b>(一整年没收任何1分钱！)</b>，且云服务资质可在任何玲行云端国际站文档中心查阅。<br />
              如果您害怕跑路，我们随时提供无理由全额退款服务，您可随时查阅文档中心相关协议发起退款。<br />
              我们希望用心成为一个值得您信赖的云服务提供者。
          
          </div>
        </div>
<!-- end col -->