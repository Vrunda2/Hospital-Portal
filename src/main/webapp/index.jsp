<%@page import="com.hms.db.DBConnection"%>
<%@page import="java.sql.Connection"%>
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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Home Page | Doctor Patient Portal</title>
<%@include file="component/allcss.jsp"%>

<!-- Custom CSS for this page -->
<style type="text/css">
:root {
  --primary-color: #2563eb;
  --secondary-color: #1e40af;
  --accent-color: #60a5fa;
  --text-dark: #1f2937;
  --text-light: #6b7280;
  --light-bg: #f3f4f6;
  --white: #ffffff;
  --shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
  --rounded: 0.5rem;
}

body {
  font-family: 'Inter', system-ui, -apple-system, sans-serif;
  color: var(--text-dark);
  line-height: 1.6;
}

.my-card {
  border-radius: var(--rounded);
  box-shadow: var(--shadow);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  border: none;
  height: 100%;
}

.my-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
}

.myP-color {
  color: var(--primary-color);
  font-weight: 600;
}

.hero-section {
  position: relative;
}

.carousel-item img {
  object-fit: cover;
  filter: brightness(0.85);
}

.carousel-caption {
  bottom: 25%;
}

.feature-icon {
  font-size: 2.5rem;
  color: var(--primary-color);
  margin-bottom: 1rem;
}

.team-card img {
  border-radius: var(--rounded);
  object-fit: cover;
  width: 100%;
  height: 300px;
}

.section-heading {
  position: relative;
  margin-bottom: 2.5rem;
  padding-bottom: 1rem;
}

.section-heading:after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 50%;
  transform: translateX(-50%);
  width: 80px;
  height: 4px;
  background-color: var(--accent-color);
  border-radius: 2px;
}

.btn-primary {
  background-color: var(--primary-color);
  border-color: var(--primary-color);
}

.btn-primary:hover {
  background-color: var(--secondary-color);
  border-color: var(--secondary-color);
}
</style>
<!-- End of custom CSS -->

