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
			<div id="today" class="panel panel-default">
  				<div class="panel-heading">今日文章</div>
  				<div class="panel-body">
  				</div>
			</div>
			<hr/>
			<div id="random" class="panel panel-default">
  				<div class="panel-heading">随机文章   <a href="javascript:void(0);" onclick="getApiResult_random()" id="flush_random">点击刷新</a></div>
  				<div class="panel-body">
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
		getApiResult_today();
		getApiResult_random();
	});
	//2、发送请求-今日文章
	function getApiResult_today(){
		$("#today .panel-body").html("");
		$.ajax({
			url:"/api-list/api/interview_no_params/${resultVO.data.apiInfo.id?c}",
			type:"get",
			success:function(result){
				callback_today(result);
			}
		});
	}
	//3、发送请求-随机文章
	function getApiResult_random(){
		$("#random .panel-body").html("");
		$.ajax({
			url:"/api-list/api/interview_path/${resultVO.data.apiInfo.id?c}",
			type:"get",
			success:function(result){
				callback_random(result);
			}
		});
	}
	//4、回调函数-今日文章
	function callback_today(result){
		if(result.code==200){
			$("#today .panel-body").html('<center><b>'+result.data.title+'</b></center>'+'<center>—— '+result.data.author+' '+result.data.up_date.substring(0,4)+'-'+result.data.up_date.substring(4,6)+'-'+result.data.up_date.substring(6)+'</center><br/>'+result.data.content);
		}
	}
	//5、回调函数-随机文章
	function callback_random(result){
		if(result.code==200){
			$("#random .panel-body").html('<center><b>'+result.data.title+'</b></center>'+'<center> —— '+result.data.author+' '+result.data.up_date.substring(0,4)+'-'+result.data.up_date.substring(4,6)+'-'+result.data.up_date.substring(6)+'</center><br/>'+result.data.content);
		}
	}
</script>
</html>