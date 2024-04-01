<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.Hotel.entities.Booking" %>
<%@ page import="com.Hotel.service.BookingService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Date"%>

<%
System.out.println(request.getParameter("roomID"));
if ("createBooking".equals(request.getParameter("bookForm"))){
    BookingService bservice = new BookingService();
    Date startDate = null;
    Date endDate = null;
    Integer custID = null;
    Integer roomID = null;

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
    System.out.println(startDate);
    System.out.println(roomID);
        System.out.println("Error");
        response.sendRedirect("customer.jsp");
    }
    else{
    Booking booking = new Booking(0,roomID,custID,endDate,startDate,false);
        bservice.createBooking(booking);
        response.sendRedirect("customer.jsp");
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
<h1>RoomID: <%= request.getParameter("roomID") %></h1>
<form id="createBooking" name="createBooking" action="book-room.jsp" method="post">
<input type ="hidden" name="bookForm" value="createBooking">
    <label for="roomID">RoomID: </label>
    <input type="number" id="roomID" name="roomID"><br>

    <label for="customerID"> customerID:</label>
    <input type="number" id="customerID" name="customerID"><br>

    <label for="startDate">Start Date:</label>
    <input type="date" id="startDate" name="startDate"><br>

    <label for="endDate">End Date:</label>
    <input type="date" id="endDate" name="endDate"><br>

    <button class ="submit-button" type ="submit"><Create Booking></button>
</form>


</body>
</html>