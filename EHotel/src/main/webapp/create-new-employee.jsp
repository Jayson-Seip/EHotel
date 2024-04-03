<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.Hotel.service.EmployeeService"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Date"%>


<%
if ("employeeForm".equals(request.getParameter("employForm"))){
    EmployeeService es = new EmployeeService();
    String name = request.getParameter("EmployeeName");
    String address = request.getParameter("address");
    int sin  = Integer.parseInt(request.getParameter("ID"));
    int hotelID = Integer.parseInt(request.getParameter("hotelID"));
    String position = request.getParameter("Position");
    int salary = Integer.parseInt(request.getParameter("Salary"));
    es.createEmployee(sin,name,address,salary,hotelID,position);
    String message = "Employee Created";
    session.setAttribute("message", message);
    RequestDispatcher dispatcher = request.getRequestDispatcher("employee-view.jsp");
    dispatcher.forward(request, response);

}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EHotel</title>
    <link rel="stylesheet" href="EHotel\src\main\webapp\assets\bootstrap\css\bootstrap.min.css">
</head>

<h1> Create New Employee</h1>
<h3> Enter in Employee Information</h3>
<form id="employeeForm" action="create-new-employee.jsp" method="post">
<input type ="hidden" name="employForm" value="employeeForm">
        <label for="EmployeeName"> Full Name:</label>
        <input type="text" id="EmployeeName" name="EmployeeName"><br>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address"><br>

        <label for="ID">SIN:</label>
        <input type="number" id="ID" name="ID"><br>

        <label for "Salary"> Salary:</label>
        <input type="number" id="Salary" name="Salary"><br>

        <label for="hotelID">HotelID:</label>
        <input type="number" id="hotelID" name="hotelID"><br>

        <label for="Position">Position:</label>
        <input type="text" id="Position" name="Position"><br>

        <button class ="submit-button" type ="submit">Create Customer</button>
</form>