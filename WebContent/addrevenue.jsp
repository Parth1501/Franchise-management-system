<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Revenue</title>
</head>
<body>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost/franchise"  
     user="root"  password="root"/>
<sql:query dataSource="${db }" var="result">
	Select count(username) as count from revenue where username='${sessionScope.user }'
</sql:query>
<c:forEach items="${result.rows}" var="row">
	<c:if test="${row.count eq 0}">
		<sql:update dataSource="${db }">
			Insert into revenue values('${sessionScope.user }',0)
		</sql:update>
	</c:if>
	<c:if test="${param.frenchtoast ne '' }">
		
		<sql:update dataSource="${db }">
			<c:out value="${f }"></c:out>
			update revenue set revenue=revenue+ ${Integer.parseInt(param.frenchtoast) }*150 where username='${sessionScope.user }';
			
		</sql:update>
		<sql:query var="alreadycheck" dataSource="${db }">
		 	select * from sell where username='${sessionScope.user }';
		 </sql:query>
		 <c:forEach items="${alreadycheck.rows }" var="x">
			<c:if test="${x.item=='French Toast' }">
				<sql:update dataSource="${db }">
				update sell set qty=qty+${Integer.parseInt(param.frenchtoast)}, price=price+${Integer.parseInt(param.frenchtoast)}*150 where username='${sessionScope.user }' and item='French Toast';
				</sql:update>
				<c:set var="flagf" value="True" scope="page"></c:set>
			</c:if>		 
		 </c:forEach>
		 <c:if test="${flagf ne 'True' }">
		 	<sql:update dataSource="${db }">
				Insert into sell values('${sessionScope.user }','French Toast',${Integer.parseInt(param.frenchtoast)},${Integer.parseInt(param.frenchtoast)}*150);
			</sql:update>
		</c:if>
	</c:if>
	<c:if test="${param.pizza ne '' }">
		
		<sql:update dataSource="${db }">
			update revenue set revenue=revenue+${Integer.parseInt(param.pizza)}*300 where username='${sessionScope.user }';
			
		</sql:update>
		<sql:query var="alreadycheck" dataSource="${db }">
		 	select * from sell where username='${sessionScope.user }';
		 </sql:query>
		 <c:forEach items="${alreadycheck.rows }" var="x">
			<c:if test="${x.item=='Pizza' }">
				<sql:update dataSource="${db }">
				update sell set qty=qty+${Integer.parseInt(param.pizza)}, price=price+${Integer.parseInt(param.pizza)}*300 where username='${sessionScope.user }' and item='Pizza';
				</sql:update>
				<c:set var="flagp" value="True" scope="page"></c:set>
			</c:if>		 
		 </c:forEach>
		 <c:if test="${flagp ne 'True' }">
		 	<sql:update dataSource="${db }">
				Insert into sell values('${sessionScope.user }','Pizza',${Integer.parseInt(param.pizza)},${Integer.parseInt(param.pizza)}*300);
			</sql:update>
		</c:if>
	</c:if>
	<c:if test="${param.burrito ne '' }">
		
		<sql:update dataSource="${db }">
			update revenue set revenue=revenue+${Integer.parseInt(param.burrito)}*200 where username='${sessionScope.user }';
			
		 </sql:update>
		 <sql:query var="alreadycheck" dataSource="${db }">
		 	select * from sell where username='${sessionScope.user }';
		 </sql:query>
		 <c:forEach items="${alreadycheck.rows }" var="x">
			<c:if test="${x.item=='Burrito' }">
				<sql:update dataSource="${db }">
				update sell set qty=qty+${Integer.parseInt(param.burrito)}, price=price+${Integer.parseInt(param.burrito)}*200 where username='${sessionScope.user }' and item='Burrito';
				</sql:update>
				<c:set var="flagp" value="True" scope="page"></c:set>
			</c:if>		 
		 </c:forEach>
		 <c:if test="${flagp ne 'True' }">
		 	<sql:update dataSource="${db }">
				Insert into sell values('${sessionScope.user }','Burrito',${Integer.parseInt(param.burrito)},${Integer.parseInt(param.burrito)}*200);
			</sql:update>
		</c:if>
	</c:if> 
</c:forEach>
<c:redirect url="franchise.jsp"></c:redirect>
</body>
</html>