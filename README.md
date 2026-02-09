# Expense Tracker Web Application

A full-stack Expense Tracker web application built using **Java, JSP, Servlets, and MySQL**.  
This project helps users track income and expenses with authentication, reports, and password recovery.

---

## 🚀 Features
- User Registration & Login
- Session-based Authentication
- Forgot Password & Reset Password
- Add Income
- Add Expense
- Monthly Expense Report
- Logout functionality
- Secure database access using JDBC

---

## 🛠️ Technologies Used
- Java (JDK 8+)
- JSP & Servlets
- JDBC
- MySQL
- Apache Tomcat
- HTML5, CSS3

---

## 🗂️ Database Design & SQL Queries

### 1️⃣ Create Database
```sql
CREATE DATABASE expense_tracker;
USE expense_tracker;
```

---

### 2️⃣ Users Table
```sql
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL
);
```

---

### 3️⃣ Income Table
```sql
CREATE TABLE income (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    amount DOUBLE,
    category VARCHAR(100),
    income_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```

---

### 4️⃣ Expense Table
```sql
CREATE TABLE expense (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    amount DOUBLE,
    category VARCHAR(100),
    expense_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```

---

### 5️⃣ Insert Queries (Sample)
```sql
INSERT INTO users (name, email, password)
VALUES ('Jay Patel', 'jay@gmail.com', '12345');

INSERT INTO income (user_id, amount, category, income_date)
VALUES (1, 25000, 'Salary', '2026-01-01');

INSERT INTO expense (user_id, amount, category, expense_date)
VALUES (1, 2000, 'Food', '2026-01-05');
```

---

### 6️⃣ Select Queries
```sql
-- Login
SELECT * FROM users WHERE email=? AND password=?;

-- Monthly Income
SELECT SUM(amount) FROM income 
WHERE user_id=? AND MONTH(income_date)=? AND YEAR(income_date)=?;

-- Monthly Expense
SELECT SUM(amount) FROM expense 
WHERE user_id=? AND MONTH(expense_date)=? AND YEAR(expense_date)=?;
```

---

### 7️⃣ Update Queries
```sql
-- Reset Password
UPDATE users SET password=? WHERE email=?;
```

---

## ⚙️ Setup Instructions

### Configure Database Connection
Update `DBConnection.java`:

```java
String url = "jdbc:mysql://localhost:3306/expense_tracker";
String username = "root";
String password = "root";
```

---

## ▶️ Run Project
- Import project into **NetBeans / Eclipse**
- Configure **Apache Tomcat**
- Run project
- Open browser:
```
http://localhost:8080/ExpenseTracker
```

---

## 👤 Author
**Jay Patel**

---

## 📜 License
This project is developed for learning and academic purposes.

© 2026 Expense Tracker
