<%@page import="com.hms.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.hms.entity.Doctor"%>
<%@page import="com.hms.dao.AppointmentDAO"%>
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
    <title>Patient Page</title>
    
    <%@include file="../component/allcss.jsp"%>
    
    <!-- customs css for this page -->
    <style type="text/css">
        .my-card {
            box-shadow: 0 10px 20px rgba(139, 0, 0, 0.15);
            border-radius: 12px;
            border: none;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .my-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(139, 0, 0, 0.2);
        }
        
        .card-title {
            font-weight: 600;
            color: #343a40;
            letter-spacing: 0.5px;
        }
        
        .status-badge {
            padding: 6px 12px;
            border-radius: 50px;
            font-size: 12px;
            font-weight: 600;
        }
        
        .status-pending {
            background-color: #fff3cd;
            color: #856404;
        }
        
        .status-completed {
            background-color: #d4edda;
            color: #155724;
        }
        
        .table {
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 8px;
            overflow: hidden;
        }
        
        .table thead th {
            background-color: #f8f9fa;
            padding: 15px;
            font-weight: 600;
            border-bottom: 2px solid #dee2e6;
            color: #495057;
        }
        
        .table tbody tr:hover {
            background-color: rgba(0, 123, 255, 0.05);
        }
        
        .table td {
            padding: 15px;
            vertical-align: middle;
        }
        
        .btn-action {
            border-radius: 50px;
            padding: 8px 16px;
            font-size: 13px;
            font-weight: 500;
            text-transform: none;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
        }
        
        .btn-comment {
            background: linear-gradient(to right, #20bf55, #01baef);
            border: none;
            color: white;
        }
        
        .btn-comment:hover {
            background: linear-gradient(to right, #1ca347, #0099c9);
            transform: translateY(-2px);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        }
        
        .btn-comment.disabled {
            background: #e9ecef;
            color: #6c757d;
            cursor: not-allowed;
            opacity: 0.7;
        }
        
        .alert-message {
            border-radius: 8px;
            margin-bottom: 20px;
            padding: 12px 16px;
            font-weight: 500;
        }
        
        .page-title {
            font-size: 1.75rem;
            font-weight: 600;
            color: #161883;
            margin-bottom: 20px;
            position: relative;
            display: inline-block;
        }
        
        .page-title:after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 100%;
            height: 3px;
            background: linear-gradient(to right, #2e7d32, #81c784);
            border-radius: 3px;
        }
    </style>
    <!-- end of customs css for this page -->
    
</head>
<body class="bg-light">
    <%@include file="navbar.jsp"%>

    <!-- if "doctorObj" is empty means no one is login. -->
    <c:if test="${empty doctorObj }">
        <c:redirect url="../doctor_login.jsp"></c:redirect>
    </c:if>
    <!-- check is doctor is login or not -->

    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card my-card">
                    <div class="card-body p-4">
                        <h4 class="page-title text-center mb-4">Patient Details</h4>
                        
                        <!-- message print -->
                        <!-- for success msg -->
                        <c:if test="${not empty successMsg }">
                            <div class="alert alert-success alert-message text-center" role="alert">
                                ${successMsg}
                            </div>
                            <c:remove var="successMsg" scope="session" />
                        </c:if>

                        <!-- for error msg -->
                        <c:if test="${not empty errorMsg }">
                            <div class="alert alert-danger alert-message text-center" role="alert">
                                ${errorMsg}
                            </div>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>
                        <!-- End of message print -->

                        <!-- table for patient list -->
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col">Full Name</th>
                                        <th scope="col">Gender</th>
                                        <th scope="col">Age</th>
                                        <th scope="col">Appointment Date</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Phone</th>
                                        <th scope="col">Diseases</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <%
                                    Doctor doctor = (Doctor) session.getAttribute("doctorObj");
                                    //DoctorDAO docDAO = new DoctorDAO(DBConnection.getConn());
                                    AppointmentDAO appDAO = new AppointmentDAO(DBConnection.getConn());
                                    List<Appointment> list = appDAO.getAllAppointmentByLoginDoctor(doctor.getId());
                                    for (Appointment applist : list) {
                                    %>

                                    <tr>
                                        <td class="fw-bold"><%=applist.getFullName()%></td>
                                        <td><%=applist.getGender()%></td>
                                        <td><%=applist.getAge()%></td>
                                        <td><%=applist.getAppointmentDate()%></td>
                                        <td><%=applist.getEmail()%></td>
                                        <td><%=applist.getPhone()%></td>
                                        <td><%=applist.getDiseases()%></td>
                                        <td>
                                            <span class="status-badge <%= "Pending".equals(applist.getStatus()) ? "status-pending" : "status-completed" %>">
                                                <%=applist.getStatus()%>
                                            </span>
                                        </td>

                                        <td>
                                            <%
                                            if ("Pending".equals(applist.getStatus())) {
                                            %>
                                            <a href="comment.jsp?id=<%=applist.getId()%>" class="btn btn-action btn-comment">
                                                <i class="fas fa-comment-medical me-1"></i> Prescribe
                                            </a>
                                            <%
                                            } else {
                                            %>
                                            <a href="#!" class="btn btn-action btn-comment disabled">
                                                <i class="fas fa-check-circle me-1"></i> Completed
                                            </a>
                                            <%
                                            }
                                            %>
                                        </td>
                                    </tr>

                                    <%
                                    }
                                    %>

                                </tbody>
                            </table>
                        </div>
                        <!-- end table for doctor list -->

                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>