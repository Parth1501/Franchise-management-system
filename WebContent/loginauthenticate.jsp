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
 	<c:if test="${ empty param.username or empty param.password}">
      <c:redirect url="login.jsp" >
              <c:param name="errmessage" value="Please Enter UserName and Password" />
      </c:redirect>
       
    </c:if>
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost/franchise"  
     user="root"  password="root"/>
     <sql:query dataSource="${db}" var="rs">SELECT * FROM registered WHERE username='${ param.username}'</sql:query>
     <c:forEach items="${rs.rows}" var="r">
     	<c:choose>
     		<c:when test="${r.password eq param.password and r.approve ==0}">
	     		<c:redirect url="login.jsp">
	     			<c:param name="succesful" value="notapproved"></c:param>
	     		</c:redirect>
	     	</c:when>
	     	<c:when test="${r.password eq param.password and r.admin ==1}">
	     		<c:redirect url="index.jsp">
	     			<c:set var="user" scope="session" value="${param.username }"> </c:set>
	     		</c:redirect>
	     	</c:when>
	     	<c:when test="${r.password eq param.password and r.admin==0}" >
	     		<c:redirect url="franchise.jsp">
	     				<c:set var="user" scope="session" value="${param.username }"> </c:set>
	     		</c:redirect>
	     	</c:when>
	     	<c:otherwise>
	     		<c:redirect url="login.jsp">
	     				
	     				<c:param name="errmessage" value="Invalid password." />
	     		</c:redirect>
	     	</c:otherwise>
     	</c:choose>
     </c:forEach>
     <c:redirect url="login.jsp">
     	<c:param name="errmessage" value="Invalid Username." />
     </c:redirect>
</body>
</html>