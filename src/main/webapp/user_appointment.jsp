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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Your Appointment</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- all css include -->
    <%@include file="../component/allcss.jsp"%>
    
    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
        }
        
        .header-banner {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url("img/hospital1.jpg");
            background-size: cover;
            background-position: center;
            height: 30vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            margin-bottom: 3rem;
        }
        
        .appointment-card {
            border-radius: 12px;
            border: none;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            overflow: hidden;
        }
        
        .form-label {
            font-weight: 500;
            color: #333;
        }
        
        .appointment-image {
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            height: auto;
            object-fit: cover;
        }
        
        .submit-btn {
            background: linear-gradient(to right, #2D46B9, #1E3A8A);
            border: none;
            padding: 12px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .form-control, .form-select {
            padding: 12px;
            border-radius: 8px;
            border: 1px solid #e2e8f0;
            background-color: #f8fafc;
        }
        
        .form-control:focus, .form-select:focus {
            border-color: #2D46B9;
            box-shadow: 0 0 0 3px rgba(45, 70, 185, 0.1);
        }
        
        .card-header {
            background-color: #2D46B9;
            color: white;
            border-radius: 12px 12px 0 0 !important;
            padding: 1.5rem;
            text-align: center;
        }
        
        .success-alert {
            background-color: #def7ec;
            color: #0e9f6e;
            border-radius: 8px;
            padding: 1rem;
            margin-bottom: 1.5rem;
        }
        
        .error-alert {
            background-color: #fde8e8;
            color: #e02424;
            border-radius: 8px;
            padding: 1rem;
            margin-bottom: 1.5rem;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <%@include file="component/navbar.jsp"%>
    
    <!-- Header Banner -->
    <div class="header-banner">
        <h1 class="display-5 fw-bold">Book Your Appointment</h1>
    </div>
    
    <div class="container mb-5">
        <div class="row g-4 align-items-center">
            <!-- Image Column -->
            <div class="col-lg-5 d-none d-lg-block">
                <img src="img/doc3.jpg" alt="Doctor" class="appointment-image img-fluid">
                <div class="mt-4 p-4 bg-white rounded-3 shadow-sm">
                    <h4 class="mb-3"><i class="fas fa-info-circle text-primary me-2"></i>Why Choose Us</h4>
                    <ul class="list-unstyled">
                        <li class="mb-2"><i class="fas fa-check-circle text-success me-2"></i>Experienced medical professionals</li>
                        <li class="mb-2"><i class="fas fa-check-circle text-success me-2"></i>Modern facilities & equipment</li>
                        <li class="mb-2"><i class="fas fa-check-circle text-success me-2"></i>Personalized care plans</li>
                        <li class="mb-2"><i class="fas fa-check-circle text-success me-2"></i>Convenient online scheduling</li>
                    </ul>
                </div>
            </div>
            
            <!-- Form Column -->
            <div class="col-lg-7">
                <div class="appointment-card card">
                    <div class="card-header">
                        <h3 class="mb-0"><i class="fas fa-calendar-check me-2"></i>Schedule Your Visit</h3>
                    </div>
                    <div class="card-body p-4">
                        
                        <!-- Success Message -->
                        <c:if test="${not empty successMsg}">
                            <div class="success-alert">
                                <i class="fas fa-check-circle me-2"></i>${successMsg}
                            </div>
                            <c:remove var="successMsg" scope="session" />
                        </c:if>
                        
                        <!-- Error Message -->
                        <c:if test="${not empty errorMsg}">
                            <div class="error-alert">
                                <i class="fas fa-exclamation-circle me-2"></i>${errorMsg}
                            </div>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>
                        
                        <!-- Appointment Form -->
                        <form class="row g-3" action="addAppointment" method="post">
                            <!-- Hidden User ID -->
                            <input type="hidden" name="userId" value="${userObj.id}">
                            
                            <div class="col-md-6">
                                <label for="fullName" class="form-label">Full Name</label>
                                <input id="fullName" required name="fullName" type="text" placeholder="Enter your full name" class="form-control">
                            </div>
                            
                            <div class="col-md-6">
                                <label for="gender" class="form-label">Gender</label>
                                <select id="gender" class="form-select" name="gender" required>
                                    <option selected disabled>Select Gender</option>
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                    <option value="other">Other</option>
                                </select>
                            </div>
                            
                            <div class="col-md-6">
                                <label for="age" class="form-label">Age</label>
                                <input id="age" name="age" required type="number" placeholder="Enter your age" class="form-control">
                            </div>
                            
                            <div class="col-md-6">
                                <label for="appointmentDate" class="form-label">Appointment Date</label>
                                <input id="appointmentDate" required name="appointmentDate" type="date" class="form-control">
                            </div>
                            
                            <div class="col-md-6">
                                <label for="email" class="form-label">Email</label>
                                <input id="email" name="email" required type="email" placeholder="Enter your email" class="form-control">
                            </div>
                            
                            <div class="col-md-6">
                                <label for="phone" class="form-label">Phone</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                    <input id="phone" name="phone" required type="number" maxlength="11" placeholder="Enter your mobile number" class="form-control">
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <label for="diseases" class="form-label">Medical Concern</label>
                                <input id="diseases" required name="diseases" type="text" placeholder="Enter your medical concern" class="form-control">
                            </div>
                            
                            <div class="col-md-6">
                                <label for="doctorNameSelect" class="form-label">Select Doctor</label>
                                <select id="doctorNameSelect" required class="form-select" name="doctorNameSelect">
                                    <option selected disabled>Choose a doctor</option>
                                    
                                    <%
                                    DoctorDAO doctorDAO = new DoctorDAO(DBConnection.getConn());
                                    List<Doctor> listOfDoctor = doctorDAO.getAllDoctor();
                                    for(Doctor d : listOfDoctor)
                                    {%>
                                    <option value="<%= d.getId() %>">
                                        <i class="fas fa-user-md"></i> <%= d.getFullName()%> (<%= d.getSpecialist() %>)
                                    </option>
                                    <%
                                    }
                                    %>
                                </select>
                            </div>
                            
                            <div class="col-12">
                                <label for="address" class="form-label">Full Address</label>
                                <textarea id="address" name="address" required class="form-control" rows="3" placeholder="Enter your complete address"></textarea>
                            </div>
                            
                            <!-- Submit Button Logic -->
                            <c:if test="${empty userObj}">
                                <div class="col-12 mt-3">
                                    <a href="user_login.jsp" class="btn btn-primary submit-btn w-100">
                                        <i class="fas fa-sign-in-alt me-2"></i>Login to Book Appointment
                                    </a>
                                </div>
                            </c:if>
                            
                            <c:if test="${not empty userObj}">
                                <div class="col-12 mt-3">
                                    <button type="submit" class="btn btn-primary submit-btn w-100">
                                        <i class="fas fa-calendar-check me-2"></i>Confirm Appointment
                                    </button>
                                </div>
                            </c:if>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Footer -->
    <%@include file="component/footer.jsp" %>
    
    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JS -->
    <script>
        // Set min date for appointment to today
        const today = new Date().toISOString().split('T')[0];
        document.getElementById('appointmentDate').setAttribute('min', today);
    </script>
</body>
</html>