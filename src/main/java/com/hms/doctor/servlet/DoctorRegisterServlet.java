package com.hms.doctor.servlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.dao.DoctorDAO;
import com.hms.db.DBConnection;
import com.hms.entity.Doctor;

@WebServlet("/doctor_register")
public class DoctorRegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        try {
            // Get form parameters which are coming from doctor_register.jsp page
            String fullName = req.getParameter("fullName");
            String dateOfBirth = req.getParameter("dateOfBirth");
            String qualification = req.getParameter("qualification");
            String specialist = req.getParameter("specialist");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            String password = req.getParameter("password");
            
            // Create session
            HttpSession session = req.getSession();
            
            // Create Doctor object
            Doctor doctor = new Doctor();
            doctor.setFullName(fullName);
            doctor.setDateOfBirth(dateOfBirth);
            doctor.setQualification(qualification);
            doctor.setSpecialist(specialist);
            doctor.setEmail(email);
            doctor.setPhone(phone);
            doctor.setPassword(password);
            
            // Create database connection
            DoctorDAO doctorDAO = new DoctorDAO(DBConnection.getConn());
            
            // Call registerDoctor() method to register the doctor
            boolean success = doctorDAO.registerDoctor(doctor);
            
            if (success) {
                // Registration successful
                session.setAttribute("successMsg", "Doctor Registration Successful");
                resp.sendRedirect("doctor_login.jsp");
            } else {
                // Registration failed
                session.setAttribute("errorMsg", "Something went wrong on server");
                resp.sendRedirect("doctor_register.jsp");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions
            HttpSession session = req.getSession();
            session.setAttribute("errorMsg", "Server Error: " + e.getMessage());
            resp.sendRedirect("doctor_register.jsp");
        }
    }
}