<%@page import="com.basic.mvc.dao.EmployeeDaoImpl"%>
<%@page import="com.basic.mvc.model.Employee"%>
<%@page import="com.basic.mvc.dao.EmployeeDao"%>
<%
    int empId = Integer.parseInt(request.getParameter("empId"));
    EmployeeDao dao = new EmployeeDaoImpl();
    Employee emp = dao.getEmployeeById(empId);
%>

<form action="updateProcess.jsp" method="post">
	<input type="hidden" name="empId" value="<%= emp.getEmpId() %>">
    

     Name: <input type="text" name="EmpName" value="<%= emp.getEmpName() %>"><br><br> 
     
     Salary: <input type="text" name="salary" value="<%= emp.getSalary() %>"><br><br>
     
    <input type="submit" value="Update">
</form>
