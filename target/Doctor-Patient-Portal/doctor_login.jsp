<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Login</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	
	<div class="container p-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-header text-center text-white bg-primary">
						<h4>Doctor Login</h4>
					</div>
					<div class="card-body">
						<c:if test="${not empty successMsg}">
							<p class="text-center text-success">${successMsg}</p>
							<c:remove var="successMsg" scope="session" />
						</c:if>
						<c:if test="${not empty errorMsg}">
							<p class="text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						
						<form action="doctorLogin" method="post">
							<div class="form-group">
								<label>Email address</label>
								<input type="email" name="email" class="form-control" required>
								<small class="form-text text-muted">We'll never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label>Password</label>
								<input type="password" name="password" class="form-control" required>
							</div>
							<button type="submit" class="btn btn-primary mt-3">Login</button>
						</form>
						
						<p class="text-center mt-3">
							Don't have an account? <a href="doctor_register.jsp">Register here</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>