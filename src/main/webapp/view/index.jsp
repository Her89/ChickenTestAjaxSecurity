    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/estilo.css"/>
  
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Farm administration</title>

  <meta charset="utf-8">
  
</head>
<body>
<jsp:include page="navbar.jsp" />



<br>
<br>
<h3><spring:message code="Welcome" /> <sec:authentication property="name"/>! </h3>
<br>





</body>
</html>