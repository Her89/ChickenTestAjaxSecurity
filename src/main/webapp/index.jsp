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
      
      <sec:authorize access="hasAuthority('Admin')">
      <li><a href="${pageContext.request.contextPath}/Users/"><spring:message code="Users" /></a></li>
      </sec:authorize>
      </ul>
      
      <ul class=" nav navbar-nav navbar-right">
      <li><a class="  " href="${pageContext.request.contextPath}/logout"><spring:message code="Logout" /></a></li>
    </ul>
  </div>
  </div>
</nav>


<br>
<br>
<h3><spring:message code="Welcome" /> <sec:authentication property="name"/>! </h3>
<br>

<br><br>
<a href="<%=request.getContextPath()%>/Farms/?language=en">Go to Farm List</a>
<br>
<br>
<br>

<a href="<%=request.getContextPath()%>/Farms/?language=es">Ver Lista de Granjas</a>


<script>
</script>

</body>
</html>