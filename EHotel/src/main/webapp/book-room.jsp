<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.Hotel.entities.Booking" %>
<%@ page import="com.Hotel.service.BookingService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Date"%>

<%
if ("createBooking".equals(request.getParameter("bookForm"))){
    BookingService bservice = new BookingService();
    Date startDate = null;
    Date endDate = null;
    Integer custID = null;
    Integer roomID = null;
    boolean payment = false;
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
    if(request.getParameter("paymentOption").equals("Now")){
    System.out.println("Payment Option: " + request.getParameter("paymentOption"));
        payment = true;
        paymentType = request.getParameter("paymentType");
        System.out.println(paymentType);
    }

    if(startDate == null || endDate==null||custID==null||roomID==null){
        System.out.println("Booking not Created");
        response.sendRedirect("book-room.jsp");
    }
    else{
    Booking booking = new Booking(0,roomID,custID,endDate,startDate,payment,paymentType);
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
    <script>
            function togglePaymentType() {
                var paymentOption = document.getElementById("paymentOption");
                var paymentType = document.getElementById("paymentType");

                if (paymentOption.value === "Now") {
                    paymentType.disabled = false;
                } else {
                    paymentType.disabled = true;
                    paymentType.value = ""; // Clear the payment type value
                }
            }
        </script>

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

     <label for="paymentOption">Payment Option:</label>
        <select id="paymentOption" name="paymentOption" onchange="togglePaymentType()">
            <option value="Now">Pay Now</option>
            <option value="Later">Pay Later</option>
        </select><br>

        <label for="paymentType">Payment Type:</label>
        <select id="paymentType" name="paymentType" disabled>
            <option value="CreditCard">Credit Card</option>
            <option value="DebitCard">Debit Card</option>
        </select><br>

    <button class ="submit-button" type ="submit"><Create Booking></button>
</form>


</body>
</html>