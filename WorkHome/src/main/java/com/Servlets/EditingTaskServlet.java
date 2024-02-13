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

@WebServlet("/TaskEdit")
		
public class EditingTaskServlet extends HttpServlet {
      
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int uid=Integer.parseInt(req.getParameter("id"));
		//System.out.println(uid);
		int tid=Integer.parseInt(req.getParameter("tid"));
		String des=req.getParameter("description");
		String sd=req.getParameter("start_date");
		String ed=req.getParameter("end_date");
		
		Task t=new Task();
		t.setTid(tid);
		t.setuid(uid);
		t.setDescription(des);
		t.setStart_date(sd);
		t.setEnd_date(ed);
		
		userDao dao=new userDao(DBConnect.getCon());
		boolean f=dao.EditTask(t);
		HttpSession session=req.getSession();
		
		if(f) {
			session.setAttribute("succMsg", "Task updated successfully");
			resp.sendRedirect("AdminDashboard/Manage_task.jsp");
		}else {
			session.setAttribute("errorMsg", "Something error on server..");
			resp.sendRedirect("AdminDashboard/Edit_task.jsp");
			
		}
	}
}
