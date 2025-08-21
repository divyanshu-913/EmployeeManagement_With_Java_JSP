package com.basic.mvc.dao;

import java.sql.SQLException;


import java.util.List;

import com.basic.mvc.model.Employee;

public interface EmployeeDao 
{
		
	int save(Employee e) throws SQLException;
    
    List<Employee> getAllEmployees() throws SQLException;
    
    int delete(int Empid) throws SQLException;
    
    Employee getEmployeeById(int Empid) throws SQLException;
    
    int update(Employee e) throws SQLException;


}

	
