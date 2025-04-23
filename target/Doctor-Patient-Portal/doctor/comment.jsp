<%@page import="com.hms.entity.Appointment"%>
<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.dao.AppointmentDAO"%>
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
<title>Comment/Prescription Doctor</title>
<%@include file="../component/allcss.jsp"%>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

<!-- customs css for this page -->
<style type="text/css">
body {
    font-family: 'Poppins', sans-serif;
    background: #f0f5ff;
    color: #334155;
}

.my-card {
    box-shadow: 0 10px 30px rgba(0, 102, 255, 0.15);
    border-radius: 16px;
    border: none;
    background: #ffffff;
    overflow: hidden;
}

/* background image css - don't touch navbar */
.my-bg-img {
    background: linear-gradient(135deg, rgba(25, 118, 210, 0.95), rgba(13, 71, 161, 0.9)),
        url("../img/hospital1.jpg");
    height: 30vh;
    width: 100%;
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 0;
}

.my-bg-img::after {
    content: "Medical Treatment";
    font-size: 2.8rem;
    color: white;
    font-weight: 600;
    text-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
    letter-spacing: 1px;
}


.card-header {
    /* background: linear-gradient(135deg, #1976D2, #1565C0); */
    color: #07427d;
    padding: 1.5rem;
    border-bottom: none;
    position: relative;
}

.card-header:before {
    content: "";
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 40px;
    background: white;
    border-radius: 50% 50% 0 0;
}

.card-header-icon {
    font-size: 3rem;
    position: absolute;
    right: 30px;
    top: 20px;
    opacity: 0.3;
}

.card-title {
    font-size: 1.8rem;
    font-weight: 600;
    margin-bottom: 0;
    position: relative;
    z-index: 1;
}

.card-body {
    padding: 2rem;
}

.form-section {
    background: #f9faff;
    border-radius: 12px;
    padding: 1.5rem;
    margin-bottom: 2rem;
    border-left: 4px solid #1976D2;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
    transition: all 0.3s ease;
}

.form-section:hover {
    border-left: 4px solid #2196F3;
    transform: translateY(-2px);
    box-shadow: 0 6px 18px rgba(0, 0, 0, 0.08);
}

.section-title {
    font-size: 1.2rem;
    font-weight: 600;
    color: #1976D2;
    margin-bottom: 1.5rem;
    display: flex;
    align-items: center;
}

.section-title i {
    margin-right: 10px;
    background: #e3f2fd;
    padding: 10px;
    border-radius: 50%;
    color: #1976D2;
    box-shadow: 0 3px 5px rgba(33, 150, 243, 0.2);
}

.info-group {
    position: relative;
    margin-bottom: 1.5rem;
}

.form-label {
    font-weight: 500;
    color: #455a64;
    margin-bottom: 0.5rem;
    display: block;
    font-size: 0.9rem;
    transition: all 0.3s ease;
}

.info-icon {
    position: absolute;
    top: 43px;
    right: 15px;
    color: #90a4ae;
    transition: all 0.3s ease;
}

.form-control {
    border: 2px solid #e0e0e0;
    border-radius: 10px;
    padding: 12px 15px;
    font-size: 0.95rem;
    transition: all 0.3s ease;
    background-color: #ffffff;
}

.form-control:focus {
    border-color: #1976D2;
    box-shadow: 0 0 0 3px rgba(33, 150, 243, 0.15);
}

.form-control:read-only {
    background-color: #f5f9ff;
    border-color: #e3f2fd;
    color: #455a64;
}

textarea.form-control {
    min-height: 180px;
    resize: vertical;
    line-height: 1.6;
}

.form-control:focus + .info-icon,
.form-control:focus ~ .form-label {
    color: #1976D2;
}

.message-box {
    padding: 1rem;
    margin-bottom: 1.5rem;
    border-radius: 10px;
    font-weight: 500;
    position: relative;
    overflow: hidden;
    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.08);
}

.message-box:before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 5px;
    height: 100%;
}

.success-message {
    background-color: #e8f5e9;
    color: #2e7d32;
}

.success-message:before {
    background-color: #4caf50;
}

.error-message {
    background-color: #ffebee;
    color: #c62828;
}

.error-message:before {
    background-color: #f44336;
}

