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


@WebServlet("/register")
public class Register extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String  phoneno=request.getParameter("phone");
		

        User u=new User(name,email,password,phoneno);
		userDao dao=new userDao(DBConnect.getCon());
		boolean f=dao.userRegistration(u);
		
		HttpSession session=request.getSession();
		
		 if(f) {
   		  
  		   response.sendRedirect("login.jsp");
  		   session.setAttribute("sucssMsg","User Register Successfully..");
  		   //System.out.println("user register succefully");
  	   }else {
  		   session.setAttribute("errorMsg","SomeThing worng on Server..");
  		   response.sendRedirect("register.jsp");
  		   System.out.println("something wrong on server");
  	   }
		
	}

}
