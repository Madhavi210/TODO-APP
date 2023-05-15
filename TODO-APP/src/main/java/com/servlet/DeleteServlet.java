package com.servlet;

import javax.servlet.annotation.*;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.DAO.ToDoDAO;
import com.DB.DBConnect;
@WebServlet("/delete")
public class DeleteServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	int id = Integer.parseInt(req.getParameter("id"));
	
	ToDoDAO dao = new ToDoDAO(DBConnect.getConn());
	boolean f  = dao.deleteTodo(id);
	HttpSession session = req.getSession();
	if(f) {
		session.setAttribute("sucMsg", "Todo delete successfully");
		resp.sendRedirect("index.jsp");
	}
	else {
		session.setAttribute("failedMsg", "something wrong on server");
		resp.sendRedirect("index.jsp");
	}
	
	}

}
