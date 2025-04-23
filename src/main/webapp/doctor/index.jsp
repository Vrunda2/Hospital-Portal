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
            --primary-color: #2563eb;
            --secondary-color: #1e40af;
            --accent-color: #dbeafe;
            --light-accent: #eff6ff;
            --shadow-color: rgba(37, 99, 235, 0.15);
            --card-radius: 1rem;
            --text-primary: #1e3a8a;
            --text-secondary: #64748b;
        }

        body {
            background-color: #f8fafc;
            font-family: 'Poppins', sans-serif;
        }

        .dashboard-container {
            padding: 3rem 1.5rem;
        }

        .dashboard-title {
            color: var(--primary-color);
            font-weight: 700;
            margin-bottom: 2.5rem;
            position: relative;
            padding-bottom: 12px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .dashboard-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            height: 4px;
            width: 100px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
            border-radius: 4px;
        }

        .stat-card {
            background-color: white;
            border-radius: var(--card-radius);
            box-shadow: 0 10px 25px var(--shadow-color);
            transition: all 0.3s ease;
            height: 100%;
            overflow: hidden;
            border: none;
            position: relative;
        }

        .stat-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 30px rgba(37, 99, 235, 0.2);
        }

        .stat-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
        }

        .stat-card-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 1.25rem;
            text-align: center;
            font-weight: 500;
            letter-spacing: 0.5px;
        }

        .stat-card-body {
            padding: 2rem 1.5rem;
            text-align: center;
            position: relative;
            z-index: 1;
        }

        .stat-card-body::after {
            content: '';
            position: absolute;
            bottom: 0;
            right: 0;
            width: 150px;
            height: 150px;
            background-color: var(--accent-color);
            border-top-left-radius: 100%;
            opacity: 0.3;
            z-index: -1;
        }

        .stat-icon {
            color: var(--primary-color);
            margin-bottom: 1.5rem;
            font-size: 3rem;
            background-color: var(--light-accent);
            width: 80px;
            height: 80px;
            line-height: 80px;
            border-radius: 50%;
            margin: 0 auto 1.5rem;
            box-shadow: 0 5px 15px var(--shadow-color);
        }

        .stat-title {
            color: var(--text-secondary);
            font-weight: 500;
            margin-bottom: 0.75rem;
            font-size: 1rem;
        }

        .stat-value {
            color: var(--text-primary);
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 0;
            text-shadow: 1px 1px 0 rgba(255, 255, 255, 1);
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .dashboard-container {
                padding: 2rem 1rem;
            }
            
            .stat-card {
                margin-bottom: 1.5rem;
            }
            
            .stat-icon {
                width: 60px;
                height: 60px;
                line-height: 60px;
                font-size: 2rem;
            }
            
            .stat-value {
                font-size: 2rem;
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