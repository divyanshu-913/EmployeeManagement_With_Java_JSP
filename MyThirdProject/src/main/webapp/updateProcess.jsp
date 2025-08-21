<%@ page import="java.sql.*, com.basic.mvc.dao.*, com.basic.mvc.model.*" %>
<%
    String empIdParam = request.getParameter("empId");
    String empName = request.getParameter("EmpName");
    String salaryParam = request.getParameter("salary");  // ✅ fixed

    if(empIdParam == null || empIdParam.trim().isEmpty() ||
       empName == null || empName.trim().isEmpty() ||
       salaryParam == null || salaryParam.trim().isEmpty()) {
        out.println("Error: All fields are required!");
        return;
    }

    int empId = Integer.parseInt(empIdParam);
    double empSalary = Double.parseDouble(salaryParam);

    // Create Employee object
    Employee emp = new Employee();
    emp.setEmpId(empId);
    emp.setEmpName(empName);
    emp.setSalary(empSalary);

    // Call DAO update method
     EmployeeDao dao = new EmployeeDaoImpl();
    int status = 0;
    try {
        status = dao.update(emp);
        if(status > 0)
        {
            response.sendRedirect("fetchData.jsp");
        }
    } catch(Exception ex) {
        out.println("Error while updating: " + ex.getMessage());
        ex.printStackTrace();
    }
    
    
%>
