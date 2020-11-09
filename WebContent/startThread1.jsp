<%@page import="java.util.Date"%>
<%@page import="com.igot.models.MainThread"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.igot.jdbc.connectionFINAL"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>techconnect:: Threads</title>

<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
		<script>
		$(document).ready(function(){
			 $("#startThread").click(function(){
				 $("#source-modal").removeClass("hide");
				 $("#source-modal").show();
			 });
			 $("#close2").click(function(){
				 $("#msg").addClass("hide");
				 $("#msg").hide();
			 });
			 $("#finishExam").click(function(){	//finishing exam
		   		    
				 $("#source-modal").addClass("hide");	
				 $("#source-modal").hide();
				   
			});
			 $("#close1").click(function(){	//finishing exam
		   		    
				 $("#source-modal").addClass("hide");	
				 $("#source-modal").hide();
				   
			});
			 $("#close").click(function(){	//finishing exam
		   		    
				    $("#source-modal").addClass("hide");	
				    $("#source-modal").hide();
				   
			});
			 
		});
		</script>
</head>

<style>
	
	body{
		/*background-image: url('images/k2.png');*/
		background-color: #2C3E50;
		
	}
	.header{
		/*margin: 32px 70px 32px 0px;*/
		margin-bottom: 40px;
		margin-top:32px;
	}
	.container{
		margin-left: 130px;
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
	.hide{
			display: none;
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

	
	<div class="container">
	
		<div class="header">
			<img src="images/logo1.png" style="width: 200px; ">
			<div class="loggedAccount">Welcome <b style="color:#BDC3C7"><%out.println(session.getAttribute("loggedName")); %></b> !	<a href="logout.jsp" >Logout.</a></div>
		
		</div>
		<%	
			session.setAttribute("replyto", "");
			session.setAttribute("msg3", "");
			String categoryName="";
			int categoryID = -1;
			//try{
				//categoryName = session.getAttribute("categoryName").toString();
				//categoryID = Integer.parseInt(session.getAttribute("categoryID").toString());
					
			//}catch(Exception e){
				try{
					categoryName = request.getParameter("categoryName");
					categoryID = Integer.parseInt(request.getParameter("categoryID"));
					if(categoryName == null){
						categoryName = session.getAttribute("categoryName").toString();
						categoryID = Integer.parseInt(session.getAttribute("categoryID").toString());
					}
					session.setAttribute("categoryName", categoryName);
								
					session.setAttribute("categoryID", categoryID);
				}catch(Exception e){
					categoryName = session.getAttribute("categoryName").toString();
					categoryID = Integer.parseInt(session.getAttribute("categoryID").toString());
				}
			//}
			
		%>
		<ul class="breadcrumb" style="width: 1070px">
		  <li><a href="threads.jsp">Categories</a></li>
		  <li class="active"><%out.println(categoryName);%></li>
		</ul>

		<%
			try{
				String mg = session.getAttribute("msg2").toString();
				String alert = session.getAttribute("alerttype").toString();
				
				if(!mg.isEmpty()){
				%>
				<div id="msg" class="alert alert-dismissable alert-<%out.println(alert);%>" style="width: 400px">
				  <button type="button" class="close" data-dismiss="alert" id="close2">×</button>
				 <%out.println(mg); %>
				</div>
				<%
				}
			} catch(Exception e){
				
			}
		%>
		
		
		<a href="#" id="startThread" style="width: 1070px; font-family: kelvetica; font-size:35px; text-shadow: 2px 2px #6C7A89;'"class="btn btn-default btn-lg btn-block">Start a Thread!</a>
		
		
		
		<div id="source-modal" class="hide modal fade in" style="display: block; background-image: url('images/modalBg.png');" aria-hidden="false">
								
			<div class="modal-dialog modal-lg" style="margin-top: 130px; width:515px">
								    
				<div class="modal-content" style="width: 515px">
				  	<div class="modal-header">
				  		<button id="close" class="close" aria-hidden="true" data-dismiss="modal" type="button"> x </button>
				       	<h3 class="modal-title"><b>Create a discussion!</b></h3>
				   	</div>
				   	<form action="" method ="post">
						<div class="modal-body">
														
							Title: <input type="text" class="form-control" id="inputDefault" name="newThread_title">
	  						<br>
	  						Description: <textarea maxlength="250" class="form-control" rows="3" id="textArea" name="newThread_desc"></textarea>
							      		
						</div>
	
						<div class="modal-footer">
							<button id="close1" type="button"  class="btn btn-default" style="color: #2c3e50;">Cancel</button>
							<button type="submit" class="btn btn-primary" >Create Thread</button>
						</div>
					</form>
					<%
						try{
							String title = request.getParameter("newThread_title");
							String desc = request.getParameter("newThread_desc");
							
							if(title.isEmpty()){
								session.setAttribute("msg2", "<strong>FAILED. </strong>Please supply a Title");
								session.setAttribute("alerttype","danger");
							} else{
								connectionFINAL sd = new connectionFINAL();
								String username = session.getAttribute("loggedUsername").toString();
								Date d = new java.util.Date();
								
								session.setAttribute("alerttype",sd.addMainThread(categoryID, title, desc,d.toString(),username));
								String unsa = session.getAttribute("alerttype").toString();
								
								System.out.println("unsa: "+unsa);
								
								if(unsa.equals("success")){
									session.setAttribute("msg2", "<strong>SUCCESS! </strong>Start your thread now.");
									
								} else{
									session.setAttribute("msg2", "<strong>FAILED. </strong>There was an error");
								}
								response.sendRedirect("startThread1.jsp?categoryID="+categoryID+"&categoryName="+categoryName);
							}
						}catch(Exception e){
							
						}
					
					%>
				</div>	
								   

								    
			</div>	
		</div>
		
		
		
		<!--===================================================================================================-->
		
		
		<br>
		<br>
		<table class="table table-striped table-hover" style="width: 1070px; margin-bottom: 110px;">
			<tbody >
			
				<%
					connectionFINAL cf = new connectionFINAL();
					
					ArrayList<MainThread> mk = new ArrayList<MainThread>();
					
					
					mk = cf.getMainThread(categoryID);
					
					for(int km=0;km<mk.size();km++){
						MainThread thread = mk.get(km);
						
						if(km%2!=0){
							out.println("<tr style=\"background-color: #ecf0f1;\">");
						} else{
							out.println("<tr>");
						}
						
					%>
							<td style="width: 240px">
								<%out.println(thread.getDateStarted()); %>
								<% out.println("Started by: <strong>"+thread.getUsername().toString()+"</strong>"); %>		
					
							</td>
							<td>
								<span class="badge" style="float: right;"><%=cf.getSubThreadCount(categoryID,Integer.parseInt(thread.getMthreadID())) %></span>
								<%			
									out.println("<b style=\"font-size: 25px; \">"+thread.getTitle()+"</b><br>");
									out.println(thread.getDescription());
								 %>
								
							</td>
							
							<td style="width: 120px;">
							
								<a href="startThread.jsp?threadID=<%=thread.getMthreadID() %>" style="margin-left: 5px; margin-top: 10px" class="btn btn-primary">Join</a>
								
							</td>
						<%
					}
					
				%>
			
			
			</tbody>
			
		</table>
		
		
		
	</div>
	
	
	
	

</body>
</html>




















