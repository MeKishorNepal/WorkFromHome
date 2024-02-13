package com.Servlets;

import java.io.IOException;

import com.Dao.userDao;
import com.conn.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/updatetask")
public class TaskModify extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int tid=Integer.parseInt(req.getParameter("tid"));
		String status=req.getParameter("status");
		
		userDao dao=new userDao(DBConnect.getCon());
		boolean f= dao.modifystatus(tid,status);
		HttpSession session=req.getSession();
		
       if(f) {
			
			session.setAttribute("succMsg","task Updated..");
			resp.sendRedirect("UserDashboard/Update task.jsp");
			
		}else {
			
			session.setAttribute("failedMsg","Something wrong on server..");
			resp.sendRedirect("UserDashboard/Update task.jsp?tid="+tid);
			session.removeAttribute("failedMsg");
			
		}
		
		
	}
	

}
