<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Login </title>
<link href="CSS/login.css" rel="stylesheet">
</head>
<body>

<c:if test="${param.loginuser ne null}">
	<script type="text/javascript">alert('You have not login!!')</script>
</c:if>
<div class="login-wrap">
	<div class="login-html">
	<font color="red">	
		<c:if test="${param.errmessage ne ''}">
			<c:out value="${param.errmessage}"></c:out>
		</c:if>
	</font>
	<br>
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
		<div class="login-form" >
			<div class="sign-in-htm">
			<form action="loginauthenticate.jsp" method="post">
				<div class="group">
					<label for="user" class="label">Username</label>
					<input id="user" type="text" class="input" name="username">
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input id="pass" type="password" class="input" data-type="password" name="password">
				</div>
				
				<div class="group">
					<input type="submit" class="button" value="Sign In">
				</div>
				<div class="hr"></div>
				</form>
			
			</div>
			<div class="sign-up-htm">
			<form action="registrationauth.jsp" method="post">
				<div class="group">
					<label for="user" class="label">Username</label>
					<input id="user" type="text" class="input" name="username">
				</div>
				<div class="group">
					<label for="user" class="label">Ownername</label>
					<input id="user" type="text" class="input" name="ownername">
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input id="pass" type="password" class="input" data-type="password" name="password">
				</div>
				<div class="group">
					<label for="pass" class="label">Repeat Password</label>
					<input id="pass" type="password" class="input" data-type="password" name="repeatpassword">
				</div>
				<div class="group">
					<label for="pass" class="label">Mobile No</label>
					<input id="pass" type="text" class="input" name="mobile">
				</div>
				<div class="group">
					<label for="pass" class="label">Email-id</label>
					<input id="pass" type="text" class="input" name="email">
				</div>
				<div class="group">
					<label for="pass" class="label">City</label>
					<input id="pass" type="text" class="input" name="city">
				</div>
				
				<div class="group">
					<input type="submit" class="button" value="Sign Up">
				</div>
				<div class="hr"></div>
				
			</form>
			</div>
			
		</div>
	</div>
</div>

<c:if test="${param.succesful eq 'succesful' }">
	<script type="text/javascript"> alert ('You have Succesfully registered')</script>
</c:if>

<c:if test="${param.succesful eq 'notapproved' }">
	<script type="text/javascript"> alert ('Your Request is pending')</script>
</c:if>
</body>
</html>