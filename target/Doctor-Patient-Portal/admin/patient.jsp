<%@page import="com.hms.entity.Doctor"%>
<%@page import="com.hms.dao.DoctorDAO"%>
<%@page import="com.hms.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.dao.AppointmentDAO"%>
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
    <title>Patient Details | Admin Dashboard</title>

    <%@include file="../component/allcss.jsp"%>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Animate.css for animations -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    
    <!-- Custom CSS -->
    <style>
        :root {
            --primary: #2563eb;
            --primary-light: #60a5fa;
            --primary-dark: #1e40af;
            --secondary: #f0f9ff;
            --secondary-dark: #bfdbfe;
            --success: #10b981;
            --warning: #f59e0b;
            --danger: #ef4444;
            --info: #06b6d4;
            --light: #f9fafb;
            --dark: #111827;
            --gray: #6b7280;
            --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
            --shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --shadow-md: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            --shadow-lg: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            background-color: #f1f5f9;
            font-family: 'Poppins', sans-serif;
            color: var(--dark);
        }
        
        .page-container {
            padding: 1.5rem;
            max-width: 1600px;
            margin: 0 auto;
        }
        
        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
        }
        
        .dashboard-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--primary-dark);
        }
        
        .dashboard-actions {
            display: flex;
            gap: 0.5rem;
        }
        
        .btn-dashboard {
            padding: 0.5rem 1rem;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
            border: none;
        }
        
        .btn-primary-soft {
            background-color: rgba(37, 99, 235, 0.1);
            color: var(--primary);
        }
        
        .btn-primary-soft:hover {
            background-color: rgba(37, 99, 235, 0.2);
        }
        
        .card {
            border-radius: 16px;
            box-shadow: var(--shadow-md);
            border: none;
            overflow: hidden;
            background-color: white;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-lg);
        }
        
        .card-header {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white;
            padding: 1.25rem 1.5rem;
            border-bottom: none;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .card-header-title {
            font-size: 1.25rem;
            font-weight: 600;
            margin: 0;
            display: flex;
            align-items: center;
        }
        
        .card-header-icon {
            margin-right: 0.75rem;
            font-size: 1.5rem;
        }
        
        .card-header-actions {
            display: flex;
            gap: 0.5rem;
        }
        
        .stats-container {
            display: flex;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }
        
        .stat-card {
            flex: 1;
            background-color: white;
            border-radius: 16px;
            padding: 1.25rem;
            box-shadow: var(--shadow);
            display: flex;
            align-items: center;
            transition: transform 0.3s ease;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
        }
        
        .stat-icon {
            width: 48px;
            height: 48px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            font-size: 1.5rem;
            color: white;
        }
        
        .stat-icon.blue {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
        }
        
        .stat-icon.green {
            background: linear-gradient(135deg, #10b981 0%, #059669 100%);
        }
        
        .stat-icon.orange {
            background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%);
        }
        
        .stat-icon.red {
            background: linear-gradient(135deg, #ef4444 0%, #b91c1c 100%);
        }
        
        .stat-details {
            flex: 1;
        }
        
        .stat-value {
            font-size: 1.5rem;
            font-weight: 700;
            margin: 0;
            line-height: 1.2;
        }
        
        .stat-label {
            color: var(--gray);
            font-size: 0.875rem;
            margin: 0;
        }
        
        .filters-container {
            background-color: white;
            border-radius: 16px;
            padding: 1rem;
            margin-bottom: 1.5rem;
            box-shadow: var(--shadow);
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
            align-items: center;
        }
        
        .filter-group {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .filter-label {
            font-weight: 500;
            color: var(--dark);
            margin: 0;
        }
        
        .form-select, .form-control {
            border-radius: 8px;
            border: 1px solid #e5e7eb;
            padding: 0.5rem 0.75rem;
            font-size: 0.875rem;
        }
        
        .form-select:focus, .form-control:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.2);
        }
        
        .table-container {
            overflow: hidden;
            border-radius: 8px;
        }
        
        .table {
            margin-bottom: 0;
            border-collapse: separate;
            border-spacing: 0;
        }
        
        .table th {
            background-color: #f8fafc;
            color: var(--dark);
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.75rem;
            letter-spacing: 0.05em;
            padding: 1rem;
            border-bottom: 2px solid #e5e7eb;
            white-space: nowrap;
        }
        
        .table td {
            padding: 1rem;
            vertical-align: middle;
            border-bottom: 1px solid #e5e7eb;
            color: var(--dark);
            font-size: 0.875rem;
        }
        
        .table tbody tr {
            transition: background-color 0.3s ease;
        }
        
        .table tbody tr:hover {
            background-color: rgba(37, 99, 235, 0.05);
        }
        
        .table-scroll {
            overflow-x: auto;
            max-width: 100%;
            scrollbar-width: thin;
            scrollbar-color: var(--primary) #f1f5f9;
        }
        
        .table-scroll::-webkit-scrollbar {
            height: 6px;
        }
        
        .table-scroll::-webkit-scrollbar-track {
            background: #f1f5f9;
        }
        
        .table-scroll::-webkit-scrollbar-thumb {
            background-color: var(--primary);
            border-radius: 6px;
        }
        
        .status-badge {
            padding: 0.375rem 0.75rem;
            border-radius: 9999px;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }
        
        .status-pending {
            background-color: #fef3c7;
            color: #92400e;
        }
        
        .status-approved {
            background-color: #d1fae5;
            color: #065f46;
        }
        
        .status-completed {
            background-color: #dbeafe;
            color: #1e40af;
        }
        
        .status-cancelled {
            background-color: #fee2e2;
            color: #b91c1c;
        }
        
        .status-indicator {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            margin-right: 0.5rem;
            display: inline-block;
        }
        
        .status-pending .status-indicator {
            background-color: #f59e0b;
        }
        
        .status-approved .status-indicator {
            background-color: #10b981;
        }
        
        .status-completed .status-indicator {
            background-color: #2563eb;
        }
        
        .status-cancelled .status-indicator {
            background-color: #ef4444;
        }
        
        .card-footer {
            background-color: #f8fafc;
            border-top: 1px solid #e5e7eb;
            padding: 1rem 1.5rem;
        }
        
        .pagination {
            margin: 0;
        }
        
        .page-link {
            color: var(--primary);
            border-radius: 8px;
            margin: 0 0.125rem;
            border: none;
            font-weight: 500;
        }
        
        .page-item.active .page-link {
            background-color: var(--primary);
            border-color: var(--primary);
        }
        
        .page-item.disabled .page-link {
            color: var(--gray);
            background-color: transparent;
        }
        
        .avatar {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background-color: var(--primary-light);
            color: white;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            font-size: 0.875rem;
            margin-right: 0.5rem;
        }
        
        .patient-name {
            display: flex;
            align-items: center;
        }
        
        .actions-cell {
            white-space: nowrap;
        }
        
        .action-btn {
            width: 32px;
            height: 32px;
            border-radius: 8px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            color: var(--gray);
            background-color: transparent;
            border: none;
            cursor: pointer;
            transition: all 0.2s ease;
            margin-right: 0.25rem;
        }
        
        .action-btn:hover {
            background-color: #f3f4f6;
            color: var(--dark);
        }
        
        .action-btn.edit:hover {
            color: var(--primary);
        }
        
        .action-btn.delete:hover {
            color: var(--danger);
        }
        
        .action-btn.view:hover {
            color: var(--info);
        }
        
        .dropdown-menu {
            border: none;
            box-shadow: var(--shadow-lg);
            border-radius: 12px;
            padding: 0.5rem;
        }
        
        .dropdown-item {
            border-radius: 8px;
            padding: 0.5rem 0.75rem;
            font-size: 0.875rem;
        }
        
        .dropdown-item:hover {
            background-color: var(--secondary);
        }
        
        .search-box {
            position: relative;
        }
        
        .search-box .form-control {
            padding-left: 2.5rem;
            border-radius: 9999px;
            background-color: white;
        }
        
        .search-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--gray);
        }
        
        @media (max-width: 992px) {
            .stats-container {
                flex-wrap: wrap;
            }
            
            .stat-card {
                min-width: calc(50% - 0.5rem);
            }
        }
        
        @media (max-width: 768px) {
            .stat-card {
                min-width: 100%;
            }
        }
        
        /* Animations */
        .animate-fade-in {
            animation: fadeIn 0.5s ease-in-out;
        }
        
        .animate-slide-up {
            animation: slideUp 0.3s ease-in-out;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        
        @keyframes slideUp {
            from { transform: translateY(20px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
    </style>
</head>
<body>
    <%@include file="navbar.jsp"%>
    
    
        <!-- Dashboard Header -->
        <div class="container-fluid page-container">
            <!-- Dashboard Header -->
            <div class="dashboard-header animate-fade-in">
                <h1 class="dashboard-title">
                    <i class="fas fa-hospital-user me-2"></i> Patient Management
                </h1>
                
            </div>
        
        <!-- Stats Cards -->
        <div class="stats-container animate-slide-up">
            <div class="stat-card">
                <div class="stat-icon blue">
                    <i class="fas fa-users"></i>
                </div>
                <div class="stat-details">
                    <h2 class="stat-value">
                        <%
                        AppointmentDAO statsAppDAO = new AppointmentDAO(DBConnection.getConn());
                        List<Appointment> allAppointments = statsAppDAO.getAllAppointment();
                        %>
                        <%= allAppointments.size() %>
                    </h2>
                    <p class="stat-label">Total Patients</p>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon green">
                    <i class="fas fa-check-circle"></i>
                </div>
                <div class="stat-details">
                    <h2 class="stat-value">
                        <%
                        int approvedCount = 0;
                        for(Appointment app : allAppointments) {
                            if(app.getStatus().equalsIgnoreCase("approved") || app.getStatus().equalsIgnoreCase("completed")) {
                                approvedCount++;
                            }
                        }
                        %>
                        <%= approvedCount %>
                    </h2>
                    <p class="stat-label">Approved Appointments</p>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon orange">
                    <i class="fas fa-clock"></i>
                </div>
                <div class="stat-details">
                    <h2 class="stat-value">
                        <%
                        int pendingCount = 0;
                        for(Appointment app : allAppointments) {
                            if(app.getStatus().equalsIgnoreCase("pending")) {
                                pendingCount++;
                            }
                        }
                        %>
                        <%= pendingCount %>
                    </h2>
                    <p class="stat-label">Pending Appointments</p>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon red">
                    <i class="fas fa-times-circle"></i>
                </div>
                <div class="stat-details">
                    <h2 class="stat-value">
                        <%
                        int cancelledCount = 0;
                        for(Appointment app : allAppointments) {
                            if(app.getStatus().equalsIgnoreCase("cancelled")) {
                                cancelledCount++;
                            }
                        }
                        %>
                        <%= cancelledCount %>
                    </h2>
                    <p class="stat-label">Cancelled Appointments</p>
                </div>
            </div>
        </div>
        
        
        
        <!-- Patient Table Card -->
        <div class="card animate-slide-up" style="animation-delay: 0.2s;">
            <div class="card-header">
                <h5 class="card-header-title">
                    <i class="fas fa-list-alt card-header-icon"></i>
                    Patient Details
                </h5>
                <div class="card-header-actions">
                    <div class="dropdown">
                        <button class="btn btn-sm btn-light" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-ellipsis-v"></i>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton">
                            <li><a class="dropdown-item" href="#"><i class="fas fa-file-excel me-2"></i>Export to Excel</a></li>
                            <li><a class="dropdown-item" href="#"><i class="fas fa-file-pdf me-2"></i>Export to PDF</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#"><i class="fas fa-print me-2"></i>Print</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <div class="table-scroll">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col"><i class="fas fa-user me-2"></i>Patient</th>
                            <th scope="col"><i class="fas fa-venus-mars me-2"></i>Gender/Age</th>
                            <th scope="col"><i class="fas fa-calendar-alt me-2"></i>Appointment Date</th>
                            <th scope="col"><i class="fas fa-disease me-2"></i>Condition</th>
                            <th scope="col"><i class="fas fa-user-md me-2"></i>Doctor</th>
                            <th scope="col"><i class="fas fa-phone me-2"></i>Contact</th>
                            <th scope="col"><i class="fas fa-map-marker-alt me-2"></i>Location</th>
                            <th scope="col"><i class="fas fa-clipboard-check me-2"></i>Status</th>
                            <th scope="col"><i class="fas fa-cog me-2"></i>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        AppointmentDAO appDAO = new AppointmentDAO(DBConnection.getConn());
                        DoctorDAO docDAO = new DoctorDAO(DBConnection.getConn());
                        List<Appointment> list = appDAO.getAllAppointment();
                        for(Appointment appList : list) {
                            Doctor doctor = docDAO.getDoctorById(appList.getDoctorId());
                            String statusClass = "";
                            
                            // Determine status class for badge styling
                            if(appList.getStatus().equalsIgnoreCase("pending")) {
                                statusClass = "status-pending";
                            } else if(appList.getStatus().equalsIgnoreCase("approved")) {
                                statusClass = "status-approved";
                            } else if(appList.getStatus().equalsIgnoreCase("completed")) {
                                statusClass = "status-completed";
                            } else {
                                statusClass = "status-cancelled";
                            }
                            
                            // Get initials for avatar
                            String nameParts[] = appList.getFullName().split(" ");
                            String initials = "";
                            if(nameParts.length > 0) {
                                initials += nameParts[0].charAt(0);
                                if(nameParts.length > 1) {
                                    initials += nameParts[1].charAt(0);
                                }
                            }
                        %>
                        <tr>
                            <td>
                                <div class="patient-name">
                                    <div class="avatar"><%= initials.toUpperCase() %></div>
                                    <div>
                                        <div class="fw-medium"><%= appList.getFullName() %></div>
                                        <div class="text-muted fs-xs"><%= appList.getEmail() %></div>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <span class="fw-medium"><%= appList.getGender() %></span>
                                <span class="text-muted ms-2"><%= appList.getAge() %> yrs</span>
                            </td>
                            <td><%= appList.getAppointmentDate() %></td>
                            <td><span class="fw-medium"><%= appList.getDiseases() %></span></td>
                            <td>
                                <div class="fw-medium"><%= doctor.getFullName() %></div>
                                <div class="text-muted fs-xs"><%= doctor.getSpecialist() %></div>
                            </td>
                            <td><%= appList.getPhone() %></td>
                            <td>
                                <span class="text-truncate d-inline-block" style="max-width: 150px;" title="<%= appList.getAddress() %>">
                                    <%= appList.getAddress() %>
                                </span>
                            </td>
                            <td>
                                <span class="status-badge <%= statusClass %>">
                                    <span class="status-indicator"></span>
                                    <%= appList.getStatus() %>
                                </span>
                            </td>
                            <td class="actions-cell">
                                <button class="action-btn view" title="View Details">
                                    <i class="fas fa-eye"></i>
                                </button>
                                <button class="action-btn edit" title="Edit">
                                    <i class="fas fa-edit"></i>
                                </button>
                                <button class="action-btn delete" title="Delete">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            
            <div class="card-footer d-flex justify-content-between align-items-center">
                <div>
                    <span class="text-muted">Showing <%= list.size() %> out of <%= list.size() %> patients</span>
                </div>
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" aria-label="Previous">
                                <i class="fas fa-chevron-left"></i>
                            </a>
                        </li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <i class="fas fa-chevron-right"></i>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Fix for navbar toggle functionality
        document.addEventListener('DOMContentLoaded', function() {
            // Find the navbar toggler and attach event listener
            const navbarToggler = document.querySelector('.navbar-toggler');
            if (navbarToggler) {
                navbarToggler.addEventListener('click', function() {
                    const targetId = this.getAttribute('data-bs-target') || this.getAttribute('data-target');
                    if (targetId) {
                        const targetElement = document.querySelector(targetId);
                        if (targetElement) {
                            targetElement.classList.toggle('show');
                        }
                    }
                });
            }
            
            // Initialize any other JavaScript functionality here
            
            // Example: Toggle advanced filters
            const filterToggle = document.querySelector('.filter-toggle');
            const advancedFilters = document.querySelector('.advanced-filters');
            
            if(filterToggle && advancedFilters) {
                filterToggle.addEventListener('click', function() {
                    advancedFilters.classList.toggle('show');
                });
            }
        });
    </script>
</body>
</html>