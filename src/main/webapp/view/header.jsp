 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand active" href="${pageContext.request.contextPath}"> Farm Administration</a>
    </div>
    <ul class="nav navbar-nav">
      <li ><a href="#"><spring:message code="title.Farm" /></a></li>
      
      <sec:authorize access="hasAuthority('Admin')">
      <li><a href="#"><spring:message code="Users" /></a></li>
      </sec:authorize>
      <li>
      <a class="btn  dropdown-toggle" data-toggle="dropdown"><spring:message code="Language" />
    <span class="caret"></span></a>
    <ul class="dropdown-menu">
      <li><a href="?language=en">English</a></li>
      <li><a href="?language=es">Spanish</a></li>
    </ul></li>
      </ul>
      
      <ul class=" nav navbar-nav navbar-right">
      <li><a class="  " href="${pageContext.request.contextPath}/logout"><spring:message code="Logout" /></a></li>
    </ul>
  </div>
</nav>
</body>
</html>