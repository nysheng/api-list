<html>
<head>
	<title>历史上的今天</title>
	<#include "../commons/herder.ftl">
</head>
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
					查询结果：${resultVO.data.result.data?size}
				</h2>
				<#list resultVO.data.result.data as d>
				<p>
					${d.year?c}年${resultVO.data.result.month}月${resultVO.data.result.day}日：
				</p>
				<p>
					<a href="${d.link}"> ${d.title} </a>
				</p><hr/>
				</#list>
				
			</div>
		</div>
		<div class="col-md-2 column">
		</div>
	</div>
</div>
</body>
</html>