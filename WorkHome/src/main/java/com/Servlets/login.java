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
import com.entities.User;


@WebServlet("/Login")
public class login extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String name=request.getParameter("name");
		String password=request.getParameter("password");
		
		userDao dao=new userDao(DBConnect.getCon());
		User u=dao.userlogin( name, password);
		
		HttpSession session=request.getSession();
	
		 if(u!=null) {
				// System.out.println("User is Available"+u);
				 //Using session concept
			        session.setAttribute("user",u);
			        
			
				 response.sendRedirect("UserDashboard/userDashboard.jsp");
				 
				 
			 }else {
				 //System.out.println("User is not Available"+u);
				 
				 session.setAttribute("invalidMsg", "Invalid Name Or Password");
				 response.sendRedirect("login.jsp");
			 
	}
	}

}
