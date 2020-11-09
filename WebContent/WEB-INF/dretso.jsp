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
		background-image: url('images/k2.png');
		
	}
	.header{
		margin: 32px 70px 32px 70px;
	}
	.container{
		margin-left: 70px;
		margin-right: 70px;
	}
	.loggedAccount{
		position: absolute;
		top: 62px; 
		margin-left: 833px;
		font-family: montserrat;
		font-size: 20px;
		color: #D4A34F;
		
		
	}
	.loggedAccount a{
		color: white;
		text-decoration: none;
	}
	.loggedAccount a:visited{
		color:white;
	}
	.categories{
		margin-left: 100px;
		color: white;
		font-family: kalinga;
	}
	.categories a{
		color:white;
		text-decoration: none;
	}
	.categories a:hover{
		color:white; 	
	}
	
	
	@font-face {
		font-family: montserrat;
		src: url(fonts/Montserrat.ttf);
	}
	@font-face {
		font-family: kalinga;
		src: url(fonts/kalinga.ttf);
	}
	
	
</style>

<body>	

	<div class="header">
		<img src="images/logo1.png" style="width: 200px; ">
		<div class="loggedAccount">Welcome <b style="color: #79BCFF"><%out.println(session.getAttribute("loggedName")); %></b> !	<a href="logout.jsp">Logout.</a></div>
	
	</div>
	
	
	
</body>
</html>


















