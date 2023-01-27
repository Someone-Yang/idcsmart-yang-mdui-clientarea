
{include file="includes/tablestyle"}
{include file="includes/pop"}

<script>
	$(function () {
		// 状态筛选
		var parmas = []
		var urlParams = '{:implode(',', $Think.get.domain_status)}';
		var statusSelected = urlParams.split(',')
		if(!statusSelected[0]){
			statusSelected=['Pending','Active','Suspended']
		}

		$('#statusSel').selectpicker('val', statusSelected)
		$('#statusSel').on('change', function () {

			statusSelected = $('#statusSel').val()
			statusSelected.forEach(item => {
				parmas += '&domain_status[]=' + item
			})

			location.href = 'service?groupid={$Think.get.groupid}' + parmas
		});
		// 关键字搜索
		$('#searchInp').val('{$Think.get.keywords}')

		$('#searchInp').on('keydown', function (e) {
			if (e.keyCode == 13) {
				location.href = 'service?groupid={$Think.get.groupid}&keywords=' + $('#searchInp').val() +
						'&sort={$Think.get.sort}&orderby={$Think.get.orderby}&page={$Think.get.page}&limit={$Think.get.limit}'
			}
		})
		$('#searchIcon').on('click', function () {
			location.href = 'service?groupid={$Think.get.groupid}&keywords=' + $('#searchInp').val() +
					'&sort={$Think.get.sort}&orderby={$Think.get.orderby}&page={$Think.get.page}&limit={$Think.get.limit}'
		});
		// 设置样式

		// 排序
		$('.bg-light th:not(.checkbox)').on('click', function () {
			var sort = '{$Think.get.sort}'
			location.href = 'service?groupid={$Think.get.groupid}&keywords={$Think.get.keywords}&sort=' + (sort ==
					'desc' ? 'asc' : 'desc') + '&orderby=' + $(this).attr('prop') +
					'&page={$Think.get.page}&limit={$Think.get.limit}'
		})
		changeStyle()
		function changeStyle() {
			$('.text-black-50.d-inline-flex.flex-column.justify-content-center.ml-1.offset-3').children().css('color','rgba(0, 0, 0, 0.1)')
			var sort = '{$Think.get.sort}'
			var orderby = '{$Think.get.orderby}'
			let index
			if(orderby === 'domainstatus') {
				if (sort === 'desc') {
					index = 1
				} else if(sort === 'asc') {
					index = 0
				}
			} else if(orderby === 'nextduedate') {
				if (sort === 'desc') {
					index = 3
				} else if(sort === 'asc') {
					index = 2
				}
			}
			$('.text-black-50.d-inline-flex.flex-column.justify-content-center.ml-1.offset-3').children().eq(index).css('color','rgba(0, 0, 0, 0.8)')
		}
	})
</script>




