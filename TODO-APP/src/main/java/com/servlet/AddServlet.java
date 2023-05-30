package com.servlet;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import com.DAO.ToDoDAO;
import com.DB.DBConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

@WebServlet("/add_todo")
public class AddServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String username = req.getParameter("username");
		String todo = req.getParameter("todo");
		String status = req.getParameter("status");

		ToDoDAO dao = new ToDoDAO(DBConnect.getConn());
		boolean f = dao.addToDo(username, todo, status);
		
		HttpSession session = req.getSession();
		
		if(f)
		{
			session.setAttribute("sucMsg", "todo added successfully");
			resp.sendRedirect("index.jsp");
		}
		else
		{
			session.setAttribute("failedMsg", "something wrong on server");
			resp.sendRedirect("index.jsp");
		}
	}
	
}
