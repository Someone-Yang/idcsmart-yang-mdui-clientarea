<script>var totalActiveHost = 0;</script>
<div class="mdui-row mdui-center">

<!-- 新人优惠码 -->

{if $ClientArea.index.host}
{else}
<div class="mdui-card mdui-p-a-1 mdui-hoverable">
  <div class="mdui-card-primary">
    <div class="mdui-card-primary-title">欢迎新用户</div>
  </div>
  <div class="mdui-card-content">
    <div class="mdui-typo-headline">欢迎加入玲行云端！您已可用一个<span class="mdui-text-color-red">无门槛 5元 优惠码</span>。现在下单任何产品立减5元！</div><br>
    <div>您的新人优惠码：<span class="mdui-typo-display-1 mdui-text-color-green">helloworld</span></div>
    <p>使用方法：新建实例时，在购物车下方输入此优惠码并应用。</p>
    <div class="mdui-typo-caption">优惠码仅限新用户。如果您购置了白嫖产品，此新用户优惠码将自动过期。除非另有说明，此优惠码不对基础优惠产品或协作云产品有效。</div>
  </div>
  <div class="mdui-card-actions">
    <a class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-blue-a400" href="/cart"><i class="mdui-icon material-icons">play_circle_outline</i> 选择并新建一个实例，使用优惠码</a>
    <a class="mdui-btn mdui-btn-raised mdui-ripple" href="/affiliates"><i class="mdui-icon material-icons">attach_money</i> 使用推介计划邀请新用户，他人消费帮您赚零花钱</a>
  </div>
</div>

<br />
{/if}


