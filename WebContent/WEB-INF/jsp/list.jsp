<%@page  pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <title>layui在线调试</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">
  <style>
    body{margin: 10px;}
    .demo-carousel{height: 200px; line-height: 200px; text-align: center;}
  </style>
</head>
<body>
 
 <div class="layui-container">
  <div class="layui-row layui-col-md-offset2">
    	<button id="addBtn" class="layui-btn layui-btn-warm">新增</button>
 
		<table class="layui-hide" id="test" lay-filter="demo"></table>
  </div>
</div>
 
 
 
 
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
 

  
<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js" charset="utf-8"></script>
<script>
 
layui.use(['laydate', 'laypage', 'layer', 'table'], function(){
  var laydate = layui.laydate //日期
  ,laypage = layui.laypage //分页
  layer = layui.layer //弹层
  ,table = layui.table //表格
  ,element = layui.element,//元素操作
  $ = layui.jquery; 
  
  //执行一个 table 实例
  table.render({
    elem: '#test'
    ,height: "480"
    ,url: 'listData' //数据接口
    ,page: true //开启分页
    ,cols: [[ //表头
      {field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
      ,{field: 'username', title: '用户名', width:80}
      ,{field: 'sex', title: '性别', width:80, sort: true}
      ,{field: 'sign', title: '签名', width: 170}
      ,{field: 'classify', title: '职业', width: 80}
      ,{fixed: 'right', width: 165, align:'center', toolbar: '#barDemo'}
    ]]
  });
  
  //监听工具条
  table.on('tool(demo)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
    var data = obj.data //获得当前行数据
    ,layEvent = obj.event; //获得 lay-event 对应的值
    if(layEvent === 'del'){
      layer.confirm('真的删除行么', function(index){
        obj.del(); //删除对应行（tr）的DOM结构
        layer.close(index);
        //向服务端发送删除指令
        $.post("deleteUser",data,function(msg){
	    	if(msg.code == 100){
	    		layer.msg("删除成功!", {time:1000, icon:6, shift:6});
	   		}else{
	   			layer.msg("删除失败!", {time:1000, icon:5, shift:6});
	   		}
	    });
      });
    } else if(layEvent === 'edit'){
      layer.msg('编辑操作');
    }
  });
  
  
  
  
  //分页
  laypage.render({
    elem: 'pageDemo' //分页容器的id
    ,count: 100 //总页数
    ,skin: '#1E9FFF' //自定义选中色值
    //,skip: true //开启跳页
    ,jump: function(obj, first){
      if(!first){
        layer.msg('第'+ obj.curr +'页');
      }
    }
  });
  $("#addBtn").click(function(){
	  layer.open({
		  type: 2, 
		  content: ['add', 'no'], //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以
		  area: ['500px', '500px']
		}); 
  });
  
});
  
</script>
</body>
</html>      