<%@page import="java.util.List"%>
<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.entity.Specialist"%>
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
<title>Edit Doctor | Doctor</title>
<%@include file="../component/allcss.jsp"%>

<!-- customs css for this page -->
<style type="text/css">
:root {
    --primary-blue: #2563eb;
    --secondary-blue: #1e40af;
    --light-blue: #dbeafe;
    --blue-accent: #60a5fa;
    --shadow-color: rgba(37, 99, 235, 0.15);
    --card-radius: 12px;
    --text-dark: #1e293b;
    --text-light: #475569;
}

body {
    background-color: #f8fafc;
    font-family: 'Poppins', sans-serif;
}

.my-card {
    border-radius: var(--card-radius);
    border: none;
    box-shadow: 0 10px 25px var(--shadow-color);
    transition: all 0.3s ease;
    overflow: hidden;
    margin-bottom: 2rem;
}

.my-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 15px 30px rgba(37, 99, 235, 0.2);
}

.card-body {
    padding: 1.75rem;
}

.text-success {
    color: var(--primary-blue) !important;
    font-weight: 600;
    letter-spacing: 0.5px;
}

.form-label {
    color: var(--text-light);
    font-weight: 500;
    margin-bottom: 0.5rem;
    font-size: 0.95rem;
}

.form-control {
    padding: 0.75rem 1rem;
    border-radius: 8px;
    border: 1px solid #e2e8f0;
    transition: all 0.2s;
}

.form-control:focus {
    border-color: var(--blue-accent);
    box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
}

.form-control::placeholder {
    color: #94a3b8;
    font-size: 0.9rem;
}

.btn {
    padding: 0.75rem 1.5rem;
    border-radius: 8px;
    font-weight: 500;
    letter-spacing: 0.5px;
    transition: all 0.3s;
    position: relative;
    overflow: hidden;
}

.btn-success {
    background: linear-gradient(135deg, var(--primary-blue), var(--secondary-blue)) !important;
    border: none !important;
}

.btn-success:hover {
    background: linear-gradient(135deg, var(--secondary-blue), var(--primary-blue)) !important;
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(37, 99, 235, 0.3);
}

.btn::after {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    width: 5px;
    height: 5px;
    background: rgba(255, 255, 255, 0.5);
    opacity: 0;
    border-radius: 100%;
    transform: scale(1, 1) translate(-50%);
    transform-origin: 50% 50%;
}

.btn:focus:not(:active)::after {
    animation: ripple 1s ease-out;
}

@keyframes ripple {
    0% {
        transform: scale(0, 0);
        opacity: 0.5;
    }
    100% {
        transform: scale(20, 20);
        opacity: 0;
    }
}

.text-center.text-success.fs-5 {
    padding: 0.75rem;
    background-color: rgba(37, 99, 235, 0.1);
    border-radius: 8px;
    margin-bottom: 1rem;
}

.text-center.text-danger.fs-5 {
    padding: 0.75rem;
    background-color: rgba(239, 68, 68, 0.1);
    border-radius: 8px;
    margin-bottom: 1rem;
}

select.form-control {
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='%232563eb' viewBox='0 0 16 16'%3E%3Cpath d='M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z'/%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: right 1rem center;
    background-size: 16px 12px;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    padding-right: 2.5rem;
}

.mb-3 {
    margin-bottom: 1.25rem !important;
}

/* Card top border accent */
.my-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 4px;
    background: linear-gradient(90deg, var(--primary-blue), var(--secondary-blue));
}

/* New responsive layout for reordering */
@media (min-width: 992px) {
    .profile-container {
        display: flex;
        flex-direction: column;
    }
    
    .edit-profile-section {
        order: 1;
        margin-bottom: 2rem;
    }
    
    .change-password-section {
        order: 2;
    }
}

@media (max-width: 991px) {
    .container {
        max-width: 100%;
        padding: 1rem;
    }
}
</style>
<!-- end of customs css for this page -->