{if $Userinfo.customs.3.value == '隐藏'}
{else}
<!-- 引导开始 -->
    <div class="mdui-card mdui-p-a-1 mdui-color-light-blue-50 mdui-hoverable">
              <div class="mdui-card-primary">
                <div class="mdui-card-primary-title"><i class="mdui-icon material-icons">assistant</i> 快速引导</div>
                <div class="mdui-card-primary-subtitle">使用 2 分钟快速上手。</div>
              </div>
              <div class="mdui-card-content">
     
              
        <div class="mdui-panel mdui-panel-popout" mdui-panel="{accordion: true}">
        
          <div class="mdui-panel-item mdui-panel-item-open">
            <div class="mdui-panel-item-header">
              <div class="mdui-panel-item-title">欢迎您！</div>
              <div class="mdui-panel-item-summary">准备开始</div>
              <i class="mdui-panel-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
            </div>
            <div class="mdui-panel-item-body">
            
              <h1>欢迎来到玲行云端</h1>
              <p>很高兴在茫茫人海中遇到您！玲行云端为您提供多种多样的云基础业务服务，支持在线交付。</p>
              <p>您现在所处的位置是玲行云端魔方控制台用户中心，您有能力在这里管理您在魔方控制台激活的产品。</p>
              <p>我们争取成为一个值得您信赖的云服务提供者。在这里，我们准备了一篇 2 分钟快速引导，帮助您快速上手。</p>
              <p>展开下方其他卡片，可以按流程体验到账户设置和白嫖产品、管理入门。</p>
              
        
            </div>
          </div>
        
          <div class="mdui-panel-item">
            <div class="mdui-panel-item-header">
              <div class="mdui-panel-item-title">完善账户信息</div>
              <div class="mdui-panel-item-summary">检查账户安全性</div>
              <i class="mdui-panel-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
            </div>
            <div class="mdui-panel-item-body">
            
              <h1>完善账户信息非常重要</h1>
              <p>您需要知道：玲行云端使用了协作云生态。这意味着，您在玲行云端魔方控制台的数据不会与其他玲行云端用户中心同步。您需要妥善管理您的账户，保证基础的账户安全。</p>
              <p>当前指南将指引您完善账户信息。</p>
              
              <p>
              {if $Userinfo.user.email}
                <span class="mdui-text-color-green"><i class="mdui-icon material-icons">check_circle</i> 您成功绑定了电子邮箱。您绑定的电邮地址为 {$Userinfo.user.email}。请确保您信任玲行云端来信地址，以接收业务邮件。</span>
                {else}
                <span class="mdui-text-color-orange"><i class="mdui-icon material-icons mdui-text-color-orange-a400">assignment_late</i> 您的电子邮箱绑定有误，将无法第一时间获取业务邮件。</span>
                <a class="mdui-btn mdui-btn-raised" href="/security" target="_blank" mdui-tooltip="{content: '点击前往绑定'}">前往绑定 <i class="mdui-icon material-icons">arrow_forward</i></a>
              {/if}
              </p>
              
              <p>
              {if $Userinfo.user.qq}
                <span class="mdui-text-color-green"><i class="mdui-icon material-icons">check_circle</i> 还不错，您已经填写了 QQ 联系方式。运维团队会优先联系您填写的 QQ {$Userinfo.user.qq}。活动消息您将第一时间获取！</span>
                {else}
                <span class="mdui-text-color-orange"><i class="mdui-icon material-icons mdui-text-color-orange-a400">assignment_late</i> 您没有为您的账号关联 QQ 。通过填写 QQ 账号并加入玲行云端用户群，您可以第一时间了解活动消息和维护新闻，帮助我们更好地为您提供服务。</span>
                <a class="mdui-btn mdui-btn-raised" href="/details" target="_blank" mdui-tooltip="{content: '点击前往填写'}">前往填写 <i class="mdui-icon material-icons">arrow_forward</i></a>
              {/if}
              </p>
              
              <p>
              {if $Userinfo.user.email_remind == 1}
                <span class="mdui-text-color-green"><i class="mdui-icon material-icons">check_circle</i> 您已开启安全邮件推送功能。</span>
                {else}
                <span class="mdui-text-color-orange"><i class="mdui-icon material-icons mdui-text-color-orange-a400">assignment_late</i> 蝴蝶飞舞慢悠悠。您未开启安全邮件推送，您将无法接收登录提醒，这不安全。</span>
                <a class="mdui-btn mdui-btn-raised" href="/security" target="_blank" mdui-tooltip="{content: '点击前往开启'}">前往开启 <i class="mdui-icon material-icons">arrow_forward</i></a>
              {/if}
              </p>
              
        
            </div>
          </div>
          
          
          <div class="mdui-panel-item">
            <div class="mdui-panel-item-header">
              <div class="mdui-panel-item-title">白嫖产品及实例管理入门</div>
              <div class="mdui-panel-item-summary">您也一定为此而来吧</div>
              <i class="mdui-panel-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
            </div>
            <div class="mdui-panel-item-body">
            
              <h1>简单上手</h1>
              <p>玲行云端魔方控制台基础操作和其他友商的智简魔方控制台一致。您也许只需要熟悉我们的《人性化》布局即可。</p>
              <p>当然，可以从白嫖开始。</p>
              
              <p>
              {if $ClientArea.index.host}
                <span class="mdui-text-color-green"><i class="mdui-icon material-icons">check_circle</i> 看起来您已经开通了 {$ClientArea.index.host} 个实例。尽情享受吧！您可以在用户中心下方“管理实例”选择相关产品分组，进入内页详细管理。</span>
                {else}
                <span class="mdui-text-color-orange"><i class="mdui-icon material-icons mdui-text-color-orange-a400">assignment_late</i> 您貌似还没有开通任何实例？没关系，欢迎从我们的公益虚拟主机开始！</span>
                <a class="mdui-btn mdui-btn-raised" href="/cart?fid=2" target="_blank" mdui-tooltip="{content: '点击浏览'}">搜寻白嫖产品 <i class="mdui-icon material-icons">arrow_forward</i></a>
              {/if}
              </p>
              
              <p>
              {if $Userinfo.user.credit > 0}
                <span class="mdui-text-color-green"><i class="mdui-icon material-icons">check_circle</i> 您已存储 {$Userinfo.user.credit} 元到账户余额，可用于在玲行云端魔方控制台消费。当然，您也可以随时申请退款！</span>
                {else}
                <span class="mdui-text-color-orange"><i class="mdui-icon material-icons mdui-text-color-orange-a400">assignment_late</i> 您可以对您的账户进行充值，用于快速完成在线产品交付。</span>
                <a class="mdui-btn mdui-btn-raised" href="/addfunds" target="_blank" mdui-tooltip="{content: '访问充值中心'}">打开充值界面 <i class="mdui-icon material-icons">arrow_forward</i></a>
              {/if}
              </p>
              
              <p>
                <span class="mdui-text-color-green"><i class="mdui-icon material-icons">check_circle</i> 如果您遇到任何产品问题，欢迎发起工单，您或许可以和运维成员畅快交谈！</span>
                <a class="mdui-btn mdui-btn-raised" href="/supporttickets" target="_blank" mdui-tooltip="{content: '点击打开'}">打开工单中心 <i class="mdui-icon material-icons">arrow_forward</i></a>
              </p>
              
              
        
            </div>
          </div>
          
          
          <div class="mdui-panel-item">
            <div class="mdui-panel-item-header">
              <div class="mdui-panel-item-title">购置付费产品</div>
              <div class="mdui-panel-item-summary">发现玲行云端的价值</div>
              <i class="mdui-panel-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
            </div>
            <div class="mdui-panel-item-body">
            
              <h1>探索魅力</h1>
              <p>白嫖或是购置付费产品，玲行云端永远为您提供高性价比业务和高效的服务。</p>
              <p>我们预料到您可能有以下需求，为您提供可能的解决方案。</p>
              
              <p>
                <div class="mdui-tab" mdui-tab>
                  <a href="#solutions-1" class="mdui-ripple">博客与电商 Web 服务</a>
                  <a href="#solutions-2" class="mdui-ripple">多人游戏</a>
                  <a href="#solutions-3" class="mdui-ripple">标准云应用</a>
                  <a href="#solutions-4" class="mdui-ripple">轻量云托管</a>
                </div>
                <div id="solutions-1" class="mdui-p-a-2">
                    玲行云端为您提供低成本、低运维需求的虚拟主机产品，便于操作，新手上云也可以快速部署自己的博客、电商等站点。
                    <p><i class="mdui-icon material-icons">check_circle</i> 极速开通，即买即用。</p>
                    <p><i class="mdui-icon material-icons">check_circle</i> 含独立面板，快速操作，无需服务器运维知识。</p>
                    <p><i class="mdui-icon material-icons">check_circle</i> 多地域、多节点，满足不同需求。</p>
                </div>
                <div id="solutions-2" class="mdui-p-a-2">
                    玲行云端提供了适合多人游戏的容器云产品。相比于云服务器，容器云更轻量、成本更低，管理更加灵活。
                    <p><i class="mdui-icon material-icons">check_circle</i> 支持 MCSM 和翼龙面板。</p>
                    <p><i class="mdui-icon material-icons">check_circle</i> MineCraft 服务器极速配置。</p>
                    <p><i class="mdui-icon material-icons">check_circle</i> 在小圈中有大量占有率。</p>
                </div>
                <div id="solutions-3" class="mdui-p-a-2">
                    玲行云端提供标准云服务器，多种配置选型，可快速交付、部署，在线管理。
                    <p><i class="mdui-icon material-icons">check_circle</i> 标准云产品。</p>
                    <p><i class="mdui-icon material-icons">check_circle</i> KVM 虚拟化、完全 Root 权限。</p>
                    <p><i class="mdui-icon material-icons">check_circle</i> 支持独立 IP 和高防。</p>
                    <p><i class="mdui-icon material-icons">check_circle</i> 支持 Windows 系统。<small>仅部分可用区支持、部分可用区需额外支付 Windows Server 授权费用。</small></p>
                </div>
                <div id="solutions-4" class="mdui-p-a-2">
                    玲行云端新增“应用盒”产品，相当于更迷你的云服务器，适合非大量业务需求、长期云端托管的业务。
                    <p><i class="mdui-icon material-icons">check_circle</i> KVM 虚拟化、完全 Root 权限。</p>
                </div>
              </p>
             
            </div>
          </div>
          
          
          <div class="mdui-panel-item">
            <div class="mdui-panel-item-header">
              <div class="mdui-panel-item-title">增值联动服务</div>
              <div class="mdui-panel-item-summary">在玲行云端追逐更多</div>
              <i class="mdui-panel-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
            </div>
            <div class="mdui-panel-item-body">
            
              <h1>不止支出</h1>
              <p>玲行云端有较完善的协作云和公益服务生态。您可以额外填写这些信息，完成魔方控制台和其他业务的联动。</p>
              <p>这些项目不是必需的，但建议您了解。</p>
              
              <p>
              {if $Userinfo.customs.2.value}
                <span class="mdui-text-color-green"><i class="mdui-icon material-icons">check_circle</i> 您完成了联动早柚盘绑定。您的账号 {$Userinfo.customs.2.value} 将有机会获取免费存储包和积分奖励。</span>
                {else}
                <span><i class="mdui-icon material-icons">check_circle</i> 您可以选择绑定早柚盘。填写早柚盘 ID ，有机会获取免费存储包和积分奖励。</span>
                <a class="mdui-btn mdui-btn-raised" href="/details" target="_blank" mdui-tooltip="{content: '点击前往填写'}">前往填写 <i class="mdui-icon material-icons">arrow_forward</i></a>
                <a class="mdui-btn mdui-btn-raised" href="https://drive.paimon.cloud/" target="_blank" mdui-tooltip="{content: '点击前往早柚盘'}">访问早柚盘 <i class="mdui-icon material-icons">arrow_forward</i></a>
              {/if}
              </p>
              
              <p>
              {if $ClientArea.aff_msg.affStatus == 1}
                <span class="mdui-text-color-green"><i class="mdui-icon material-icons">check_circle</i> 您已激活推介计划。可在玲行云端魔方控制台用户中心访问推介计划。</span>
                {else}
                <span><i class="mdui-icon material-icons">check_circle</i> 您可以开启推介计划，邀请新用户注册账号（仅限魔方控制台），领取返利抵扣消费或提现。</span>
                <a class="mdui-btn mdui-btn-raised" href="/affiliates" target="_blank" mdui-tooltip="{content: '点击推介中心'}">前往激活 <i class="mdui-icon material-icons">arrow_forward</i></a>
              {/if}
              </p>
              
              <p>
              {if $Userinfo.user.api_open == 1}
                <span class="mdui-text-color-green"><i class="mdui-icon material-icons">check_circle</i> 您激活玲行云端魔方控制台 API。您可以使用兼容智简魔方的财务系统对接本控制台。</span>
                {else}
                <span><i class="mdui-icon material-icons">check_circle</i> 您可以开启玲行云端魔方控制台 API ，完成兼容智简魔方财务系统对接。</span>
                <a class="mdui-btn mdui-btn-raised" href="/apimanage" target="_blank" mdui-tooltip="{content: '点击前往开启'}">前往开启 <i class="mdui-icon material-icons">arrow_forward</i></a>
              {/if}
              </p>
              
        
            </div>
          </div>
          
          
          <div class="mdui-panel-item">
            <div class="mdui-panel-item-header">
              <div class="mdui-panel-item-title">完成引导</div>
              <div class="mdui-panel-item-summary">可以选择隐藏此区块</div>
              <i class="mdui-panel-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
            </div>
            <div class="mdui-panel-item-body">
            
              <h1>梦想的旅途继续前行</h1>
              <p>您或许已经完成了新人指引。</p>
              <p>玲行云端全体运维成员在此祝您上云愉快！我们期待着帮助为您梦想添砖加瓦。</p>
              
              <p>
                <span class="mdui-text-color-green"><i class="mdui-icon material-icons">check_circle</i> 转到“个人中心”（“账户信息设置”）可寻找到关闭选项。之后，您也可以在同样位置再次回顾本引导。</span>
                <a class="mdui-btn mdui-btn-raised" href="/details" target="_blank" mdui-tooltip="{content: '点击打开'}">打开个人中心 <i class="mdui-icon material-icons">arrow_forward</i></a>
              </p>
              
        
            </div>
          </div>
                    
        </div>
    
    </div>
    </div>
    
    <br />
