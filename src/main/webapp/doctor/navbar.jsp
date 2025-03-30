<!-- for jstl tag -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- end of jstl tag -->

<%@page isELIgnored="false"%>

<nav class="navbar navbar-expand-lg shadow-sm">
  <div class="container">
    <a class="navbar-brand d-flex align-items-center" href="index.jsp">
      <i class="fa-solid fa-hospital-user me-2 text-primary"></i>
      <span class="fw-bold">HealthConnect</span>
    </a>
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
      data-bs-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent" aria-expanded="false"
      aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link d-flex align-items-center" href="index.jsp">
            <i class="fa-solid fa-house-medical me-1"></i>
            <span>Dashboard</span>
          </a>
        </li>

        <li class="nav-item">
          <a class="nav-link d-flex align-items-center" href="patient.jsp">
            <i class="fa-solid fa-user-injured me-1"></i>
            <span>Patients</span>
          </a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link d-flex align-items-center" href="appointments.jsp">
            <i class="fa-solid fa-calendar-check me-1"></i>
            <span>Appointments</span>
          </a>
        </li>
      </ul>

      <div class="d-flex align-items-center">
        <div class="dropdown">
          <button class="btn btn-outline-primary dropdown-toggle d-flex align-items-center" type="button"
            id="dropdownMenuButton1" data-bs-toggle="dropdown"
            aria-expanded="false">
            <div class="avatar-circle me-2 bg-primary text-white">
              ${fn:substring(doctorObj.fullName, 0, 1)}
            </div>
            <span>${doctorObj.fullName}</span>
          </button>
          <ul class="dropdown-menu dropdown-menu-end shadow-sm border-0 mt-2" aria-labelledby="dropdownMenuButton1">
            <li>
              <a class="dropdown-item d-flex align-items-center" href="doctor_profile.jsp">
                <i class="fa-solid fa-user me-2 text-primary"></i>
                <span>My Profile</span>
              </a>
            </li>
            <li>
              <a class="dropdown-item d-flex align-items-center" href="edit_profile.jsp">
                <i class="fa-solid fa-gear me-2 text-primary"></i>
                <span>Edit Profile</span>
              </a>
            </li>
            <li><hr class="dropdown-divider"></li>
            <li>
              <a class="dropdown-item d-flex align-items-center" href="../doctorLogout">
                <i class="fa-solid fa-arrow-right-from-bracket me-2 text-danger"></i>
                <span>Logout</span>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</nav>

<style>
  /* Custom navbar styling */
  .navbar {
    background-color: #ffffff;
    padding: 0.75rem 1rem;
  }
  
  .navbar-brand {
    font-size: 1.5rem;
  }
  
  .navbar .nav-link {
    color: #4a5568;
    font-size: 0.95rem;
    padding: 0.5rem 1rem;
    border-radius: 0.375rem;
    transition: all 0.2s;
  }
  
  .navbar .nav-link:hover {
    background-color: #f8f9fa;
    color: #2b6cb0;
  }
  
  .avatar-circle {
    width: 32px;
    height: 32px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
  }
  
  .btn-outline-primary {
    border-color: #e2e8f0;
    color: #4a5568;
  }
  
  .btn-outline-primary:hover {
    background-color: #f8f9fa;
    border-color: #cbd5e0;
    color: #2b6cb0;
  }
  
  .dropdown-item {
    padding: 0.5rem 1rem;
    font-size: 0.95rem;
  }
  
  .dropdown-item:hover {
    background-color: #f8f9fa;
  }
  
  /* For active state */
  .navbar .nav-link.active {
    background-color: rgba(43, 108, 176, 0.1);
    color: #2b6cb0;
    font-weight: 500;
  }
  
  /* Custom media query to improve mobile experience */
  @media (max-width: 992px) {
    .avatar-circle {
      margin-bottom: 0.5rem;
    }
    
    .navbar .nav-link {
      padding: 0.75rem 1rem;
      margin-bottom: 0.25rem;
    }
  }
</style>

<!-- Add this to make the first letter avatar work -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>