{if $Service.list}
    <div class="mdui-row-xs-1 mdui-row-sm-2 mdui-row-md-3">
    	{foreach $Service.list as $list}
    	    <div class="mdui-col">
    	    
        	    <div class="mdui-card mdui-p-a-2">
                  <div class="mdui-card-primary">
                    <div class="mdui-card-primary-title">
                        云服务器实例
                        {if $list.api_type == 'zjmf_api'}
                            <button class="mdui-btn mdui-btn-icon mdui-text-color-blue" mdui-tooltip="{content: '这是一个玲行云端协作云实例。玲行云端协作云多个团队将共同帮助您维护实例。'}">
                              <i class="mdui-icon material-icons">group</i>
                            </button>
                        {/if}
                       
                    </div>
                    <div class="mdui-card-primary-subtitle mdui-text-truncate">{if $list.notes}{$list.notes}{else}无备注{/if} - {$list.productname}</div>
                  </div>
                  <div class="mdui-card-content">
                    <div class="dots" id="service{$list.id}" style="display:none" data-toggle="tooltip" data-placement="top" title="{$Lang.please_wait_a_moment}..." onclick="getSingleStatus('{$list.id}')">
					</div>
					<span class="badge badge-pill font-size-12
					status-{$list.domainstatus|strtolower}">{$Lang['domainstatus_select_'.strtolower($list.domainstatus)]}</span><br>
                    <span><i class="mdui-icon material-icons">apps</i> 产品 ID: {$list.id}</span><br>
                    
                        <span><i class="mdui-icon material-icons">dns</i> 主 IP：
                            {if $list.dedicatedip}
                                {$list.dedicatedip}
                            {else}
                                无独立 IP
                            {/if}
                        </span><br>
                        
                        <span><i class="mdui-icon material-icons">save</i> 系统盘： {$list.system_disk_size}</span><br>
                        <span><i class="mdui-icon material-icons">settings</i> 实例资源：vCPU {$list.cpu} / RAM {$list.memory}</span><br>
                        <span><i class="mdui-icon material-icons">network_check</i> 宽带：{$list.bw}</span><br>
                        
                        <span><i class="mdui-icon material-icons">folder</i> 系统：
                            {if $list.svg}
								<img width="14" height="14" src="/upload/common/system/{$list.svg}.svg" alt="">
							{else}
								<img width="14" height="14" src="/upload/common/system/{$list.os_url|getOsSvg}.svg"
									 alt="">
							{/if}
							{$list.os}
						</span><br>
                        
                    <span><i class="mdui-icon material-icons">access_time</i> 到期日期：{$list.nextduedate|date="Y-m-d"}</span>
                    
                  </div>
                  <div class="mdui-card-actions">
                    <a class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-blue-a400" href="servicedetail?id={$list.id}"><i class="mdui-icon material-icons">build</i> 管理实例</a>
                  </div>
                </div>
                
                <br>
    	    
    	    </div>
    	{/foreach}
    </div>
{else}
	<div class="mdui-card mdui-p-a-1">
      <div class="mdui-card-primary">
        <div class="mdui-card-primary-title">您尚未开通任何云服务器实例</div>
      </div>
      <div class="mdui-card-content">
        <p>千里之行，始于足下。</p>
        <p>玲行云端不同用户中心间产品数据不互通，另有说明的产品除外。请您检查产品下单位置。</p>
      </div>
    </div>
{/if}















<style>
	.dots {
		cursor: pointer;
		width: 15px;
		height: 15px;
		border-radius: 50%;
		border: 1px solid #fff;
		position: absolute;
		top: 6px;
		left: 6px;
	}

	.on_color {
		background-color: #3fbf70;
	}

	.ing_color {
		background-color: #f5f5f5;
	}

	.off_color {
		background-color: #e31519;
	}

	.unknown_color {
		background-color: #c0c0c0;
	}

	.error_color {
		background-color: #959799;
	}

	.not_support_color {
		background-color: #2d2d2d;
	}
</style>

<!-- 修改备注弹窗 -->
<div class="modal fade" id="modifyNotesModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	 aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">修改备注</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="modifyNotesForm" class="needs-validation" novalidate>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label text-right">备注</label>
						<div class="col-sm-8">
							<input type="textarea" class="form-control" id="notesInp" placeholder="请输入备注" required />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary mr-2" id="modifyNotesSubmit">确定</button>
			</div>
		</div>
	</div>
</div>