<!-- 引导结束 -->
{/if}

<div class="mdui-col-xs-12 mdui-col-sm-8">
{if $Userinfo.customs.4.value == '简洁表格'}

<div class="mdui-row-xs-3">
      <div class="mdui-col">
          
          <div class="mdui-card mdui-p-a-1 mdui-hoverable">
              <div class="mdui-card-primary">
                <div class="mdui-card-primary-title">云服务器</div>
                <div class="mdui-card-primary-subtitle">ICS / DVPS</div>
              </div>
              <div class="mdui-card-content">
                <p>快速、可靠、硬件虚拟化的独立云服务器。<p>
              </div>
              <div class="mdui-card-actions mdui-card-actions-stacked">
                <a class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-blue-a400" href="/service?groupid=334"><i class="mdui-icon material-icons">view_list</i> 管理实例</a>
                <a class="mdui-btn mdui-ripple" href="/cart?fid=7"><i class="mdui-icon material-icons">library_add</i> 新建实例</a>
              </div>
            </div>
            
            <br>
          
      </div>
      
       <div class="mdui-col">
          
          <div class="mdui-card mdui-p-a-1 mdui-hoverable">
              <div class="mdui-card-primary">
                <div class="mdui-card-primary-title">应用盒</div>
                <div class="mdui-card-primary-subtitle">App Box</div>
              </div>
              <div class="mdui-card-content">
                <p>易于使用的挂机宝、云端设备及玲行云端荧盒。<p>
              </div>
              <div class="mdui-card-actions mdui-card-actions-stacked">
                <a class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-blue-a400" href="/service?groupid=356"><i class="mdui-icon material-icons">view_list</i> 管理实例</a>
                <a class="mdui-btn mdui-ripple" href="/cart?fid=15"><i class="mdui-icon material-icons">library_add</i> 新建实例</a>
              </div>
            </div>
            
            <br>
          
      </div>
      
      <div class="mdui-col">
          
          <div class="mdui-card mdui-p-a-1 mdui-hoverable">
              <div class="mdui-card-primary">
                <div class="mdui-card-primary-title">容器云</div>
                <div class="mdui-card-primary-subtitle">Container</div>
              </div>
              <div class="mdui-card-content">
                <p>本站新建、离站管理的含独立面板的 LXC 虚拟化服务器。<p>
              </div>
              <div class="mdui-card-actions mdui-card-actions-stacked">
                <a class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-blue-a400" href="/service?groupid=333"><i class="mdui-icon material-icons">view_list</i> 管理实例</a>
                <a class="mdui-btn mdui-ripple" href="/cart?fid=13"><i class="mdui-icon material-icons">library_add</i> 新建实例</a>
              </div>
            </div>
            
            <br>
          
      </div>
      
      <div class="mdui-col">
          
          <div class="mdui-card mdui-p-a-1 mdui-hoverable">
              <div class="mdui-card-primary">
                <div class="mdui-card-primary-title">
                    虚拟主机
                </div>
                <div class="mdui-card-primary-subtitle">Vhost</div>
              </div>
              <div class="mdui-card-content">
                <p>无需过多运维知识、即开即用的网站搭建专用服务器。<p>
              </div>
              <div class="mdui-card-actions mdui-card-actions-stacked">
                <a class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-blue-a400" href="/service?groupid=329"><i class="mdui-icon material-icons">view_list</i> 管理实例</a>
                <a class="mdui-btn mdui-ripple" href="/cart?fid=2"><i class="mdui-icon material-icons">library_add</i> 新建实例</a>
              </div>
            </div>
            
            <br>
          
      </div>
      
      <div class="mdui-col">
          
          <div class="mdui-card mdui-p-a-1 mdui-hoverable">
              <div class="mdui-card-primary">
                <div class="mdui-card-primary-title">域名</div>
                <div class="mdui-card-primary-subtitle">Domain</div>
              </div>
              <div class="mdui-card-content">
                <p>玲行云端协作云的低价域名注册服务，助您快速打造个人品牌。<p>
              </div>
              <div class="mdui-card-actions mdui-card-actions-stacked">
                <a class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-blue-a400" href="/service?groupid=361"><i class="mdui-icon material-icons">view_list</i> 管理实例</a>
                <a class="mdui-btn mdui-ripple" href="/cart?fid=19"><i class="mdui-icon material-icons">library_add</i> 新建实例</a>
              </div>
            </div>
            
            <br>
          
      </div>
      
      
  </div>
  <br />




