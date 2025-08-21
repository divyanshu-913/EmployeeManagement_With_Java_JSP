saveEmployee.jsp
<%@page import="com.basic.mvc.dao.EmployeeDaoImpl"%>
<%@page import="com.basic.mvc.dao.EmployeeDao"%>
<%@page import="com.basic.mvc.model.Employee"%>
<%
    //int empId = Integer.parseInt(request.getParameter("EmpId"));
    //String empName = request.getParameter("EmpName");
    //double empSalary = Double.parseDouble(request.getParameter("empSalary"));
	
    String empIdStr = request.getParameter("Empid");
    String EmpName = request.getParameter("EmpName");
    String salaryStr = request.getParameter("salary");

    int Empid = 0;
    double salary = 0.0;

    if(empIdStr != null && !empIdStr.isEmpty()) {
        Empid = Integer.parseInt(empIdStr);
    } else {
        out.println("Employee ID is missing");
        return;
    }

    if(salaryStr != null && !salaryStr.isEmpty()) {
        salary = Double.parseDouble(salaryStr);
    } else {
        out.println("Salary is missing");
        return;
    }
    Employee e = new Employee(Empid, EmpName,salary);
    e.setEmpId(Empid);
    e.setEmpName(EmpName);
    e.setSalary(salary);
    
    EmployeeDao dao = new EmployeeDaoImpl();
    
    int status = dao.save(e);

    
    
    if(status > 0){
        response.sendRedirect("fetchData.jsp");
    } else {
        out.println("Error saving employee.");
    }
%>