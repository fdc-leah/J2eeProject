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

import com.igot.models.User;
import com.igot.jdbc.connectionFINAL;

@WebServlet("/signup")
public class SignUp extends HttpServlet {

	public SignUp() {

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
	//	PrintWriter out = resp.getWriter();

		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String rpassword = req.getParameter("rpassword");
		String lastname = req.getParameter("ln");
		String firstname = req.getParameter("fn");
		
		String message="";
		
		if(!password.equals(rpassword)){
			message = "Passwords does not match";
		} else{
			try {

				User us = new User(username, password, lastname, firstname);

				connectionFINAL cf = new connectionFINAL();

				if(cf.addUser(us).equals("success")){
					message = "SUCCESS! Now Log in to your Account";
				} else{
					message= "Username '"+username+"' already exists";
				}

				
			} catch (Exception e) {
				message= "Username '"+username+"' already exists";
				
			}
			
			
		}
		Writer mk = resp.getWriter();
	
		HttpSession hs = req.getSession(true);
		hs.setAttribute("msg", message);
		resp.sendRedirect("home.jsp");
		
		
	}
}
