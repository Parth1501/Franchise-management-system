<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Approve Franchise</title>
</head>
<body>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost/franchise"  
     user="root"  password="root"/>
     <sql:update dataSource="${db }" var="count">
     	UPDATE registered SET approve=1 WHERE username='${param.btnapprove }';
     </sql:update>
     <c:redirect url="requests.jsp">
     	<c:param name="approve" value="ok"></c:param>
     </c:redirect>
     
</body>
</html>