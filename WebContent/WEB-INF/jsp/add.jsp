<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>layui</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
 

<div class="layui-row">
 
<form class="layui-form">
 



  <div class="layui-form-item">
    <label class="layui-form-label">用户名</label>
    <div class="layui-input-inline">
      <input type="text" name="username"  required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">单选框</label>
    <div class="layui-input-block">
      <input type="radio" name="sex" value="男" title="男">
      <input type="radio" name="sex" value="女" title="女" checked>
    </div>
  </div>
  
 
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">签名</label>
    <div class="layui-input-inline">
      <textarea name=sign placeholder="请输入内容" class="layui-textarea"></textarea>
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">职业</label>
    <div class="layui-input-inline">
      <input type="text" name="classify"  required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
    </div>
  </div>
 
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
 </div>
</form>

<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<script>
 
layui.use('form', function(){
	  var form = layui.form,
	  		$ = layui.jquery;
	  
	  //监听提交
	  form.on('submit(formDemo)', function(data){
	   
	   $.post("addUser",data.field,function(msg){
	    	if(msg.code == 100){
   			 parent.window.location.reload(); 
	   		}else{
	   			layer.msg("新增失败!", {time:1000, icon:5, shift:6});
	   		}
	    });
	    return false;
	  });
	});
</script>
</body>
</html>