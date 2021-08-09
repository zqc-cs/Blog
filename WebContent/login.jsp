<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="JavaCode.*" %>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>Login</title>
	<link rel="icon" type="image/png" href="static/images/icon3.png"/>
	<link href="static/css/bootstrap.css" rel='stylesheet' type='text/css' />
	<link href="static/css/style.css" rel='stylesheet' type='text/css' />
    <!--用百度的静态资源库的cdn安装bootstrap环境-->
    <!-- Bootstrap 核心 CSS 文件 -->
    <link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!--font-awesome 核心我CSS 文件-->
    <link href="//cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- 在bootstrap.min.js 之前引入 -->
    <script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
    <!-- Bootstrap 核心 JavaScript 文件 -->
    <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function login() {
		document.loginForm.submit();
	}
</script>
    <link rel="stylesheet" href="static/font-awesome-4.7.0/css/font-awesome.min.css">
    <style type="text/css">
    	body {
		    background: url(../img/carback.jpg) no-repeat;
		    background-size:cover;font-size: 15px;
		}
		/*给表单的边框设置大小,颜色和不透明度*/
		.form {
		    background: rgba(255,255,255,0.9);
		    width:400px;margin:50px auto;
		}
		/*设置字体和大小*/
		label {
		    font-family: Arial;font-size: 15px
		}
		/*当输入正确时,给输入框设置浅绿色*/
		input.form-control:valid{
		    background-color: mintcream;
		}
		/*当输入正确时,给输入框设置浅红色*/
		input.form-control:invalid{
		    background-color: #ffeeed;
		}
		/*设置图标为行内元素，并设置大小和颜色*/
		.fa{
		    display: inline-block;
		    top: 27px;
		    left: 6px;
		    position: relative;
		    color: #575757;
		}
		/*为几个输入框设置padding,防止和图标重合*/
		input[type="text"],input[type="password"],input[type="email"]{
		    padding-left:26px;
		}
		.form-title{
		    padding-top:20px;
		}
		#button{
		    padding-bottom: 50px;
		}
		
    </style>
	
</head>
<body>
<div class="header">  
	<div class="container">
		<div class="logo">
			<a href="index.jsp"><img src="static/images/logo.jpg" title="" /></a>
		</div>
	<!---start-top-nav---->
	<div class="top-menu">
		  <span class="menu"> </span> 
		   <ul>
				<li class="active"><a href="index.jsp">主页</a></li>
				
				<li><a href="about.jsp" style="color: #00AEFF;">关于</a></li>
				
				<li><a href="situation.jsp" style="color: #00AEFF;">形势与政策</a></li>
				<%
					if(session.getAttribute("user") == null) {
				%>
						<li><a href="register.jsp" style="color: #00AEFF;">注册</a> </li>
				<%
					} else {
				%>
						<li><a href="exit.jsp" style="color: #00AEFF;">退出</a> </li>
				<%
					}
				%>
		 </ul>
	 </div>
			 <div class="clearfix"></div>
					<script>
					$("span.menu").click(function(){
					$(".top-menu ul").slideToggle("slow" , function(){
					});
					});
					</script>
				<!---//End-top-nav---->					
	 </div>
</div>
	<div class="container">
    <div class="form row">
        <form name="loginForm" class="form-horizontal col-sm-offset-3 col-md-offset-3" method="POST" >
            <h3 class="form-title">登录</h3>
            <div class="col-sm-9 col-md-9">
                <div class="form-group">
                    <!--        用户名图标和用户名输入框            -->
                    <i class="fa fa-user" aria-hidden="true"></i>
                    <input class="form-control" type="text" name="userid" id="username" placeholder="请输入用户名" required autofocus>
                </div>
                    <!--        密码图标和密码输入框                -->
                <div class="form-group">
                    <i class="fa fa-key" aria-hidden="true"></i>
                    <input class="form-control " type="password" name="password" id="password" placeholder="请输入密码" required>
                </div>
                    <!--        用超链接跳转到注册页面               -->
                <div class="form-group">
                    <br>
                    <a href="register.jsp">没有账号？立即注册</a>
                </div>
                    <!--         登录按钮           -->
                <div class="form-group">
                    <input type="button" value="登录" class="btn btn-success pull-right" onclick="login()">
                </div>

            </div>
        </form>
    </div>
</div>
	<%
		if(request.getParameter("userid") != null && request.getParameter("password") != null) {
			User user = new User();
			user.setuID(request.getParameter("userid"));
			user.setuPassWord(request.getParameter("password"));
			boolean match = DBAccess.login(user);
			if (match) {
				session.setAttribute("user", user);
				response.sendRedirect("index.jsp");
	%>
				<script type="text/javascript">
					alert("登陆成功");
				</script>
	<%
			} else {
				System.out.println("error");
	%>
				<script type="text/javascript">
					alert("登陆失败");
				</script>
	<%
			}
		} 
	%>
</body>
</html>