<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Doctor Details</title>
  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom CSS -->
  <style>
    .card {
      border-radius: 10px;
      box-shadow: 0 4px 12px rgba(128, 0, 0, 0.2);
      transition: transform 0.3s ease;
    }
    .card:hover {
      transform: translateY(-5px);
    }
    .btn-primary {
      background-color: #dc3545;
      border: none;
      transition: all 0.3s;
    }
    .btn-primary:hover {
      background-color: #bd2130;
      transform: scale(1.02);
    }
    .form-control:focus {
      border-color: #dc3545;
      box-shadow: 0 0 0 0.2rem rgba(220, 53, 69, 0.25);
    }
  </style>
</head>
<body class="bg-light">
  <!-- Navigation component will be included here -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-danger">
    <div class="container">
      <a class="navbar-brand" href="#">HMS Dashboard</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <!-- Navigation items would go here -->
      </div>
    </div>
  </nav>

  <div class="container py-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card border-0">
          <div class="card-body p-4">
            <h3 class="text-center mb-4 text-danger fw-bold">Edit Doctor Profile</h3>
            
            <!-- Toast Notifications for messages -->
            <div class="position-fixed top-0 end-0 p-3" style="z-index: 5">
              <div id="successToast" class="toast hide" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="toast-header bg-success text-white">
                  <strong class="me-auto">Success</strong>
                  <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
                <div class="toast-body"></div>
              </div>
              
              <div id="errorToast" class="toast hide" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="toast-header bg-danger text-white">
                  <strong class="me-auto">Error</strong>
                  <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
                <div class="toast-body"></div>
              </div>
            </div>

            <form id="doctorEditForm" action="../api/doctors/update" method="post" class="needs-validation" novalidate>
              <div class="mb-3">
                <label for="fullName" class="form-label">Full Name</label>
                <input id="fullName" name="fullName" type="text" placeholder="Enter full name" 
                       class="form-control" value="${doctor.fullName}" required>
                <div class="invalid-feedback">Full name is required</div>
              </div>
              
              <div class="mb-3">
                <label for="dateOfBirth" class="form-label">Date of Birth</label>
                <input id="dateOfBirth" name="dateOfBirth" type="date" 
                       class="form-control" value="${doctor.dateOfBirth}" required>
                <div class="invalid-feedback">Date of birth is required</div>
              </div>
              
              <div class="mb-3">
                <label for="qualification" class="form-label">Qualification</label>
                <input id="qualification" name="qualification" type="text" placeholder="Enter qualification" 
                       class="form-control" value="${doctor.qualification}" required>
                <div class="invalid-feedback">Qualification is required</div>
              </div>

              <div class="mb-3">
                <label for="specialist" class="form-label">Specialty</label>
                <select id="specialist" class="form-select" name="specialist" required>
                  <option value="">Select specialty</option>
                  <!-- Specialties will be loaded here via JavaScript -->
                </select>
                <div class="invalid-feedback">Please select a specialty</div>
              </div>

              <div class="mb-3">
                <label for="email" class="form-label">Email address</label>
                <input id="email" name="email" type="email" placeholder="Enter Email" 
                       class="form-control" value="${doctor.email}" required>
                <div class="invalid-feedback">Please enter a valid email</div>
              </div>
              
              <div class="mb-3">
                <label for="phone" class="form-label">Phone</label>
                <input id="phone" name="phone" type="tel" placeholder="Enter mobile number" 
                       class="form-control" value="${doctor.phone}" required 
                       pattern="[0-9]{10}">
                <div class="invalid-feedback">Please enter a valid 10-digit phone number</div>
              </div>
              
              <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <div class="input-group">
                  <input id="password" name="password" type="password" placeholder="Enter password" 
                         class="form-control" value="${doctor.password}" required>
                  <button class="btn btn-outline-secondary" type="button" id="togglePassword">
                    <i class="bi bi-eye"></i>
                  </button>
                </div>
                <div class="invalid-feedback">Password is required</div>
              </div>
              
              <!-- Hidden field for doctor ID -->
              <input name="id" type="hidden" value="${doctor.id}">

              <div class="d-grid gap-2 mt-4">
                <button type="submit" class="btn btn-primary py-2 fw-bold">Update Profile</button>
                <a href="doctors.html" class="btn btn-outline-secondary">Cancel</a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap 5 JS Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Bootstrap Icons -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
  
  <script>
    document.addEventListener('DOMContentLoaded', function() {
      // Form validation
      const form = document.getElementById('doctorEditForm');
      
      form.addEventListener('submit', function(event) {
        if (!form.checkValidity()) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      });
      
      // Toggle password visibility
      const togglePassword = document.getElementById('togglePassword');
      const password = document.getElementById('password');
      
      togglePassword.addEventListener('click', function() {
        const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
        password.setAttribute('type', type);
        this.querySelector('i').classList.toggle('bi-eye');
        this.querySelector('i').classList.toggle('bi-eye-slash');
      });
      
      // Fetch doctor data and populate form
      const doctorId = new URLSearchParams(window.location.search).get('id');
      if (doctorId) {
        fetchDoctorData(doctorId);
      }
      
      // Fetch specialties and populate dropdown
      fetchSpecialties();
    });
    
    // Function to fetch doctor data
    function fetchDoctorData(id) {
      fetch(`../api/doctors/${id}`)
        .then(response => {
          if (!response.ok) {
            throw new Error('Failed to fetch doctor data');
          }
          return response.json();
        })
        .then(data => {
          // Populate form fields with doctor data
          document.getElementById('fullName').value = data.fullName;
          document.getElementById('dateOfBirth').value = data.dateOfBirth;
          document.getElementById('qualification').value = data.qualification;
          document.getElementById('specialist').value = data.specialist;
          document.getElementById('email').value = data.email;
          document.getElementById('phone').value = data.phone;
          document.getElementById('password').value = data.password;
        })
        .catch(error => {
          console.error('Error:', error);
          showToast('errorToast', 'Failed to load doctor data. Please try again.');
        });
    }
    
    // Function to fetch specialties
    function fetchSpecialties() {
      fetch('../api/specialties')
        .then(response => {
          if (!response.ok) {
            throw new Error('Failed to fetch specialties');
          }
          return response.json();
        })
        .then(data => {
          const specialistDropdown = document.getElementById('specialist');
          const currentSpecialist = specialistDropdown.value;
          
          // Clear existing options except the first one
          while (specialistDropdown.options.length > 1) {
            specialistDropdown.remove(1);
          }
          
          // Add new options
          data.forEach(specialty => {
            const option = document.createElement('option');
            option.value = specialty.specialistName;
            option.textContent = specialty.specialistName;
            specialistDropdown.appendChild(option);
          });
          
          // Restore selected value if it exists
          if (currentSpecialist) {
            specialistDropdown.value = currentSpecialist;
          }
        })
        .catch(error => {
          console.error('Error:', error);
          showToast('errorToast', 'Failed to load specialties. Please try again.');
        });
    }
    
    // Function to show toast notifications
    function showToast(toastId, message) {
      const toastElement = document.getElementById(toastId);
      const toastBody = toastElement.querySelector('.toast-body');
      toastBody.textContent = message;
      
      const toast = new bootstrap.Toast(toastElement);
      toast.show();
    }
  </script>
</body>
</html>