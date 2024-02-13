package com.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.Dao.userDao;
import com.conn.DBConnect;
import com.entities.admin;

@WebServlet("/adminlogin")
public class Admin extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String name=request.getParameter("name");
		String password=request.getParameter("password");
		
		admin ad=new admin(name,password);
		userDao dao=new userDao(DBConnect.getCon());
		admin a=dao.adminlogin(ad);
		
		HttpSession session=request.getSession();
		
		if(a!=null) {
			// System.out.println("User is Available"+u);
			 //Using session concept
			 session.setAttribute("admin",a);
			 response.sendRedirect("AdminDashboard/adminDashboard.jsp");
			 
			 
		 }else {
			 //System.out.println("User is not Available"+u);
			 
			 session.setAttribute("invalidMsg", "Invalid Name Or Password");
			 response.sendRedirect("adminLogin.jsp");
		 

	}
	}
}
