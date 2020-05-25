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
			<div class="jumbotron">
				<button style="float:right;display:block;" type="button" class="btn btn-primary">刷新</button>
				<br/>
				<hr/>
				<p></p>
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
		$(".jumbotron p").html("");
		getApiResult();
	});
	//2、发送请求
	function getApiResult(){
		$.ajax({
			url:"/api-list/api/interview_no_params/${resultVO.data.apiInfo.id?c}",
			type:"get",
			success:function(result){
				callback(result);
			}
		});
	}
	//3、回调函数
	function callback(result){
		if(result.code==200){
			$(".jumbotron p").html(result.data.content);
		}
	}
	$(".jumbotron button").click(function(){
		$(".jumbotron p").html("");
		getApiResult();
	});
</script>
</html>