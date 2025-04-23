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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Management Dashboard</title>
    <%@include file="../component/allcss.jsp"%>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Google Fonts - Poppins -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    
    <!-- Custom CSS -->
    <style>
        :root {
            --primary-blue: #2563eb;
            --secondary-blue: #3b82f6;
            --light-blue: #dbeafe;
            --dark-blue: #1e40af;
            --accent-blue: #60a5fa;
            --white: #ffffff;
            --light-gray: #f3f4f6;
            --dark-gray: #4b5563;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8fafc;
            color: #1e293b;
        }
        
        .page-container {
            padding: 2rem;
        }
        
        .dashboard-header {
            margin-bottom: 2rem;
        }
        
        .dashboard-title {
            font-weight: 600;
            color: var(--dark-blue);
            font-size: 1.75rem;
        }
        
        .doctor-card {
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
            border: none;
            overflow: hidden;
            transition: all 0.3s ease;
        }
        
        .doctor-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(37, 99, 235, 0.1);
        }
        
        .card-header {
            background: linear-gradient(135deg, var(--primary-blue), var(--secondary-blue));
            color: white;
            border: none;
            padding: 1.25rem;
            position: relative;
        }
        
        .card-header::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(90deg, #60a5fa, #3b82f6, #2563eb);
        }
        
        .card-body {
            padding: 1.5rem;
            background-color: var(--white);
        }
        
        .card-title {
            font-weight: 600;
            margin-bottom: 0;
            letter-spacing: 0.5px;
        }
        
        .header-icon {
            background-color: rgba(255, 255, 255, 0.2);
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
            margin-right: 12px;
        }
        
        .table {
            border-collapse: separate;
            border-spacing: 0 12px;
            margin-top: 1rem;
        }
        
        .table th {
            border: none;
            background-color: var(--light-blue);
            color: var(--dark-blue);
            font-weight: 500;
            padding: 1rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 0.85rem;
            white-space: nowrap;
        }
        
        .table td {
            padding: 1rem;
            border: none;
            background-color: white;
            vertical-align: middle;
        }
        
        .table tr {
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
            border-radius: 8px;
            transition: all 0.2s;
        }
        
        .table tbody tr:hover {
            transform: scale(1.01);
            box-shadow: 0 5px 15px rgba(37, 99, 235, 0.1);
        }
        
        .table tbody tr td:first-child {
            border-top-left-radius: 8px;
            border-bottom-left-radius: 8px;
        }
        
        .table tbody tr td:last-child {
            border-top-right-radius: 8px;
            border-bottom-right-radius: 8px;
        }
        
        .btn {
            border-radius: 8px;
            font-weight: 500;
            padding: 0.5rem 1rem;
            transition: all 0.3s;
            text-transform: capitalize;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        
        .btn-primary {
            background-color: var(--primary-blue);
            border: none;
        }
        
        .btn-primary:hover {
            background-color: var(--dark-blue);
            transform: translateY(-2px);
        }
        
        .btn-danger {
            background-color: #ef4444;
            border: none;
        }
        
        .btn-danger:hover {
            background-color: #b91c1c;
            transform: translateY(-2px);
        }
        
        .btn-add {
            background: linear-gradient(135deg, var(--primary-blue), var(--dark-blue));
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            font-weight: 500;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(37, 99, 235, 0.3);
            transition: all 0.3s;
        }
        
        .btn-add:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(37, 99, 235, 0.4);
        }
        
        .btn-icon {
            margin-right: 6px;
        }
        
        .alert {
            border-radius: 12px;
            padding: 1rem 1.5rem;
            margin-bottom: 1.5rem;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
            border: none;
        }
        
        .alert-success {
            background-color: #ecfdf5;
            border-left: 5px solid #10b981;
            color: #065f46;
        }
        
        .alert-danger {
            background-color: #fef2f2;
            border-left: 5px solid #ef4444;
            color: #991b1b;
        }
        
        .badge {
            padding: 0.35em 0.65em;
            font-size: 0.75em;
            font-weight: 500;
            border-radius: 6px;
            text-transform: capitalize;
            letter-spacing: 0.5px;
        }
        
        .badge-specialist {
            background-color: var(--light-blue);
            color: var(--dark-blue);
        }
        
        .doctor-name {
            color: var(--dark-blue);
            font-weight: 600;
        }
        
        .stats-container {
            display: flex;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }
        
        .stat-card {
            flex: 1;
            background: white;
            border-radius: 12px;
            padding: 1.25rem;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
            display: flex;
            align-items: center;
            transition: all 0.3s;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(37, 99, 235, 0.1);
        }
        
        .stat-icon {
            background: linear-gradient(135deg, var(--primary-blue), var(--secondary-blue));
            color: white;
            width: 50px;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
            margin-right: 1rem;
            font-size: 1.25rem;
        }
        
        .stat-value {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--dark-blue);
            margin-bottom: 0;
        }
        
        .stat-label {
            color: var(--dark-gray);
            font-size: 0.875rem;
            margin-bottom: 0;
        }
        
        .search-container {
            position: relative;
            margin-bottom: 1.5rem;
        }
        
        .search-input {
            padding: 0.75rem 1rem 0.75rem 3rem;
            border-radius: 12px;
            border: 1px solid #e2e8f0;
            width: 100%;
            background-color: white;
            font-size: 0.95rem;
            transition: all 0.3s;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }
        
        .search-input:focus {
            border-color: var(--primary-blue);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
            outline: none;
        }
        
        .search-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #94a3b8;
        }
        
        @media (max-width: 768px) {
            .page-container {
                padding: 1rem;
            }
            
            .stats-container {
                flex-direction: column;
            }
            
            .table-responsive {
                border-radius: 12px;
                overflow: hidden;
            }
        }
        
        /* Animation Classes */
        .fade-in {
            animation: fadeIn 0.5s ease-in;
        }
        
        .slide-up {
            animation: slideUp 0.5s ease-out;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        
        @keyframes slideUp {
            from { transform: translateY(20px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        
        /* Pagination Styling */
        .pagination {
            margin-top: 1.5rem;
            justify-content: center;
        }
        
        .pagination .page-item .page-link {
            border: none;
            color: var(--dark-blue);
            margin: 0 3px;
            border-radius: 8px;
            transition: all 0.3s;
        }
        
        .pagination .page-item.active .page-link {
            background-color: var(--primary-blue);
            color: white;
        }
        
        .pagination .page-item .page-link:hover {
            background-color: var(--light-blue);
            color: var(--dark-blue);
        }
    </style>
</head>
<body>
    <%@include file="navbar.jsp"%>

    <div class="page-container">
        <div class="dashboard-header slide-up">
            <h2 class="dashboard-title"><i class="fas fa-user-md me-2"></i>Doctor Management Dashboard</h2>
        </div>
        
        <!-- Quick Stats Section -->
        <div class="stats-container fade-in">
            <div class="stat-card">
                <div class="stat-icon">
                    <i class="fas fa-user-md"></i>
                </div>
                <div>
                    <% int totalDoctors = new DoctorDAO(DBConnection.getConn()).getAllDoctor().size(); %>
                    <p class="stat-value"><%= totalDoctors %></p>
                    <p class="stat-label">Total Doctors</p>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon">
                    <i class="fas fa-stethoscope"></i>
                </div>
                <div>
                    <% int totalSpecialists = new SpecialistDAO(DBConnection.getConn()).getAllSpecialist().size(); %>
                    <p class="stat-value"><%= totalSpecialists %></p>
                    <p class="stat-label">Specializations</p>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon">
                    <i class="fas fa-calendar-check"></i>
                </div>
                <div>
                    <p class="stat-value">0</p>
                    <p class="stat-label">Appointments Today</p>
                </div>
            </div>
        </div>
        
        <!-- Search Box -->
        
        
        <!-- Main Content -->
        <div class="row justify-content-center">
            <div class="col-lg-12">
                <div class="card doctor-card slide-up">
                    <div class="card-header d-flex align-items-center">
                        <div class="header-icon">
                            <i class="fas fa-user-md"></i>
                        </div>
                        <h5 class="card-title mb-0">Doctor Directory</h5>
                    </div>
                    <div class="card-body">
                    
                        <!-- Message Alerts -->
                        <c:if test="${not empty successMsg}">
                            <div class="alert alert-success alert-dismissible fade show animate__animated animate__fadeIn" role="alert">
                                <i class="fas fa-check-circle me-2"></i>${successMsg}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                <c:remove var="successMsg" scope="session" />
                            </div>
                        </c:if>
                        
                        <c:if test="${not empty errorMsg}">
                            <div class="alert alert-danger alert-dismissible fade show animate__animated animate__fadeIn" role="alert">
                                <i class="fas fa-exclamation-circle me-2"></i>${errorMsg}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                <c:remove var="errorMsg" scope="session" />
                            </div>
                        </c:if>
                        <!-- End Messages -->
                        
                        <div class="d-flex justify-content-end mb-3">
                            <a href="doctor.jsp" class="btn btn-add">
                                <i class="fas fa-plus-circle btn-icon"></i> Add New Doctor
                            </a>
                        </div>
                        
                        <div class="table-responsive">
                            <table class="table table-hover" id="doctorTable">
                                <thead>
                                    <tr>
                                        <th><i class="fas fa-user me-2"></i>Full Name</th>
                                        <th><i class="fas fa-calendar-alt me-2"></i>DOB</th>
                                        <th><i class="fas fa-graduation-cap me-2"></i>Qualification</th>
                                        <th><i class="fas fa-stethoscope me-2"></i>Specialist</th>
                                        <th><i class="fas fa-envelope me-2"></i>Email</th>
                                        <th><i class="fas fa-phone me-2"></i>Phone</th>
                                        <th colspan="2" class="text-center"><i class="fas fa-cogs me-2"></i>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    DoctorDAO docDAO2 = new DoctorDAO(DBConnection.getConn());
                                    List<Doctor> listOfDoc = docDAO2.getAllDoctor();
                                    for (Doctor doctorLst : listOfDoc) {
                                    %>
                                    <tr class="fade-in">
                                        <td>
                                            <span class="doctor-name"><%=doctorLst.getFullName()%></span>
                                        </td>
                                        <td><%=doctorLst.getDateOfBirth()%></td>
                                        <td><%=doctorLst.getQualification()%></td>
                                        <td>
                                            <span class="badge badge-specialist"><%=doctorLst.getSpecialist()%></span>
                                        </td>
                                        <td>
                                            <a href="mailto:<%=doctorLst.getEmail()%>" class="text-decoration-none text-primary">
                                                <%=doctorLst.getEmail()%>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="tel:<%=doctorLst.getPhone()%>" class="text-decoration-none text-primary">
                                                <%=doctorLst.getPhone()%>
                                            </a>
                                        </td>
                                        <td class="text-center">
                                            <a class="btn btn-primary btn-sm" href="edit_doctor.jsp?id=<%=doctorLst.getId()%>">
                                                <i class="fas fa-edit btn-icon"></i> Edit
                                            </a>
                                        </td>
                                        <td class="text-center">
                                            <a class="btn btn-danger btn-sm" href="../deleteDoctor?id=<%=doctorLst.getId()%>"
                                               onclick="return confirm('Are you sure you want to delete Dr. <%=doctorLst.getFullName()%>?')">
                                                <i class="fas fa-trash-alt btn-icon"></i> Delete
                                            </a>
                                        </td>
                                    </tr>
                                    <%
                                    }
                                    %>
                                </tbody>
                            </table>
                        </div>
                        
                        <!-- Pagination -->
                        
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Search Functionality -->
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const searchInput = document.getElementById('doctorSearch');
        const table = document.getElementById('doctorTable');
        const rows = table.getElementsByTagName('tr');
        
        searchInput.addEventListener('keyup', function() {
            const query = searchInput.value.toLowerCase();
            
            // Skip header row (index 0)
            for (let i = 1; i < rows.length; i++) {
                const row = rows[i];
                const cells = row.getElementsByTagName('td');
                let found = false;
                
                for (let j = 0; j < cells.length; j++) {
                    const cellText = cells[j].textContent.toLowerCase();
                    if (cellText.indexOf(query) > -1) {
                        found = true;
                        break;
                    }
                }
                
                if (found) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            }
        });
    });
    </script>
</body>
</html>