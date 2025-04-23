<%@page import="com.hms.entity.Doctor"%>
<%@page import="java.util.List"%>
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
<title>User Appointment Page</title>
<!-- all css include -->
<%@include file="../component/allcss.jsp"%>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

<!-- customs css for this page -->
<style type="text/css">
.my-card {
    box-shadow: 0px 5px 20px rgba(0, 123, 255, 0.2);
    border-radius: 15px;
    border: none;
    background: #ffffff;
}

/* background image css */
.my-bg-img {
    background: linear-gradient(rgba(13, 71, 161, 0.7), rgba(13, 71, 161, 0.7)), url("img/hospital1.jpg");
    height: 25vh;
    width: 100%;
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    border-bottom: 5px solid #0d47a1;
}

/* Form styling */
.form-control {
    border-radius: 8px;
    border: 1px solid #d1e3ff;
    padding: 10px 15px;
    transition: all 0.3s ease;
    background-color: #f7faff;
}

.form-control:focus {
    border-color: #0d47a1;
    box-shadow: 0 0 0 0.2rem rgba(13, 71, 161, 0.25);
    background-color: #ffffff;
}

label.form-label {
    font-weight: 500;
    color: #0d47a1;
    margin-bottom: 5px;
}

.btn-primary-blue {
    background-color: #0d47a1;
    border-color: #0d47a1;
    color: white;
    border-radius: 8px;
    padding: 10px 25px;
    font-weight: 600;
    transition: all 0.3s ease;
}

.btn-primary-blue:hover {
    background-color: #0a3d8f;
    border-color: #0a3d8f;
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(13, 71, 161, 0.3);
}

.appointment-title {
    color: #0d47a1;
    font-weight: 700;
    position: relative;
    padding-bottom: 10px;
}

.appointment-title:after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 80px;
    height: 3px;
    background: linear-gradient(90deg, #0d47a1, #2196f3);
}

.appointment-img {
    border-radius: 15px;
    box-shadow: 0px 10px 30px rgba(0, 123, 255, 0.3);
    transition: all 0.3s ease;
}

.appointment-img:hover {
    transform: scale(1.02);
}

.message-success {
    background-color: #e8f5e9;
    border-left: 4px solid #43a047;
    padding: 10px 15px;
    color: #2e7d32;
    border-radius: 5px;
}

.message-error {
    background-color: #ffebee;
    border-left: 4px solid #e53935;
    padding: 10px 15px;
    color: #c62828;
    border-radius: 5px;
}

