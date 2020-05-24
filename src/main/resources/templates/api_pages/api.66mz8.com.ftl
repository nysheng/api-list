<html>
<head>
	<title>垃圾分类</title>
	<#include "../commons/herder.ftl">
</head>
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
                	<button type="button" class="btn btn-primary">无限制</button>
                	<button type="button" class="btn btn-primary">支持HTTPS</button>                
                </div>
			</div>
			<hr/>
			<#include "../commons/form.ftl">
			<button type="button" class="btn btn-primary" id="start">开始</button>
			<hr/>
			<div class="jumbotron">
				<h2>
					查询结果：
				</h2>
				<p id="name"></p>
				<p id="data"></p>
			</div>
		</div>
		<div class="col-md-2 column">
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	//1、输入完参数后，点击开始，直接去发送ajax请求，获取json信息
	$("#start").click(function(){
		$("#name").html("");
		$("#data").html("");
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
		if(result.code==200){
			$("#name").html(result.name);
			$("#data").html(result.data);
		}
		else{
			$("#name").html("");
			$("#data").html(result.msg);
		}
	}
</script>
</html>