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
	
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost/franchise"  
     user="root"  password="root"/>
     <sql:update dataSource="${db }" var="count">
     	DELETE from registered where username='${param.remove }'
     </sql:update>
     <sql:update dataSource="${db }" var="count">
     	DELETE from revenue where username='${param.remove }'
     </sql:update>
      <sql:update dataSource="${db }" var="count">
     	DELETE from sell where username='${param.remove }'
     </sql:update>
     <c:redirect url="index.jsp">
     	
     </c:redirect>
</body>
</html>