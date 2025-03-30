<!-- for jstl tag -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- end of jstl tag -->

<%@page isELIgnored="false"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<nav class="navbar navbar-expand-lg navbar-dark sticky-top">
  <div class="container">
    <a class="navbar-brand d-flex align-items-center" href="index.jsp">
      <i class="fa-solid fa-hospital me-2"></i>
      <span>HealthConnect</span>
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
      data-bs-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent" aria-expanded="false"
      aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0 align-items-center">

        <!-- if user not logged in then user can see below items -->
        <c:if test="${empty userObj}">
          <li class="nav-item">
            <a class="nav-link" href="admin_login.jsp">
              <i class="fa-solid fa-user-shield me-1"></i> Admin
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="doctor_login.jsp">
              <i class="fa-solid fa-user-doctor me-1"></i> Doctor
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="user_appointment.jsp">
              <i class="fa-solid fa-calendar-plus me-1"></i> Appointment
            </a>
          </li>
          <li class="nav-item ms-lg-2">
            <a class="btn btn-light btn-sm px-3" href="user_login.jsp">
              <i class="fas fa-sign-in-alt me-1"></i> Sign In
            </a>
          </li>
        </c:if>

        <!-- if user is logged in then user can see below items -->
        <c:if test="${not empty userObj}">
          <li class="nav-item">
            <a class="nav-link" href="user_appointment.jsp">
              <i class="fa-solid fa-calendar-plus me-1"></i> New Appointment
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="view_appointment.jsp">
              <i class="fa-solid fa-calendar-check me-1"></i> My Appointments
            </a>
          </li>

          <li class="nav-item ms-lg-2">
            <div class="dropdown">
              <button class="btn btn-light dropdown-toggle d-flex align-items-center" type="button"
                id="userDropdown" data-bs-toggle="dropdown"
                aria-expanded="false">
                <div class="avatar-circle me-2">
                  ${fn:substring(userObj.fullName, 0, 1)}
                </div>
                <span>${userObj.fullName}</span>
              </button>
              <ul class="dropdown-menu dropdown-menu-end shadow border-0" aria-labelledby="userDropdown">
                <li>
                  <a class="dropdown-item" href="user_profile.jsp">
                    <i class="fa-solid fa-user me-2"></i> My Profile
                  </a>
                </li>
                <li>
                  <a class="dropdown-item" href="change_password.jsp">
                    <i class="fa-solid fa-key me-2"></i> Change Password
                  </a>
                </li>
                <li><hr class="dropdown-divider"></li>
                <li>
                  <a class="dropdown-item" href="userLogout">
                    <i class="fa-solid fa-right-from-bracket me-2"></i> Logout
                  </a>
                </li>
              </ul>
            </div>
          </li>
        </c:if>
      </ul>
    </div>
  </div>
</nav>

<style>
  /* Modern navbar styling */
  .navbar {
    background: linear-gradient(135deg, #4568dc, #3f78e0);
    box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
    padding: 0.7rem 1rem;
  }
  
  .navbar-brand {
    font-size: 1.4rem;
    font-weight: 600;
    letter-spacing: 0.5px;
  }
  
  .navbar-brand i {
    font-size: 1.6rem;
  }
  
  .nav-link {
    font-size: 0.95rem;
    padding: 0.5rem 0.8rem;
    border-radius: 4px;
    font-weight: 500;
    transition: all 0.2s ease;
  }
  
  .nav-link:hover {
    background-color: rgba(255, 255, 255, 0.15);
  }
  
  .btn-light {
    background-color: rgba(255, 255, 255, 0.9);
    color: #4568dc;
    font-weight: 500;
    border: none;
    transition: all 0.2s;
  }
  
  .btn-light:hover {
    background-color: #ffffff;
    transform: translateY(-2px);
  }
  
  .dropdown-menu {
    border-radius: 8px;
    margin-top: 10px;
    min-width: 220px;
    padding: 0.5rem 0;
  }
  
  .dropdown-item {
    padding: 0.6rem 1rem;
    display: flex;
    align-items: center;
  }
  
  .dropdown-item:hover {
    background-color: #f8f9fa;
  }
  
  .dropdown-item i {
    width: 20px;
    text-align: center;
    color: #4568dc;
  }
  
  .avatar-circle {
    background-color: rgba(255, 255, 255, 0.9);
    color: #4568dc;
    height: 28px;
    width: 28px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
    font-size: 0.9rem;
  }
  
  /* Responsive adjustments */
  @media (max-width: 991px) {
    .navbar-nav {
      padding-top: 0.5rem;
    }
    
    .nav-link {
      padding: 0.7rem 1rem;
      margin-bottom: 0.2rem;
    }
    
    .btn-light {
      margin-top: 0.5rem;
      width: 100%;
      text-align: left;
      padding: 0.7rem 1rem;
    }
    
    .dropdown {
      width: 100%;
    }
    
    .dropdown button {
      width: 100%;
      text-align: left;
      padding: 0.7rem 1rem;
      margin-top: 0.5rem;
    }
  }
</style>