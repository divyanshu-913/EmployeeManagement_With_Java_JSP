<%@page import="com.basic.mvc.dao.EmployeeDao"%>
<%@page import="com.basic.mvc.dao.EmployeeDaoImpl"%>
<%
    int empId = Integer.parseInt(request.getParameter("empId"));
    EmployeeDao dao = new EmployeeDaoImpl();
    dao.delete(empId);
    response.sendRedirect("fetchData.jsp");
%>