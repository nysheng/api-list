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
                	<button type="button" class="btn btn-primary">无限制</button>
                	<button type="button" class="btn btn-primary">支持HTTPS</button>                
                </div>
			</div>
			<hr/>
			<div class="jumbotron">
				<h2>
					查询结果：
				</h2>
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
			$(".jumbotron h2").append(result.data.length);
			var month=result.month;
			var day=result.day;
			$.each(result.data,function(index,item){
				var p1=$("<p></p>").append(item.year+"年"+month+"月"+day+"日");
				var a=$("<a></a>").append(item.title).attr("href",item.link);
				var p2=$("<p></p>").append(a);
				$(".jumbotron").append(p1).append(p2).append("<hr/>");
			});
		}
	}
</script>
</html>