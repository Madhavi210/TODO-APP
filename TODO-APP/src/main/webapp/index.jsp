<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.ToDoDAO"%>
<%@ page import="com.entity.TodoDtls"%>

<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ToDo APP</title>
<%@include file="component/all_css.jsp" %>
</head>

<body>
<%@include file="component/navbar.jsp" %>


<h1 class="text-center text-success">TODO-APP</h1>

<%
String sucMsg = (String) session.getAttribute("sucMsg");
if(sucMsg != null){
%>
<div class="alert alert-success" role="alert"><%=sucMsg %></div>
<%
session.removeAttribute("sucMsg");
}
%>

<%
String failedMsg = (String) session.getAttribute("failedMsg");
if(failedMsg != null){
%>
<div class="alert alert-danger" role="alert"><%=failedMsg %></div>
<%
session.removeAttribute("failedMsg");
}
%>

<div class="container">
<table class="table table-striped" border="1px">
  <thead class="bg-success text-white">
    <tr>
   <%--   <th scope="col">ID</th>  --%> 
	  <th scope="col">Name</th>
      <th scope="col">ToDo</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  
  ToDoDAO dao = new ToDoDAO(DBConnect.getConn());
  List<TodoDtls> todo = dao.getTodo();
  for(TodoDtls t : todo)
  {
  %>
	  <tr>
      <%-- <th scope="row"><%=t.getId() %></th> --%>
      <th scope="col"><%=t.getName() %></th>
      <td><%= t.getTodo() %></td>
      <td><%= t.getStatus() %></td>
      <td>
      	<a href="edit.jsp?id=<%=t.getId() %>" class="btn btn-sm btn-success">Edit</a>
      	<a href="delete?id=<%=t.getId() %>" class="btn btn-sm btn-danger">Delete</a>
      </td>
    </tr> 
  <%}
  %>
  
   
  </tbody>
</table>
</div>

</body>
</html>