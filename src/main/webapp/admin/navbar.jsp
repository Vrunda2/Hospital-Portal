<nav class="navbar navbar-expand-lg navbar-dark" style="background: linear-gradient(135deg, #2563eb 0%, #1e40af 100%);">
    <div class="container-fluid">
        <a class="navbar-brand d-flex align-items-center" href="index.jsp">
            <i class="fas fa-hospital me-2"></i> 
            <span class="fw-bold">Doctor Patient Portal</span>
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
                    <a class="nav-link active px-3" aria-current="page" href="index.jsp">
                        <i class="fas fa-home me-1"></i> Home
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active px-3" aria-current="page" href="doctor.jsp">
                        <i class="fas fa-user-md me-1"></i> Doctor
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active px-3" aria-current="page" href="view_doctor.jsp">
                        <i class="fas fa-list me-1"></i> View Doctors
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active px-3" aria-current="page" href="patient.jsp">
                        <i class="fas fa-wheelchair me-1"></i> Patient
                    </a>
                </li>
            </ul>

            <div class="dropdown">
                <button class="btn btn-light dropdown-toggle" type="button"
                    id="adminDropdown" data-bs-toggle="dropdown"
                    aria-expanded="false">
                    <i class="fas fa-user-shield me-1"></i> Admin
                </button>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="adminDropdown">
                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="../adminLogout">
                            <i class="fas fa-sign-out-alt me-2"></i> Logout
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>