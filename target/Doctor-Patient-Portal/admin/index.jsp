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
<title>Admin page</title>
<%@include file="../component/allcss.jsp"%>

<!-- customs css for this page -->
<style type="text/css">
:root {
  --primary-blue: #1a73e8;
  --primary-dark: #0d47a1;
  --primary-light: #e8f0fe;
  --accent: #00c3ff;
  --text-primary: #202124;
  --text-secondary: #5f6368;
  --shadow-sm: 0 2px 5px rgba(0, 0, 0, 0.1);
  --shadow-md: 0 4px 10px rgba(0, 0, 0, 0.15);
  --shadow-lg: 0 8px 20px rgba(0, 0, 0, 0.2);
  --radius: 12px;
  --transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
}

body {
  background-color: #f6f9fc;
  color: var(--text-primary);
  font-family: 'Segoe UI', -apple-system, BlinkMacSystemFont, sans-serif;
}

.dashboard-container {
  padding: 2rem;
  max-width: 1280px;
  margin: 0 auto;
}

.dashboard-header {
  margin-bottom: 2rem;
  position: relative;
  text-align: center;
}

.dashboard-title {
  font-weight: 700;
  color: var(--primary-blue);
  font-size: 2.2rem;
  margin-bottom: 1rem;
  letter-spacing: -0.5px;
  position: relative;
  display: inline-block;
}

.dashboard-title::after {
  content: "";
  position: absolute;
  bottom: -10px;
  left: 50%;
  transform: translateX(-50%);
  width: 80px;
  height: 4px;
  background: linear-gradient(90deg, var(--primary-blue), var(--accent));
  border-radius: 2px;
}

.my-card {
  border: none;
  border-radius: var(--radius);
  background: white;
  box-shadow: var(--shadow-md);
  transition: var(--transition);
  overflow: hidden;
  height: 100%;
  position: relative;
  z-index: 1;
}

.my-card::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 5px;
  background: linear-gradient(90deg, var(--primary-blue), var(--accent));
  z-index: 2;
}

.my-card:hover {
  transform: translateY(-8px);
  box-shadow: var(--shadow-lg);
}

.card-body {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: 2rem 1.5rem;
  position: relative;
  z-index: 3;
}

.dashboard-icon {
  width: 70px;
  height: 70px;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: var(--primary-light);
  color: var(--primary-blue);
  border-radius: 50%;
  margin-bottom: 1.5rem;
  position: relative;
  overflow: hidden;
}

.dashboard-icon::after {
  content: '';
  position: absolute;
  width: 100%;
  height: 100%;
  background: radial-gradient(circle, rgba(255,255,255,0) 30%, rgba(26, 115, 232, 0.1) 100%);
}

.dashboard-icon i {
  font-size: 1.8rem;
  z-index: 2;
}

