<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Employee</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="container centered-content">
    <h2>Add New Employee</h2>
    <div class="form-container">
        <form method="post" action="saveEmployee.jsp">
            <input class="form-input" type="text" name="Empid" placeholder="Enter ID" required><br>
            <input class="form-input" type="text" name="EmpName" placeholder="Enter Name" required><br>
            <input class="form-input" type="text" name="salary" placeholder="Enter Salary" required><br>
            <input class="form-submit" type="submit" value="Save Data">
        </form>
    </div>
    <a class="nav-link" href="fetchData.jsp">View All Employees</a>
</div>
</body>
</html>