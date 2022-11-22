    <script>var totalActiveHost = 0;</script>
    <div class="mdui-row mdui-center">
      <div class="mdui-col-xs-8">
        
        <div class="mdui-card mdui-p-a-1">
          <div class="mdui-card-primary">
            <div class="mdui-card-primary-title">工作台桌面</div>
            <div class="mdui-card-primary-subtitle">快速导航</div>
          </div>
          <div class="mdui-card-content">
            <div class="mdui-typo-subheading">服务生态</div>
            <a class="mdui-btn mdui-ripple" href="https://www.incloudify.com/zhcn/">玲行云端官网</a>
            <div class="mdui-typo-subheading">容器云独立面板</div>
            <a class="mdui-btn mdui-ripple" href="http://mcsm.incloudify.com/">MCSM 独立面板</a>
            <a class="mdui-btn mdui-ripple" href="http://ptero.incloudify.com/">翼龙面板</a>
            <div class="mdui-typo-subheading">其他用户中心</div>
            <a class="mdui-btn mdui-ripple" href="https://console.incloudify.com/">Consolify 智控</a>
            <a class="mdui-btn mdui-ripple" href="https://partner.incloudify.com/">玲行云端协作云用户中心</a>
          </div>
          <div class="mdui-card-actions">
            <button class="mdui-btn mdui-btn-icon mdui-float-right" mdui-tooltip="{content: '自定义视图'}" onclick="mdui.snackbar({message: '魔方控制台暂不支持自定义视图。想要自定义工作台视图？Consolify 将支持！'});">
              <i class="mdui-icon material-icons">create</i>
            </button>
          </div>
        </div>
        
        <br />
        
        <div class="mdui-card mdui-p-a-1">
          <div class="mdui-card-primary">
            <div class="mdui-card-primary-title">已激活魔方实例</div>
            <div class="mdui-card-primary-subtitle" id="totalActiveHostLable">此账户于玲行云端智简魔方控制台激活的产品</div>
          </div>
          <div class="mdui-card-content">
          {if $ClientArea.index.host}
            {foreach $ClientArea.index.host_nav as $list}
                <a href="service?groupid={$list.id}" class="mdui-btn mdui-btn-raised mdui-ripple">
                  <span>
                    <i class="mdui-icon material-icons">audiotrack</i>
                    {$list.groupname}
                  </span>
                  <span>({$list.count}个实例)</span>
                </a>
                <script>totalActiveHost = totalActiveHost + {$list.count};</script>
            {/foreach}
            {else}
            <div class="mdui-typo-caption-opacity">千里之行，始于足下。</div>
            {/if}
          
          </div>
          <div class="mdui-card-actions">
            <button class="mdui-btn mdui-btn-icon mdui-float-right" mdui-tooltip="{content: '有的产品购买后不显示：可能是自动交付出了问题。一般等待片刻即可，您也可以选择发工单要求得到运维团队的帮助。'}">
              <i class="mdui-icon material-icons">help</i>
            </button>
          </div>
        </div>
        
        <br />
        
        <div class="mdui-card mdui-p-a-1">
          <div class="mdui-card-primary">
            <div class="mdui-card-primary-title">管理魔方实例</div>
            <div class="mdui-card-primary-subtitle">此玲行云端魔方账户下有 {$ClientArea.index.host} 个实例可管理</div>
          </div>
          <div class="mdui-card-content">
          
            <a class="mdui-btn mdui-btn-raised mdui-ripple" href="/service?groupid=334">云服务器</a>
            <a class="mdui-btn mdui-btn-raised mdui-ripple" href="/service?groupid=356">应用盒</a>
            <a class="mdui-btn mdui-btn-raised mdui-ripple" href="/service?groupid=333">容器云</a>
            <a class="mdui-btn mdui-btn-raised mdui-ripple" href="/service?groupid=329">虚拟主机</a>
            <a class="mdui-btn mdui-btn-raised mdui-ripple" href="/service?groupid=361">域名</a>
            <a class="mdui-btn mdui-btn-raised mdui-ripple" href="/service?groupid=347">优惠通行证</a>
          
          </div>
          <div class="mdui-card-actions">
            <button class="mdui-btn mdui-btn-icon mdui-float-right" mdui-tooltip="{content: '此处仅支持管理玲行云端魔方控制台激活的产品。其他产品请前往玲行云端智控管理。'}">
              <i class="mdui-icon material-icons">help</i>
            </button>
          </div>
        </div>
        
        <br />
        
        <div class="mdui-card mdui-p-a-1">
          <div class="mdui-card-primary">
            <div class="mdui-card-primary-title">新建魔方实例</div>
            <div class="mdui-card-primary-subtitle">可在玲行云端魔方控制台新购实例</div>
          </div>
          <div class="mdui-card-content">
          
            <a class="mdui-btn mdui-btn-raised mdui-ripple" href="/cart?fid=7">云服务器</a>
            <a class="mdui-btn mdui-btn-raised mdui-ripple" href="/cart?fid=15">应用盒</a>
            <a class="mdui-btn mdui-btn-raised mdui-ripple" href="/cart?fid=13">容器云</a>
            <a class="mdui-btn mdui-btn-raised mdui-ripple" href="/cart?fid=2">虚拟主机</a>
            <a class="mdui-btn mdui-btn-raised mdui-ripple" href="/cart?fid=19">域名注册</a>
            <a class="mdui-btn mdui-btn-raised mdui-ripple" href="#" mdui-tooltip="{content: '服务调整中'}" disabled>CDN</a><br />
            <div class="mdui-typo-caption-opacity">寻找更多产品？请前往玲行云端 Consolify 了解。</div>
          
          </div>
          <div class="mdui-card-actions">
            <a class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-blue-a400" href="/cart">查看全部</a>
            <button class="mdui-btn mdui-btn-icon mdui-float-right" mdui-tooltip="{content: '此处订购产品仅限用于玲行云端魔方控制台'}">
              <i class="mdui-icon material-icons">help</i>
            </button>
          </div>
        </div>
        
        <br />
         
        <div class="mdui-card mdui-p-a-1">
          <div class="mdui-card-primary">
            <div class="mdui-card-primary-title">公告</div>
            <div class="mdui-card-primary-subtitle">适用于玲行云端魔方控制台的公告</div>
          </div>
          <div class="mdui-card-content">
          
              <div class="user-center_notice h100p">
                <ul class="user-center_notice_ul pl-0">
                  {if $ClientArea.index.news}
                  {foreach $ClientArea.index.news as $list}
                  <li class="user-center_notice_item">
                    <span class="notice_item_time text-black-50">{$list.push_time|date="Y-m-d H:i"}</span>
                    <a href="newsview?id={$list.id}" class="notice_item_title">{$list.title}</a>
                  </li>
                  {/foreach}
                  {else}
                  <tr>
                    <td colspan="2">
                      <div class="no-data">{$Lang.nothing}</div>
                    </td>
                  </tr>
                  {/if}
                </ul>
              </div>
          
          </div>
          <div class="mdui-card-actions">
            <a class="mdui-btn mdui-btn-raised mdui-ripple" href="/news">查看全部</a>
          </div>
        </div>
        
        <br />
        
        <div class="mdui-card mdui-p-a-1">
          <div class="mdui-card-primary">
            <div class="mdui-card-primary-title">近期消息</div>
            <div class="mdui-card-primary-subtitle">或许这里会出现什么...</div>
          </div>
          <div class="mdui-card-content">
          
              {$CustomDepot.cilentareanotice}
          
          </div>
          <div class="mdui-card-actions">
            <button class="mdui-btn mdui-btn-icon mdui-float-right" mdui-tooltip="{content: '说白了，这里就是管理员玩梗的地方。'}">
              <i class="mdui-icon material-icons">help</i>
            </button>
          </div>
        </div>
        
        
      </div>
      
      
      
      <div class="mdui-col-xs-4">
        <div class="mdui-card mdui-p-a-1">
          <div class="mdui-card-primary">
            <div class="mdui-card-primary-title"><i class="mdui-icon material-icons">account_circle</i> 账户信息</div>
          </div>
          <div class="mdui-card-content">
            尊敬的<div class="mdui-typo-display-1">{$Userinfo.user.username}</div><br />欢迎访问玲行云端魔方控制台！<br />
            魔方控制台用户 ID: {$Userinfo.user.id}<br />
            绑定邮箱 {$Userinfo.user.email}<br />
            {if $Userinfo.user.qq}
            联系 QQ {$Userinfo.user.qq}
            {else}
            <div class="mdui-text-color-orange-a400">您没有填写您的 QQ 账号！消息可能无法及时通知到您。<br />未完成 QQ 留存的用户，可在填写 QQ 账号并加入玲行云端交流群后申领 3 元优惠码！</div>
            请填写您的 QQ 账号，并加入玲行云端官方用户交流群，以便为您提供最新消息。
            <a class="mdui-btn mdui-btn-raised mdui-btn-icon mdui-color-orange-a100" href="/details" mdui-tooltip="{content: '点击前往填写'}"><i class="mdui-icon material-icons">arrow_forward</i></a>
            {/if}
            
          </div>
          <div class="mdui-card-actions">
            <a class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent" href="/details" mdui-tooltip="{content: '在这里可以设置您的账户基础信息'}"><i class="mdui-icon material-icons">settings</i> 账户信息</a>
            <a class="mdui-btn mdui-btn-raised mdui-ripple" href="/security" mdui-tooltip="{content: '在这里更改密码或绑定邮箱，提高账户安全性'}"><i class="mdui-icon material-icons">security</i> 安全设置</a>
            <a class="mdui-btn mdui-btn-raised mdui-ripple" href="/apimanage" mdui-tooltip="{content: '管理当前玲行云端魔方控制台账户兼容智简魔方的接口服务'}"><i class="mdui-icon material-icons">all_inclusive</i> API</a>
          </div>
        </div>
        
        <br />
        
        <div class="mdui-card mdui-p-a-1">
          <div class="mdui-card-primary">
            <div class="mdui-card-primary-title"><i class="mdui-icon material-icons">credit_card</i> 账户资产</div>
          </div>
          <div class="mdui-card-content">
            <div class="mdui-typo-display-1">{$ClientArea.index.client.credit}</div> (本月消费 {$ClientArea.index.intotal})
          </div>
          <div class="mdui-card-actions">
            <a class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent mdui-color-blue-a400" href="/addfunds" mdui-tooltip="{content: '转到充值界面添加余额到账户，以更方便完成产品交付'}"><i class="mdui-icon material-icons">add_circle</i> 充值</a>
            <a class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-orange-a100" href="/affiliates" mdui-tooltip="{content: '转到推介计划页面，邀请新用户注册并购置产品获得大量返利'}"><i class="mdui-icon material-icons">attach_money</i> 邀新赚钱</a>
            <a class="mdui-btn mdui-btn-raised mdui-ripple" href="/billing" mdui-tooltip="{content: '查看此账户近期订单'}"><i class="mdui-icon material-icons">library_books</i> 消费记录</a>
            <button class="mdui-btn mdui-btn-icon mdui-float-right" mdui-tooltip="{content: '玲行云端魔方控制台余额与玲行云端其他用户中心、玲行云端协作云或玲行云端下游服务商不互通。'}">
              <i class="mdui-icon material-icons">help</i>
            </button>
          </div>
        </div>
        
        <br />
         
        <div class="mdui-card mdui-p-a-1">
          <div class="mdui-card-primary">
            <div class="mdui-card-primary-title"><i class="mdui-icon material-icons">today</i> 待办事项</div>
          </div>
          <div class="mdui-card-content">
            {if $ClientArea.index.order_count > 0}
            <a class="mdui-btn mdui-btn-block mdui-text-left" href="/billing?status=Unpaid" mdui-tooltip="{content: '点击前往处理'}"><i class="mdui-icon material-icons mdui-text-color-orange-a400">assignment_late</i> 您有 {$ClientArea.index.order_count} 个未支付订单，请及时处理。</a>
            <!--<a class="mdui-btn mdui-btn-icon mdui-btn-raised mdui-ripple mdui-color-theme-accent mdui-color-orange-a100" href="/billing" mdui-tooltip="{content: '前往处理'}"><i class="mdui-icon material-icons">arrow_forward</i></a>-->
            {else}
            <div class="mdui-btn mdui-btn-block mdui-text-left" disabled><i class="mdui-icon material-icons">check_circle</i> 很棒！您已结清所有款项。</div>
            {/if}
            
            {if $ClientArea.index.ticket_count > 0}
            <a class="mdui-btn mdui-btn-block mdui-text-left" href="/supporttickets" mdui-tooltip="{content: '点击前往处理'}"><i class="mdui-icon material-icons mdui-text-color-orange-a400">assignment_late</i> 您有 {$ClientArea.index.ticket_count} 个待处理工单，请前往工单中心。</a>
            <!--<a class="mdui-btn mdui-btn-icon mdui-btn-raised mdui-ripple mdui-color-theme-accent mdui-color-orange-a100" href="/supporttickets" mdui-tooltip="{content: '前往处理'}"><i class="mdui-icon material-icons">arrow_forward</i></a>-->
            {else}
            <div class="mdui-btn mdui-btn-block mdui-text-left" disabled><i class="mdui-icon material-icons">check_circle</i> 不错，您暂时没有需要处理的工单。</div>
            {/if}
            
            {if $Userinfo.user.qq}
            <div class="mdui-btn mdui-btn-block mdui-text-left" disabled><i class="mdui-icon material-icons">check_circle</i> QQ 联系方式已留存。</div>
            {else}
            <a class="mdui-btn mdui-btn-block mdui-text-left" href="/details" mdui-tooltip="{content: '点击前往处理'}"><i class="mdui-icon material-icons mdui-text-color-orange-a400">assignment_late</i> 您没有为您的账号关联 QQ ，请前往填写。</a>
            {/if}
            
            <div class="mdui-btn mdui-btn-block mdui-text-left" disabled><i class="mdui-icon material-icons">check_circle</i> 暂无未读站内信。</div>
            <div class="mdui-btn mdui-btn-block mdui-text-left" disabled><i class="mdui-icon material-icons">check_circle</i> 无自定义待办。前面的区域，以后再来探索吧。</div>
          
          </div>
          <div class="mdui-card-actions">
            <button class="mdui-btn mdui-btn-icon mdui-float-right" mdui-tooltip="{content: '自定义待办'}" onclick="mdui.snackbar({message: '魔方控制台暂不支持自定义待办。想要自定义待办清单？行云 Teamify 和 Consolify 已经支持！'});">
              <i class="mdui-icon material-icons">create</i>
            </button>
          </div>
        </div>
        
        <br />
        
        <div class="mdui-card mdui-p-a-1">
          <div class="mdui-card-primary">
            <div class="mdui-card-primary-title"><i class="mdui-icon material-icons">build</i> 服务支持</div>
          </div>
          <div class="mdui-card-content">
            
          <a class="mdui-btn mdui-btn-block mdui-text-left" href="/supporttickets" target="_blank" mdui-tooltip="{content: '工单是高效的服务方式，提交工单后运维团队会帮助您解决问题'}"><i class="mdui-icon material-icons">border_color</i> 工单中心</a>
          <a class="mdui-btn mdui-btn-block mdui-text-left" href="https://www.incloudify.com/zhcn/docs/" target="_blank" mdui-tooltip="{content: '通过查阅官网文档，可以快速了解常见问题解答'}"><i class="mdui-icon material-icons">library_books</i> 文档中心</a>
          <a class="mdui-btn mdui-btn-block mdui-text-left" href="https://jq.qq.com/?_wv=1027&k=CTosGa6w" target="_blank" mdui-tooltip="{content: '点击可快速加群'}"><i class="mdui-icon material-icons">chat</i> 企鹅交流群</a>
          <div class="mdui-typo-caption-opacity">交流群号：580739538</div>
          
          
          </div>
          <div class="mdui-card-actions">
            <button class="mdui-btn mdui-btn-icon mdui-float-right" mdui-tooltip="{content: '你知道吗，51.4%的问题可通过自行查阅产品文档解决嗷！'}">
              <i class="mdui-icon material-icons">help</i>
            </button>
          </div>
        </div>
        
        <br />
        
        <div class="mdui-card mdui-p-a-1">
          <div class="mdui-card-primary">
            <div class="mdui-card-primary-title"><i class="mdui-icon material-icons">local_florist</i> 关于</div>
          </div>
          <div class="mdui-card-content">
            我们尽力成为值得您信赖的优秀的云服务提供者。不打价格战，脚踏实地。<br />
            智简魔方控制台保持最基本的服务，现在我们正在 Consolify 上努力。那将是一个全新的、前后端分离的、高度自由化的云服务控制台。敬请期待。
          
          </div>
          <div class="mdui-card-actions">
            <a class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent" href="https://github.com/Incloudify/consolify-frontend">Consolify 前端开源仓库</a>
            <a class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent" href="https://console.incloudify.com/">智控预览站</a>
          </div>
        </div>
        
      </div>
    </div>
    <script>document.getElementById('totalActiveHostLable').innerHTML = '此玲行云端魔方账户已激活 ' + totalActiveHost + ' 个实例';</script>