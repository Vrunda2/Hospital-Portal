<nav class="navbar navbar-expand-lg navbar-dark shadow-sm">
	<div class="container-fluid">
	  <a class="navbar-brand d-flex align-items-center" href="index.jsp">
		<i class="fa-sharp fa-solid fa-hospital me-2"></i>
		<span class="fw-bold">Doctor Patient Portal</span>
	  </a>
	  <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
		data-bs-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
		<!-- original ul class preserved for compatibility -->
		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
		  <li class="nav-item"><a class="nav-link active"
			aria-current="page" href="index.jsp"><i class="fa fa-home me-1"></i>
			  HOME</a></li>
		  <li class="nav-item"><a class="nav-link active"
			aria-current="page" href="doctor.jsp"><i
			  class="fa-solid fa-user-doctor me-1"></i> DOCTOR</a></li>
		  <li class="nav-item"><a class="nav-link active"
			aria-current="page" href="view_doctor.jsp"><i
			  class="fa-solid fa-list me-1"></i> VIEW DOCTOR</a></li>
		  <li class="nav-item"><a class="nav-link active"
			aria-current="page" href="patient.jsp"><i
			  class="fa fa-wheelchair me-1"></i> PATIENT</a></li>
		</ul>
  
		<!-- Preserved exact same dropdown structure for logout functionality -->
		<div class="dropdown">
		  <button class="btn dropdown-toggle user-dropdown" type="button"
			id="dropdownMenuButton1" data-bs-toggle="dropdown"
			aria-expanded="false">
			<i class="fa fa-universal-access me-1"></i> Admin
		  </button>
		  <ul class="dropdown-menu dropdown-menu-end shadow-sm" aria-labelledby="dropdownMenuButton1">
			<li><a class="dropdown-item" href="../adminLogout">Logout</a></li>
		  </ul>
		</div>
	  </div>
	</div>
  </nav>
  
  <style>
  :root {
	--primary-blue: #1976d2;
	--primary-light: #bbdefb;
	--primary-dark: #0d47a1;
	--secondary-blue: #2196f3;
	--text-light: #ffffff;
	--text-dark: #333333;
	--hover-bg: rgba(255, 255, 255, 0.1);
  }
  
  .navbar {
	background-color: var(--primary-blue);
	padding: 0.8rem 1rem;
  }
  
  .navbar-brand {
	font-size: 1.25rem;
	color: var(--text-light) !important;
  }
  
  .navbar-brand i {
	font-size: 1.5rem;
	color: var(--text-light);
  }
  
  .nav-link {
	color: var(--text-light) !important;
	padding: 0.8rem 1.2rem;
	border-radius: 4px;
	margin-right: 0.3rem;
	font-weight: 500;
	transition: all 0.3s ease;
  }
  
  .nav-link:hover, .nav-link:focus {
	background-color: var(--hover-bg);
  }
  
  .nav-link i {
	font-size: 1rem;
  }
  
  .user-dropdown {
	background-color: var(--primary-dark);
	color: var(--text-light);
	border: none;
	border-radius: 30px;
	padding: 0.5rem 1.2rem;
	font-weight: 500;
	transition: all 0.3s ease;
  }
  
  .user-dropdown:hover, .user-dropdown:focus {
	background-color: var(--secondary-blue);
	color: var(--text-light);
  }
  
  .dropdown-menu {
	border: none;
	border-radius: 8px;
	margin-top: 10px;
  }
  
  .dropdown-item {
	padding: 0.6rem 1.2rem;
	transition: all 0.2s ease;
  }
  
  .dropdown-item:hover {
	background-color: var(--primary-light);
  }
  
  @media (max-width: 992px) {
	.nav-link {
	  padding: 0.5rem 0;
	  margin: 0.2rem 0;
	}
	
	.user-dropdown {
	  margin-top: 0.5rem;
	  width: 100%;
	  justify-content: center;
	}
  }
  </style>

