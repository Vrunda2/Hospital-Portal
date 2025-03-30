<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- for jstl tag -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- end of jstl tag -->

<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Login | Doctor Patient Portal</title>
<%@include file="component/allcss.jsp"%>

<!-- FontAwesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<!-- Custom CSS for this page -->
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

.my-card {
  border-radius: var(--rounded);
  box-shadow: var(--shadow);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  border: none;
  overflow: hidden;
}

.my-bg-color {
  background-color: var(--primary-color);
  border-color: var(--primary-color);
}

.btn-primary {
  background-color: var(--primary-color);
  border-color: var(--primary-color);
  transition: all 0.3s ease;
}

.btn-primary:hover {
  background-color: var(--secondary-color);
  border-color: var(--secondary-color);
}

.form-control {
  border-radius: 0.375rem;
  padding: 0.625rem 0.75rem;
  border: 1px solid #d1d5db;
  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.form-control:focus {
  border-color: var(--accent-color);
  box-shadow: 0 0 0 0.25rem rgba(96, 165, 250, 0.25);
}

.text-success {
  color: var(--success) !important;
}

.text-danger {
  color: var(--danger) !important;
}

.login-container {
  min-height: 80vh;
  display: flex;
  align-items: center;
  justify-content: center;
}

.card-header {
  padding: 1.5rem 1rem;
}

.brand-logo {
  font-size: 2rem;
  margin-bottom: 0.5rem;
}

.login-title {
  font-weight: 600;
  margin-bottom: 0;
}

.form-text {
  color: var(--text-light);
}

.login-btn {
  padding: 0.625rem 1.25rem;
  font-weight: 500;
  margin-top: 1rem;
}

.signup-link {
  display: inline-block;
  margin-top: 1rem;
  color: var(--primary-color);
  font-weight: 500;
}

.signup-link:hover {
  color: var(--secondary-color);
  text-decoration: underline !important;
}

.alert {
  border-radius: var(--rounded);
  padding: 1rem;
  margin-bottom: 1rem;
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
</style>
<!-- End of custom CSS -->

</head>
<body>
	<!-- navbar -->
	<%@include file="component/navbar.jsp"%>
	<!-- end navbar -->

	<!-- User Login -->
	<div class="login-container">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-5 col-lg-4">
					<div class="card my-card">
						<div class="card-header text-center text-white my-bg-color">
							<i class="fas fa-user-circle brand-logo"></i>
							<h4 class="login-title">User Login</h4>
						</div>
						
						<div class="card-body p-4">
							<!-- success message -->
							<c:if test="${not empty successMsg}">
								<div class="alert alert-success" role="alert">
									<i class="fas fa-check-circle me-2"></i>${successMsg}
								</div>
								<c:remove var="successMsg" scope="session" />
							</c:if>

							<!-- error message -->
							<c:if test="${not empty errorMsg}">
								<div class="alert alert-danger" role="alert">
									<i class="fas fa-exclamation-circle me-2"></i>${errorMsg}
								</div>
								<c:remove var="errorMsg" scope="session" />
							</c:if>

							<!-- login form -->
							<form action="userLogin" method="post">
								<div class="mb-3">
									<label class="form-label fw-medium">Email address</label>
									<div class="input-group mb-2">
										<span class="input-group-text bg-light border-end-0">
											<i class="fas fa-envelope text-muted"></i>
										</span>
										<input name="email" type="email" placeholder="Enter your email" 
											class="form-control border-start-0" required>
									</div>
									<div class="form-text">
										<i class="fas fa-lock-open me-1"></i>We'll never share your email with anyone else.
									</div>
								</div>
								
								<div class="mb-4">
									<label class="form-label fw-medium">Password</label>
									<div class="input-group">
										<span class="input-group-text bg-light border-end-0">
											<i class="fas fa-lock text-muted"></i>
										</span>
										<input name="password" type="password" placeholder="Enter your password" 
											class="form-control border-start-0" required>
									</div>
								</div>

								<button type="submit" class="btn btn-primary login-btn w-100">
									<i class="fas fa-sign-in-alt me-2"></i>Login
								</button>
								
								<div class="text-center mt-4">
									<span class="text-muted">Don't have an account?</span>
									<a href="signup.jsp" class="signup-link ms-2 text-decoration-none">
										Create one <i class="fas fa-arrow-right ms-1 small"></i>
									</a>
								</div>
							</form>
						</div>
					</div>
					
					<div class="text-center mt-4 text-muted">
						<small>&copy; 2025 Doctor Patient Portal. All rights reserved.</small>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End of User Login -->

	<!-- Bootstrap JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>