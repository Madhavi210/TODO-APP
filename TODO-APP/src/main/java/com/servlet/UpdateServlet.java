package com.servlet;
import java.io.*;
import javax.servlet.annotation.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.sql.*; 
import java.util.*;
import com.DAO.ToDoDAO;
import com.DB.DBConnect;
import com.entity.TodoDtls;

@WebServlet("/update")
public class UpdateServlet extends HttpServlet  {

 protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
 {
	 int id= Integer.parseInt(req.getParameter("id"));
	 String username = req.getParameter("username");
		String todo = req.getParameter("todo");
		String status = req.getParameter("status");
		
		ToDoDAO dao = new ToDoDAO(DBConnect.getConn());
		
		TodoDtls t = new TodoDtls();
		t.setId(id);
		t.setName(username);
		t.setTodo(todo);
		t.setStatus(status);
		
		boolean f = dao.updateTodo(t);
		HttpSession session = req.getSession();
		if(f) {
			session.setAttribute("sucMsg", "todo update successfully");
			resp.sendRedirect("index.jsp");
		}
		else {
			session.setAttribute("failedMsg", "something wrong on server");
			resp.sendRedirect("index.jsp");
		}
		
	 
 }
}
