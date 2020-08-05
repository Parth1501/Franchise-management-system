<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:if test="${ empty param.username or empty param.password or empty param.ownername or empty param.mobile or empty param.email or empty param.city }">
      <c:redirect url="login.jsp" >
              <c:param name="errmessage" value="All feilds are requried." />
      </c:redirect>
    </c:if>
    <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost/franchise"  
     user="root"  password="root"/>

    <c:if test="${param.password ne param.repeatpassword}">
      <c:redirect url="login.jsp" >
              <c:param name="errmessage" value="Password not matching" />
      </c:redirect>
    </c:if>
    
    	
	     <sql:update dataSource="${db }" var="count">
	     	INSERT INTO registered values('${param.username }','${param.password }','${param.ownername }','${param.mobile }','${param.email }','${param.city }',0,0 )
	     	
	     </sql:update>
		 
 
  
     <c:choose>
		 <c:when test="${count eq 1}">
		  	<c:redirect url="login.jsp">
		 		<c:param name="succesful" value="succesful"/>
		 			
		 	</c:redirect>
		 	<c:out value="${count }"></c:out>
		 </c:when>   
		 <c:otherwise>
		 	<c:redirect url="login.jsp">
		 		<c:param name="errmessage" value="Something Went Wrong!!!."/>
		 	</c:redirect>
		 </c:otherwise>
	 </c:choose>   
</body>
</html>