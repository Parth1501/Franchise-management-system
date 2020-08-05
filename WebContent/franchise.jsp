<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:if test="${sessionScope.user eq null }">
	<c:redirect url="login.jsp">
		<c:param name="loginuser" value="null"></c:param>
	</c:redirect>
</c:if>
<meta charset="UTF-8">
<title>Franchise</title>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost/franchise"  
     user="root"  password="root"/>
<body>
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
      <li class="nav-item active">
        <a class="nav-link" href="franchise.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="totalsell.jsp">Sell <span class="sr-only">(current)</span></a>
      </li>
        <li class="nav-item">
        <a class="nav-link" href="removesession.jsp">Sign out <span class="sr-only">(current)</span></a>
      </li>
      
    </ul>
  </div>
</nav>
<form action="addrevenue.jsp"  style="margin-left: 50px">
<div class="card-deck" style="margin-top: 50px">
<form action="addrevenue.jsp" class="card" style="margin-left: 50px">
  	<div class="card"> 
    <img class="card-img-top" src="img/1.jpeg" alt="Card image cap" height="250px" width="75px">
    <div class="card-body">
      <h5 class="card-title">French Toast</h5>
      <p class="card-text">Price: 150</p>
      <p class="card-text" >Qty:</p>
      <input type="text" class="form-control" name="frenchtoast" placeholder="0" > 
      <br>
      
      
      
    </div>
  </div>
 
 
<div class="card">  
    <img class="card-img-top" src="img/2.jpeg" alt="Card image cap" height="250px">
    <div class="card-body">
      <h5 class="card-title">Pizza</h5>
      <p class="card-text" >Price: 300</p>
     <p class="card-text" >Qty:</p>
      <input type="text" class="form-control" name="pizza"  placeholder="0" > 
      <br>
      
      
    </div>
  </div>
  
  <form action="addrevenue.jsp" class="card" style="margin-right: 50px">
  <div class="card">
    <img class="card-img-top" src="img/3.jpeg" alt="Card image cap" height="250px">
    <div class="card-body">
      <h5 class="card-title">Burrito</h5>
      <p class="card-text">Price: 200</p>
      <p class="card-text">Qty:</p>
      <input type="text" class="form-control" name="burrito" placeholder="0" > 
      <br>
      
      
    </div>
  </div>
  

</div>
	<div class="text-center">
	<button type="submit" class="btn btn-primary" style="margin-top: 20px; width:35%">Add</button>
	</div>
  </form>
</body>
</html>