{else}
    <div class="mdui-row mdui-p-a-1">
        <div class="mdui-card mdui-p-a-1 mdui-hoverable">
          <div class="mdui-card-primary">
            <div class="mdui-card-primary-title">已激活魔方实例</div>
            <div class="mdui-card-primary-subtitle" id="totalActiveHostLable">此账户于玲行云端智简魔方控制台激活的产品</div>
          </div>
          <div class="mdui-card-content">
          {if $ClientArea.index.host}
            {foreach $ClientArea.index.host_nav as $list}
                <a href="service?groupid={$list.id}" class="mdui-btn mdui-btn-raised mdui-ripple">
                  <span>
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
    </div>
    
    <div class="mdui-row mdui-p-a-1">
        <div class="mdui-card mdui-p-a-1 mdui-hoverable">
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
    </div>
    
    <div class="mdui-row mdui-p-a-1">
        <div class="mdui-card mdui-p-a-1 mdui-hoverable">
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
    </div>
    

{/if}
    <div class="mdui-row mdui-p-a-1">
        <div class="mdui-card mdui-p-a-1 mdui-hoverable">
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
    </div>
    
    <div class="mdui-row mdui-p-a-1">
        <div class="mdui-card mdui-p-a-1 mdui-hoverable">
          <div class="mdui-card-primary">
            <div class="mdui-card-primary-title">近期消息</div>
            <div class="mdui-card-primary-subtitle">或许这里会出现什么...</div>
          </div>
          <div class="mdui-card-content">
          
              {$CustomDepot.cilentareanotice}
          
          </div>
        </div>
    </div>
    
