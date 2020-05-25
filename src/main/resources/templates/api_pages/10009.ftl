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
				<!--隐藏文本域，用于单击复制的实现-->
				<textarea id="inputBox" style="position: absolute;top: 0;left: 0;opacity: 0;z-index: -10;"></textarea>
				
				<h4>
					加密方式：<span id="type"></span >
				</h4>
				<hr/>
				<h4>
					加密内容：<span id="content"></span>
				</h4>
				<hr/>
				<h4>
					加密结果：<a title="单击复制" href="javascript:copytext('encrypt');"><span id="encrypt"></span></a>
				</h4>
				<hr/>
			</div>
		</div>
		<div class="col-md-2 column">
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	$(function(){
		$("input[name='type']").attr("placeholder","支持 md5 sha1 sha256 sha512 urlencode urldecode base64_encode,base64_decode 默认为md5");
		$("input[name='content']").attr("placeholder","需要加密的内容");
	});
	//1、输入完参数后，点击开始，直接去发送ajax请求，获取json信息
	$("#start").click(function(){
		$("#type").html("");
		$("#content").html("");
		$("#encrypt").html("");
		getApiList();
	});
	//2、发送请求
	function getApiList(){
		if($("input[name='type']").val()==""){
			$("input[name='type']").val("md5");
		}
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
			$("#type").html(result.data.type);
			$("#content").html(result.data.content);
			$("#encrypt").html(result.data.encrypt);
		}
	}
	//4、单击复制
	function copytext(element){
        var text = document.getElementById(element).innerText;
        var copyBox = document.getElementById('inputBox');
        copyBox.value = text;
        copyBox.select();
        document.execCommand('copy');
	}
</script>
</html>