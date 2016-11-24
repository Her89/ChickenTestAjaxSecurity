<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns:th="http://www.thymeleaf.org">
	<head>

<title>ChickenTest</title>
</head>
<body>

<h3>Please Sign In</h3>
<div class="container-fluid">
<div class="center-block">
	<form name="f" th:action="@{/login}" method="post">

		<label for="username"><spring:message code="Username" /></label> <input class="form-control" type="text"
			id="username" name="username" /> 
			<br>
			<label for="password"><spring:message code="Password" /></label>
		<input class="form-control" type="password" id="password" name="password" /> 
		<input
			type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<br>
		<br>
			<button type="submit" class="btn">Log in</button>
		
	</form>
	</div>
	</div>
</body>
</html>