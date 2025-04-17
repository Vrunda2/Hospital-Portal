<%@page import="com.hms.entity.Doctor"%>
<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.dao.DoctorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- for jstl tag -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- end of jstl tag -->

<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Dashboard | HMS</title>
    <%@include file="../component/allcss.jsp"%>

    <!-- Custom CSS for this page -->
    <style type="text/css">
        :root {
            --primary-color: #2D8B61;
            --secondary-color: #1e6044;
            --accent-color: #f8f9fa;
            --shadow-color: rgba(0, 0, 0, 0.1);
            --card-radius: 0.8rem;
        }

        body {
            background-color: #f5f5f7;
            font-family: 'Poppins', sans-serif;
        }

        .dashboard-container {
            padding: 3rem 1.5rem;
        }

        .dashboard-title {
            color: var(--primary-color);
            font-weight: 600;
            margin-bottom: 2rem;
            position: relative;
            padding-bottom: 10px;
        }

        .dashboard-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            height: 3px;
            width: 80px;
            background-color: var(--primary-color);
            border-radius: 2px;
        }

        .stat-card {
            background-color: white;
            border-radius: var(--card-radius);
            box-shadow: 0 8px 20px var(--shadow-color);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            height: 100%;
            overflow: hidden;
            border: none;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
        }

        .stat-card-header {
            background-color: var(--primary-color);
            color: white;
            padding: 1rem;
            text-align: center;
        }

        .stat-card-body {
            padding: 1.5rem 1rem;
            text-align: center;
        }

        .stat-icon {
            color: var(--primary-color);
            margin-bottom: 1rem;
            font-size: 2.5rem;
        }

        .stat-title {
            color: #555;
            font-weight: 500;
            margin-bottom: 0.5rem;
            font-size: 1.1rem;
        }

        .stat-value {
            color: var(--primary-color);
            font-size: 2rem;
            font-weight: 700;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .dashboard-container {
                padding: 2rem 1rem;
            }
            
            .stat-card {
                margin-bottom: 1.5rem;
            }
        }
    </style>
    <!-- End of custom CSS for this page -->
</head>

<body>
    <%@include file="navbar.jsp"%>

    <!-- Check if doctor is logged in -->
    <c:if test="${empty doctorObj}">
        <c:redirect url="../doctor_login.jsp"></c:redirect>
    </c:if>

    <div class="container dashboard-container">
        <h2 class="text-center dashboard-title">Doctor Dashboard</h2>

        <%
        DoctorDAO docDAO = new DoctorDAO(DBConnection.getConn());
        int totalNumberOfDoctor = docDAO.countTotalDoctor();
        
        // Get current login doctor object from session
        Doctor currentLoginDoctor = (Doctor)session.getAttribute("doctorObj");
        %>

        <div class="row g-4">
            <div class="col-md-6">
                <div class="stat-card">
                    <div class="stat-card-header">
                        <h5 class="mb-0">Total Doctors</h5>
                    </div>
                    <div class="stat-card-body">
                        <div class="stat-icon">
                            <i class="fa-solid fa-user-doctor"></i>
                        </div>
                        <p class="stat-title">Active Medical Professionals</p>
                        <p class="stat-value"><%= totalNumberOfDoctor %></p>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="stat-card">
                    <div class="stat-card-header">
                        <h5 class="mb-0">Your Appointments</h5>
                    </div>
                    <div class="stat-card-body">
                        <div class="stat-icon">
                            <i class="fa-solid fa-calendar-check"></i>
                        </div>
                        <p class="stat-title">Total Scheduled Appointments</p>
                        <p class="stat-value"><%= docDAO.countTotalAppointmentByDoctorId(currentLoginDoctor.getId()) %></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>