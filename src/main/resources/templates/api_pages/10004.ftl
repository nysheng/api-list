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
				<p>GCJ-02火星坐标系：</p>
				<p id="gcj-lng">经度：</p>
				<p id="gcj-lat">纬度：</p>
				<hr/>
				<p>BD09百度坐标系：</p>
				<p id="bd09-lng">经度：</p>
				<p id="bd09-lat">纬度：</p>
				<hr/>
				<a id="url"></a>
				<p id="address">地址：</p>
				<p id="ip">IP：</p>
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
		if(result.status==1){
			$("#gcj-lng").append(result.gcj.lng);
			$("#gcj-lat").append(result.gcj.lat);
			$("#bd09-lng").append(result.gcj.lng);
			$("#bd09-lat").append(result.gcj.lat);
			$("#url").append('<button type="button" class="btn btn-primary">查看地图</button>').attr("href",result.url);
			$("#address").append(result.address);
			$("#ip").append(result.ip);
		}
	}
</script>
</html>