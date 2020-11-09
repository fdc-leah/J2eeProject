<%@page import="java.util.Date"%>
<%@page import="com.igot.models.SubThread"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.igot.jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>techconnect:: Connect</title>

<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
		<script>
		$(document).ready(function(){
			 $("#reply").click(function(){
				 $("#source-modal2").removeClass("hide");
				 $("#source-modal2").show();
			 });
			 $("#close2").click(function(){
				 $("#msg").addClass("hide");
				 $("#msg").hide();
			 });
			 $("#connect").click(function(){	//finishing exam
		   		    
				 $("#source-modal").removeClass("hide");	
				 $("#source-modal").show();
				   
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
			session.setAttribute("msg2", "");
			String categoryName="";
			int categoryID = -1;
		
			categoryName = session.getAttribute("categoryName").toString();
			categoryID = Integer.parseInt(session.getAttribute("categoryID").toString());
			String threadID = request.getParameter("threadID");
			
			String threadTitle = "";
			
			try{
				connectionFINAL cf = new connectionFINAL();
			
			 threadTitle = cf.getThreadTitle(Integer.parseInt(threadID),categoryID).toString();
			
			}catch(Exception e){
				System.out.println("!> startThread.jsp: "+e.toString());
			}
			
		%>
		<ul class="breadcrumb" style="width: 1070px">
		  <li><a href="threads.jsp">Categories</a></li>
		  
		   <li><%out.println("<a href=\"startThread1.jsp?categoryID="+categoryID+"&categoryName="+categoryName+"\">"+categoryName+"</a>");%></li> 
		  <li class="active"><% out.println(threadTitle);%></li>
		</ul>
						
		<%
			try{
				String mg = session.getAttribute("msg3").toString();
				String alert = session.getAttribute("alerttype3").toString();
				if(!mg.isEmpty() && !mg.contains("exception")){
				%>
				<div id="msg" class="alert alert-dismissable alert-<%out.println(alert);%>" style="width: 400px">
				  <button type="button" class="close" data-dismiss="alert" id="close2" onclick="">×</button>
				  <%out.println(mg); %>
				</div>
				<%
				}
			} catch(Exception e){
				
			}
		%>
		
		<!--===================================================================================================-->
		
		
		<br>
		<br>
		<table class="table table-striped table-hover" style="width: 1070px; margin-bottom: 15px;">
			<tbody >
			
				<%
					connectionFINAL cf = new connectionFINAL();
					
					ArrayList<SubThread> mk = new ArrayList<SubThread>();
				
					ArrayList<String>arr = new ArrayList<String>();
					
					mk = cf.getSubThread(Integer.parseInt(threadID),categoryID);
					
					
					
					
					for(int km=0;km<mk.size();km++){
						SubThread thread = mk.get(km);
						
						arr.add(thread.getSender());
						
						if(km%2!=0){
							out.println("<tr style=\"background-color: #ecf0f1;\">");
						} else{
							out.println("<tr>");
						}
						
					%>
					<!-- 	<form action="reply" method="get"> -->
							<td style="width: 130px">
								<img src="images/man.png">
							</td>
							<td style="width: 150px;">
								<input type="text" value = "<%=thread.getSender()%>&&<%=threadID %>" name="replyto" style="display: none">
								<%			
								out.println("<b style=\"font-size: 25px\">"+thread.getSender()+"</b><br>");
								out.println(thread.getDateSent()); %>
								
							</td>
							<td style="width: 650px">
								<% out.println(thread.getComment()); %>
							</td>
							<td style="width: 110px;">
								<!-- <button type="submit" id="reply" style="margin-left: 5px; margin-top: 10px" class="btn btn-primary" >Reply</button> -->
								<a href="#" id="reply" style="margin-left: 5px; margin-top: 10px" class="btn btn-primary" >Reply</a>
							</td>
					<!-- 	</form> -->
					<%
					}
					
				%>
			
				
				
			</tbody>
			
		</table>
		
<!--=========================================================================================================================-->
		<a  id="connect" style="width: 1070px; font-family: kelvetica; font-size:35px; text-shadow: 2px 2px #6C7A89; margin-bottom: 138px;"class="btn btn-default btn-lg btn-block">Connect!</a>
<!--===========================================================================================================================-->

	

		
<!--=========================================================================================================================-->		
		<div id="source-modal" class="hide modal fade in" style="display: block; background-image: url('images/modalBg.png');" aria-hidden="false">
								
			<div class="modal-dialog modal-lg" style="margin-top: 130px; width:515px">
								    
				<div class="modal-content" style="width: 515px">
				  	<div class="modal-header">
				  		<button id="close" class="close" aria-hidden="true" data-dismiss="modal" type="button"> x </button>
				       	<h3 class="modal-title"><b>Connect!</b></h3>
				   	</div>
				   	<form action="" method ="post">
						<div class="modal-body">
												
							Comment: <textarea rows="8" maxlength="600" class="form-control" id="textArea" name="comment"></textarea>
							      		
						</div>
	
						<div class="modal-footer">
							<button id="close1" type="button"  class="btn btn-default" style="color: #2c3e50;">Cancel</button>
							<button type="submit" class="btn btn-primary" >Connect</button>
						</div>
					</form>
					<%
						try{
							String comment = request.getParameter("comment");
							int mainThreadID = Integer.parseInt(request.getParameter("threadID"));
							
							if(comment.isEmpty()){
								session.setAttribute("msg3", "<strong>FAILED. </strong>Please supply a Comment");
								session.setAttribute("alerttype3","danger");
							} else{
								connectionFINAL sd = new connectionFINAL();
																
								Date d = new java.util.Date();
								
								String username = session.getAttribute("loggedUsername").toString();
								
								session.setAttribute("alerttype3",sd.addSubThread(categoryID, mainThreadID,comment,d.toString(),username));
								
								String unsa = session.getAttribute("alerttype3").toString();
								
								System.out.println("unsa: "+unsa);
								
								if(unsa.equals("success")){
									session.setAttribute("msg3", "<strong>SUCCESS! </strong>Successfully posted your comment");
								} else{
									session.setAttribute("msg3", "<strong>FAILED. </strong>There was an error");
								}
								response.sendRedirect("startThread.jsp?threadID="+threadID);
							}
						}catch(Exception e){
							//session.setAttribute("msg3", "<strong>EXCEPTION. </strong>There was an error: "+e.toString());
						}
					
					%>
				</div>	
								   

								    
			</div>	
		</div>
	
	
	
	

</body>
</html>




















