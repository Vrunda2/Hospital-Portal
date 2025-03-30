<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.dao.DoctorDAO"%>
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
<title>Admin Dashboard</title>
<%@include file="../component/allcss.jsp"%>

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<!-- Custom CSS for this page -->
<style type="text/css">
:root {
  --primary-blue: #1e88e5;
  --primary-dark: #1565c0;
  --primary-light: #bbdefb;
  --accent-blue: #2979ff;
  --text-dark: #333;
  --text-light: #fff;
  --bg-light: #f5f7fa;
  --box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
}

body {
  background-color: var(--bg-light);
  font-family: 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', sans-serif;
}

.dashboard-title {
  color: var(--primary-dark);
  font-weight: 600;
  margin-bottom: 2rem;
  position: relative;
  padding-bottom: 10px;
}

.dashboard-title:after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 50%;
  transform: translateX(-50%);
  width: 80px;
  height: 4px;
  background-color: var(--primary-blue);
  border-radius: 2px;
}

.my-card {
  background-color: white;
  border-radius: 12px;
  border: none;
  box-shadow: var(--box-shadow);
  transition: transform 0.3s, box-shadow 0.3s;
  cursor: pointer;
  overflow: hidden;
}

.my-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
}

.card-header-blue {
  background-color: var(--primary-blue);
  color: var(--text-light);
  padding: 15px;
  border-radius: 12px 12px 0 0;
}

.card-body-custom {
  padding: 20px;
  text-align: center;
}

.stat-icon {
  color: var(--primary-blue);
  margin-bottom: 15px;
  font-size: 2.5rem;
}

.stat-title {
  color: var(--text-dark);
  font-size: 1.1rem;
  margin-bottom: 5px;
  font-weight: 500;
}

.stat-value {
  color: var(--primary-dark);
  font-size: 2rem;
  font-weight: 600;
}

.alert-custom-success {
  background-color: #e8f5e9;
  color: #2e7d32;
  border-radius: 8px;
  padding: 12px;
  margin-bottom: 20px;
}

.alert-custom-danger {
  background-color: #ffebee;
  color: #c62828;
  border-radius: 8px;
  padding: 12px;
  margin-bottom: 20px;
}

/* Modal customization */
.modal-header {
  background-color: var(--primary-blue);
  color: var(--text-light);
  border-radius: 10px 10px 0 0;
}

.modal-content {
  border-radius: 10px;
  border: none;
  box-shadow: var(--box-shadow);
}

.btn-primary-custom {
  background-color: var(--primary-blue);
  color: var(--text-light);
  border: none;
  padding: 8px 20px;
  border-radius: 6px;
  transition: background-color 0.3s;
}

.btn-primary-custom:hover {
  background-color: var(--primary-dark);
}

.btn-secondary-custom {
  background-color: #e0e0e0;
  color: var(--text-dark);
  border: none;
  padding: 8px 20px;
  border-radius: 6px;
  transition: background-color 0.3s;
}

.btn-secondary-custom:hover {
  background-color: #bdbdbd;
}

.form-control-custom {
  border-radius: 6px;
  border: 1px solid #ddd;
  padding: 10px 15px;
  transition: border-color 0.3s;
}

.form-control-custom:focus {
  border-color: var(--primary-blue);
  box-shadow: 0 0 0 0.2rem rgba(30, 136, 229, 0.25);
}
</style>
</head>

