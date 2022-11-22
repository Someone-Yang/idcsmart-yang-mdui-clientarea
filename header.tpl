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
    
    <title>{$Title} - 玲行云端魔方控制台（2022测试版）</title>
  </head>
  <body class="mdui-appbar-with-toolbar">
  <div class="mdui-appbar mdui-color-white mdui-appbar-fixed">
      <div class="mdui-toolbar mdui-color-theme">
        <a href="https://smart.incloudify.com/" class="mdui-btn mdui-btn-icon" mdui-tooltip="{content: '用户中心主页'}">
          <i class="mdui-icon material-icons">home</i>
        </a>
        <a href="https://smart.incloudify.com/" class="mdui-typo-headline">玲行云端</a>
        <a href="javascript:;" class="mdui-typo-title">魔方控制台 - {$Title}</a>
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
		background: url("https://smart.incloudify.com/themes/clientarea/yang-mdui/imgs/bg.jpg") no-repeat center center fixed;
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
        document.getElementById('mainappViewButton').innerHTML = 'visibility_off';
        mdui.snackbar({
          message: '背景拍摄于《原神》璃月轻策庄北面。山峦起伏，流水荡漾，远眺可观群玉阁。愿天下人之梦如飞鸟遨游于广袤无垠的天空。',
          position: 'left-bottom',
          timeout: 6000,
        });
    } else {
        document.getElementById('yangMduiMainapp').style.visibility = '';
        document.getElementById('mainappViewButton').innerHTML = 'visibility';
    }
    mainappView = !mainappView;
    }
    </script>
  <div class="mdui-container" id="yangMduiMainapp">
  <br />