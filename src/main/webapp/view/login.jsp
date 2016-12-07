<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
	<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/> 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/estilo.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/register.js"></script>
    
  
<title>ChickenTest</title>

</head>
<body class="login">

<div class="container">

      <form class="form-signin" name="f" action="login" method="post">
        <h2 class="form-signin-heading"><spring:message code="SignIn" /></h2>
        <br>
        
        <label for="username" class="sr-only"><spring:message code="Username" /></label>
        <input name="username" type="text" id="inputUsername" class="form-control" placeholder="<spring:message code="Username" />" required autofocus>
        <br>
        <label for="inputPassword" class="sr-only"><spring:message code="Password" /></label>
        <input name="password" type="password" id="inputPassword" class="form-control" placeholder="<spring:message code="Password" />" required>
        	<font color="red">
	<span>${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message} </span>
	</font>
	<br>
	<br>
        <button class="btn btn-lg btn-primary btn-block" type="submit"><spring:message code="LogIn" /></button>
     <input	type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
     <br>
     <button type="button" class="btn btn-lg btn-success btn-block" data-toggle="modal" data-target="#myModal">
 Register
</button>
      </form>

    </div>




	

	

<!-- Button trigger modal -->



<!-- Modal -->

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Sign Up</h4>
      </div>
      <div class="modal-body row">
      
      
       <div class="form-group" id="user_group">
		<label for="username" class="col-sm-2 control-label">Username:</label>
		<div class="col-sm-10">
			<input type="text" name="username" class="form-control" id="username"/>
		</div></div>
		<div  class=" form-group"  >
		
		<div  id="userError" >  </div>
			
		</div>
			<div class="form-group" id="password_group">
		<label for="password" class="col-sm-2 control-label">Password:</label>
		<div class="col-sm-10">
			<input type="password" name="password" id="password" class="form-control" />
		</div>
		
	</div>
	<div class="form-group" id="pass_again_group">
		<label for="password_again" class="col-sm-2 control-label">Confirm Password:</label>
		<div class="col-sm-10">
			<input type="password" name="password_again" id="password_again" class="form-control" />
		</div>
		<div  class=" form-group"  >
		
			<div  id="passwordError" >
			</div>
		</div>
	</div>
     
       </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary" id="btn_register">Register</button>
      </div>
    </div>
  </div>
</div>
	
	
	
</body>
</html>