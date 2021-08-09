<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<title><%=request.getAttribute("ptitle") %></title>
	<link href="static/css/bootstrap.css" rel='stylesheet' type='text/css' />
	<link href="static/css/style.css" rel='stylesheet' type='text/css' />
	<link rel="icon" type="image/png" href="static/images/icon3.png"/>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<link href='http://fonts.googleapis.com/css?family=Oswald:100,400,300,700' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,300italic' rel='stylesheet' type='text/css'>
		  <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
		<!--end slider -->
		<!--script-->
<script type="text/javascript" src="static/js/move-top.js"></script>
<script type="text/javascript" src="static/js/easing.js"></script>
<!--/script-->
<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},900);
				});
			});
</script>
<!---->

</head>
<body>
	
	<script type="text/javascript" src="static/js/background.js"></script>
	
<!---header---->			
<div class="header">  
	 <div class="container">
		  <div class="logo">
			  <a href="/index.jsp"><img src="static/images/logo.jpg" title="" /></a>
		  </div>
			 <!---start-top-nav---->
			 <div class="top-menu">
				 
				  <span class="menu"> </span> 
				   <ul>
						<li class="active"><a href="/index.jsp">主页</a></li>
						<div class="clearfix"> </div>
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
<!--/header-->
<div class="single">
	 <div class="container">
		  <div class="col-md-8 single-main">				 
			  <div class="single-grid">
					<%=request.getAttribute("content") %>
			  </div>
			 <ul class="comment-list">
		  		   <h5 class="post-author_head">Written by <%=request.getAttribute("author") %><a href="#" title="Posts by admin" rel="author">admin</a></h5>
		  		   <li><img src="static/images/avatar.png" class="img-responsive" alt="">
		  		   <div class="desc">
		  		   </div>
		  		   <div class="clearfix"></div>
		  		   </li>
		  	  </ul>
		  </div>
	  </div>
</div>
<!---->
</body>
</html>


	


