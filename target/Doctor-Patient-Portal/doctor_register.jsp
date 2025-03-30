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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Doctor Registration | Doctor Patient Portal</title>
<%@include file="component/allcss.jsp"%>

<!-- FontAwesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style type="text/css">
:root {
  --primary-color: #2563eb;
  --secondary-color: #1e40af;
  --accent-color: #60a5fa;
  --text-dark: #1f2937;
  --text-light: #6b7280;
  --light-bg: #f3f4f6;
  --white: #ffffff;
  --danger: #ef4444;
  --success: #10b981;
  --shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
  --rounded: 0.5rem;
}

body {
  font-family: 'Inter', system-ui, -apple-system, sans-serif;
  color: var(--text-dark);
  line-height: 1.6;
  background-color: var(--light-bg);
}

.paint-card {
  border-radius: var(--rounded);
  box-shadow: var(--shadow);
  border: none;
  overflow: hidden;
}

.btn-primary {
  background-color: var(--primary-color);
  border-color: var(--primary-color);
  transition: all 0.3s ease;
  padding: 0.625rem 1.25rem;
  font-weight: 500;
}

.btn-primary:hover {
  background-color: var(--secondary-color);
  border-color: var(--secondary-color);
}

.form-control {
  border-radius: 0.375rem;
  padding: 0.625rem 0.75rem;
  border: 1px solid #d1d5db;
  margin-bottom: 1rem;
  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.form-control:focus {
  border-color: var(--accent-color);
  box-shadow: 0 0 0 0.25rem rgba(96, 165, 250, 0.25);
}

.form-group {
  margin-bottom: 1.25rem;
}

.form-group label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: 500;
  color: var(--text-dark);
}

.card-header {
  padding: 1.5rem 1rem;
  background-color: var(--primary-color) !important;
}

.card-header h4 {
  margin-bottom: 0;
  font-weight: 600;
}

.registration-container {
  min-height: 80vh;
  display: flex;
  align-items: center;
  padding: 2rem 0;
}

.text-success {
  color: var(--success) !important;
}

.text-danger {
  color: var(--danger) !important;
}

.alert {
  border-radius: var(--rounded);
  padding: 1rem;
  margin-bottom: 1.5rem;
}

.alert-success {
  background-color: rgba(16, 185, 129, 0.1);
  border: 1px solid rgba(16, 185, 129, 0.2);
  color: var(--success);
}

.alert-danger {
  background-color: rgba(239, 68, 68, 0.1);
  border: 1px solid rgba(239, 68, 68, 0.2);
  color: var(--danger);
}

.login-link {
  color: var(--primary-color);
  font-weight: 500;
  text-decoration: none;
}

.login-link:hover {
  text-decoration: underline !important;
  color: var(--secondary-color);
}

.form-section {
  padding: 2rem;
}

.icon-input {
  position: relative;
}

.icon-input i {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  left: 1rem;
  color: var(--text-light);
}

.icon-input input,
.icon-input select {
  padding-left: 2.5rem;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	
	<div class="registration-container">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-8 col-lg-6">
					<div class="card paint-card">
						<div class="card-header text-center text-white">
							<h4><i class="fas fa-user-md me-2"></i>Doctor Registration</h4>
						</div>
						<div class="card-body form-section">
							<c:if test="${not empty successMsg}">
								<div class="alert alert-success" role="alert">
									<i class="fas fa-check-circle me-2"></i>${successMsg}
								</div>
								<c:remove var="successMsg" scope="session" />
							</c:if>
							<c:if test="${not empty errorMsg}">
								<div class="alert alert-danger" role="alert">
									<i class="fas fa-exclamation-circle me-2"></i>${errorMsg}
								</div>
								<c:remove var="errorMsg" scope="session" />
							</c:if>
							
							<form action="doctor_register" method="post">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group icon-input">
											<label><i class="fas fa-user me-2"></i>Full Name</label> 
											<input type="text" name="fullName" class="form-control" placeholder="Enter your full name" required>
										</div>
									</div>
									
									<div class="col-md-6">
										<div class="form-group icon-input">
											<label><i class="fas fa-calendar me-2"></i>Date of Birth</label> 
											<input type="date" name="dateOfBirth" class="form-control" required>
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-6">
										<div class="form-group icon-input">
											<label><i class="fas fa-graduation-cap me-2"></i>Qualification</label> 
											<input type="text" name="qualification" class="form-control" placeholder="Your highest qualification" required>
										</div>
									</div>
									
									<div class="col-md-6">
										<div class="form-group icon-input">
											<label><i class="fas fa-stethoscope me-2"></i>Specialist</label> 
											<select name="specialist" class="form-control" required>
												<option value="">--select specialty--</option>
												
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
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-6">
										<div class="form-group icon-input">
											<label><i class="fas fa-envelope me-2"></i>Email</label> 
											<input type="email" name="email" class="form-control" placeholder="Your email address" required>
										</div>
									</div>
									
									<div class="col-md-6">
										<div class="form-group icon-input">
											<label><i class="fas fa-phone me-2"></i>Phone Number</label> 
											<input type="text" name="phone" class="form-control" placeholder="Your contact number" required>
										</div>
									</div>
								</div>
								
								<div class="form-group icon-input">
									<label><i class="fas fa-lock me-2"></i>Password</label> 
									<input type="password" name="password" class="form-control" placeholder="Create a strong password" required>
									<small class="text-muted">Password should be at least 8 characters with letters and numbers</small>
								</div>
								
								<div class="text-center mt-4">
									<button type="submit" class="btn btn-primary">
										<i class="fas fa-user-plus me-2"></i>Register as Doctor
									</button>
								</div>
							</form>
							
							<div class="text-center mt-4">
								<p>
									Already registered? <a href="doctor_login.jsp" class="login-link">Login here <i class="fas fa-arrow-right ms-1 small"></i></a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Bootstrap JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>