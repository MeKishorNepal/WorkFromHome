package com.Servlets;

import java.io.IOException;

import com.conn.DBConnect;
import com.entities.Task;
import com.Dao.userDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")
public class Deletetask extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int tid=Integer.parseInt(req.getParameter("Tid"));
		System.out.println(tid);
		
		
		userDao dao=new userDao(DBConnect.getCon());
		
		boolean f=dao.DeleteTask(tid);
		
		HttpSession session=req.getSession();
		
		if(f) {
			session.setAttribute("succMsg","Task deleted successfully." );;
			resp.sendRedirect("AdminDashboard/manage_task.jsp");
		}
		else {
			session.setAttribute("errorMsg","Something wrong on server.");
			resp.sendRedirect("AdminDashboard/manage_task.jsp");
			
		}
		
		
		
		
	}
	

}
