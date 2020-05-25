<html>
<#include "../commons/herder.ftl">
<body>
<hr/>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-2 column"></div>
		<div class="col-md-8 column">
			<img src="${resultVO.data.apiInfo.image}" class="img-thumbnail" width="130"/>
			<div style="float:right;height:150;width:550">
				<div>
                	<h4><b>${resultVO.data.apiInfo.name}</b></h4>
            	</div>
            	<div class="api-desc">${resultVO.data.apiInfo.comment}</div>
            	<div class="alert alert-warning" role="alert">
                	<button type="button" class="btn btn-primary">10QPS</button>
                	<button type="button" class="btn btn-primary">支持HTTPS</button>                
                </div>
			</div>
			<hr/>
			<#include "../commons/form.ftl">
			<div class="panel panel-default">
  				<div class="panel-heading">
    				<h3 class="panel-title">中英互译</h3>
  				</div>
  				<div class="panel-body">
  					<textarea id="source" onkeyup="translation(this.value)" wrap="hard" style="height: 200px; width: 340px;"></textarea>
  					>>>
    				<textarea id="target" style="height: 200px; width: 340px;"></textarea>
  				</div>
			</div>
				
				
			
		</div>
		<div class="col-md-2 column">
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	//1、页面加载完成以后，直接去发送ajax请求,要到数据
	$(function(){
		$("label[name='info']").html("");
		$("input[name='info']").attr("type","hidden");
		$("#source").attr("placeholder","输入......");
		$("#target").attr("placeholder","输出......");
	});
	//2、发送请求
	function getApiResult(){
		$.ajax({
			url:"/api-list/api/interview/${resultVO.data.apiInfo.id?c}",
			type:"get",
			data:$("form").serialize(),
			success:function(result){
				callback(result);
			}
		});
	}
	//3、回调函数
	function callback(result){
		if(result.code==200){
			$("#target").val(result.fanyi);
		}
	}
	function translation(value){
		if(value!=""){
			$("#target").val("正在翻译......");
			var texts=value.split(/\n/g);
			$("input[name='info']").val(texts[0]);
			getApiResult();
		}else{
			$("#target").val("");
		}
	}
</script>
</html>