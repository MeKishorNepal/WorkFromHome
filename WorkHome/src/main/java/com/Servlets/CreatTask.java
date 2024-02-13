package com.Servlets;

import java.io.IOException;

import com.Dao.userDao;
import com.conn.DBConnect;
import com.entities.Task;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/createtask")
public class CreatTask extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int uid=Integer.parseInt(req.getParameter("id"));
		//System.out.println(uid);
		String des=req.getParameter("description");
		String sd=req.getParameter("start_date");
		String ed=req.getParameter("end_date");
		
		Task t=new Task();
		t.setuid(uid);
		t.setDescription(des);
		t.setStart_date(sd);
		t.setEnd_date(ed);
		
		userDao dao=new userDao(DBConnect.getCon());
		boolean f=dao.createtask(t);
		HttpSession session=req.getSession();
		
		if(f) {
			//System.out.println("task created successfully");
			session.setAttribute("succMsg", "Task Created Successfully...");
			resp.sendRedirect("AdminDashboard/Create_task.jsp");
		}
		else {
			//System.out.println("something error....");
			session.setAttribute("errorMsg", "Task not created try again...");
			resp.sendRedirect("AdminDAshboard/Create_task.jsp");
			
		}
		
	}
	
	

}