<body>
	<%@include file="navbar.jsp"%>

	<!-- adminObj session maintain -->
	<c:if test="${empty adminObj }">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>

	<div class="container py-5">
		<h2 class="dashboard-title text-center mb-4">Admin Dashboard</h2>

		<!-- message print -->
		<c:if test="${not empty successMsg }">
			<div class="alert-custom-success text-center">
				<i class="fas fa-check-circle me-2"></i> ${successMsg}
			</div>
			<c:remove var="successMsg" scope="session" />
		</c:if>

		<c:if test="${not empty errorMsg }">
			<div class="alert-custom-danger text-center">
				<i class="fas fa-exclamation-circle me-2"></i> ${errorMsg}
			</div>
			<c:remove var="errorMsg" scope="session" />
		</c:if>
		<!-- End of message print -->

		<!-- create connection with db and others -->
		<% 
		DoctorDAO docDAO = new DoctorDAO(DBConnection.getConn());
		int totalNumberOfDoctor = docDAO.countTotalDoctor();
		int totalNumberOfUser = docDAO.countTotalUser();
		int totalNumberOfAppointment = docDAO.countTotalAppointment();
		int totalNumberOfSpecialist = docDAO.countTotalSpecialist();
		%>

		<!-- Stats Cards -->
		<div class="row g-4">
			<div class="col-md-6 col-lg-3">
				<div class="my-card h-100">
					<div class="card-header-blue">
						<h5 class="m-0 text-center"><i class="fas fa-stethoscope me-2"></i> Doctors</h5>
					</div>
					<div class="card-body-custom">
						<div class="stat-icon">
							<i class="fa-solid fa-user-doctor"></i>
						</div>
						<div class="stat-value"><%= totalNumberOfDoctor %></div>
						<div class="stat-title">Registered Doctors</div>
					</div>
				</div>
			</div>
			
			<div class="col-md-6 col-lg-3">
				<div class="my-card h-100">
					<div class="card-header-blue">
						<h5 class="m-0 text-center"><i class="fas fa-users me-2"></i> Users</h5>
					</div>
					<div class="card-body-custom">
						<div class="stat-icon">
							<i class="fas fa-user-circle"></i>
						</div>
						<div class="stat-value"><%= totalNumberOfUser %></div>
						<div class="stat-title">Registered Users</div>
					</div>
				</div>
			</div>
			
			<div class="col-md-6 col-lg-3">
				<div class="my-card h-100">
					<div class="card-header-blue">
						<h5 class="m-0 text-center"><i class="fas fa-calendar me-2"></i> Appointments</h5>
					</div>
					<div class="card-body-custom">
						<div class="stat-icon">
							<i class="fa-solid fa-calendar-check"></i>
						</div>
						<div class="stat-value"><%= totalNumberOfAppointment %></div>
						<div class="stat-title">Total Appointments</div>
					</div>
				</div>
			</div>
			
			<div class="col-md-6 col-lg-3">
				<div class="my-card h-100" data-bs-toggle="modal" data-bs-target="#specialistModal">
					<div class="card-header-blue">
						<h5 class="m-0 text-center"><i class="fas fa-user-md me-2"></i> Specialties</h5>
					</div>
					<div class="card-body-custom">
						<div class="stat-icon">
							<i class="fa-solid fa-stethoscope"></i>
						</div>
						<div class="stat-value"><%= totalNumberOfSpecialist %></div>
						<div class="stat-title">Specialties Available</div>
						<div class="mt-3">
							<span class="badge bg-primary">Click to Add New</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Specialist Modal -->
	<div class="modal fade" id="specialistModal" tabindex="-1"
		aria-labelledby="specialistModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="specialistModalLabel">
						<i class="fas fa-plus-circle me-2"></i> Add New Specialty
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body p-4">
					<form action="../addSpecialist" method="post">
						<div class="form-group mb-3">
							<label class="form-label fw-semibold">Specialty Name</label>
							<div class="input-group">
								<span class="input-group-text">
									<i class="fas fa-user-md"></i>
								</span>
								<input type="text" name="specialistName" 
									placeholder="Enter specialty name" 
									class="form-control form-control-custom" 
									required />
							</div>
							<small class="text-muted">For example: Cardiology, Neurology, Pediatrics, etc.</small>
						</div>
						<div class="text-center mt-4">
							<button type="button" class="btn btn-secondary-custom me-2" data-bs-dismiss="modal">
								<i class="fas fa-times me-1"></i> Cancel
							</button>
							<button type="submit" class="btn btn-primary-custom">
								<i class="fas fa-plus-circle me-1"></i> Add Specialty
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- End of Specialist Modal -->

	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>