.stat-label {
  font-weight: 600;
  color: var(--text-secondary);
  font-size: 1rem;
  margin: 0;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.stat-value {
  font-size: 2.5rem;
  font-weight: 700;
  color: var(--primary-blue);
  margin: 0.2rem 0 0;
}

.clickable-card {
  cursor: pointer;
  position: relative;
}

.clickable-card::after {
  content: "+";
  position: absolute;
  right: 1rem;
  top: 1rem;
  width: 25px;
  height: 25px;
  background: var(--primary-light);
  color: var(--primary-blue);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: bold;
  opacity: 0;
  transition: var(--transition);
}

.clickable-card:hover::after {
  opacity: 1;
}

/* Alert styles */
.alert {
  border-radius: var(--radius);
  border: none;
  box-shadow: var(--shadow-sm);
  position: relative;
  padding-left: 3rem;
  margin-bottom: 2rem;
}

.alert::before {
  font-family: "Font Awesome 5 Free";
  font-weight: 900;
  position: absolute;
  left: 1rem;
  top: 50%;
  transform: translateY(-50%);
}

.alert-success {
  background-color: #e3f6e8;
  color: #0a6b2e;
}

.alert-success::before {
  content: "\f058";
  color: #0a6b2e;
}

.alert-danger {
  background-color: #fdeded;
  color: #b71c1c;
}

.alert-danger::before {
  content: "\f057";
  color: #b71c1c;
}

/* Modal styling */
.modal-content {
  border: none;
  border-radius: var(--radius);
  overflow: hidden;
  box-shadow: var(--shadow-lg);
}

.modal-header {
  background: linear-gradient(90deg, var(--primary-blue), var(--accent));
  color: white;
  border-bottom: none;
  padding: 1.5rem;
}

.modal-title {
  font-weight: 600;
  letter-spacing: 0.5px;
}

.modal-body {
  padding: 2rem;
}

.form-label {
  font-weight: 500;
  color: var(--text-secondary);
  margin-bottom: 0.5rem;
}

.form-control {
  border-radius: 8px;
  border: 1px solid #e1e1e1;
  padding: 0.75rem 1rem;
  transition: var(--transition);
}

.form-control:focus {
  border-color: var(--primary-blue);
  box-shadow: 0 0 0 4px rgba(26, 115, 232, 0.15);
}

.modal-footer {
  border-top: none;
  padding: 1rem 2rem 1.5rem;
}

.btn-outline-primary-blue {
  color: var(--primary-blue);
  border: 2px solid var(--primary-blue);
  border-radius: 8px;
  padding: 0.5rem 1.5rem;
  font-weight: 600;
  transition: var(--transition);
}

.btn-outline-primary-blue:hover {
  background-color: var(--primary-blue);
  color: white;
}

.btn-secondary {
  background-color: #e1e1e1;
  border: none;
  color: var(--text-secondary);
  border-radius: 8px;
  padding: 0.5rem 1.5rem;
  font-weight: 500;
  transition: var(--transition);
}

.btn-secondary:hover {
  background-color: #d1d1d1;
  color: var(--text-primary);
}

.btn-close {
  color: white;
  opacity: 0.8;
}

.btn-close:hover {
  opacity: 1;
}

/* Stats row */
.stats-row {
  margin-top: 1rem;
}

@media (max-width: 992px) {
  .stats-row > div {
    margin-bottom: 1rem;
  }
}

@media (max-width: 768px) {
  .dashboard-title {
    font-size: 1.8rem;
  }
  .stat-value {
    font-size: 2rem;
  }
}
</style>
<!-- end of customs css for this page -->

</head>
<body>
	<%@include file="navbar.jsp"%>

	<!-- adminObj session maintain if "adminObj" empty than go and login first...-->
	<!-- no one can access admin dashboard without login as admin-->
	<c:if test="${empty adminObj }">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>

	<div class="dashboard-container">
		<div class="dashboard-header">
			<h2 class="dashboard-title">Admin Dashboard</h2>
		</div>

		<!-- message print -->
		<!-- for success msg -->
		<c:if test="${not empty successMsg }">
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				${successMsg}
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
			<c:remove var="successMsg" scope="session" />
		</c:if>

		<!-- for error msg -->
		<c:if test="${not empty errorMsg }">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				${errorMsg}
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
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

		<!-- row-1 -->
		<div class="row stats-row g-4">
			<div class="col-md-3 col-sm-6">
				<div class="my-card">
					<div class="card-body">
						<div class="dashboard-icon">
							<i class="fa-solid fa-user-doctor"></i>
						</div>
						<p class="stat-label">Doctors</p>
						<h3 class="stat-value"><%= totalNumberOfDoctor %></h3>
					</div>
				</div>
			</div>
			
			<div class="col-md-3 col-sm-6">
				<div class="my-card">
					<div class="card-body">
						<div class="dashboard-icon">
							<i class="fas fa-user-circle"></i>
						</div>
						<p class="stat-label">Users</p>
						<h3 class="stat-value"><%= totalNumberOfUser %></h3>
					</div>
				</div>
			</div>
			
			<div class="col-md-3 col-sm-6">
				<div class="my-card">
					<div class="card-body">
						<div class="dashboard-icon">
							<i class="fa-solid fa-calendar-check"></i>
						</div>
						<p class="stat-label">Appointments</p>
						<h3 class="stat-value"><%= totalNumberOfAppointment %></h3>
					</div>
				</div>
			</div>
			
			<div class="col-md-3 col-sm-6">
				<div class="my-card clickable-card" data-bs-toggle="modal" data-bs-target="#exampleModal">
					<div class="card-body">
						<div class="dashboard-icon">
							<i class="fa-solid fa-stethoscope"></i>
						</div>
						<p class="stat-label">Specialists</p>
						<h3 class="stat-value"><%= totalNumberOfSpecialist %></h3>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- specialis modal -->
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Specialist</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="../addSpecialist" method="post">
						<div class="form-group mb-3">
							<label class="form-label">Enter Specialist Name</label>
							<input type="text" name="specialistName" placeholder="Enter Specialist Name" class="form-control" />
						</div>
						<div class="text-center mt-4">
							<button type="submit" class="btn btn-outline-primary-blue">Add</button>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end of specialis modal -->
</body>
</html>