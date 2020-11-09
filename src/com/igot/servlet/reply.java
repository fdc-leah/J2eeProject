package com.igot.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;

@WebServlet("/reply")
public class reply extends HttpServlet {
	
	public reply(){
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		
		String mk[] = req.getParameter("replyto").toString().split("&&");
		String replyto = mk[0];
		String threadID = mk[1];
		HttpSession hs = req.getSession(true);
		
		hs.setAttribute("replyto", mk[0]);
		resp.sendRedirect("startThread.jsp?threadID="+threadID);
	}
	

}

















