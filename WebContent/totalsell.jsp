<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost/franchise"  
     user="root"  password="root"/>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
 		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
   		 <span class="navbar-toggler-icon"></span>
  	 	</button>
  <div class="collapse navbar-collapse mr-auto" id="navbarText">
  
    <ul class="navbar-nav ml-auto">
    <li class="nav-item mr-auto">
        <a class="nav-link" >
        	<sql:query dataSource="${db }" var="result">
        		select * from revenue where username='${sessionScope.user }'
        	</sql:query>
        	<c:forEach items="${ result.rows}" var="row">
        		Total Revenue: ${row.revenue }
        	</c:forEach>
         <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="franchise.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
       <li class="nav-item active">
        <a class="nav-link" >Sell <span class="sr-only">(current)</span></a>
      </li>
        <li class="nav-item">
        <a class="nav-link" href="removesession.jsp">Sign out <span class="sr-only">(current)</span></a>
      </li>
      
    </ul>
  </div>
</nav>




<sql:query dataSource="${db}" var="result">select * from sell where username='${sessionScope.user }' </sql:query>
<table class="table" align="center" style="width: 85%;margin-top: 50px">
	<tr class="thead-dark">
		
		<th>Iteam</th>
		<th>Quantity</th>
		<th>Sell Revenue</th>
	</tr>
	<c:forEach var="row" items="${result.rows}" >
		
			<tr>
				<td>${row.item }</td>
				<td>${row.qty }</td>
				<td>${row.price }</td>
				
				
			</tr>
		
	</c:forEach>
</table>

</body>
</html>