<!doctype html>
<html lang="zh-cmn-Hans">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no"/>
    <meta name="renderer" content="webkit"/>
    <meta name="force-rendering" content="webkit"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

    <!-- MDUI CSS -->
    <link rel="stylesheet" href="/themes/clientarea/yang-mdui/src/css/mdui.min.css"/>
    
        <link href="/themes/clientarea/default/assets/css/bootstrap.min.css?v={$Ver}" rel="stylesheet" type="text/css" />
        <link href="/themes/clientarea/default/assets/css/icons.min.css?v={$Ver}" rel="stylesheet" type="text/css" />
        <link href="/themes/clientarea/default/assets/css/app.min.css?v={$Ver}" rel="stylesheet" type="text/css" />
        {if($load_css=load_css('custom.css'))}
            <link href="{$load_css}?v={$Ver}" rel="stylesheet" type="text/css" />
        {/if}
        <!-- 自定义全局样式 -->
        <link href="/themes/clientarea/default/assets_custom/css/global.css?v={$Ver}" rel="stylesheet" >
        <link href="/themes/clientarea/default/assets_custom/css/responsive.css?v={$Ver}" rel="stylesheet">
        <!-- 字体图标 -->
        
        
        
         <link href="/themes/clientarea/default/assets_custom/fonts/iconfont.css?v={$Ver}" rel="stylesheet"> 
        
        <!-- JAVASCRIPT -->
        <script src="/themes/clientarea/default/assets/libs/jquery/jquery.min.js?v={$Ver}"></script>
        <script src="/themes/clientarea/default/assets/libs/bootstrap/js/bootstrap.bundle.min.js?v={$Ver}"></script>
        <script src="/themes/clientarea/default/assets/libs/metismenu/metisMenu.min.js?v={$Ver}"></script>
        <script src="/themes/clientarea/default/assets/libs/simplebar/simplebar.min.js?v={$Ver}"></script>
        <script src="/themes/clientarea/default/assets/libs/node-waves/waves.min.js?v={$Ver}"></script>
        
        <!-- <script src="/themes/clientarea/default/assets/libs/error-all/solve-error.js" type="text/javascript"></script> -->
        <!-- 自定义js -->
        <script src="/themes/clientarea/default/assets_custom/js/throttle.js?v={$Ver}"></script>
        
        <link type="text/css" href="/themes/clientarea/default/assets/libs/toastr/build/toastr.min.css?v={$Ver}" rel="stylesheet" />
        <script src="/themes/clientarea/default/assets/libs/toastr/build/toastr.min.js?v={$Ver}"></script>
        
        <script>
	var setting_web_url = ''
  var language={:json_encode($_LANG)};
  </script>
    
    <title>{$Title} - 玲行云端魔方控制台</title>
  </head>
  <body class="mdui-appbar-with-toolbar mdui-drawer-body-left">
  
  <div class="mdui-drawer mdui-color-white" id="left-drawer">
            <ul class="mdui-list mdui-list-dense">
            {if $Userinfo}
              <li class="mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons">home</i>
                <a href="/" class="mdui-list-item-content">首页</a>
              </li>
              <li class="mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons">add</i>
                <a href="/cart" class="mdui-list-item-content">新建实例</a>
              </li>
              <li class="mdui-subheader">魔方账户</li>
              <li class="mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons">account_circle</i>
                <a href="/details" class="mdui-list-item-content">我的账户</a>
              </li>
              <li class="mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons">security</i>
                <a href="/security" class="mdui-list-item-content">安全设置</a>
              </li>
              
              <li class="mdui-subheader">资产管理</li>
              <li class="mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons">attach_money</i>
                <a href="/addfunds" class="mdui-list-item-content">账户充值</a>
              </li>
              <li class="mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons">library_books</i>
                <a href="/billing" class="mdui-list-item-content">交易账单</a>
              </li>
              
              <li class="mdui-subheader">实例管理</li>
              <li class="mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons"></i>
                <a href="/manage/ics" class="mdui-list-item-content">云服务器</a>
              </li>
              <li class="mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons"></i>
                <a href="/manage/vhost" class="mdui-list-item-content">虚拟主机</a>
              </li>
              <li class="mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons"></i>
                <a href="/manage/appbox" class="mdui-list-item-content">应用盒</a>
              </li>
              <li class="mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons"></i>
                <a href="/manage/container" class="mdui-list-item-content">容器云</a>
              </li>
              <li class="mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons"></i>
                <a href="/manage/domain" class="mdui-list-item-content">域名</a>
              </li>
              <li class="mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons"></i>
                <a href="/service?groupid=362" class="mdui-list-item-content">协作云实例</a>
              </li>
              
              <li class="mdui-subheader">支持中心</li>
              <li class="mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons">library_books</i>
                <a href="https://www.incloudify.com/zhcn/docs/" class="mdui-list-item-content">服务文档</a>
              </li>
              <li class="mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons">assignment</i>
                <a href="https://forum.incloudify.com/" class="mdui-list-item-content">用户论坛</a>
              </li>
              <li class="mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons">border_color</i>
                <a href="/supporttickets" class="mdui-list-item-content">工单中心</a>
              </li>
              <li class="mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons">chat</i>
                <a href="https://jq.qq.com/?_wv=1027&k=CTosGa6w" class="mdui-list-item-content">QQ 唠嗑群</a>
              </li>
            </ul>
            {else}
              <li class="mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons">person_add</i>
                <a href="/login" class="mdui-list-item-content">请先登录</a>
              </li>
              <li class="mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons"></i>
                <a href="/register" class="mdui-list-item-content">或点此注册</a>
              </li>
            {/if}
  </div>
  
  <div class="mdui-appbar mdui-color-white mdui-appbar-fixed">
      <div class="mdui-toolbar mdui-color-theme">
        <a href="javascript:;" class="mdui-btn mdui-btn-icon" mdui-tooltip="{content: '展开/隐藏侧边栏',position: 'right'}" mdui-drawer="{target: '#left-drawer'}">
          <i class="mdui-icon material-icons">menu</i>
        </a>
        <a href="javascript:history.back(-1);" class="mdui-btn mdui-btn-icon mdui-hidden-sm-down" mdui-tooltip="{content: '返回上一页'}">
          <i class="mdui-icon material-icons">arrow_back</i>
        </a>
        <a href="https://smart.incloudify.com/" class="mdui-typo-headline">玲行云端魔方控制台</a>
        <a href="javascript:;" class="mdui-typo-title mdui-hidden-sm-down">{$Title}</a>
        <div class="mdui-toolbar-spacer"></div>
        <a class="mdui-btn mdui-btn-icon" mdui-tooltip="{content: '显示/隐藏框架'}" onclick="mainappViewSwitch();">
          <i class="mdui-icon material-icons" id="mainappViewButton">visibility</i>
        </a>
        {if $Userinfo}
        <a href="/cart?action=viewcart" class="mdui-btn mdui-btn-icon" mdui-tooltip="{content: '购物车'}">
          <i class="mdui-icon material-icons">shopping_cart</i>
        </a>
        <a href="/details" class="mdui-btn mdui-btn-icon" mdui-tooltip="{content: '玲行云端魔方账户'}">
          <i class="mdui-icon material-icons">account_circle</i>
        </a>
        <a href="/logout" class="mdui-btn mdui-btn-icon" mdui-tooltip="{content: '登出'}">
          <i class="mdui-icon material-icons">exit_to_app</i>
        </a>
        {else}
        <a href="/login" class="mdui-btn mdui-btn-icon" mdui-tooltip="{content: '请先登录'}">
          <i class="mdui-icon material-icons">person_add</i>
        </a>
        {/if}
      </div>
  </div>
  <style type="text/css">
	body{
		background: url("/themes/clientarea/yang-mdui/imgs/bg.jpg") no-repeat center center fixed;
                -webkit-background-size: cover;
                -o-background-size: cover;                
                background-size: cover;
	}
	</style>
    <script>
    var mainappView = true;
    function mainappViewSwitch () {
    if (mainappView == true) {
        document.getElementById('yangMduiMainapp').style.visibility = 'hidden';
        document.getElementById('left-drawer').style.visibility = 'hidden';
        document.getElementById('mainappViewButton').innerHTML = 'visibility_off';
        mdui.snackbar({
          message: '背景拍摄于《原神》。愿您自行探索。',
          position: 'left-bottom',
          timeout: 6000,
        });
    } else {
        document.getElementById('yangMduiMainapp').style.visibility = '';
        document.getElementById('left-drawer').style.visibility = '';
        document.getElementById('mainappViewButton').innerHTML = 'visibility';
    }
    mainappView = !mainappView;
    }
    </script>
  <div class="mdui-container" id="yangMduiMainapp">
  <br />