</head>
<body>
	<%@include file="navbar.jsp"%>

	<!-- if "doctorObj" is empty means no one is login. -->

	<c:if test="${empty doctorObj }">

		<c:redirect url="../doctor_login.jsp"></c:redirect>

	</c:if>

	<!-- check is doctor is login or not -->

	<div class="container p-4">
		<div class="profile-container">
			<!-- EDIT PROFILE SECTION FIRST -->
			<div class="edit-profile-section">
				<div class="card my-card">
					<div class="card-body">
						<p class="fs-3 text-center text-success">Edit Doctor Profile</p>

						<!-- for message -->
						<!-- success message -->
						<c:if test="${not empty successMsgForD }">
							<p class="text-center text-success fs-5">${successMsgForD}</p>
							<c:remove var="successMsgForD" scope="session" />
						</c:if>

						<!-- error message -->
						<c:if test="${not empty errorMsgForD }">
							<p class="text-center text-danger fs-5">${errorMsgForD}</p>
							<c:remove var="errorMsgForD" scope="session" />
						</c:if>
						<!-- end of message -->

						<!-- bootstrap form -->
						<form action="../doctorEditProfile" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input
									name="fullName" type="text" placeholder="Enter full name"
									class="form-control" value="${doctorObj.fullName}">

							</div>
							<div class="mb-3">
								<label class="form-label">Date of Birth</label> <input
									name="dateOfBirth" type="date" placeholder="Enter DOB"
									class="form-control" value="${doctorObj.dateOfBirth}">

							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									name="qualification" type="text"
									placeholder="Enter qualification" class="form-control"
									value="${doctorObj.qualification}">
							</div>

							<div class="mb-3">
								<label class="form-label">Specialist</label> <select
									class="form-control" name="specialist">
									<option>${ doctorObj.specialist }</option>

									<%
									SpecialistDAO spDAO = new SpecialistDAO(DBConnection.getConn());
									List<Specialist> spList = spDAO.getAllSpecialist();
									for (Specialist sp : spList) {
									%>
									<option>
										<%=sp.getSpecialistName()%>
									</option>
									<%
									}
									%>

								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email address</label> <input
									name="email" type="email" placeholder="Enter Email"
									class="form-control" readonly value="${doctorObj.email}">

							</div>
							<div class="mb-3">
								<label class="form-label">Phone</label> <input name="phone"
									type="text" placeholder="Enter mobile number"
									class="form-control" value="${doctorObj.phone}">

							</div>
							
							<input type="hidden" value="${doctorObj.id}" name="doctorId">

							<button type="submit"
								class="btn btn-success text-white col-md-12">Update</button>
						</form>
					</div>
				</div>
			</div>

			<!-- CHANGE PASSWORD SECTION SECOND -->
			<div class="change-password-section">
				<div class="card my-card">
					<div class="card-body">
						<p class="fs-3 text-center text-success">Change Password</p>

						<!-- for message -->
						<!-- success message -->
						<c:if test="${not empty successMsg }">
							<p class="text-center text-success fs-5">${successMsg}</p>
							<c:remove var="successMsg" scope="session" />
						</c:if>

						<!-- error message -->
						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<!-- end of message -->

						<!-- doctor change password form -->
						<form action="../doctorChangePassword" method="post">
							<div class="mb-3">
								<label class="form-label">Enter New Password</label> <input
									name="newPassword" type="password"
									placeholder="Enter new password" class="form-control"
									required="required">

							</div>
							<div class="mb-3">
								<label class="form-label">Enter Old Password</label> <input
									name="oldPassword" type="password"
									placeholder="Enter old password" class="form-control" required>
							</div>
							<input type="hidden" value="${doctorObj.id}" name="doctorId">

							<button type="submit" class="btn btn-success col-md-12">Change
								Password</button>
						</form>
						<!-- doctor change password form -->
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>