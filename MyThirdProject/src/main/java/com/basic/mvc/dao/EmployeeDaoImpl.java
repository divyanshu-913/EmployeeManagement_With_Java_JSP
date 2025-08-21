package com.basic.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.basic.mvc.model.Employee;

public class EmployeeDaoImpl implements EmployeeDao {
    private Connection con;

    public EmployeeDaoImpl() throws ClassNotFoundException, SQLException {
        con = MyConnection.getConnection();  // must return valid connection
        if (con == null) {
            throw new SQLException("Connection is NULL in EmployeeDaoImpl constructor");
        }
    }

    @Override
    public int save(Employee e) throws SQLException {
        String sql = "INSERT INTO employee VALUES (?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, e.getEmpId());
        ps.setString(2, e.getEmpName());
        ps.setDouble(3, e.getSalary());
        return ps.executeUpdate();
    }

    @Override
    public List<Employee> getAllEmployees() throws SQLException {
        String sql = "SELECT * FROM Employee";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        List<Employee> list = new ArrayList<>();
        
        while (rs.next()) {
            list.add(new Employee(
                rs.getInt("Empid"),
                rs.getString("EmpName"),
                rs.getDouble("Salary"))); 
        }
        return list;
    }

    @Override
    public int delete(int Empid) throws SQLException {
        String sql = "DELETE FROM employee WHERE Empid=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, Empid);
        return ps.executeUpdate();
    }

    @Override
    public Employee getEmployeeById(int Empid) throws SQLException {
        String sql = "SELECT * FROM Employee WHERE Empid=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, Empid);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return new Employee(
                rs.getInt("Empid"),
                rs.getString("EmpName"),
                rs.getDouble("salary"));  
        }
        return null;
    }

    @Override
    public int update(Employee e) throws SQLException {
        String sql = "UPDATE employee SET EmpName = ? ,salary=? WHERE Empid=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, e.getEmpName());
        ps.setDouble(2, e.getSalary());
        ps.setInt(3, e.getEmpId());
        return ps.executeUpdate();
    }


	
}
