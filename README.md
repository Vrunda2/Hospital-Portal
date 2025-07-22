# 🏥 MediCore - Hospital Portal

A web-based hospital management system built using **Java**, **Servlets**, **JSP**, and **MySQL**. This portal enables hospital staff to manage patients, doctors, appointments, and more efficiently.

---

## 🚀 Features

- 🧑‍⚕️ Doctor & Patient Registration
- 🗓️ Appointment Booking and Scheduling
- 📋 Medical Record Management
- 🔐 Secure Login for Doctors & Admins
- 🏥 Admin Panel to Manage All Hospital Operations

---

## 🛠️ Tech Stack

| Technology      | Description                    |
|----------------|--------------------------------|
| Java           | Core application logic         |
| JSP & Servlets | Server-side rendering & logic  |
| MySQL          | Relational database             |
| JDBC           | Database connectivity           |
| HTML/CSS       | Frontend UI                     |
| Apache Tomcat  | Web server                      |

---

## 📂 Project Structure

```
Hospital-Portal/
├── src/main/
│   └── java/           # Java classes and servlets
├── WebContent/
│   ├── jsp/            # JSP files (UI)
│   ├── css/            # Stylesheets
│   └── WEB-INF/        # web.xml and config files
├── target/             # Compiled files (build)
├── pom.xml             # Maven project descriptor
```

---

## ⚙️ Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/Vrunda2/Hospital-Portal.git
cd Hospital-Portal
```

### 2. Import into VSCode

- Import as a **Maven Project** (if using `pom.xml`)
- Set up **Apache Tomcat Server** (v9+ recommended)

### 3. Set Up MySQL Database

1. Create a new MySQL database (e.g., `hospital_portal`)
2. Import the provided `.sql` script (if available)
3. Configure DB credentials in the Java JDBC code:
   ```java
   String url = "jdbc:mysql://localhost:3306/hospital_portal";
   String user = "root";
   String password = "yourpassword";
   ```

### 4. Run the Project

- Deploy the project on Tomcat Server
- Open in browser: `http://localhost:8080/Hospital-Portal`




