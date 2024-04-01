<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.Hotel.entities.Renting" %>
<%@ page import="com.Hotel.service.RentingService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Date"%>

<%
if ("createRenting".equals(request.getParameter("rentForm"))){
    RentingService rservice = new RentingService();
    Date startDate = null;
    Date endDate = null;
    Integer custID = null;
    Integer roomID = null;
    String paymentType = null;

    if (request.getParameter("startDate") != null && !request.getParameter("startDate").isEmpty()) {
        startDate = Date.valueOf(request.getParameter("startDate"));
    }
    if (request.getParameter("endDate") != null && !request.getParameter("endDate").isEmpty()) {
        endDate = Date.valueOf(request.getParameter("endDate"));
    }
    if (request.getParameter("customerID") != null && !request.getParameter("customerID").isEmpty()) {
        custID = Integer.parseInt(request.getParameter("customerID"));
    }
    if (request.getParameter("roomID") != null && !request.getParameter("roomID").isEmpty()) {
        roomID = Integer.parseInt(request.getParameter("roomID"));
    }
    if(startDate == null || endDate==null||custID==null||roomID==null){
        System.out.println("Booking not Created");
        response.sendRedirect("create-renting.jsp");
    }
    else{
    paymentType = request.getParameter("paymentType");
    Renting renting = new Renting(0,roomID,custID,endDate,startDate,paymentType);
        rservice.createRenting(renting);
        response.sendRedirect("employee-view.jsp");
    }
}
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
</head>

<body>
<form id="createRenting" name="createRenting" action="create-renting.jsp" method="post">
<input type ="hidden" name="rentForm" value="createRenting">
    <label for="roomID">RoomID: </label>
    <input type="number" id="roomID" name="roomID"><br>

    <label for="customerID"> customerID:</label>
    <input type="number" id="customerID" name="customerID"><br>

    <label for="startDate">Start Date:</label>
    <input type="date" id="startDate" name="startDate"><br>

    <label for="endDate">End Date:</label>
    <input type="date" id="endDate" name="endDate"><br>

        <label for="paymentType">Payment Type:</label>
        <select id="paymentType" name="paymentType">
            <option value="CreditCard">Credit Card</option>
            <option value="DebitCard">Debit Card</option>
            <option value="Cash">Cash</option>
        </select><br>

    <button class ="submit-button" type ="submit"><Create Booking></button>
</form>


</body>
</html>