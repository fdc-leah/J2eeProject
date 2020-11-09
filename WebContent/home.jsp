<!DOCTYPE html>

<%@page import="java.io.Writer"%>
<%@page import="com.igot.jdbc.*"%>
<html>
<head>

<title>techconnect::</title>
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/component.css" />
<link rel="stylesheet" type="text/css" href="css/content.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<script src="js/modernizr.custom.js"></script>
</head>
<style>
body {
	background-image: url("images/k2.png");
	background-size: 100%;
	
	
	 @font-face {
		font-family: itclight;
		src: url(fonts/itclight.ttf);
	}
	
	@font-face {
		font-family: montserrat;
		src: url(fonts/montserrat.ttf);
	}
}
</style>
<body>

	<%
		try{
			
			if(!session.getAttribute("loggedUsername").toString().isEmpty()){
				response.sendRedirect("threads.jsp");
			}
			
		}catch(Exception e){
			
		}
	
	%>
	<img src="images/logo1.png"
		style="width: 460px; margin-top: 25px; margin-left: 37px;">

	<div class="container"
		style="margin: 0 auto; margin-top: 90px; width: 530px">
			
		
			<%
				
				
				try{
					String msg = session.getAttribute("msg").toString();
					if(msg!=null){
						%>
						<div class="message" style="background-color:#BDC3C7; border-radius: 5px 5px 5px 5px; opacity: 0.7;padding: 5px 9px 5px 9px;">
							<% out.println(msg); %>
						</div>
						<%	
					} 
							
				}catch(Exception e){
					
				}
			%>
	
		
		<div class="morph-button morph-button-modal morph-button-modal-2 morph-button-fixed" style="margin-right: 70px;">
			<button type="button" style="margin-bottom: -20px; background-color: #F39C12; height: 110px;  border-radius: 15px 15px 15px 15px; color: white; font-size: 28px; ">Login</button>
			<div class="morph-content" style="background-color: #ededed; border-radius: 10px 10px 10px 10px">
				<div>
					<div class="content-style-form content-style-form-1">
						<span class="icon icon-close">Close the dialog</span>
						<h2 style="margin-bottom: 20px;"><b>Login</b></h2>
						<form action="" method="post">	
							<center>
								<label>Username</label>
								<input type="text" name="username" style="width: 244px; font-size:27px; padding: 7px; border-radius: 5px"/><br><br>
							
								<label>Password</label>
								<input type="password" name="password"  style="width: 244px; font-size: 27px; padding: 7px; border-radius: 5px "/>
							
							<br><br>
							<p>
							
								<input class="btn btn-primary btn-sm" type="submit"name="submit" value="Login" style="font-size: 15px;" />
							</center>
							
							
							<%
									try{
										connectionFINAL cf = new connectionFINAL();
										
										String username = request.getParameter("username");
										String password = request.getParameter("password");
										
									
											String rsult = cf.checkStudent(username,password)+"";
											
											if(!rsult.isEmpty()){
												session.setAttribute("loggedUsername", username);
												session.setAttribute("loggedName", rsult);
												response.sendRedirect("threads.jsp");
											}else{
												session.setAttribute("msg", "Invalid Username/Password");
											}
										
									}catch(Exception e){
									
									}
						
							
								%>
						</form>				
					</div>
				</div>
			</div>
		</div>
		<!-- morph-button -->
		<div
			class="morph-button morph-button-modal morph-button-modal-3 morph-button-fixed"
			style="margin-left: -6px">
			<button type="button"
				style="background-color: #F1C40F; height: 110px; border-radius: 15px 15px 15px 15px; color: #1C1C1C; font-size: 28px; ">Sign Up</button>
			<div class="morph-content"
				style="background-color: #ededed; border-radius: 10px 10px 10px 10px; height: 583px; margin-top: -287px;">
				<div>
					<div class="content-style-form content-style-form-2">
						<span class="icon icon-close">Close the dialog</span>
						<h2><b>Sign Up</b></h2>
						<form method="post" action="signup">
							<p>
								<label>First Name</label><input style="font-size: 16px;"
									id="inputDefault" class="form-control" type="text" name="fn" />
							</p>
							<p>
								<label>Last Name</label><input style="font-size: 16px"
									id="inputDefault" class="form-control" type="text" name="ln" />
							</p>
							
							<p>
								<label>Username</label><input style="font-size: 16px"
									id="inputDefault" class="form-control" type="text" name="username" />
							</p>
							<p>
								<label>Password</label><input style="font-size: 16px"
									id="inputDefault" class="form-control" type="password"
									name="password" />
							</p>
							<p>
								<label>Repeat Password</label><input style="font-size: 16px"
									id="inputDefault" class="form-control" type="password"
									name="rpassword" />
							</p>

							<br>
							<p>
							<center>
								<input class="btn btn-primary btn-sm" type="submit"
									name="submit" value="Sign Up"/>
							</center>
							</p>
							
						</form>
						
						
					</div>
				</div>
			</div>
		</div><!-- morph-button -->
		
		
		


	</div>




</body>
<script src="js/classie.js"></script>
<script src="js/uiMorphingButton_fixed.js"></script>
<script>
	(function() {
		var docElem = window.document.documentElement, didScroll, scrollPosition;

		// trick to prevent scrolling when opening/closing button
		function noScrollFn() {
			window.scrollTo(scrollPosition ? scrollPosition.x : 0,
					scrollPosition ? scrollPosition.y : 0);
		}

		function noScroll() {
			window.removeEventListener('scroll', scrollHandler);
			window.addEventListener('scroll', noScrollFn);
		}

		function scrollFn() {
			window.addEventListener('scroll', scrollHandler);
		}

		function canScroll() {
			window.removeEventListener('scroll', noScrollFn);
			scrollFn();
		}

		function scrollHandler() {
			if (!didScroll) {
				didScroll = true;
				setTimeout(function() {
					scrollPage();
				}, 60);
			}
		}
		;

		function scrollPage() {
			scrollPosition = {
				x : window.pageXOffset || docElem.scrollLeft,
				y : window.pageYOffset || docElem.scrollTop
			};
			didScroll = false;
		}
		;

		scrollFn();

		[].slice.call(document.querySelectorAll('.morph-button')).forEach(
				function(bttn) {
					new UIMorphingButton(bttn, {
						closeEl : '.icon-close',
						onBeforeOpen : function() {
							// don't allow to scroll
							noScroll();
						},
						onAfterOpen : function() {
							// can scroll again
							canScroll();
						},
						onBeforeClose : function() {
							// don't allow to scroll
							noScroll();
						},
						onAfterClose : function() {
							// can scroll again
							canScroll();
						}
					});
				});

		// for demo purposes only
		[].slice.call(document.querySelectorAll('form button')).forEach(
				function(bttn) {
					bttn.addEventListener('click', function(ev) {
						ev.preventD"WebContent/index.jsp"efault();
					});
				});
	})();
</script>
</html>