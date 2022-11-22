<!-- <div class="alert alert-danger mb-4">
	<div class="alert-body">[value]</div>
</div> -->
<script type="text/javascript">
	$(function () {
		mdui.snackbar({
          message: '[value]'
        });
        setTimeout(function () {
			var url = '[url]'
			if (url) {
				location.href = url
			}
		}, 500);
	});
</script>