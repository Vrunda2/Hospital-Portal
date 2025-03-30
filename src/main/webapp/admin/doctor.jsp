<%@page import="com.hms.entity.Doctor"%>
<%@page import="com.hms.dao.DoctorDAO"%>
<%@page import="com.hms.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.dao.SpecialistDAO"%>
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
<title>Register Doctor | Healthcare Management System</title>
<%@include file="../component/allcss.jsp"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<!-- Custom CSS -->
<style>
:root {
  --primary: #0369a1;
  --primary-light: #0ea5e9;
  --primary-dark: #075985; 
  --secondary: #f0f9ff;
  --accent: #38bdf8;
  --success: #10b981;
  --warning: #f59e0b;
  --danger: #ef4444;
  --dark: #0f172a;
  --light: #f8fafc;
  --body-bg: #f1f5f9;
  --card-bg: #ffffff;
  --border-radius: 16px;
  --icon-size: 18px;
  --transition: all 0.3s ease;
  --box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
  --hover-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  background-color: var(--body-bg);
  color: var(--dark);
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
  line-height: 1.6;
}

.page-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 2rem;
}

.page-header {
  margin-bottom: 2rem;
  text-align: center;
}

.page-title {
  font-size: 2.5rem;
  font-weight: 800;
  color: var(--primary-dark);
  margin-bottom: 0.5rem;
}

.card {
  background-color: var(--card-bg);
  border-radius: var(--border-radius);
  box-shadow: var(--box-shadow);
  transition: var(--transition);
  border: none;
  overflow: hidden;
}

.card:hover {
  box-shadow: var(--hover-shadow);
  transform: translateY(-5px);
}

.card-header {
  background: linear-gradient(135deg, var(--primary) 0%, var(--primary-light) 100%);
  color: white;
  padding: 2rem;
  border-bottom: none;
  position: relative;
}

.card-header::after {
  content: '';
  position: absolute;
  bottom: -20px;
  left: 0;
  right: 0;
  height: 40px;
  background-color: var(--card-bg);
  border-radius: 50% 50% 0 0;
}

.card-header-icon {
  background-color: rgba(255, 255, 255, 0.2);
  width: 60px;
  height: 60px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto 1rem;
}

.card-header-icon i {
  font-size: 28px;
}

.card-body {
  padding: 2.5rem;
}

.form-group {
  margin-bottom: 1.5rem;
  position: relative;
}

.form-control {
  height: 55px;
  border-radius: 12px;
  padding: 10px 16px 10px 45px;
  font-size: 1rem;
  border: 2px solid #e2e8f0;
  background-color: #f8fafc;
  transition: var(--transition);
}

.form-control:focus {
  border-color: var(--primary-light);
  background-color: white;
  box-shadow: 0 0 0 4px rgba(14, 165, 233, 0.15);
}

select.form-control {
  appearance: none;
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='%230ea5e9'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M19 9l-7 7-7-7'%3E%3C/path%3E%3C/svg%3E");
  background-repeat: no-repeat;
  background-position: right 16px center;
  background-size: 16px;
  padding-right: 45px;
}

.form-label {
  position: absolute;
  left: 45px;
  top: 17px;
  font-size: 1rem;
  color: #64748b;
  transition: var(--transition);
  pointer-events: none;
  z-index: 1;
}

.form-control:focus ~ .form-label,
.form-control:not(:placeholder-shown) ~ .form-label {
  transform: translateY(-24px) scale(0.85);
  color: var(--primary);
  font-weight: 600;
}

.form-icon {
  position: absolute;
  left: 16px;
  top: 19px;
  color: #94a3b8;
  transition: var(--transition);
  z-index: 2;
}

.form-control:focus ~ .form-icon {
  color: var(--primary);
}

.form-row {
  display: flex;
  flex-wrap: wrap;
  margin: 0 -10px;
}

.form-col {
  flex: 1 0 50%;
  padding: 0 10px;
}

@media (max-width: 768px) {
  .form-col {
    flex: 1 0 100%;
  }
}

.btn {
  font-weight: 600;
  height: 55px;
  border-radius: 12px;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  transition: var(--transition);
  padding: 0 2rem;
  font-size: 1rem;
  border: none;
  cursor: pointer;
}