<script>
	var serviceList = {:json_encode($Service.list)}; // 当前页列表数据
	$(function () {
		if($('.row-checkbox:checked').length){
			$('#readBtn').removeAttr('disabled').removeClass('not-allowed');
		}else {
			$('#readBtn').attr('disabled', 'disabled').addClass('not-allowed');
		}
		var url = 'service?groupid={$Think.get.groupid}'
		// 每页数量选择改变
		$('#limitSel').on('change', function () {
			location.href = url + '&keywords={$Think.get.keywords}&sort={$Think.get.sort}&orderby={$Think.get.orderby}&page=1&limit=' + $('#limitSel').val()

		})

		// 表格多选
		$('input[name="headCheckbox"]').on('change', function () {
			$('.row-checkbox').prop("checked", $(this).is(':checked'))
			if ($('.row-checkbox:checked').length) {
				$('#readBtn').removeAttr('disabled').removeClass('not-allowed');
			} else {
				$('#readBtn').attr('disabled', 'disabled').addClass('not-allowed');
			}
			// 以产品状态来判断批量操作按钮是否启用
			let xfStatus = true;
			let plStatus = true;
			const allCheck = [...$('.row-checkbox:checked')]
			allCheck.forEach(res=>{
				let thisStatus = $(res).parents('td').next().find('.badge-pill').html();
				if(thisStatus!="已激活"&&thisStatus!="已暂停"){
					xfStatus = false;
				}
			})
			allCheck.forEach(res=>{
				let thisStatus = $(res).parents('td').next().find('.badge-pill').html();
				if(thisStatus!="已激活"){
					plStatus = false;
				}
			})
			if(xfStatus&&allCheck.length>0) {
				$("#readBtn").removeAttr("disabled")
			} else {
				$("#readBtn").attr("disabled","disabled")
			}
			if(plStatus&&allCheck.length>0) {
				$("#bulkOperation").removeAttr("disabled")
			} else {
				$("#bulkOperation").attr("disabled","disabled")
			}
		});
		$('.row-checkbox').on('change', function () {
			$('input[name="headCheckbox"]').prop('checked', $('.row-checkbox').length === $('.row-checkbox:checked')
					.length)
			// 下面这个判断处理底部按钮的disabled
			if ($('.row-checkbox:checked').length) {
				$('#readBtn').removeAttr('disabled').removeClass('not-allowed');
			} else {
				$('#readBtn').attr('disabled', 'disabled').addClass('not-allowed');
			}

			let statusArr = getCheckStatus() // 获取所有勾选的状态
			if (statusArr.every(i => i == 'Pending')) {
				$('#bulkOperation').addClass('not-allowed').attr('disabled', 'disabled');
			} else {
				$('#bulkOperation').removeClass('not-allowed').removeAttr('disabled');
			}
			// 以产品状态来判断批量操作按钮是否启用
			let xfStatus = true;
			let plStatus = true;
			const allCheck = [...$('.row-checkbox:checked')]
			allCheck.forEach(res=>{
				let thisStatus = $(res).parents('td').next().find('.badge-pill').html();
				if(thisStatus!="已激活"&&thisStatus!="已暂停"){
					xfStatus = false;
				}
			})
			allCheck.forEach(res=>{
				let thisStatus = $(res).parents('td').next().find('.badge-pill').html();
				if(thisStatus!="已激活"){
					plStatus = false;
				}
			})
			if(xfStatus&&allCheck.length>0) {
				$("#readBtn").removeAttr("disabled")
			} else {
				$("#readBtn").attr("disabled","disabled")
			}
			if(plStatus&&allCheck.length>0) {
				$("#bulkOperation").removeAttr("disabled")
			} else {
				$("#bulkOperation").attr("disabled","disabled")
			}
		});

		$('#readBtn').on('click', function () {
			var idArr = getCheckbox()
			var str = idArr.reduce(function (total, item) {
				return total + '&host_ids[]=' + item
			}, '')
			location.href = '/mulitrenew?' + str
		})

		// 获取所有勾选项的id
		const getCheckbox = function () {
			// 勾选的id
			const ids = []
			// 所有表格内的checkbox
			const allCheck = [...$('.row-checkbox:checked')]
			for (const key in allCheck) {
				if (Object.hasOwnProperty.call(allCheck, key)) {
					const item = allCheck[key];
					ids.push(item.id.substring(11))
				}
			}
			return ids
		}
		// 获取所有勾选项的Status
		const getCheckStatus = function () {
			// 勾选的id
			const statusArr = []
			// 所有表格内的checkbox
			const allCheck = [...$('.row-checkbox:checked')]
			for (const key in allCheck) {
				if (Object.hasOwnProperty.call(allCheck, key)) {
					const item = allCheck[key];
					statusArr.push($(item).attr('data-status'))
				}
			}
			return statusArr
		}

		// 给当前页数据加属性
		for (let i = 0; i < serviceList.length; i++) {
			const item = serviceList[i]
			item.loading = false
			item.status = {
				data: {
					des: '',
					status: ''
				},
				status: 0
			}
		}

		getStatus(serviceList) // 请求列表电源状态
	})
	// 获取所有勾选项的id
	var getCheckbox = function () {
		// 勾选的id
		const ids = []
		// 所有表格内的checkbox
		const allCheck = [...$('.row-checkbox:checked')]
		for (const key in allCheck) {
			if (Object.hasOwnProperty.call(allCheck, key)) {
				const item = allCheck[key];
				ids.push(item.id.substring(11))
			}
		}
		return ids
	};

	let loopStatusTimer = null; // 循环定时器
	let batchObj = { // 发请求用的对象
		id: [],
		func: '',
		code: ''
	};
	let tableMul = getCheckbox()
	function handleOperating(command) { // 批量操作
		clearInterval(loopStatusTimer)
		batchObj.id.length = 0
		batchObj.func = command
		tableMul = getCheckbox()
		// vue那边的逻辑，直接赋值也行，因为那边的item是row，这边的item直接就是id，所以可以直接push
		for (let i = 0; i < tableMul.length; i++) {
			const item = tableMul[i]
			batchObj.id.push(item)
		}

		$.ajax({
			type: "post",
			url: '' + '/provision/default',
			data: batchObj,
			success: function (data) {
				if (data.status == 200) {
					toastr.success(data.msg)

					loopGetStatus(serviceList)
				}
			}
		});

		// if (this.tableData.length === 1) {
		// 	this.tableData[0].status.data.status = 'process'
		// }

	};

	function getStatus(items) { // 获取列表电源状态
		const obj = {
			id: [],
			func: 'status ',
			code: ''
		}
		items = items.filter(i => {
			if(i.status.data) return i.status.data.status!=='on';
			//return i.status?.data?.status !== 'on'
		})
		if (Array.isArray(items)) {
			for (let i = 0; i < items.length; i++) {
				const element = items[i]
				obj.id.push(element.id)
			}
		}
		if (!obj.id.length) {
			clearInterval(loopStatusTimer)
			loopStatusTimer = null
			return
		}

		$.ajax({
			type: "post",
			url: '' + '/provision/default',
			data: obj,
			success: function (data) {
				// 以下注释部分功能为：
				// 如果全是不能查状态的，或者，能查状态的全开机了，就不再发查询请求，
				// 但是现有问题是：在全开机的情况下，发起批量操作后，第一次查询依旧全是开机状态，则会导致停止查询，需要看后端能不能返回的及时一点
				// 也可以不改，就是查够5分钟或者切换页面就停

				// let allStatus = Object.values(data.data) || []
				// let sucArr = [] // 可以正常返回状态的服务器
				// let errArr = []	// 不支持查询状态的服务器
				// // 把列表服务器分成能查状态的和不能查状态的
				// for (let i = 0; i < allStatus.length; i++) {
				// 	const item = allStatus[i];
				// 	if (item.status === 200) {
				// 		sucArr.push(item)
				// 	} else {
				// 		errArr.push(item)
				// 	}
				// }

				// let allOpen = function () { // 返回是否所有能查状态的服务器全是开机状态
				// 	const statusArr = []
				// 	sucArr.forEach(i=>{
				// 		statusArr.push(i.data.status)
				// 	})
				// 	return statusArr.every(i => i === 'on')
				// }
				// if (!sucArr.length) { // 全都是不能查状态的，结束定时器不查了
				// 	console.log('全都不可以查询状态')
				// 	clearInterval(loopStatusTimer)
				// 	loopStatusTimer = null
				// } else if (allOpen()) {
				// 	console.log('能查状态的全是开机了')
				// 	clearInterval(loopStatusTimer)
				// 	loopStatusTimer = null
				// }
				for (const k in data.data) {
					const element = data.data[k]
					if (element.status === 200) {
						$(`#service${k}`)
								.show()
								.attr('data-original-title', element.data.des);
						setColor(element, k)

					}
				}
			}
		});

	};

	function getSingleStatus(id) { // 单个查状态
		const loadingIcon = `<i class="bx bx-loader bx-spin font-size-14 text-dark" style="position: relative; top: -1px;"></i>`
		$(`#service${id}`).removeClass().addClass('dots ing_color').html(loadingIcon);

		const obj = {
			id: [id],
			func: 'status ',
			code: ''
		}
		$.ajax({
			type: "post",
			url: '' + '/provision/default',
			data: obj,
			success: function (data) {

				const result = data.data[id]
				if (result.status === 200) {
					$(`#service${id}`)
							.show()
							.attr('data-original-title', result.data.des);
					$(`#service${id}`).removeClass().addClass('dots');
					setColor(result, id)
				}
			}
		});
	};

	function setColor(item, id) {
		//console.log('id: ', id);
		//console.log('item: ', item.data.status);
		if (item.data.status === 'on') {
			$(`#service${id}`).removeClass().addClass('dots on_color').html('');
		} else if (item.data.status === 'off') {
			$(`#service${id}`).removeClass().addClass('dots off_color').html('');
		} else if (item.data.status === 'unknown') {
			$(`#service${id}`).removeClass().addClass('dots unknown_color').html('');
		} else if (item.data.status === 'process') {
			const loadingIcon = `<i class="bx bx-loader bx-spin font-size-14 text-dark" style="position: relative; top: -1px;"></i>`
			$(`#service${id}`).removeClass().addClass('dots ing_color').html(loadingIcon);
		}
	};

	function loopGetStatus(items) { // 循环5分钟
		if (loopStatusTimer !== null) { // 如果不是初始值，则恢复成初始值
			clearInterval(loopStatusTimer)
		}
		let endTime = 0
		getStatus(items) // 先调用一次
		loopStatusTimer = setInterval(async () => {
			if (endTime >= 300) { // 超过300秒
				clearInterval(loopStatusTimer)
				loopStatusTimer = null
				return
			}
			getStatus(serviceList)
			endTime += 15
		}, 15 * 1000)
	};



	// 修改备注
	var rowId = 0
	function editNotesHandleClick(id, notes) {
		rowId = id
		$('#modifyNotesModal').modal('show')
		$('#notesInp').val(notes)
	}
	$('#modifyNotesSubmit').on('click', function () {
		$.ajax({
			type: "POST",
			url: '' + '/host/remark',
			data: {
				id: rowId,
				remark: $('#notesInp').val()
			},
			success: function (data) {
				toastr.success(data.msg)
				$('#modifyNotesModal').modal('hide')
				location.reload()
			}
		});
	});


