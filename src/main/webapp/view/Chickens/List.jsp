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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/scriptC.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="ChickenList" /></title>

</head>
<body>

<jsp:include page="../navbar.jsp" />

<br><br>
<h3 id="titleTop"><spring:message code="Farm" />: </h3>

<h3><spring:message code="ChickenList" />:</h3>

<br>

<table class="table-condensed">
<thead>
<tr>
<th class="text-center"><spring:message code="Name" /></th>
<th class="text-center"><spring:message code="TotalEggs" /></th>
<th class="text-center"><spring:message code="EggList" /></th>
<th class="text-center"><spring:message code="Update" /></th>
<th class="text-center"><spring:message code="Delete" /></th>
</tr>
</thead>
<tbody id="results">
</tbody>

</table>
<br>
<div id="noInfo" class="error"></div>
<br><br>	



   <button id="new" type="button" class="btn btn-default .btn-sm" data-toggle="modal" data-target="#myModal">
 <spring:message code="NewChicken" />
</button>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="title"><spring:message code="NewChicken" /></h4>
      </div>
            <div class="modal-body row">
      

<div id="FormDiv">
<form action="" method="post"  id="Form">
		
		 <div class="form-group" id="name_group">
		<label for="name" class="col-sm-2 control-label"><spring:message code="Name" />:</label>
		<div class="col-sm-10">
			<input type="text" name="name" class="form-control" id="name"/>
		</div></div>
		
		
		<span id="nameError" class="error"></span>
		
		<br><br>
	
   
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary" id="submit">OK</button>
        </div>
        		</form>
            </div>
      </div>
    </div>
  </div>
</div>
<br>
<br><br>
<a href="${pageContext.request.contextPath}/Farms/?language=${param.language}"> <spring:message code="Return" /> </a>

<br><br>


</body>
</html>