select.form-control {
    background-image: linear-gradient(45deg, transparent 50%, #0d47a1 50%), 
                      linear-gradient(135deg, #0d47a1 50%, transparent 50%);
    background-position: calc(100% - 20px) calc(1em + 2px), 
                         calc(100% - 15px) calc(1em + 2px);
    background-size: 5px 5px, 5px 5px;
    background-repeat: no-repeat;
    appearance: none;
    -webkit-appearance: none;
}

.row.g-3 .col-md-6, .row.g-3 .col-md-12 {
    margin-bottom: 15px;
}

textarea.form-control {
    resize: none;
    min-height: 100px;
}

.blue-highlight {
    color: #1976d2;
    font-weight: 600;
}

/* Doctor card appearance */
.doctor-option {
    margin: 5px 0;
}

/* Header design */
.header-content {
    padding: 50px 0;
    text-align: center;
}

.header-title {
    color: white;
    font-size: 2.5rem;
    font-weight: 700;
    margin-bottom: 10px;
    text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
}

.header-subtitle {
    color: white;
    font-size: 1.2rem;
    max-width: 600px;
    margin: 0 auto;
    text-shadow: 1px 1px 3px rgba(0,0,0,0.3);
}

/* Keep original my-bg-color for the submit button if it's defined elsewhere */
.my-bg-color {
    background-color: #0d47a1;
}
/* Enhanced header styling */
.my-bg-img {
    background: linear-gradient(rgba(13, 71, 161, 0.8), rgba(13, 71, 161, 0.9)), url("img/hospital1.jpg");
    height: 30vh;
    width: 100%;
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    border-bottom: 5px solid #0d47a1;
    display: flex;
    align-items: center;
    justify-content: center;
}

.header-content {
    padding: 30px 0;
    text-align: center;
    max-width: 800px;
    margin: 0 auto;
}

.header-title {
    color: white;
    font-size: 3.2rem;
    font-weight: 700;
    margin-bottom: 15px;
    text-shadow: 2px 2px 8px rgba(0,0,0,0.4);
    letter-spacing: 1px;
}

.header-subtitle {
    color: white;
    font-size: 1.3rem;
    max-width: 600px;
    margin: 0 auto;
    text-shadow: 1px 1px 4px rgba(0,0,0,0.4);
    font-weight: 300;
    line-height: 1.5;
}

/* Add a subtle animation for the header text */
@keyframes fadeInDown {
    from {
        opacity: 0;
        transform: translateY(-20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.header-title {
    animation: fadeInDown 0.8s ease-out forwards;
}

.header-subtitle {
    animation: fadeInDown 0.8s ease-out 0.2s forwards;
    opacity: 0;
    animation-fill-mode: forwards;
}

/* Animation effects */
@keyframes fadeIn {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}

.animate-fade {
    animation: fadeIn 0.8s ease-out forwards;
}
</style>
<!-- end of customs css for this page -->

</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<!-- start 1st Div -->
	<div class="container-fluid my-bg-img p-5">
		<div class="header-content animate-fade">
			<h1 class="header-title">Book Your Appointment</h1>
			<p class="header-subtitle">Schedule a visit with our qualified healthcare professionals</p>
		</div>
	</div>
	<!-- end of 1st Div -->

	<!-- 2nd Div -->
	<div class="container py-5">
		<div class="row justify-content-center">
			<!-- col-1 -->
			<div class="col-md-5 d-flex align-items-center justify-content-center mb-4 mb-md-0 animate-fade" style="animation-delay: 0.2s;">
				<!-- for Background image -->
				<img alt="Doctor with patient" src="img/doc3.jpg" class="img-fluid appointment-img" width="100%">
			</div>
			
			<!-- col-2 -->
			<div class="col-md-7 animate-fade" style="animation-delay: 0.4s;">
				<div class="card my-card">
					<div class="card-body p-4">
						<h2 class="text-center appointment-title mb-4">Schedule Your Visit</h2>

						<!-- message print -->
						<!-- for success msg -->
						<c:if test="${not empty successMsg }">
							<div class="message-success mb-4">
								<i class="fas fa-check-circle me-2"></i>${successMsg}
							</div>
							<c:remove var="successMsg" scope="session" />
						</c:if>

						<!-- for error msg -->
						<c:if test="${not empty errorMsg }">
							<div class="message-error mb-4">
								<i class="fas fa-exclamation-circle me-2"></i>${errorMsg}
							</div>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<!-- End of message print -->

						<!-- bootstrap form -->
						<form class="row g-3" action="addAppointment" method="post">
							
							<!-- take user Id in hidden field -->
							<input type="hidden" name="userId" value="${ userObj.id }">
							
							<div class="col-md-6">
								<label class="form-label"><i class="fas fa-user me-2"></i>Full Name</label>
								<input required="required" name="fullName" type="text" placeholder="Enter full name" class="form-control">
							</div>

							<div class="col-md-6">
								<label class="form-label"><i class="fas fa-venus-mars me-2"></i>Gender</label>
								<select class="form-control" name="gender" required="required">
									<option selected="selected" disabled="disabled">---Select Gender---</option>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>

							<div class="col-md-6">
								<label class="form-label"><i class="fas fa-birthday-cake me-2"></i>Age</label>
								<input name="age" required="required" type="number" placeholder="Enter your Age" class="form-control">
							</div>
							
							<div class="col-md-6">
								<label class="form-label"><i class="fas fa-calendar-alt me-2"></i>Appointment Date</label>
								<input required="required" name="appointmentDate" type="date" class="form-control">
							</div>

							<div class="col-md-6">
								<label class="form-label"><i class="fas fa-envelope me-2"></i>Email</label>
								<input name="email" required="required" type="email" placeholder="Enter email" class="form-control">
							</div>

							<div class="col-md-6">
								<label class="form-label"><i class="fas fa-phone me-2"></i>Phone</label>
								<input name="phone" required="required" type="number" maxlength="11" placeholder="Enter Mobile no." class="form-control">
							</div>

							<div class="col-md-6">
								<label class="form-label"><i class="fas fa-heartbeat me-2"></i>Diseases</label>
								<input required="required" name="diseases" type="text" placeholder="Enter diseases" class="form-control">
							</div>

							<div class="col-md-6">
								<label class="form-label"><i class="fas fa-user-md me-2"></i>Doctor</label>
								<select required="required" class="form-control" name="doctorNameSelect">
									<option selected="selected" disabled="disabled">---Select Doctor---</option>
									
									<%
									DoctorDAO doctorDAO = new DoctorDAO(DBConnection.getConn());
									List<Doctor> listOfDoctor = doctorDAO.getAllDoctor();
									for(Doctor d : listOfDoctor)
									{%>
									<!-- actually we take id of doctor from doctor table -->
									<option value="<%= d.getId() %>"><%= d.getFullName()%> (<%= d.getSpecialist() %>)</option>
									<%
									}
									%>
								</select>
							</div>

							<!-- below are visible to right side part of form-->
							<div class="col-md-12">
								<label class="form-label"><i class="fas fa-map-marker-alt me-2"></i>Full Address</label>
								<textarea name="address" required="required" class="form-control" rows="3" cols="" placeholder="Enter your full address"></textarea>
							</div>

							<c:if test="${empty userObj}">
								<div class="col-md-12 mt-3">
									<a href="user_login.jsp" class="btn my-bg-color text-white col-md-12 py-3">
										<i class="fas fa-sign-in-alt me-2"></i>Login to Submit
									</a>
								</div>
							</c:if>

							<c:if test="${not empty userObj}">
								<div class="col-md-12 mt-3">
									<button type="submit" class="btn my-bg-color text-white col-md-12 py-3">
										<i class="fas fa-calendar-check me-2"></i>Confirm Appointment
									</button>
								</div>
							</c:if>
						</form>
						<!-- end of bootstrap form -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end of 2nd Div -->

	<!-- footer -->
	<%@include file="component/footer.jsp" %>
	<!-- end footer -->

	<!-- Add animation script -->
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			// Function to check if element is in viewport
			function isInViewport(element) {
				const rect = element.getBoundingClientRect();
				return (
					rect.top >= 0 &&
					rect.left >= 0 &&
					rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
					rect.right <= (window.innerWidth || document.documentElement.clientWidth)
				);
			}
			
			// Handle animations on scroll
			function handleScrollAnimations() {
				document.querySelectorAll('.animate-fade').forEach(function(element) {
					if (isInViewport(element) && !element.classList.contains('animated')) {
						element.classList.add('animated');
						element.style.opacity = 1;
						element.style.transform = 'translateY(0)';
					}
				});
			}
			
			// Initial check
			handleScrollAnimations();
			
			// On scroll
			window.addEventListener('scroll', handleScrollAnimations);
		});
	</script>
</body>
</html>