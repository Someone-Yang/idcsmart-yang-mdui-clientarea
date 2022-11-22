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
                    <div class="mdui-typo-display-1">谱写你的篇章</div>
                    <div class="mdui-typo-subheading">注册玲行云端魔方控制台</div>
                    <ul class="affs-nav nav nav-tabs nav-tabs-custom nav-justified" role="tablist">

						{if $Register.allow_register_phone}
							<li class="nav-item">
								<a class="nav-link fs-14 bg-transparent {if $Get.action=="phone" || !$Get.action}active{/if}" data-toggle="tab" href="#phone" role="tab" aria-selected="false"> {$Lang.mobile_registration}</a>
							</li>
						{/if}

						{if $Register.allow_register_email}
							<li class="nav-item">
								<a class="nav-link fs-14 bg-transparent {if ($Register.allow_register_email && !$Register.allow_register_phone) || $Get.action=="email"}active{/if}" data-toggle="tab" href="#email" role="tab" aria-selected="true">{$Lang.email_registration}</a>
							</li>
						{/if}

                    </ul>

                    <div class="mt-4">
						<div class="tab-content">	
							{if $Register.allow_register_email}
							<div id="email" class="tab-pane {if ($Register.allow_register_email && !$Register.allow_register_phone) || $Get.action=="email"}active{/if}" role="tabpanel">
								<form class="needs-validation" novalidate method="post" action="/register?action=email">
									<div class="form-group">
									    <div class="mdui-textfield mdui-textfield-floating-label">
                                          <label class="mdui-textfield-label">电子邮箱</label>
                                          <input class="mdui-textfield-input" type="email" id="emailInp" name="email" value="{$Post.email}" required/>
                                          <div class="mdui-textfield-error">邮箱格式有误，请检查。</div>
                                          <div class="mdui-textfield-helper">与玲行云端 Consolify 不互通。</div>
                                        </div>
									</div>
									{if $Verify.allow_register_email_captcha==1}
									{include file="includes/verify"  type="allow_register_email_captcha" positon="top"}
									{/if}
									{if $Register.allow_email_register_code==1}
									<div class="form-group">
										<label for="code">{$Lang.verification_code}</label>
										<div class="input-group">
											<input type="text" class="form-control" id="code" name="code"
												placeholder="{$Lang.please_enter_code}" value="{$Post.code}" required>
											<div class="input-group-append">
												<button class="btn btn-primary" type="button"  onclick="getCode(this,'register_email_send','allow_register_email_captcha')">{$Lang.get_code}</button>
											</div>
										</div>
									</div>
									{/if}
									<div class="form-group">
									    <div class="mdui-textfield mdui-textfield-floating-label">
                                          <label class="mdui-textfield-label">密码</label>
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
									{foreach $Register.login_register_custom_require as $custom}
									<div class="form-group">
									    <div class="mdui-textfield mdui-textfield-floating-label">
    									    <label class="mdui-textfield-label">{$Register[login_register_custom_require_list][$custom.name]}</label>
                                              <input class="mdui-textfield-input" type="{if $custom.name=='password'}password{else}text{/if}" name="{$custom.name}" id="{$custom.name}" value="{$Post[$custom.name]}">
                                          </div>
									</div>
									{/foreach}

									{foreach $Register.fields as $k => $list}
										<div class="form-group">
											<label for="{$list.id}">{$list.fieldname}</label>
											{if $list.fieldtype == 'dropdown'}
												<!-- 下拉 -->
												<select name="fields[{$list.id}]" class="form-control ">
													{foreach $list.dropdown_option as $key => $val}
														<option value="{$key}" {if(isset($_fields[$key]))} selected {/if}>{$val}</option>
													{/foreach}
												</select>
											{elseif $list.fieldtype == 'password'}
												<!-- 密码 -->
												<input name="fields[{$list.id}]" type="password" {if(isset($_fields[$list['id']]))} value="{$_fields[$list['id']]}" {/if}class="form-control" placeholder="{$Lang.custom_password_box}" />
											{elseif $list.fieldtype == 'text' || $list.fieldtype == 'link'}
												<!-- 文本框、链接 -->
												<input name="fields[{$list.id}]" type="text" class="form-control" {if(isset($_fields[$list['id']]))} value="{$_fields[$list['id']]}" {/if} placeholder="{$list.fieldname}" />
											{elseif $list.fieldtype == 'tickbox'}
												<!-- 选项框 -->
												<input type="checkbox" name="fields[{$list.id}]" {if(isset($_fields[$list['id']]))} checked {/if}>{$list.fieldname}
											{elseif $list.fieldtype == 'textarea'}
												<!-- 文本域 -->
												<textarea name="fields[{$list.id}]" cols="30" rows="10" class="form-control">{if(isset($_fields[$list['id']]))} {$_fields[$list['id']]} {/if}</textarea>
											{/if}
										</div>
									{/foreach}
									<!--销售-->
									{if $setsaler == '2'}
									<div class="form-group">
										<label for="checkPassword">{$Lang.sales_representative}</label>
										<select name="sale_id" class="form-control">
											<option value="0">{$Lang.nothing}</option>
											{foreach $saler as $list}
											<option {if $list.id==$Post.id}selected{/if} value="{$list.id}">{$list.user_nickname}</option>
											{/foreach}
										</select>
									</div>
									{/if}
									<div class="mt-3">                                       
										<button class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent mdui-center mdui-btn-block mdui-color-blue-a400"
											type="submit" onclick="if(!beforeSubmit(this)){ return false;}">{$Lang.register}</button>
									</div>

								</form>
							</div>
							{/if}
							{if $Register.allow_register_phone}
							<div id="phone" class="tab-pane {if $Get.action=="phone" || !$Get.action}active{/if}" role="tabpanel">
								<form class="needs-validation" novalidate method="post" action="/register?action=phone">
									<div class="form-group">
										<label for="username">{$Lang.phone_number}</label>
										<div class="input-group">
											{if $Register.allow_login_register_sms_global==1}
											<div class="input-group-prepend">
												<select class="form-control select2 select2-hidden-accessible"
													data-select2-id="1" tabindex="-1" aria-hidden="true"
													name="phone_code" value="{$Post.phone_code}" id="phoneCodeSel">
													{foreach $SmsCountry as $list}
													<option value="{$list.phone_code}"  {if $list.phone_code=="+86"}selected {/if}>
														{$list.link}
													</option>
													{/foreach}
												</select>
											</div>
											{/if}
											<input type="text" class="form-control" id="phoneInp" name="phone"
												placeholder="{$Lang.please_enter_your_mobile_phone_number}"  value="{$Post.phone}" required>
										</div>
									</div>
									{if $Verify.allow_register_phone_captcha==1}
									{include file="includes/verify"  type="allow_register_phone_captcha" positon="top"}
									{/if}
									<div class="form-group">
										<label for="code">{$Lang.verification_code}</label>
										<div class="input-group">
											<input type="text" class="form-control" id="code" name="code"
												placeholder="{$Lang.please_enter_code}" value="{$Post.code}" required>
											<div class="input-group-append"> 
												<button class="btn btn-primary" type="button"  onclick="getCode(this,'register_phone_send','allow_register_phone_captcha')">{$Lang.get_code}</button>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="password">{$Lang.password}</label>
										<input type="password" class="form-control" name="password" 
											id="emailPwd" placeholder="{$Lang.please_enter_password}" required>
									</div>
									<div class="form-group">
										<label for="checkPassword">{$Lang.confirm_password}</label>
										<input type="password" class="form-control" name="checkPassword" 
											id="emailPwdCheck" placeholder="{$Lang.please_password_again}" required>
									</div>
									{foreach $Register.login_register_custom_require as $custom}
									<div class="form-group">
										<label for="{$custom.name}">{$Register[login_register_custom_require_list][$custom.name]}</label>
										<input type="{if $custom.name=='password'}password{else}text{/if}" class="form-control" name="{$custom.name}" id="{$custom.name}"  value="{$Post[$custom.name]}" >
									</div>
									{/foreach}

									{foreach $Register.fields as $k => $list}
									<div class="form-group">
										<label for="{$list.id}">{$list.fieldname}</label>															
										{if $list.fieldtype == 'dropdown'}
											<!-- 下拉 -->
											<select name="fields[{$list.id}]" class="form-control ">
												{foreach $list.dropdown_option as $key => $val}
													<option value="{$key}" {if(isset($_fields[$key]))} selected {/if}>{$val}</option>
												{/foreach}
											</select>
										{elseif $list.fieldtype == 'password'}
										<!-- 密码 -->
											<input name="fields[{$list.id}]" type="password" {if(isset($_fields[$list['id']]))} value="{$_fields[$list['id']]}" {/if}class="form-control" placeholder="{$Lang.custom_password_box}" />
										{elseif $list.fieldtype == 'text' || $list.fieldtype == 'link'}
											<!-- 文本框、链接 -->
											<input name="fields[{$list.id}]" type="text" class="form-control" {if(isset($_fields[$list['id']]))} value="{$_fields[$list['id']]}" {/if} placeholder="{$list.fieldname}" />
										{elseif $list.fieldtype == 'tickbox'}
											<!-- 选项框 -->
											<input type="checkbox" name="fields[{$list.id}]" {if(isset($_fields[$list['id']]))} checked {/if}>{$list.fieldname}
										{elseif $list.fieldtype == 'textarea'}
											<!-- 文本域 -->
											<textarea name="fields[{$list.id}]" cols="30" rows="10" class="form-control">{if(isset($_fields[$list['id']]))} {$_fields[$list['id']]} {/if}</textarea>
										{/if}												
									</div>														
									{/foreach}
									<!--销售-->
									{if $setsaler == '2'}
									<div class="form-group">
										<label for="checkPassword">{$Lang.sales_representative}</label>
										<select name="sale_id" class="form-control">
											<option value="0">{$Lang.nothing}</option>
											{foreach $saler as $list}
											<option value="{$list.id}" {if($Post.sale_id==$list.id)}selected{/if}>{$list.user_nickname}</option>
											{/foreach}
										</select>
									</div>
									{/if}
									<div class="mt-3">                                       
										<button class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent mdui-center mdui-btn-block mdui-color-blue-a400" type="submit" onclick="if(!beforeSubmit(this)) {return false;}">{$Lang.register}</button>
									</div>

								</form>
							</div>
							{/if}
						</div>
                        <div class="mt-5 text-center">
                            <p>
                                <input type="checkbox" id="agreePrivacy">
                                <span>
                                    注册即表示同意
                                    <a href="{$Setting.web_tos_url}" class="font-weight-medium text-primary"
                                        target="_blank">{$Lang.terms_service}</a>
                                </span>
                            </p>
                        </div>
                        <div class="mt-5 text-center">
                            <p>{$Lang.there_already_account} <a href="login" class="font-weight-medium text-primary"> {$Lang.sign_in}</a> </p>
                        </div>
                    </div>
                </div>
            </div>


        </div>