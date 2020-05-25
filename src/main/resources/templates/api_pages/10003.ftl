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
                	<button type="button" class="btn btn-primary">无限制</button>
                	<button type="button" class="btn btn-primary">支持HTTPS</button>                
                	<a href="https://docs.qq.com/sheet/DSk9STW5ta2lzRlhM?c=F5A0V0"><button type="button" class="btn btn-primary">查看各城市ID</button></a>           
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
				<p id="city"></p>
				<p id="citykey"></p>
				<p id="updateTime"></p>
				<hr/>
				<p id="shidu"></p>
				<p id="pm25"></p>
				<p id="pm10"></p>
				<p id="quality"></p>
				<p id="wendu"></p>
				<p id="ganmao"></p>
				<hr/>
				<div id="forecast">
				</div>
			</div>
		</div>
		<div class="col-md-2 column">
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	$(function(){
		$("input").attr("placeholder","城市ID，101010100-北京，101020100-上海，101040100-重庆，默认为 101270101-成都，更多“查看各城市ID”");
	});
	//1、输入完参数后，点击开始，直接去发送ajax请求，获取json信息
	$("#start").click(function(){
		$("#forecast").empty();
		$(".jumbotron h2").html("查询结果：");
		$("#city").html("");
		$("#citykey").html("");
		$("#updateTime").html("");
		$("#shidu").html("");
		$("#pm25").html("");
		$("#pm10").html();
		$("#quality").html("");
		$("#wendu").html("");
		$("#ganmao").html("");
		if($("input").val()==""){
			$("input").val("101270101");
		}
		getApiList();
	});
	//2、发送请求
	function getApiList(){
		$.ajax({
			url:"/api-list/api/interview_path/${resultVO.data.apiInfo.id?c}",
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
		$(".jumbotron h2").html("查询结果："+result.time);
		$("#city").html("城市："+result.cityInfo.city);
		$("#citykey").html("城市编码："+result.cityInfo.citykey);
		$("#updateTime").html("更新时间："+result.cityInfo.updateTime);
		$("#shidu").html("湿度："+result.data.shidu);
		$("#pm25").html("pm2.5："+result.data.pm25);
		$("#pm10").html("pm10："+result.data.pm10);
		$("#quality").html("空气质量："+result.data.quality);
		$("#wendu").html("温度："+result.data.wendu);
		$("#ganmao").html("小提示："+result.data.ganmao);
		//添加天气数据
		$.each(result.data.forecast,function(index,item){
			var p1=$("<p></p>").append("日期："+item.ymd+" "+item.week);
			var p2=$("<p></p>").append("温度："+item.low+"~"+item.high);
			var p3=$("<p></p>").append("风向："+item.fx);
			var p4=$("<p></p>").append("风级："+item.fl);
			var p5=$("<p></p>").append("状态："+item.type);
			var p6=$("<p></p>").append("小提示："+item.notice);
			$("#forecast").append(p1).append(p2).append(p3).append(p4).append(p5).append(p6).append('<hr style="background-color:blue;height:1px;border:none"/>');
		});
	}
</script>
</html>