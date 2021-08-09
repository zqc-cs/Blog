<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="JavaCode.*" %>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>post</title>
<!--用百度的静态资源库的cdn安装bootstrap环境-->
    <!-- Bootstrap 核心 CSS 文件 -->
    <link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!--font-awesome 核心我CSS 文件-->
    <link href="//cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- 在bootstrap.min.js 之前引入 -->
    <script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
    <!-- Bootstrap 核心 JavaScript 文件 -->
    <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="ueditor/ueditor.config.js"></script>  
<script type="text/javascript" src="ueditor/ueditor.all.js"></script>  
<link rel="stylesheet" href="ueditor/themes/default/css/ueditor.css"> 
<script type="text/javascript" charset="utf-8"  
    src="ueditor/lang/zh-cn/zh-cn.js"></script>  
</head>
<link rel="stylesheet" href="static/font-awesome-4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
	function post() {
		document.postForm.submit();
	}
</script>
<body>
 <script type="text/javascript">  
        var ue = UE.getEditor("container"); 
  </script>
  <div class="container">
    <div class="form row">
        <form name="postForm" class="form-horizontal col-sm-offset-3 col-md-offset-3" method="POST" >
            <h3 class="form-title">发布</h3>
            <div class="col-sm-9 col-md-9">
            	<div class="form-group">
            		<input class="form-control" type="text" name="purl" placeholder="请输入url" required autofocus>
            	</div>
            	<div class="form-group">
            		<input class="form-control" type="text" name="ptitle" placeholder="请输入标题" required autofocus>
            	</div>
            	<div class="form-group">
            		<input class="form-control" type="text" name="pintro" placeholder="请输入简介" required autofocus>
            	</div>
                <div class="form-group">
                    <textarea id="container" name="ptext" placeholder="请输入帖子正文内容" style="width: 720px; height: 400px; margin: 0 auto;"></textarea> 
                </div>
                <div class="form-group">
                	<input type="button" value="发布" class="btn btn-success pull-right" onclick="post()" />
                </div>
            </div>
        </form>
    </div>
</div>
	<%
		if(request.getParameter("purl") != null && request.getParameter("ptitle") != null && request.getParameter("pintro") != null && request.getParameter("ptext") != null) {
			if (session.getAttribute("user") != null) {
				
				Page newPage = new Page(request.getParameter("purl"), request.getParameter("ptitle"), request.getParameter("pintro"), request.getParameter("ptext"), ((User)session.getAttribute("user")).getuID(), "2021.3.19");
				newPage.setpUrl("/Blog/page/" + newPage.getpUrl());
				boolean succ = DBAccess.post(newPage);
				if (succ) {
					User user = (User)session.getAttribute("user");
					if(user.getuPagesSet() == null || user.getuPagesSet() == "null") {
						user.setuPagesSet(newPage.getpUrl());
					} else {
						user.setuPagesSet(user.getuPagesSet() + "#*#" + newPage.getpUrl());
					}
					user.setuPageNum(user.getuPageNum() + 1);
					if(DBAccess.updateUser(user)) {
						response.sendRedirect(newPage.getpUrl());
					} else {
						%>
						<script type="text/javascript">
							alert("发布失败");
						</script>
						<%
					}
				} else {
					%>
					<script type="text/javascript">
						alert("发布失败");
					</script>
					<%
				}
			} else {
				%>
				<script type="text/javascript">
					alert("请登录");
				</script>
				<%
				response.sendRedirect("login.jsp");
			}
		}
	%>
</body>
</html>