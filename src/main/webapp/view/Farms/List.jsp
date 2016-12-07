    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
        <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
        <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
        
    

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/estilo.css"/>


<script>var contextPath = "${pageContext.request.contextPath}"</script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery.i18n.properties.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/scriptF.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Farm administration</title>

</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <a class="navbar-brand active" href="${pageContext.request.contextPath}"> Farm Administration</a>
    </div>
    <ul class="nav navbar-nav">
      
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
<br>
<h3><spring:message code="title.Farm" /></h3>


<br>
<table>
<tr>
<th class="text-center"><spring:message code="Name" /></th>
<th class="text-center"><spring:message code="th.Chickens" /></th>
<th class="text-center"><spring:message code="Update" /></th>
<th class="text-center"><spring:message code="Delete" /></th>
</tr>
<tbody id="results">
</tbody>

</table>
<br><br>	
<button id="new"> <spring:message code="NewFarm" /></button>


<div id="FormDiv">
<form action="" method="post"  id="Form">
		<h3 id="title"><spring:message code="NewFarm" /></h3>
		
		<label ><spring:message code="Name" /> </label>
		<input type="text" id="name"/>
		<span id="nameError" class="error"></span>
		
		<br><br>
	
		<button  id="submit"> OK </button>
		</form>
	<button  style="display:inline" id="cancel"> <spring:message code="btn.Cancel" /></button>
		
	

</div>
<br><br>
</body>
</html>