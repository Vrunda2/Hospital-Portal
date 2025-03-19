<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="com.hms.dao.SpecialistDAO" %>
<%@ page import="com.hms.entity.Specialist" %>
<%@ page import="java.util.List" %>
<%@ page import="com.hms.db.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Registration</title>
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
						<h4>Doctor Registration</h4>
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
						
						<form action="doctor_register" method="post">
							<div class="form-group">
								<label>Full Name</label> 
								<input type="text" name="fullName" class="form-control" required>
							</div>
							
							<div class="form-group">
								<label>Date of Birth</label> 
								<input type="date" name="dateOfBirth" class="form-control" required>
							</div>
							
							<div class="form-group">
								<label>Qualification</label> 
								<input type="text" name="qualification" class="form-control" required>
							</div>
							
							<div class="form-group">
								<label>Specialist</label> 
								<select name="specialist" class="form-control" required>
									<option value="">--select--</option>
									
									<%
									SpecialistDAO dao = new SpecialistDAO(DBConnection.getConn());
									List<Specialist> list = dao.getAllSpecialist();
									for (Specialist s : list) {
									%>
									<option value="<%=s.getSpecialistName()%>"><%=s.getSpecialistName()%></option>
									<%
									}
									%>
								</select>
							</div>
							
							<div class="form-group">
								<label>Email</label> 
								<input type="email" name="email" class="form-control" required>
							</div>
							
							<div class="form-group">
								<label>Phone Number</label> 
								<input type="text" name="phone" class="form-control" required>
							</div>
							
							<div class="form-group">
								<label>Password</label> 
								<input type="password" name="password" class="form-control" required>
							</div>
							
							<button type="submit" class="btn btn-primary mt-3">Register</button>
						</form>
						
						<p class="text-center mt-3">
							Already have an account? <a href="doctor_login.jsp">Login</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>