<html>
<head>
	<title>API工具集</title>
	<#include "commons/herder.ftl">
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
		<div class="alert alert-success alert-dismissable">
				 <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
				<h4>
					测试! 
				</h4> <strong>API接口</strong> API整合 
			</div>
			<div class="row">
				<#list resultVO.data.apiList as api>
					<div class="col-md-3">
						<div class="thumbnail">
							<img alt="300x200" src="${api.image}" width="100"/>
							<div class="caption">
								<h3>
									${api.name}
								</h3>
								<p>
								 	<a class="btn btn-primary" href="/api-list/details/${api.id?c}">进入</a>
								</p>
							</div>
						</div>
					</div>
				</#list>
			</div>
		</div>
	</div>
</div>
</body>
</html>