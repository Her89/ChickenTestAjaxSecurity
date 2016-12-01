<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>

<title>ChickenTest</title>
</head>
<body>

<h3><spring:message code="SignIn" /></h3>
<div>
<div>

	<form name="f" action="login" method="post">
<table>
		<tr><td>
		<label for="username"><spring:message code="Username" /></label> </td>
		<td><input  type="text"	id="username" name="username" /> </td>
		</tr><tr>
		<td><label for="password"><spring:message code="Password" /></label></td>
		<td><input type="password" id="password" name="password" /></td>
		</tr> 
		<tr>
		<td colspan="2" align="right"><button type="submit" name="submit"><spring:message code="LogIn" /></button></td>
	</tr>
	</table>	
	<input
			type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
	
	<font color="red">
	<span>${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message} </span>
	</font>
	</div>
	</div>
</body>
</html>