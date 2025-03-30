<!-- EDIT PROFILE PAGE -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Doctor Profile | HMS</title>
  <%@include file="../component/allcss.jsp"%>
  
  <!-- Custom CSS -->
  <style>
    :root {
      --primary: #1d976c;
      --primary-dark: #166e4f;
      --secondary: #93f9b9;
      --light: #f8f9fa;
      --dark: #343a40;
      --danger: #dc3545;
      --success: #28a745;
    }
    
    body {
      background-color: #f5f5f5;
      font-family: 'Roboto', sans-serif;
    }
    
    .navbar {
      background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%) !important;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }
    
    .card {
      border-radius: 10px;
      border: none;
      transition: all 0.3s;
      margin-bottom: 20px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.08);
    }
    
    .card:hover {
      transform: translateY(-5px);
      box-shadow: 0 8px 20px rgba(0,0,0,0.12);
    }
    
    .card-header {
      background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
      color: white;
      border-radius: 10px 10px 0 0 !important;
      padding: 15px;
    }
    
    .form-control {
      border-radius: 8px;
      padding: 10px 15px;
      border: 1px solid #ced4da;
      margin-bottom: 15px;
    }
    
    .form-control:focus {
      box-shadow: 0 0 0 0.2rem rgba(29, 151, 108, 0.25);
      border-color: var(--primary);
    }
    
    .btn-success {
      background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
      border: none;
      border-radius: 8px;
      padding: 10px 15px;
      transition: all 0.3s;
    }
    
    .btn-success:hover {
      background: linear-gradient(135deg, var(--primary-dark) 0%, var(--primary) 100%);
      transform: translateY(-2px);
      box-shadow: 0 4px 8px rgba(0,0,0,0.15);
    }
    
    .text-success {
      color: var(--primary) !important;
    }
    
    label {
      font-weight: 500;
      margin-bottom: 8px;
    }
    
    .alert {
      border-radius: 8px;
      padding: 15px;
    }
    
    .section-heading {
      position: relative;
      padding-bottom: 10px;
      margin-bottom: 20px;
      font-weight: 600;
    }
    
    .section-heading:after {
      content: '';
      position: absolute;
      left: 0;
      right: 0;
      bottom: 0;
      margin: 0 auto;
      width: 50px;
      height: 3px;
      background: var(--primary);
    }
  </style>
</head>
<body>
  <%@include file="navbar.jsp"%>

  <c:if test="${empty doctorObj }">
    <c:redirect url="../doctor_login.jsp"></c:redirect>
  </c:if>

  <div class="container py-5">
    <div class="row">
      <div class="col-md-4">
        <div class="card">
          <div class="card-header">
            <h5 class="mb-0 text-center"><i class="fas fa-lock me-2"></i>Change Password</h5>
          </div>
          <div class="card-body p-4">
            <!-- for message -->
            <c:if test="${not empty successMsg }">
              <div class="alert alert-success alert-dismissible fade show">
                ${successMsg}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
              </div>
              <c:remove var="successMsg" scope="session" />
            </c:if>

            <c:if test="${not empty errorMsg }">
              <div class="alert alert-danger alert-dismissible fade show">
                ${errorMsg}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
              </div>
              <c:remove var="errorMsg" scope="session" />
            </c:if>

            <form action="../doctorChangePassword" method="post">
              <div class="mb-3">
                <label class="form-label">New Password</label>
                <div class="input-group">
                  <span class="input-group-text"><i class="fas fa-key"></i></span>
                  <input name="newPassword" type="password" placeholder="Enter new password" class="form-control" required>
                </div>
              </div>
              <div class="mb-4">
                <label class="form-label">Current Password</label>
                <div class="input-group">
                  <span class="input-group-text"><i class="fas fa-lock"></i></span>
                  <input name="oldPassword" type="password" placeholder="Enter current password" class="form-control" required>
                </div>
              </div>
              <input type="hidden" value="${doctorObj.id}" name="doctorId">
              <button type="submit" class="btn btn-success w-100">
                <i class="fas fa-sync-alt me-2"></i>Update Password
              </button>
            </form>
          </div>
        </div>
      </div>

      <div class="col-md-8">
        <div class="card">
          <div class="card-header">
            <h5 class="mb-0 text-center"><i class="fas fa-user-md me-2"></i>Edit Doctor Profile</h5>
          </div>
          <div class="card-body p-4">
            <!-- for message -->
            <c:if test="${not empty successMsgForD }">
              <div class="alert alert-success alert-dismissible fade show">
                ${successMsgForD}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
              </div>
              <c:remove var="successMsgForD" scope="session" />
            </c:if>

            <c:if test="${not empty errorMsgForD }">
              <div class="alert alert-danger alert-dismissible fade show">
                ${errorMsgForD}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
              </div>
              <c:remove var="errorMsgForD" scope="session" />
            </c:if>

            <form action="../doctorEditProfile" method="post">
              <div class="row">
                <div class="col-md-6">
                  <div class="mb-3">
                    <label class="form-label">Full Name</label>
                    <div class="input-group">
                      <span class="input-group-text"><i class="fas fa-user"></i></span>
                      <input name="fullName" type="text" placeholder="Enter full name" class="form-control" value="${doctorObj.fullName}">
                    </div>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="mb-3">
                    <label class="form-label">Date of Birth</label>
                    <div class="input-group">
                      <span class="input-group-text"><i class="fas fa-calendar"></i></span>
                      <input name="dateOfBirth" type="date" class="form-control" value="${doctorObj.dateOfBirth}">
                    </div>
                  </div>
                </div>
              </div>

              <div class="row">
                <div class="col-md-6">
                  <div class="mb-3">
                    <label class="form-label">Qualification</label>
                    <div class="input-group">
                      <span class="input-group-text"><i class="fas fa-graduation-cap"></i></span>
                      <input name="qualification" type="text" placeholder="Enter qualification" class="form-control" value="${doctorObj.qualification}">
                    </div>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="mb-3">
                    <label class="form-label">Specialist</label>
                    <div class="input-group">
                      <span class="input-group-text"><i class="fas fa-stethoscope"></i></span>
                      <select class="form-control" name="specialist">
                        <option>${doctorObj.specialist}</option>
                        <%
                        SpecialistDAO spDAO = new SpecialistDAO(DBConnection.getConn());
                        List<Specialist> spList = spDAO.getAllSpecialist();
                        for (Specialist sp : spList) {
                        %>
                        <option><%=sp.getSpecialistName()%></option>
                        <%
                        }
                        %>
                      </select>
                    </div>
                  </div>
                </div>
              </div>

              <div class="row">
                <div class="col-md-6">
                  <div class="mb-3">
                    <label class="form-label">Email Address</label>
                    <div class="input-group">
                      <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                      <input name="email" type="email" placeholder="Enter Email" class="form-control" readonly value="${doctorObj.email}">
                    </div>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="mb-3">
                    <label class="form-label">Phone Number</label>
                    <div class="input-group">
                      <span class="input-group-text"><i class="fas fa-phone"></i></span>
                      <input name="phone" type="text" placeholder="Enter mobile number" class="form-control" value="${doctorObj.phone}">
                    </div>
                  </div>
                </div>
              </div>

              <input type="hidden" value="${doctorObj.id}" name="doctorId">
              <button type="submit" class="btn btn-success w-100 mt-3">
                <i class="fas fa-save me-2"></i>Update Profile
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Footer -->
  <footer class="text-center text-muted py-4 mt-5">
    <p>&copy; 2025 Doctor Patient Portal. All rights reserved.</p>
  </footer>

  <!-- Bootstrap Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