.btn-submit {
    background: linear-gradient(135deg, #1976D2, #1565C0);
    color: white;
    font-weight: 600;
    padding: 14px;
    border: none;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(25, 118, 210, 0.35);
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
    z-index: 1;
    letter-spacing: 0.5px;
}

.btn-submit:hover {
    background: linear-gradient(135deg, #1565C0, #0D47A1);
    transform: translateY(-2px);
    box-shadow: 0 6px 15px rgba(25, 118, 210, 0.45);
}

.btn-submit:before {
    content: "";
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
    transition: all 0.6s ease;
    z-index: -1;
}

.btn-submit:hover:before {
    left: 100%;
}

.highlight-field {
    border-bottom: 2px dashed #1976D2;
    padding-bottom: 3px;
    font-weight: 600;
    color: #1976D2;
}

.patient-info-row {
    display: flex;
    align-items: center;
    margin-bottom: 0.5rem;
}

.patient-info-label {
    font-weight: 500;
    width: 90px;
    color: #546e7a;
    font-size: 0.85rem;
}

.patient-info-value {
    font-weight: 600;
    color: #2c3e50;
}

.prescription-guide {
    padding: 12px;
    background: #e3f2fd;
    border-radius: 8px;
    margin-bottom: 1rem;
    font-size: 0.85rem;
    color: #0d47a1;
    border-left: 3px solid #1976D2;
}

.prescription-guide ul {
    margin-bottom: 0;
    padding-left: 1.5rem;
}

.prescription-guide li {
    margin-bottom: 0.25rem;
}

/* Animations */
@keyframes fadeInUp {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}

.animate-fadeInUp {
    animation: fadeInUp 0.5s ease-out forwards;
}

.patient-card {
    background: white;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
    margin-bottom: 1.5rem;
    border-top: 4px solid #1976D2;
}

.patient-card-header {
    background: #f5f9ff;
    padding: 1rem;
    border-bottom: 1px solid #e3f2fd;
}

.patient-card-title {
    margin: 0;
    font-size: 1.1rem;
    color: #1976D2;
    font-weight: 600;
    display: flex;
    align-items: center;
}

.patient-card-title i {
    margin-right: 8px;
}

.patient-card-body {
    padding: 1.5rem;
}

.animated-bg {
    background: linear-gradient(-45deg, #1976D2, #2196F3, #1565C0, #0D47A1);
    background-size: 400% 400%;
    animation: gradientBG 15s ease infinite;
}

@keyframes gradientBG {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

.floating-label-group {
    position: relative;
    margin-bottom: 1.5rem;
}

.floating-label {
    position: absolute;
    pointer-events: none;
    left: 15px;
    top: 15px;
    transition: 0.2s ease all;
    opacity: 0.7;
}

.form-control:focus ~ .floating-label,
.form-control:not(:placeholder-shown) ~ .floating-label {
    top: -10px;
    left: 10px;
    font-size: 12px;
    opacity: 1;
    background: white;
    padding: 0 5px;
    color: #1976D2;
}
</style>
<!-- end of customs css for this page -->

</head>
<body>

	<%@include file="navbar.jsp"%>

	<c:if test="${empty doctorObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<!-- start 1st Div -->
	<div class="container-fluid my-bg-img p-5 animated-bg">
		<!-- css background image with text overlay -->
	</div>
	<!-- end of 1st Div -->

	<!-- 2nd Div -->
	<div class="container py-5">
		<div class="row">
			<div class="col-lg-10 offset-lg-1 animate-fadeInUp">
				<div class="card my-card">
					<div class="card-header">
						<h3 class="card-title">
							<i class="fas fa-notes-medical me-3"></i> Medical Prescription Form
						</h3>
						<div class="card-header-icon">
							<i class="fas fa-stethoscope"></i>
						</div>
					</div>
					<div class="card-body">

						<!-- message print -->
						<c:if test="${not empty successMsg }">
							<div class="message-box success-message">
								<i class="fas fa-check-circle me-2"></i>${successMsg}
							</div>
							<c:remove var="successMsg" scope="session" />
						</c:if>

						<c:if test="${not empty errorMsg }">
							<div class="message-box error-message">
								<i class="fas fa-exclamation-circle me-2"></i>${errorMsg}
							</div>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<!-- End of message print -->

						<%
						/* get or receive appointment id which is coming through url (from patient.jsp page) */
						int id = Integer.parseInt(request.getParameter("id"));
						AppointmentDAO appDAO = new AppointmentDAO(DBConnection.getConn());
						Appointment appointment = appDAO.getAppointmentById(id);
						%>
						
						<!-- bootstrap form -->
						<form class="row g-3" action="../updateStatus" method="post">
                            <div class="col-12">
                                <div class="patient-card">
                                    <div class="patient-card-header">
                                        <h5 class="patient-card-title">
                                            <i class="fas fa-user-injured"></i> Patient Details
                                        </h5>
                                    </div>
                                    <div class="patient-card-body">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="patient-info-row">
                                                    <span class="patient-info-label">Name:</span>
                                                    <span class="patient-info-value"><%= appointment.getFullName()%></span>
                                                </div>
                                                <div class="patient-info-row">
                                                    <span class="patient-info-label">Age:</span>
                                                    <span class="patient-info-value"><%= appointment.getAge()%> years</span>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="patient-info-row">
                                                    <span class="patient-info-label">Phone:</span>
                                                    <span class="patient-info-value"><%= appointment.getPhone()%></span>
                                                </div>
                                                <div class="patient-info-row">
                                                    <span class="patient-info-label">Condition:</span>
                                                    <span class="patient-info-value highlight-field"><%= appointment.getDiseases()%></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-section">
                                    <div class="section-title">
                                        <i class="fas fa-prescription-bottle-alt"></i>Medical Prescription
                                    </div>
                                    
                                    <div class="prescription-guide">
                                        <strong><i class="fas fa-lightbulb me-2"></i>Guidelines:</strong>
                                        <ul>
                                            <li>Include diagnosis, medication, dosage, and duration</li>
                                            <li>Add special instructions and follow-up details</li>
                                            <li>Note any allergies or contraindications</li>
                                        </ul>
                                    </div>
                                    
                                    <div class="mb-3">
                                        <div class="floating-label-group">
                                            <textarea name="comment" class="form-control" rows="8" placeholder=" "></textarea>
                                            <label class="floating-label">Enter your comprehensive treatment plan here...</label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- hidden fields -->
                            <input type="hidden" name="id" value="<%= appointment.getId()%>">
                            <input type="hidden" name="doctorId" value="<%= appointment.getDoctorId()%>">

                            <div class="col-12">
                                <button type="submit" class="btn btn-submit col-12">
                                    <i class="fas fa-file-medical me-2"></i>Submit Medical Prescription
                                </button>
                            </div>
                            
                            <!-- hidden fields for original form values -->
                            <input type="hidden" name="fullName" value="<%= appointment.getFullName()%>">
                            <input type="hidden" name="age" value="<%= appointment.getAge()%>">
                            <input type="hidden" name="phone" value="<%= appointment.getPhone()%>">
                            <input type="hidden" name="diseases" value="<%= appointment.getDiseases()%>">
						</form>
						<!-- end of bootstrap form -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end of 2nd Div -->

</body>
</html>