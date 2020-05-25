<html>
<#include "../commons/herder.ftl">
<body>
<hr/>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-2 column">
		</div>
		<div class="col-md-8 column">
			<img alt="140x140" src="${resultVO.data.apiInfo.image}" class="img-thumbnail" width="130" />
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
			<button type="button" class="btn btn-primary" id="start">开始</button>
			<hr/>
			<div class="jumbotron">
				<blockquote></blockquote>
			</div>
		</div>
		<div class="col-md-2 column">
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	$(function(){
		$("input").attr("placeholder","a动画，b漫画，c游戏，d小说，e原创，f来自网络，g其他，默认随机");
	});
	//1、输入完参数后，点击开始，直接去发送ajax请求，获取json信息
	$("#start").click(function(){
		$("blockquote").empty();
		getApiList();
	});
	//2、发送请求
	function getApiList(){
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
		//console.log(result);
		var p=$("<p></p>").append(result.data.hitokoto);
		$("blockquote").append(p).append('<small>'+result.data.from+'<cite> '+result.data.creator+'</cite>'+'</small>');
	}
</script>
</html>