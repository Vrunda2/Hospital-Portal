<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- for jstl tag -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- end of jstl tag -->

<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login | HealthConnect</title>

    <!-- Bootstrap CSS -->
    <%@include file="component/allcss.jsp"%>
    
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <style>
        :root {
            --primary-color: #4568dc;
            --primary-dark: #3a57b5;
            --secondary-color: #b6b6f8;
            --text-color: #333333;
            --light-color: #f8f9fa;
            --border-radius: 10px;
        }
        
        body {
            background-color: #f5f7fb;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .login-container {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem 1rem;
        }

        .login-card {
            border: none;
            border-radius: var(--border-radius);
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s ease;
            max-width: 420px;
            width: 100%;
            background-color: white;
        }
        
        .login-card:hover {
            transform: translateY(-5px);
        }
        
        .card-header {
            background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
            padding: 1.5rem;
            border-bottom: none;
            text-align: center;
        }
        
        .card-header i {
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
        }
        
        .card-body {
            padding: 2rem;
        }
        
        .form-control {
            border-radius: 8px;
            padding: 0.8rem 1rem;
            border: 1px solid #e2e8f0;
            margin-bottom: 0.5rem;
            font-size: 1rem;
            transition: all 0.3s;
            background-color: #f8fafc;
        }
        
        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(69, 104, 220, 0.2);
            background-color: #fff;
        }
        
        .form-label {
            font-weight: 500;
            margin-bottom: 0.3rem;
            color: var(--text-color);
        }
        
        .form-text {
            color: #718096;
            font-size: 0.875rem;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
            border: none;
            border-radius: 8px;
            padding: 0.8rem;
            font-weight: 600;
            font-size: 1rem;
            margin-top: 1rem;
            transition: all 0.3s;
        }
        
        .btn-primary:hover {
            background: linear-gradient(135deg, var(--primary-dark), var(--primary-color));
            box-shadow: 0 4px 15px rgba(69, 104, 220, 0.3);
            transform: translateY(-2px);
        }
        
        .alert {
            border-radius: 8px;
            margin-bottom: 1rem;
            padding: 1rem;
        }
        
        .brand-section {
            text-align: center;
            margin-bottom: 1.5rem;
        }
        
        .brand-section h5 {
            margin-top: 1rem;
            color: #4a5568;
            font-weight: 400;
        }
        
        .brand-icon {
            height: 70px;
            width: 70px;
            background-color: var(--primary-color);
            margin: 0 auto;
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 10px 20px rgba(69, 104, 220, 0.2);
        }
        
        .brand-icon i {
            font-size: 2.5rem;
            color: white;
        }
        
        .input-group-text {
            background-color: transparent;
            border: 1px solid #e2e8f0;
            border-right: none;
            color: #718096;
        }
        
        .has-icon .form-control {
            border-left: none;
            padding-left: 0;
        }
        
        .divider {
            display: flex;
            align-items: center;
            text-align: center;
            margin: 1rem 0;
        }
        
        .divider::before, .divider::after {
            content: '';
            flex: 1;
            border-bottom: 1px solid #e2e8f0;
        }
        
        .divider span {
            padding: 0 5px;
            color: #718096;
            font-size: 0.875rem;
        }
        
        .footer-text {
            text-align: center;
            color: #718096;
            font-size: 0.875rem;
            margin-top: 1.5rem;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <%@include file="component/navbar.jsp"%>
    
    <!-- Admin Login Section -->
    <div class="login-container">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-5">
                    <div class="login-card">
                        <div class="card-header">
                            <h4 class="mb-0 text-white">Admin Portal</h4>
                        </div>
                        
                        <div class="card-body">
                            <!-- Brand Section -->
                            <div class="brand-section">
                                <div class="brand-icon">
                                    <i class="fas fa-user-shield"></i>
                                </div>
                                <h5>Sign in to your admin account</h5>
                            </div>
                            
                            <!-- Message Alerts -->
                            <c:if test="${not empty successMsg}">
                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                    <i class="fas fa-check-circle me-2"></i> ${successMsg}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    <c:remove var="successMsg" scope="session" />
                                </div>
                            </c:if>
                            
                            <c:if test="${not empty errorMsg}">
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    <i class="fas fa-exclamation-circle me-2"></i> ${errorMsg}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    <c:remove var="errorMsg" scope="session" />
                                </div>
                            </c:if>
                            
                            <!-- Login Form -->
                            <form action="adminLogin" method="post">
                                <div class="mb-3">
                                    <label class="form-label">Email Address</label>
                                    <div class="input-group has-icon">
                                        <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                        <input name="email" type="email" placeholder="admin@example.com" 
                                               class="form-control" required>
                                    </div>
                                    <div class="form-text">We'll never share your email with anyone else.</div>
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label">Password</label>
                                    <div class="input-group has-icon">
                                        <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                        <input name="password" type="password" placeholder="••••••••" 
                                               class="form-control" required>
                                    </div>
                                </div>
                                
                                <div class="d-grid">
                                    <button type="submit" class="btn btn-primary">
                                        Sign In <i class="fas fa-sign-in-alt ms-1"></i>
                                    </button>
                                </div>
                            </form>
                            
                            <div class="divider">
                                <span>System Access Only</span>
                            </div>
                            
                            <!-- <div class="footer-text">
                                <p>Need help? Contact the IT department</p>
                            </div> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>