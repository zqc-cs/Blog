<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="JavaCode.*" %>
<!DOCTYPE HTML>
<html>
<head>
	
	<title>Blog-ZQC</title>
	<link rel="icon" type="image/png" href="static/images/icon3.png"/>
	<link href="static/css/bootstrap.css" rel='stylesheet' type='text/css' />
	<link href="static/css/style.css" rel='stylesheet' type='text/css' />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="Personal Blog Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" 
	/>
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!----webfonts---->
		<link href='http://fonts.googleapis.com/css?family=Oswald:100,400,300,700' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,300italic' rel='stylesheet' type='text/css'>
		<!----//webfonts---->
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
<!--
	<script type="text/javascript" src="static/js/background.js"></script>
	-->

	

<!---header---->		
<div class="header">  
	 <div class="container">
		  <div class="logo">
			  <a href="index.jsp"><img src="static/images/logo.jpg" title="" /></a>
		  </div>
			 <!---start-top-nav---->
			 <div class="top-menu">
				  <span class="menu"> </span> 
				   <ul>
						<li class="active"><a href="index.jsp">??????</a></li>
						
						<li><a href="about.jsp" style="color: #00AEFF;">??????</a></li>
						
						<li><a href="situation.jsp" style="color: #00AEFF;">???????????????</a></li>
						<li><a href="post.jsp" style="color: #00AEFF;">????????????</a></li>
						<%
							if(session.getAttribute("user") == null) {
						%>
								<li><a href="register.jsp" style="color: #00AEFF;">??????</a> </li>
								<li><a href="login.jsp" style="color: #00AEFF;">??????</a> </li>
						<%
							} else {
						%>
								<li><a href="exit.jsp" style="color: #00AEFF;">??????</a> </li>
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
<!--/header-->
<div class="content">
	 <div class="container">
		 <div class="content-grids">
			 <div class="col-md-8 content-main">
				 <div class="content-grid">	 
					 <div class="content-grid-info">
						 <img src="static/images/post1.jpg" alt=""/>
						 <div class="post-info">
						 <h4><a href="/single.html">???????????????</a>2020.9.12</h4>
						 <p>????????????????????????????????????</p>
						 <a href="/single.html"><span></span>??????</a>
						 </div>
					 </div>
					 <%
					 	try {
					 		ResultSet resultSet = DBAccess.pageOverview();
						 	if (resultSet != null) {
							 	while(resultSet.next()) {
							 		System.out.println("ok");
							 		%>
							 		<div class="content-grid-info">
								 	<div class="post-info">
								 	<h4><a href="<%=resultSet.getString(1) %>"><%=resultSet.getString(2) %></a><%=resultSet.getString(3) %></h4>
								 	<p><%=resultSet.getString(4) %></p>
								 	<a href="<%=resultSet.getString(1) %>"><span></span>??????</a>
								 	</div>
								 </div>
								 	<% 
							 	}
						 	}
						 	resultSet.close();
					 	} catch(Exception e) {
					 		e.printStackTrace();
					 	}
								
					 %>
					 <!--
					 <div class="content-grid-info">
					 	<img src="static/images/post2.jpg" alt=""/>
					 	<div class="post-info">
					 	<h4><a href="/temp.html">??????</a>2020.9.14</h4>
					 	<p>...</p>
					 	<a href=/temp.html"><span></span>??????</a>
					 	</div>
					 </div>
					 <div class="content-grid-info">
					 	<img src="static/images/post3.jpg" alt=""/>
					 	<div class="post-info">
					 	<h4><a href="/3.html">?????????????????????</a>2020.10.11</h4>
					 	<p>????????????...</p>
					 	<a href="/3.html"><span></span>??????</a>
					 	</div>
					 </div>
					 <div class="content-grid-info">
					 	
					 	<div class="post-info">
					 	<h4><a href="https://www.macbl.com/?utm_source=appdmg&utm_medium=webloc">Mac???????????????????????????</a>2020.10.11</h4>
					 	<p>??????...</p>
					 	<a href="https://www.macbl.com/?utm_source=appdmg&utm_medium=webloc"><span></span>??????</a>
					 	</div>
					 </div>
					 -->
				 </div>
				 
			  </div>
			  <div class="col-md-4 content-right">
				 <div class="recent">
					 <h3 style="font-size: 30px;">????????????</h3>
					 <ul>
					<!-- ??????li???????????????????????? -->
					 <li><a href="/single.html" style="font-size: 20px; color: #00AEFF;">????????????</a></li>
					 <li><a href="/temp.html" style="font-size: 20px; color: #00AEFF;">??????</a></li>
					 <li><a href="/3.html" style="font-size: 20px; color: #00AEFF;">???????????????</a></li>
					 <li><a href="https://www.macbl.com/?utm_source=appdmg&utm_medium=webloc" style="font-size: 20px; color: #00AEFF;">Mac??????????????????</a></li>
					 </ul>
				 </div>
				 <div class="clearfix"></div>
				 
				 <div class="clearfix"></div>
			  </div>
			  <div class="clearfix"></div>
		  </div>
	  </div>
</div>
<!---->


</body>

</html>