.btn-primary {
  background: linear-gradient(135deg, var(--primary) 0%, var(--primary-light) 100%);
  color: white;
  box-shadow: 0 10px 15px -3px rgba(3, 105, 161, 0.3);
}

.btn-primary:hover {
  background: linear-gradient(135deg, var(--primary-dark) 0%, var(--primary) 100%);
  transform: translateY(-3px);
  box-shadow: 0 15px 20px -3px rgba(3, 105, 161, 0.4);
}

.btn-icon {
  margin-right: 10px;
  font-size: var(--icon-size);
}

.alert {
  padding: 1rem;
  border-radius: 12px;
  margin-bottom: 1.5rem;
  display: flex;
  align-items: center;
}

.alert-icon {
  margin-right: 1rem;
  font-size: 20px;
}

.alert-success {
  background-color: rgba(16, 185, 129, 0.1);
  color: var(--success);
  border-left: 4px solid var(--success);
}

.alert-danger {
  background-color: rgba(239, 68, 68, 0.1);
  color: var(--danger);
  border-left: 4px solid var(--danger);
}

.divider {
  height: 1px;
  background-color: #e2e8f0;
  margin: 2rem 0;
  position: relative;
}

.divider-text {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: white;
  padding: 0 1rem;
  color: #64748b;
  font-size: 0.875rem;
}

.helper-text {
  font-size: 0.85rem;
  color: #64748b;
  margin-top: 0.5rem;
}

.floating-input .form-control {
  padding: 1.1rem 1rem 0.5rem 45px;
}

.floating-input .form-label {
  top: 0;
  margin: 0;
  padding: 1.1rem 0 0.5rem 0;
}

.floating-input .form-control:focus ~ .form-label,
.floating-input .form-control:not(:placeholder-shown) ~ .form-label {
  transform: translateY(-0.5rem) scale(0.85);
  transform-origin: left top;
}

/* Adjustments for specific elements */
.date-input::-webkit-calendar-picker-indicator {
  position: absolute;
  right: 15px;
  filter: invert(60%);
}

.steps {
  display: flex;
  margin-bottom: 2rem;
  justify-content: center;
}

.step {
  display: flex;
  flex-direction: column;
  align-items: center;
  flex: 1;
  max-width: 100px;
  position: relative;
}

.step-number {
  width: 30px;
  height: 30px;
  border-radius: 50%;
  background-color: var(--primary);
  color: white;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: bold;
  margin-bottom: 0.5rem;
}

.step-title {
  font-size: 0.8rem;
  text-align: center;
  color: var(--primary);
  font-weight: 600;
}

.step:not(:last-child)::after {
  content: '';
  position: absolute;
  top: 15px;
  right: -50%;
  width: 100%;
  height: 2px;
  background-color: var(--primary-light);
  z-index: -1;
}

.form-section {
  margin-bottom: 2rem;
}

.section-title {
  font-size: 1.1rem;
  font-weight: 600;
  color: var(--primary-dark);
  margin-bottom: 1rem;
  display: flex;
  align-items: center;
}

.section-icon {
  margin-right: 0.5rem;
  color: var(--primary);
}

.form-required::after {
  content: '*';
  color: var(--danger);
  margin-left: 4px;
}
</style>
<!-- End of Custom CSS -->

