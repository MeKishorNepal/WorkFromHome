package com.Servlets;

import java.io.IOException;

import com.Dao.userDao;
import com.conn.DBConnect;
import com.entities.Leave;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/applyleave")
public class ApplyLeaveServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int uid=Integer.parseInt(req.getParameter("uid"));
		String subject=req.getParameter("subject");
		String message=req.getParameter("message");
		
		Leave leave=new Leave(uid,subject,message);
		
		userDao dao=new userDao(DBConnect.getCon());
		boolean f=dao.requestleave(leave);
		
		HttpSession session=req.getSession();
	
		
		if(f) {
			session.setAttribute("succMsg", "Your leave apply successfully..");
			resp.sendRedirect("UserDashboard/userDashboard.jsp");
		}
		
		
	}
	

}
