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
			<button id="36k" class="label label-default">36氪 ‧ 24小时热榜</button>
			<button id="zhihu" class="label label-primary">知乎热榜</button>
			<button id="weibo" class="label label-success">微博热榜</button>
			<button id="weixin" class="label label-info">微信 ‧ 24h热文榜</button>
			<button id="baidu" class="label label-danger">百度‧ 实时热点</button>
			<button id="toutiao" class="label label-primary">今日头条</button>
			<button id="163" class="label label-success">网易新闻</button>
			<button id="xl" class="label label-info">新浪网‧ 热词排行榜</button>
			<button id="csdn" class="label label-warning">csdn今日推荐</button>
			<button id="juejin" class="label label-default">掘金热榜</button>
			<button id="bilibili" class="label label-primary">哔哩哔哩热榜</button>
			<button id="douyin" class="label label-danger">抖音视频榜</button>
			<button id="52pojie" class="label label-info">吾爱破解热榜</button>
			<button id="hostloc" class="label label-warning">全球主机论坛热帖</button>
			<hr/>
			<div class="jumbotron">
			</div>`
		</div>
		<div class="col-md-2 column">
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	$(function(){
		$("input[name='type']").attr("placeholder","选择热榜来源 ，默认 36k，即36氪 ‧ 24小时热榜");
		getApiList();
	});
	//1、发送请求
	function getApiList(){
		$(".jumbotron").empty();
		$.ajax({
			url:"/api-list/api/interview/${resultVO.data.apiInfo.id?c}",
			type:"get",
			data:$("form").serialize(),
			success:function(result){
				callback(result);
			}
		});
	}
	//2、回调函数
	function callback(result){
		if(result.code==200){
			var h1=$("<h2></h2>").append("热榜来源："+result.data.name);
			var h2=$("<h3></h3>").append("更新时间："+result.data.last_update);
			$(".jumbotron").append(h1).append(h2).append("<hr/>");
			$.each(result.data.list,function(index,item){
				var h4=$("<h4></h4>").append($("<b></b>").append(item.title));
				var div1_1=$("<div></div>").append(h4);
				
				var div1_2=$("<div class='api-desc'></div>").append("——"+result.data.name);
				
				var a=$("<a style='float:right;'></a>").append('<button type="button" class="btn btn-primary">查看 >></button>').attr("href",item.link);
				
				var div1=$("<div></div>").append(div1_1).append("<br/>").append(div1_2).append(a)
				
				var div=$("<div></div>").append(div1);
				
				$(".jumbotron").append(div).append("<br/><hr/>");
			});
		}
	}
	//3、选择标签，直接去发送ajax请求，获取json信息
	$("#36k").click(function(){
		$("input[name='type']").val("36k");
		getApiList();
	});
	$("#zhihu").click(function(){
		$("input[name='type']").val("zhihu");
		getApiList();
	});
	$("#weibo").click(function(){
		$("input[name='type']").val("weibo");
		getApiList();
	});
	$("#weixin").click(function(){
		$("input[name='type']").val("weixin");
		getApiList();
	});
	$("#baidu").click(function(){
		$("input[name='type']").val("baidu");
		getApiList();
	});
	$("#toutiao").click(function(){
		$("input[name='type']").val("toutiao");
		getApiList();
	});
	$("#163").click(function(){
		$("input[name='type']").val("163");
		getApiList();
	});
	$("#xl").click(function(){
		$("input[name='type']").val("xl");
		getApiList();
	});
	$("#csdn").click(function(){
		$("input[name='type']").val("csdn");
		getApiList();
	});
	$("#juejin").click(function(){
		$("input[name='type']").val("juejin");
		getApiList();
	});
	$("#bilibili").click(function(){
		$("input[name='type']").val("bilibili");
		getApiList();
	});
	$("#douyin").click(function(){
		$("input[name='type']").val("douyin");
		getApiList();
	});
	$("#52pojie").click(function(){
		$("input[name='type']").val("52pojie");
		getApiList();
	});
	$("#hostloc").click(function(){
		$("input[name='type']").val("hostloc");
		getApiList();
	});
</script>
</html>