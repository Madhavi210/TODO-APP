<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.ToDoDAO"%>
<%@ page import="com.entity.TodoDtls"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/all_css.jsp" %>

</head>
<body style="background-color:#f0f1f2">
<%@include file="component/navbar.jsp" %>
<div class="container">
<div class="row p-5">
<div class="col-md-6 offset-md-3">
<div class="card">
<div class="card-body">
<h3 class="text-center text-success">Add TODO</h3>

<%
int id = Integer.parseInt(request.getParameter("id"));

ToDoDAO dao = new ToDoDAO(DBConnect.getConn());
TodoDtls t =  dao.getTodoById(id);

%>

<form action="update" method="post">

<input type="hidden" value="<%= t.getId()%>"  name="id">

  <div class="mb-3 form-group ">
    <label for="exampleInputEmail1" class="form-label">Name</label>
    <input type="text" class="form-control" id="exampleInputEmail1" name="username" value="<%= t.getName() %>" aria-describedby="emailHelp">
  </div>
  <div class="mb-3 form-group ">
    <label for="exampleInputEmail1" class="form-label">TODO</label>
    <input type="text" class="form-control" id="exampleInputEmail1" name="todo"  value="<%= t.getTodo() %>"  aria-describedby="emailHelp">
  </div>
  
 <div class="form-group">
  <label for="inputstate">Status</label>
  <select id="inputstate" class="form-control" name="status">
  <%
  	if("Pending".equals(t.getStatus()))
  	{%>
  		<option value="Pending">Pending </option>
  		<option value="Complete">Complete</option>
  	<% }
  	else
  	{%>
  		  	<option value="Complete">Complete</option>
  		  	<option value="Pending">Pending </option>
  		
  	<%}
  %>
  	
  </select>
</div>
<div class="text-center">
	  <button type="submit" class="btn btn-primary">Update</button>
</div>
</form>
</div>
</div>
</div>

</div>
</div>


</body>
</html>