</div>
  
  
  
<div class="mdui-col-xs-12 mdui-col-sm-4">
<div class="mdui-row mdui-p-a-1">
    <div class="mdui-card mdui-p-a-1 mdui-hoverable">
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
        <div class="mdui-text-color-orange-a400">您没有填写您的 QQ 账号！消息可能无法及时通知到您。<br />未完成 QQ 留存的用户，可在填写 QQ 账号后申领 3 元优惠码！</div>
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
    
</div>
    
<div class="mdui-row mdui-p-a-1">
    <div class="mdui-card mdui-p-a-1 mdui-hoverable">
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
    
</div>
     
<div class="mdui-row mdui-p-a-1">
    <div class="mdui-card mdui-p-a-1 mdui-hoverable">
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
    </div>
    
</div>
    
<div class="mdui-row mdui-p-a-1">
    <div class="mdui-card mdui-p-a-1 mdui-hoverable">
      <div class="mdui-card-primary">
        <div class="mdui-card-primary-title"><i class="mdui-icon material-icons">build</i> 服务支持</div>
      </div>
      <div class="mdui-card-content">
        
      <a class="mdui-btn mdui-btn-block mdui-text-left" href="/supporttickets" target="_blank" mdui-tooltip="{content: '工单是高效的服务方式，提交工单后运维团队会帮助您解决问题'}"><i class="mdui-icon material-icons">border_color</i> 工单中心</a>
      <a class="mdui-btn mdui-btn-block mdui-text-left" href="https://www.incloudify.com/zhcn/docs/" target="_blank" mdui-tooltip="{content: '通过查阅官网文档，可以快速了解常见问题解答'}"><i class="mdui-icon material-icons">library_books</i> 文档中心</a>
      <a class="mdui-btn mdui-btn-block mdui-text-left" href="https://forum.incloudify.com/" target="_blank" mdui-tooltip="{content: '玲行云端用户论坛'}"><i class="mdui-icon material-icons">assignment</i> 用户论坛</a>
      <a class="mdui-btn mdui-btn-block mdui-text-left" href="https://jq.qq.com/?_wv=1027&k=CTosGa6w" target="_blank" mdui-tooltip="{content: '点击可快速加群'}"><i class="mdui-icon material-icons">chat</i> 企鹅交流群</a>
      <div class="mdui-typo-caption-opacity">交流群号：580739538</div>
      
      
      </div>
    </div>
</div>
    
    
  </div>
</div>
<script>document.getElementById('totalActiveHostLable').innerHTML = '此玲行云端魔方账户已激活 ' + totalActiveHost + ' 个实例，共 {$ClientArea.index.host} 个实例';</script>