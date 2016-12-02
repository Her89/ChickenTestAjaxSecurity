<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<title>ChickenTest</title>

<style>
body {
  padding-top: 40px;
  padding-bottom: 40px;
}

.form-signin {
  max-width: 330px;
  padding: 15px;
  margin: 0 auto;
}
.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 10px;
}
.form-signin .checkbox {
  font-weight: normal;
}
.form-signin .form-control {
  position: relative;
  height: auto;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}

.modal-header{
background-color:  #66cc66;
 font-weight: bold;
}
</style>


</head>
<body>

<div class="container">

      <form class="form-signin" name="f" action="login" method="post">
        <h2 class="form-signin-heading"><spring:message code="SignIn" /></h2>
        
        <label for="username" class="sr-only"><spring:message code="Username" /></label>
        <input name="username" type="text" id="inputUsername" class="form-control" placeholder="<spring:message code="Username" />" required autofocus>
        <label for="inputPassword" class="sr-only"><spring:message code="Password" /></label>
        <input name="password" type="password" id="inputPassword" class="form-control" placeholder="<spring:message code="Password" />" required>
        
        <button class="btn btn-lg btn-primary btn-block" type="submit"><spring:message code="LogIn" /></button>
     <input	type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
     <br>
     <button type="button" class="btn btn-lg btn-success btn-block" data-toggle="modal" data-target="#myModal">
 Register
</button>
      </form>

    </div>




	
	<font color="red">
	<span>${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message} </span>
	</font>
	<br>
	

<!-- Button trigger modal -->


<form:form action="register" method="post" modelAttribute="user" cssClass="form-horizontal registrationForm">

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Sign Up</h4>
      </div>
      <div class="modal-body">
      
      
       <div class="form-group">
		<label for="username" class="col-sm-2 control-label">Username:</label>
		<div class="col-sm-10">
			<form:input path="username" cssClass="form-control" />
		</div>
	</div>
	
		<div class="form-group">
		<label for="password" class="col-sm-2 control-label">Password:</label>
		<div class="col-sm-10">
			<form:password path="password" cssClass="form-control" />
		</div>
	</div>
	<div class="form-group">
		<label for="password_again" class="col-sm-2 control-label">Confirm Password:</label>
		<div class="col-sm-10">
			<input type="password" name="password_again" id="password_again" class="form-control" />
		</div>
	</div>
       
       </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Register</button>
      </div>
    </div>
  </div>
</div>
	</form:form>
</body>
</html>