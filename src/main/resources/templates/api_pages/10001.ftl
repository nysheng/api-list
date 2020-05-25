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
				<h2>
					查询结果：
				</h2>
				<hr style="background-color:blue;height:1px;border:none"/>
				<div id="data"></div>
			</div>
		</div>
		<div class="col-md-2 column">
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	$(function(){
		$("input").attr("placeholder","输入垃圾名称");
	});
	//1、输入完参数后，点击开始，直接去发送ajax请求，获取json信息
	$("#start").click(function(){
		$(".jumbotron h2").html("");
		$("#data").empty();
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
			$(".jumbotron h2").html("查询结果："+result.data.length);
			$.each(result.data,function(index,item){
				var p1=$("<p></p>").append("<b>名称：</b>"+item.name);
				var p2=$("<p></p>").append("<b>类型：</b>"+(item.type==1?"可回收垃圾":item.type==2?"有害垃圾":item.type==3?"厨余（湿）垃圾":"其它（干）垃圾"));
				var p3=$("<p></p>").append("<b>分类解释：</b>"+item.explain);
				var p4=$("<p></p>").append("<b>包含类型：</b>"+item.contain);
				var p5=$("<p></p>").append("<b>投放提示：</b>"+item.tip);
				$("#data").append(p1).append(p2).append(p3).append(p4).append(p5).append('<hr style="background-color:blue;height:1px;border:none"/>');
			});
			
		}
		else{
			$("#name").html("");
			$("#data").html(result.msg);
		}
	}
</script>
</html>