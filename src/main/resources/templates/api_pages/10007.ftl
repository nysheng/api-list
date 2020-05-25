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
				<h2>
					日期：
				</h2>
				<hr/>
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
			$(".jumbotron h2").append(result.data.date.substring(0,4)+"年"+result.data.date.substring(4,6)+"月"+result.data.date.substring(6)+"日");
			$.each(result.data.stories,function(index,item){
				var img=$("<img />").attr("class","img-thumbnail").attr("src",item.images).attr("width","130");
				
				var h4=$("<h4></h4>").append($("<b></b>").append(item.title));
				var div1_1=$("<div></div>").append(h4);
				
				var div1_2=$("<div class='api-desc'></div>").append("——"+item.hint);
				
				var a=$("<a style='float:right;'></a>").append('<button type="button" class="btn btn-primary">查看更多>></button>').attr("href",item.url);
				
				var div1=$("<div style='float:right;height:150;width:450;'></div>").append(div1_1).append("<br/>").append(div1_2).append(a)
				
				var div=$("<div></div>").append(img).append(div1);
				$(".jumbotron").append(div).append("<hr/>");
			});
		}
	}
</script>
</html>