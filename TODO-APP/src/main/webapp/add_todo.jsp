<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<form action="add_todo" method="post">
  <div class="mb-3 form-group ">
    <label for="exampleInputEmail1" class="form-label">Name</label>
    <input type="text" class="form-control" id="exampleInputEmail1" name="username" aria-describedby="emailHelp">
  </div>
  <div class="mb-3 form-group ">
    <label for="exampleInputEmail1" class="form-label">TODO</label>
    <input type="text" class="form-control" id="exampleInputEmail1" name="todo"  aria-describedby="emailHelp">
  </div>
  
 <div class="form-group">
  <label for="inputstate">Status</label>
  <select id="inputstate" class="form-control" name="status">
  	<option selected> --select-- </option>
  	<option value="Pending">Pending </option>
  	<option value="Complete">Complete</option>
  </select>
</div>
<div class="text-center">
	  <button type="submit" class="btn btn-primary">ADD</button>
</div>
</form>
</div>
</div>
</div>

</div>
</div>


</body>
</html>