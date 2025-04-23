<%@page import="com.hms.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.hms.entity.Doctor"%>
<%@page import="com.hms.dao.AppointmentDAO"%>
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
<title>Patient Page</title>


<%@include file="../component/allcss.jsp"%>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

<!-- customs css for this page -->
<style type="text/css">
body {
    font-family: 'Poppins', sans-serif;
    background-color: #f0f5ff;
}

.my-card {
    box-shadow: 0 8px 25px rgba(13, 110, 253, 0.15);
    border-radius: 16px;
    border: none;
    overflow: hidden;
    background: #ffffff;
}

.card-header {
    background: linear-gradient(135deg, #1976D2, #1565C0);
    color: white;
    border: none;
    padding: 20px;
    position: relative;
}

.card-header::after {
    content: "";
    position: absolute;
    bottom: -20px;
    left: 0;
    width: 100%;
    height: 20px;
    /* background: linear-gradient(to right, #1976D2, #2196F3, #1976D2); */
    border-radius: 50% 50% 0 0 / 100% 100% 0 0;
    z-index: 1;
}

.card-body {
    padding: 30px 25px;
    position: relative;
    z-index: 2;
}

.patient-header {
    font-size: 1.8rem;
    font-weight: 600;
    color: #fff;
    margin-bottom: 0;
    display: flex;
    align-items: center;
    justify-content: center;
}

.patient-header i {
    margin-right: 10px;
    font-size: 1.9rem;
}

.message-success {
    background-color: #e8f5e9;
    color: #2e7d32;
    padding: 12px;
    border-radius: 8px;
    margin-bottom: 20px;
    border-left: 4px solid #4caf50;
    font-weight: 500;
}

.message-error {
    background-color: #ffebee;
    color: #c62828;
    padding: 12px;
    border-radius: 8px;
    margin-bottom: 20px;
    border-left: 4px solid #f44336;
    font-weight: 500;
}

.table {
    border-collapse: separate;
    border-spacing: 0;
    width: 100%;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
    margin-top: 20px;
}

.table thead {
    background: linear-gradient(135deg, #2196F3, #1976D2);
    color: #fff;
}

.table thead th {
    font-weight: 600;
    padding: 15px 15px;
    vertical-align: middle;
    border: none;
    font-size: 0.9rem;
    letter-spacing: 0.5px;
    text-transform: uppercase;
}

.table tbody tr {
    transition: all 0.3s ease;
}

.table tbody tr:nth-child(even) {
    background-color: #f8fbff;
}

.table tbody tr:hover {
    background-color: #e3f2fd;
    transform: scale(1.005);
    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
}

.table tbody td, .table tbody th {
    padding: 15px;
    vertical-align: middle;
    border-top: 1px solid #e0e0e0;
    font-size: 0.95rem;
}

.table tbody th {
    font-weight: 600;
    color: #1565C0;
}

.badge {
    padding: 8px 12px;
    border-radius: 50px;
    font-weight: 500;
    font-size: 0.75rem;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.badge-pending {
    background-color: #fff8e1;
    color: #ff8f00;
    border: 1px solid #ffca28;
}

.badge-completed {
    background-color: #e8f5e9;
    color: #2e7d32;
    border: 1px solid #66bb6a;
}

.btn-action {
    padding: 8px 12px;
    border-radius: 50px;
    font-weight: 500;
    transition: all 0.3s ease;
    border: none;
    font-size: 0.85rem;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 5px;
    box-shadow: 0 3px 5px rgba(0, 0, 0, 0.1);
}

.btn-prescription {
    background: linear-gradient(135deg, #2196F3, #1976D2);
    color: white;
}

.btn-prescription:hover {
    background: linear-gradient(135deg, #1976D2, #1565C0);
    transform: translateY(-2px);
    box-shadow: 0 5px 10px rgba(33, 150, 243, 0.3);
}

.btn-prescription.disabled {
    background: linear-gradient(135deg, #78909c, #607d8b);
    pointer-events: none;
    opacity: 0.7;
}

.table-container {
    overflow-x: auto;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
}

.table-responsive {
    overflow-x: auto;
    -webkit-overflow-scrolling: touch;
}

.header-actions {
    display: flex;
    align-items: center;
    gap: 15px;
    margin-bottom: 20px;
}

.search-box {
    position: relative;
    flex: 1;
}

.search-box input {
    width: 100%;
    padding: 12px 20px;
    padding-left: 40px;
    border-radius: 50px;
    border: 2px solid #e0e0e0;
    background-color: #ffffff;
    transition: all 0.3s ease;
    font-size: 0.95rem;
}

.search-box i {
    position: absolute;
    left: 15px;
    top: 50%;
    transform: translateY(-50%);
    color: #90a4ae;
}

.search-box input:focus {
    border-color: #2196F3;
    box-shadow: 0 0 0 3px rgba(33, 150, 243, 0.15);
    outline: none;
}

.patient-stat {
    background: #ffffff;
    border-radius: 10px;
    padding: 15px;
    display: flex;
    align-items: center;
    gap: 10px;
    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.08);
    margin-right: 15px;
}

.stat-icon {
    width: 45px;
    height: 45px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 10px;
    font-size: 1.2rem;
}

.stat-icon.pending {
    background-color: #fff8e1;
    color: #ff8f00;
}

.stat-icon.completed {
    background-color: #e8f5e9;
    color: #2e7d32;
}

.stat-content {
    flex: 1;
}

.stat-value {
    font-size: 1.2rem;
    font-weight: 600;
    color: #263238;
    margin: 0;
}

.stat-label {
    font-size: 0.8rem;
    color: #607d8b;
    margin: 0;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}

.fade-in {
    animation: fadeIn 0.5s ease forwards;
}

/* Status Pills */
.status-pill {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 6px 12px;
    border-radius: 50px;
    font-size: 0.8rem;
    font-weight: 500;
    line-height: 1;
}

.status-pill.pending {
    background-color: #fff8e1;
    color: #ff8f00;
    border: 1px solid #ffca28;
}

.status-pill.completed {
    background-color: #e8f5e9;
    color: #2e7d32;
    border: 1px solid #66bb6a;
}

.status-pill i {
    margin-right: 5px;
    font-size: 0.85rem;
}

/* Gender icons */
.gender-icon {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 30px;
    height: 30px;
    border-radius: 50%;
    margin-right: 5px;
}

.gender-icon.male {
    background-color: #e3f2fd;
    color: #1976D2;
}

.gender-icon.female {
    background-color: #f8bbd0;
    color: #c2185b;
}

.patient-name {
    display: flex;
    align-items: center;
}

/* Empty state */
.empty-state {
    text-align: center;
    padding: 40px 20px;
}

.empty-state i {
    font-size: 4rem;
    color: #90a4ae;
    margin-bottom: 20px;
}

.empty-state h3 {
    color: #455a64;
    margin-bottom: 10px;
}

.empty-state p {
    color: #78909c;
    max-width: 400px;
    margin: 0 auto;
}

/* Media queries */
@media (max-width: 992px) {
    .header-actions {
        flex-direction: column;
        align-items: stretch;
    }
    
    .patient-stat {
        margin-right: 0;
        margin-bottom: 10px;
    }
    
    .search-box {
        margin-bottom: 15px;
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
		<div class="row fade-in">
			<div class="col-md-12">
				<div class="my-card">
					<div class="card-header">
						<h5 class="patient-header"><i class="fas fa-user-injured"></i> Patient Management Dashboard</h5>
					</div>
					<div class="card-body">
					
                        <!-- Stats Row -->
                        <div class="header-actions">
                            <%
                            Doctor doctor = (Doctor) session.getAttribute("doctorObj");
                            AppointmentDAO appDAO = new AppointmentDAO(DBConnection.getConn());
                            List<Appointment> list = appDAO.getAllAppointmentByLoginDoctor(doctor.getId());
                            
                            int totalPatients = list.size();
                            int pendingCount = 0;
                            int completedCount = 0;
                            
                            for (Appointment app : list) {
                                if ("Pending".equals(app.getStatus())) {
                                    pendingCount++;
                                } else {
                                    completedCount++;
                                }
                            }
                            %>
                            
                            <div class="patient-stat">
                                <div class="stat-icon pending">
                                    <i class="fas fa-hourglass-half"></i>
                                </div>
                                <div class="stat-content">
                                    <h5 class="stat-value"><%= pendingCount %></h5>
                                    <p class="stat-label">Pending Appointments</p>
                                </div>
                            </div>
                            
                            <div class="patient-stat">
                                <div class="stat-icon completed">
                                    <i class="fas fa-check-circle"></i>
                                </div>
                                <div class="stat-content">
                                    <h5 class="stat-value"><%= completedCount %></h5>
                                    <p class="stat-label">Completed Treatments</p>
                                </div>
                            </div>
                            
                           
                        </div>

						<!-- message print -->
						<!-- for success msg -->
						<c:if test="${not empty successMsg }">
							<div class="message-success">
                                <i class="fas fa-check-circle me-2"></i> ${successMsg}
                            </div>
							<c:remove var="successMsg" scope="session" />
						</c:if>

						<!-- for error msg -->
						<c:if test="${not empty errorMsg }">
							<div class="message-error">
                                <i class="fas fa-exclamation-circle me-2"></i> ${errorMsg}
                            </div>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<!-- End of message print -->

						<!-- table for patient list -->
                        <div class="table-responsive">
                            <table class="table" id="patientTable">
                                <thead>
                                    <tr>
                                        <th scope="col"><i class="fas fa-user me-2"></i>Full Name</th>
                                        <th scope="col"><i class="fas fa-venus-mars me-2"></i>Gender</th>
                                        <th scope="col"><i class="fas fa-birthday-cake me-2"></i>Age</th>
                                        <th scope="col"><i class="fas fa-calendar-alt me-2"></i>Date</th>
                                        <th scope="col"><i class="fas fa-envelope me-2"></i>Email</th>
                                        <th scope="col"><i class="fas fa-phone me-2"></i>Phone</th>
                                        <th scope="col"><i class="fas fa-disease me-2"></i>Condition</th>
                                        <th scope="col"><i class="fas fa-chart-line me-2"></i>Status</th>
                                        <th scope="col"><i class="fas fa-tasks me-2"></i>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    if (list.isEmpty()) {
                                    %>
                                        <tr>
                                            <td colspan="9">
                                                <div class="empty-state">
                                                    <i class="fas fa-folder-open"></i>
                                                    <h3>No appointments found</h3>
                                                    <p>You currently don't have any patient appointments assigned to you.</p>
                                                </div>
                                            </td>
                                        </tr>
                                    <%
                                    } else {
                                        for (Appointment applist : list) {
                                    %>
                                        <tr>
                                            <th>
                                                <div class="patient-name">
                                                    <div class="gender-icon <%= "Male".equals(applist.getGender()) ? "male" : "female" %>">
                                                        <i class="fas fa-<%= "Male".equals(applist.getGender()) ? "mars" : "venus" %>"></i>
                                                    </div>
                                                    <%= applist.getFullName() %>
                                                </div>
                                            </th>
                                            <td><%= applist.getGender() %></td>
                                            <td><%= applist.getAge() %></td>
                                            <td><%= applist.getAppointmentDate() %></td>
                                            <td><%= applist.getEmail() %></td>
                                            <td><%= applist.getPhone() %></td>
                                            <td><%= applist.getDiseases() %></td>
                                            <td>
                                                <span class="status-pill <%= "Pending".equals(applist.getStatus()) ? "pending" : "completed" %>">
                                                    <i class="fas fa-<%= "Pending".equals(applist.getStatus()) ? "hourglass-half" : "check-circle" %>"></i>
                                                    <%= applist.getStatus() %>
                                                </span>
                                            </td>
                                            <td>
                                                <%
                                                if ("Pending".equals(applist.getStatus())) {
                                                %>
                                                    <a href="comment.jsp?id=<%= applist.getId() %>" class="btn btn-action btn-prescription">
                                                        <i class="fas fa-prescription"></i> Prescribe
                                                    </a>
                                                <%
                                                } else {
                                                %>
                                                    <button class="btn btn-action btn-prescription disabled">
                                                        <i class="fas fa-check-circle"></i> Completed
                                                    </button>
                                                <%
                                                }
                                                %>
                                            </td>
                                        </tr>
                                    <%
                                        }
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

    <!-- JavaScript for search functionality -->
    <script>
        function searchPatients() {
            const input = document.getElementById('patientSearch');
            const filter = input.value.toUpperCase();
            const table = document.getElementById('patientTable');
            const tr = table.getElementsByTagName('tr');

            for (let i = 1; i < tr.length; i++) {
                let found = false;
                const td = tr[i].getElementsByTagName('td');
                const th = tr[i].getElementsByTagName('th');
                
                // Skip empty state row
                if (td.length === 1 && td[0].colSpan > 1) continue;
                
                // Check in all columns
                if (th[0].textContent.toUpperCase().indexOf(filter) > -1) found = true;
                
                for (let j = 0; j < td.length; j++) {
                    if (td[j].textContent.toUpperCase().indexOf(filter) > -1) {
                        found = true;
                        break;
                    }
                }
                
                tr[i].style.display = found ? '' : 'none';
            }
        }
    </script>
</body>
</html>