</script>

<script src="/themes/clientarea/default/assets/libs/clipboard/clipboard.min.js?v={$Ver}"></script>
<script>
	// var clipboard = null
	// var ips = {:json_encode($Service.list)};
	// // console.log('ips: ', ips);
	// $(document).on('mouseover', '.iptd', function () {
	//   $('#popModal').modal('show')
	//   $('#popTitle').text('IP地址')
	//   if (clipboard) {
	//     clipboard.destroy()
	// 	}

	//   ips.forEach(function(item, index)  {
	// 		if (item.dedicatedip && item.assignedips && $(this).attr('id') == ('ips'+item.id)) {
	// 			var ipbox = `
	// 				<div class="text-right text-primary mb-2 pointer" id="copyip${item.id}" data-clipboard-action="copy" data-clipboard-target="#ippopbox${item.id}">复制</div>
	// 				<div id="ippopbox${item.id}"></div>
	// 			`

	// 			$('#popContent').html(ipbox)
	// 			var iplist = ''
	// 			item.assignedips.forEach(ipitem => {
	// 				iplist += `
	// 					<div>${ipitem}</div>
	// 				`
	// 			})
	// 			$('#ippopbox'+item.id).html(iplist)

	// 			// 复制
	// 			clipboard = new ClipboardJS('#copyip'+item.id, {
	//         text: function (trigger) {
	//           return $('#ippopbox'+item.id).text()
	//         },
	//         container: document.getElementById('popModal')
	//       });
	//       clipboard.on('success', function (e) {
	//         toastr.success('{$Lang.copy_succeeded}');
	//       })
	// 		}

	//   })


	// });

</script>