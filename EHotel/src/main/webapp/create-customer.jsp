<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.Hotel.service.CustomerService"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Date"%>


<%
if ("customerForm".equals(request.getParameter("createForm"))){
    CustomerService cs = new CustomerService();
    String name = request.getParameter("customerName");
    String address = request.getParameter("address");
    int sin  = Integer.parseInt(request.getParameter("ID"));
    cs.createCustomer(name,address,sin);
    response.sendRedirect("index.jsp");
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


<form id="customerForm" action="create-customer.jsp" method="post">
<input type ="hidden" name="createForm" value="customerForm">
        <label for="customerName"> Full Name:</label>
        <input type="text" id="customerName" name="customerName"><br>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address"><br>

        <label for="ID">SIN:</label>
        <input type="number" id="ID" name="ID"><br>

        <button class ="submit-button" type ="submit">Create Customer</button>
</form>