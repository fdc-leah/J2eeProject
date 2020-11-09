<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>techconnect:: Connect</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	
	
	
</head>

<style>
	
	body{
		/* background-image: url('images/k2.png');*/
		background-color: #2C3E50;
		
		
	}
	.header{
		/*margin: 32px 70px 32px 0px;*/
		margin-bottom: 40px;
		margin-top:32px;
	}
	.container{
		margin-left: 170px;
		margin-right: 170px;
	}
	.loggedAccount{
		position: absolute;
		top: 62px; 
		margin-left: 660px;
		font-family: montserrat;
		font-size: 20px;
		color: #7F8C8D;
		
		
	}
	.loggedAccount a{
		color: #BDC3C7;
		text-decoration: none;
	}
	
	a:visited { 
		text-decoration: none; 
		color: #BDC3C7;
	}
	a:hover, a:focus, a:active { 
		color: #7F8C8D;
	}
	.categories{
		text-shadow: 2px 2px #6C7A89;
		color: white;
		font-family: kelvetica;
		font-size: 100px;
		font-weight: 5px;
		
	}
	.categories a{
		position: absolute;
		color:white;
		text-decoration: none;
	}
	.categories a:hover{
		color:white; 	
		text-decoration: none;
	}
	.animate {
		height: 170px;
		margin-bottom: 10px;
		border-radius: 0px 140px 140px 0px; 
		opacity: 0.8;
		width: 55%;
		color: #FF0080;
		-webkit-transition: width 1s; 
		transition:width 1s; 	
	
	}
	.animate:hover{
		opacity: 1;
		width: 85%;
		color: #E6E6E6;
	}
	
	.reverse-animate{
		width: 59%;
		height: 170px;
		opacity: 0.8;
		border-radius: 140px 0px 0px 140px; 
		margin-bottom: 10px;
		right: 13.5%;
		position: absolute;
		transition: width 1s;
		
	}
	.reverse-animate:hover{
		opacity: 1;
		width: 70%;
		color: #E6E6E6;
	}
	.internet{
		width: 80%;
		background-color: #19B5FE; 
		margin-top: 190px;
	}
	.gadgets{
		width:63%;
		background-color: #F27935;
	}
	.inventions{
		width: 70%;
		background-color: #663399;  
		margin-top: 190px;
	}
	.updates{
		width: 60%;
		margin-top: 190px;
		background-color: #F22613;
		margin-bottom: 140px;
	}
	.android{
		width:62%;
		background-color: #2ECC71;
	}
	.root{
		background-color: #262626;
		margin-bottom:15px; 
		
	}
	@font-face {
		font-family: montserrat;
		src: url(fonts/Montserrat.ttf);
	}
	@font-face {
		font-family: kelvetica;
		src: url(fonts/kelvetica.otf);
	}
	@font-face {
		font-family: nexab;
		src: url(fonts/nexab.otf);
	}
	
	
</style>

<body>	

	
	<%
		session.setAttribute("replyto", "");	
		session.setAttribute("msg2", "");
		session.setAttribute("msg3", "");
	%>
	<div class="container" style="color:white">
		<div class="header">
			<img src="images/logo1.png" style="width: 200px; ">
			<div class="loggedAccount">Welcome <b style="color:#BDC3C7"><%out.println(session.getAttribute("loggedName")); %></b> !	<a href="logout.jsp" >Logout.</a></div>
		
		</div>
		
		
		<div class="categories">
			<div class="android animate" >
				<img src="images/android.png" style="width: 200px;  margin-top:6.5px;">
				<a href="startThread1.jsp?categoryID=0&categoryName=Android" style="margin-top: -17px; margin-left: -25px"><B>ANDROID<B></a>
			</div>
			
			<div class="reverse-animate" style=" margin-bottom:15px; background-color: #BDC3C7">
				<img src ="images/apple.png" style="margin-left: 30px;width: 138px; margin-top:7px">
				<a  href="startThread1.jsp?categoryID=1&categoryName=IOS"  style="margin-left: 29px; " >IOS</a>
			</div>
			
			<div class="internet animate" >
				<img src ="images/internet.png" style="width: 165px;">
				<a href="startThread1.jsp?categoryID=2&categoryName=Internet"  style="margin-top: 40px;	margin-left: -9px">Internet</a>
				
			</div>
			
			<div class="gadgets reverse-animate"  >
				<img src ="images/gadgets.png" style="margin-left: 50px;width: 220px">
				<a href="startThread1.jsp?categoryID=3&categoryName=Gadgets"  style="margin-left: 10px; " >Gadgets</a>

			</div>
			
			<div class="inventions animate">
				<img src ="images/inventions.png" style="width: 130px; margin-left: 12px;">
				<a href="startThread1.jsp?categoryID=4&categoryName=Inventions">Inventions</a>
				
			</div>
			
			<div class="root reverse-animate" >
				<img src ="images/root.png" style="width: 165px; margin-left:50px">
				<a href="startThread1.jsp?categoryID=5&categoryName=Root">Root</a>
			</div>
			
			<div class="updates animate">
				<img src ="images/updates.png" style="width: 130px; margin-top: 18px; margin-left: 16px">
				<a href="startThread1.jsp?categoryID=6&categoryName=updates" style="position: absolute; margin-top:-20px">tech</a>
				<a href="startThread1.jsp?categoryID=6&categoryName=updates" style="position: absolute; margin-left: 90px ;margin-top: 40px;">updates</a>
			</div>
		</div>	
	</div>
	

</body>
</html>