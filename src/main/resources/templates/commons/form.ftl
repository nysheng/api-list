<form role="form">
	<#list resultVO.data.params as param>
		<div class="form-group">
			<label name="${param!""}" for="exampleInputText">${param!""}</label><input type="text" name="${param!""}" class="form-control" />
		</div>
	</#list>
</form>
			