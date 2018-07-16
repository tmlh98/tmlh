<%@page pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
<title>登录界面</title>
</head>
<script type="text/javascript" src="static/js/jquery-3.2.1.min.js"></script>
<body>
	<div class="login-content">
		<div class="login-title">
			<h1>登录</h1>
		</div>
		<div class="login">
			<form>
				<div>

					<input type="text" id="user_input_verifyCode"
						name="user_input_verifyCode" placeholder="验证码" maxlength="4">

					<span class="code_img"> <img
						src="${pageContext.request.contextPath }/login/getVerifyCode"
						width="110" height="40" id="verifyCodeImage">

					</span> <span> <a id="changeVerifImageRegister"
						onclick="javascript:changeImage();">换一张</a>

					</span>

				</div>

				<input id="submit" type="button" value="登录" onclick="login()">

			</form>
		</div>

	</div>

	<script type="text/javascript">
		function genTimestamp() {

			var time = new Date();

			return time.getTime();
		}
		function changeImage() {
			$('#verifyCodeImage').attr(
					'src',
					'${pageContext.request.contextPath }/login/getVerifyCode?timestamp='
							+ genTimestamp());

		}
		//登录，目前只检测验证码
		function login() {
			var user_input_verifyCode = $("#user_input_verifyCode").val();
			$.ajax({
				type : 'post',
				url : "${pageContext.request.contextPath}/login/login",
				data : {
					verifyCode : user_input_verifyCode
				},
				//dataType : "json",

				success : function(data) {
					if(data){
						alert("查询成功");
						
					}else{
						
						alert("查询失败");
					}
				},
				error : function() {
					alert("查询失败");
				}

			});

		}
	</script>

</body>

</html>
