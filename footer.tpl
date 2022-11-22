<!-- MDUI JavaScript -->
    <script src="/themes/clientarea/yang-mdui/src/js/mdui.min.js"></script>
    <br>
        <div class="mdui-card">
          <div class="mdui-card-content mdui-text-center">
          
              (C) Incloudify Inc. 2015-2022. All rights reserved.<br>
              <div class="mdui-typo-caption-opacity">The <em>IDCSmart Yang-MDUI</em> Theme by <a href="https://github.com/Someone-Yang" target="_blank">Someone_Yang</a>.</div>
              
              <a href="#" id="hitokoto_text" id="hitokoto">获取一言中...</a>
          
          </div>
        </div>
        <br>
    </div>
    
    {if $Userinfo}
    <a class="mdui-fab mdui-fab-fixed mdui-ripple mdui-color-blue-a400" mdui-tooltip="{content: '工单支持'}" href="/supporttickets" style="z-index:10001;">
      <i class="mdui-icon material-icons">question_answer</i>
    </a>
    {else}
    <a class="mdui-fab mdui-fab-fixed mdui-ripple mdui-color-grey-400" mdui-tooltip="{content: '登录可获取支持'}" href="/login" style="z-index:10001;">
      <i class="mdui-icon material-icons">question_answer</i>
    </a>
    {/if}
    
    
  </body>
  <script>
  mdui.mutation();
  fetch('https://v1.hitokoto.cn/')
    .then(response => response.json())
    .then(data => {
      const hitokoto = document.getElementById('hitokoto_text')
      hitokoto.href = 'https://hitokoto.cn/?uuid=' + data.uuid
      hitokoto.innerText = "【Hitokoto 一言】" + data.hitokoto
    })
    .catch(console.error)
</script>
  
</html>