   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand active" href="${pageContext.request.contextPath}"> Farm Administration</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
    <ul class="nav navbar-nav">
    
    <li><a href="<%=request.getContextPath()%>/Farms/?language=${pageContext.response.locale}"><spring:message code="title.Farm" /></a></li>
      
      <sec:authorize access="hasAuthority('Admin')">
      <li><a href="${pageContext.request.contextPath}/Users/"><spring:message code="Users" /></a></li>
      </sec:authorize>
            <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown"><spring:message code="Language" />
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
  </div>
</nav>

</body>
</html>