<!-- FontAwesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<!-- Hero Section with Carousel -->
	<div class="hero-section">
		<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="3" aria-label="Slide 4"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="img/doctor_2.jpg" class="d-block w-100" alt="..." height="600px">
					<div class="carousel-caption d-none d-md-block">
						<h2 class="display-4 fw-bold">Welcome to E-Hospital</h2>
						<p class="lead">Quality Healthcare for Everyone</p>
						<a href="user_appointment.jsp" class="btn btn-primary btn-lg px-4 mt-3">
							Make an Appointment
						  </a>
						  
						  
						
					</div>
				</div>
				<div class="carousel-item">
					<img src="img/doctor_1.jpg" class="d-block w-100" alt="..." height="600px">
					<div class="carousel-caption d-none d-md-block">
						<h2 class="display-4 fw-bold">Expert Doctors</h2>
						<p class="lead">Dedicated to Your Well-being</p>
						
					</div>
				</div>
				<div class="carousel-item">
					<img src="img/hospital4.jpg" class="d-block w-100" alt="..." height="600px">
					<div class="carousel-caption d-none d-md-block">
						<h2 class="display-4 fw-bold">State-of-the-Art Facilities</h2>
						<p class="lead">Equipped with Modern Technology</p>
						
					</div>
				</div>
				<div class="carousel-item">
					<img src="img/doctor_3.jpg" class="d-block w-100" alt="..." height="600px">
					<div class="carousel-caption d-none d-md-block">
						<h2 class="display-4 fw-bold">Patient-Centered Care</h2>
						<p class="lead">Your Health is Our Priority</p>
						
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
	<!-- End of Hero Section -->

	<!-- Features Section -->
	<div class="container py-5">
		<h2 class="text-center section-heading">Key Features of our Doctor Patient Portal</h2>
		
		<div class="row g-4">
			<div class="col-lg-8">
				<div class="row g-4">
					<div class="col-md-6">
						<div class="card my-card p-4">
							<div class="text-center mb-3">
								<i class="fas fa-user-md feature-icon"></i>
							</div>
							<div class="card-body text-center">
								<h5 class="card-title fw-bold myP-color">11,000+ Healing Hands</h5>
								<p class="card-text">Largest network of the world's finest and brightest
									medical experts who provide compassionate care using
									outstanding expertise.</p>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="card my-card p-4">
							<div class="text-center mb-3">
								<i class="fas fa-microscope feature-icon"></i>
							</div>
							<div class="card-body text-center">
								<h5 class="card-title fw-bold myP-color">Advanced Healthcare Technology</h5>
								<p class="card-text">E-Hospitals has been the pioneer in bringing
									ground-breaking health care technologies to Bangladesh.</p>
							</div>
						</div>
					</div>

					<div class="col-md-6 mt-2">
						<div class="card my-card p-4">
							<div class="text-center mb-3">
								<i class="fas fa-chart-line feature-icon"></i>
							</div>
							<div class="card-body text-center">
								<h5 class="card-title fw-bold myP-color">Best Clinical Outcomes</h5>
								<p class="card-text">Leveraging its vast medical expertise & technological
									advantage, E-Hospitals has consistently delivered best in class
									clinical outcomes.</p>
							</div>
						</div>
					</div>

					<div class="col-md-6 mt-2">
						<div class="card my-card p-4">
							<div class="text-center mb-3">
								<i class="fas fa-pills feature-icon"></i>
							</div>
							<div class="card-body text-center">
								<h5 class="card-title fw-bold myP-color">500+ Pharmacies</h5>
								<p class="card-text">E-Hospital Pharmacy is our first, largest and most
									trusted branded pharmacy network, with over 500 plus outlets
									covering the entire nation.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-lg-4 d-flex align-items-center">
				<div class="card shadow-sm border-0 overflow-hidden h-100">
					<img src="img/doctor_1.jpg" alt="Doctor" class="img-fluid h-100 object-cover">
				</div>
			</div>
		</div>
	</div>
	<!-- End of Features Section -->

	<!-- Team Section -->
	<div class="bg-light py-5">
		<div class="container">
			<h2 class="text-center section-heading">Our Medical Team</h2>
			
			<div class="row g-4">
				<div class="col-md-3">
					<div class="card my-card border-0 team-card">
						<img src="img/doc1.jpg" class="card-img-top" alt="Dr. John">
						<div class="card-body text-center py-4">
							<h5 class="card-title fw-bold myP-color mb-1">Dr. John</h5>
							<p class="text-muted">CEO & Chairman</p>
							<div class="mt-3">
								<a href="#" class="text-primary mx-2"><i class="fab fa-twitter"></i></a>
								<a href="#" class="text-primary mx-2"><i class="fab fa-linkedin"></i></a>
								<a href="#" class="text-primary mx-2"><i class="fas fa-envelope"></i></a>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-md-3">
					<div class="card my-card border-0 team-card">
						<img src="img/doc2.jpg" class="card-img-top" alt="Dr. Brad">
						<div class="card-body text-center py-4">
							<h5 class="card-title fw-bold myP-color mb-1">Dr. Brad</h5>
							<p class="text-muted">Chief Doctor</p>
							<div class="mt-3">
								<a href="#" class="text-primary mx-2"><i class="fab fa-twitter"></i></a>
								<a href="#" class="text-primary mx-2"><i class="fab fa-linkedin"></i></a>
								<a href="#" class="text-primary mx-2"><i class="fas fa-envelope"></i></a>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-md-3">
					<div class="card my-card border-0 team-card">
						<img src="img/doc3.jpg" class="card-img-top" alt="Dr. Jennifer">
						<div class="card-body text-center py-4">
							<h5 class="card-title fw-bold myP-color mb-1">Dr. Jennifer</h5>
							<p class="text-muted">Chief Doctor</p>
							<div class="mt-3">
								<a href="#" class="text-primary mx-2"><i class="fab fa-twitter"></i></a>
								<a href="#" class="text-primary mx-2"><i class="fab fa-linkedin"></i></a>
								<a href="#" class="text-primary mx-2"><i class="fas fa-envelope"></i></a>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-md-3">
					<div class="card my-card border-0 team-card">
						<img src="img/doc4.jpg" class="card-img-top" alt="Dr. Maria">
						<div class="card-body text-center py-4">
							<h5 class="card-title fw-bold myP-color mb-1">Dr. Maria</h5>
							<p class="text-muted">Dean</p>
							<div class="mt-3">
								<a href="#" class="text-primary mx-2"><i class="fab fa-twitter"></i></a>
								<a href="#" class="text-primary mx-2"><i class="fab fa-linkedin"></i></a>
								<a href="#" class="text-primary mx-2"><i class="fas fa-envelope"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End of Team Section -->

	<!-- Call to Action Section -->
	<div class="container py-5">
		<div class="row">
			<div class="col-lg-8 mx-auto">
				<div class="card my-card border-0 bg-primary text-white p-5 text-center">
					<h2 class="fw-bold mb-4">Ready to experience better healthcare?</h2>
					<p class="lead mb-4">Book an appointment with one of our specialists today</p>
					<div>
						<a href="user_appointment.jsp" class="btn btn-outline-light btn-lg px-4">
							Make an Appointment
						  </a>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End of Call to Action Section -->

	<!-- footer -->
	<%@include file="component/footer.jsp"%>
	<!-- end footer -->
	
	<!-- Bootstrap JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>