</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="page-container">
		<div class="page-header">
			<h1 class="page-title">Doctor Registration Portal</h1>
		</div>
		
		<div class="row justify-content-center">
			<div class="col-xl-8 col-lg-10">
				<div class="card">
					<div class="card-header text-center">
						<div class="card-header-icon">
							<i class="fas fa-user-md"></i>
						</div>
						<h2>Register New Doctor</h2>
						<p>Complete the form below to add a new doctor to the system</p>
					</div>
					
					<div class="card-body">
						<!-- message alerts -->
						<c:if test="${not empty successMsg }">
							<div class="alert alert-success">
								<i class="fas fa-check-circle alert-icon"></i>
								<div>
									<strong>Success!</strong> ${successMsg}
								</div>
							</div>
							<c:remove var="successMsg" scope="session" />
						</c:if>

						<c:if test="${not empty errorMsg }">
							<div class="alert alert-danger">
								<i class="fas fa-exclamation-triangle alert-icon"></i>
								<div>
									<strong>Error!</strong> ${errorMsg}
								</div>
							</div>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<!-- End of message alerts -->
						
						<!-- Steps indicator -->
						<div class="steps">
							<div class="step">
								<div class="step-number">1</div>
								<div class="step-title">Personal Info</div>
							</div>
							<div class="step">
								<div class="step-number">2</div>
								<div class="step-title">Professional</div>
							</div>
							<div class="step">
								<div class="step-number">3</div>
								<div class="step-title">Account</div>
							</div>
						</div>
						
						<!-- Registration form -->
						<form action="../addDoctor" method="post">
							
							<!-- Personal Information Section -->
							<div class="form-section">
								<h3 class="section-title"><i class="fas fa-user section-icon"></i> Personal Information</h3>
								
								<div class="form-row">
									<div class="form-col">
										<div class="form-group floating-input">
											<input name="fullName" type="text" class="form-control" id="fullName" placeholder=" " required>
											<i class="fas fa-user form-icon"></i>
											<label for="fullName" class="form-label form-required">Full Name</label>
										</div>
									</div>
									<div class="form-col">
										<div class="form-group floating-input">
											<input name="dateOfBirth" type="date" class="form-control date-input" id="dateOfBirth" placeholder=" " required>
											<i class="fas fa-calendar-alt form-icon"></i>
											<label for="dateOfBirth" class="form-label form-required">Date of Birth</label>
										</div>
									</div>
								</div>
							</div>
							
							<!-- Professional Information Section -->
							<div class="form-section">
								<h3 class="section-title"><i class="fas fa-briefcase-medical section-icon"></i> Professional Information</h3>
								
								<div class="form-row">
									<div class="form-col">
										<div class="form-group floating-input">
											<input name="qualification" type="text" class="form-control" id="qualification" placeholder=" " required>
											<i class="fas fa-graduation-cap form-icon"></i>
											<label for="qualification" class="form-label form-required">Qualification</label>
										</div>
									</div>
									<div class="form-col">
										<div class="form-group floating-input">
											<select class="form-control" name="specialist" id="specialist" required>
												<option value="" disabled selected></option>
												<%
												SpecialistDAO spDAO = new SpecialistDAO(DBConnection.getConn());
												List<Specialist> spList = spDAO.getAllSpecialist();
												for (Specialist sp : spList) {
												%>
												<option value="<%=sp.getSpecialistName()%>">
													<%=sp.getSpecialistName()%>
												</option>
												<%
												}
												%>
											</select>
											<i class="fas fa-stethoscope form-icon"></i>
											<label for="specialist" class="form-label form-required">Specialization</label>
										</div>
									</div>
								</div>
							</div>
							
							<!-- Account Information Section -->
							<div class="form-section">
								<h3 class="section-title"><i class="fas fa-lock section-icon"></i> Account Information</h3>
								
								<div class="form-row">
									<div class="form-col">
										<div class="form-group floating-input">
											<input name="email" type="email" class="form-control" id="email" placeholder=" " required>
											<i class="fas fa-envelope form-icon"></i>
											<label for="email" class="form-label form-required">Email Address</label>
										</div>
									</div>
									<div class="form-col">
										<div class="form-group floating-input">
											<input name="phone" type="tel" class="form-control" id="phone" placeholder=" " required>
											<i class="fas fa-phone-alt form-icon"></i>
											<label for="phone" class="form-label form-required">Phone Number</label>
										</div>
									</div>
								</div>
								
								<div class="form-group floating-input">
									<input name="password" type="password" class="form-control" id="password" placeholder=" " required>
									<i class="fas fa-key form-icon"></i>
									<label for="password" class="form-label form-required">Password</label>
									<div class="helper-text">Password must be at least 8 characters long</div>
								</div>
							</div>
							
							<div class="divider">
								<span class="divider-text">All fields marked with * are required</span>
							</div>
							
							<div class="text-center">
								<button type="submit" class="btn btn-primary">
									<i class="fas fa-user-plus btn-icon"></i>Register Doctor
								</button>
							</div>
						</form>
						<!-- End of Registration form -->
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>