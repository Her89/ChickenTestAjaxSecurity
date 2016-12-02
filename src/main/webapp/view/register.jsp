<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New User Registration</title>
</head>
<body>


<h3>New User</h3>

<form:form action="register" method="post" modelAttribute="user" id="form">
<table>
		<tr><td>
		<form:label path="username"><spring:message code="Username" />:</form:label> </td>
		<td><form:input path="username" id="username"/> </td>
		</tr><tr>
		<td><form:label path="password"><spring:message code="Password" />:</form:label></td>
		<td><form:input path="password" type="password" id="password" name="password" /></td>
		</tr> 
		<tr>
		<td><label >Confirm <spring:message code="Password" />:</label></td>
		<td><input  type="password" id="conf_password" name="conf_password" /></td>
		</tr>
		<tr>
		<td colspan="2" align="right"><button type="submit" name="submit"><spring:message code="SignUp" /></button></td>
	</tr>
	</table>	
</form:form>
</body>
</html>