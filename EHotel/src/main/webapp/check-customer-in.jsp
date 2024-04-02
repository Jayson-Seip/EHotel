<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.Hotel.entities.Booking" %>
<%@ page import="com.Hotel.service.RentingService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Date"%>
<%
 Booking booking = null;
 int bookingID = Integer.parseInt(request.getParameter("booking"));
 int roomID = Integer.parseInt(request.getParameter("roomID"));
 int customerID = Integer.parseInt(request.getParameter("customerID"));
 Date checkin = Date.valueOf(request.getParameter("checkin"));
 Date checkout = Date.valueOf(request.getParameter("checkout"));
 boolean payment = Boolean.parseBoolean(request.getParameter("payment"));
 String paymentType = request.getParameter("paymentType");
 booking = new Booking(bookingID, roomID, customerID,checkin,checkout,payment,paymentType);
if ("convertBooking".equals(request.getParameter("convertBook"))){

    RentingService rentService = new RentingService();
rentService.bookingToRenting(booking, request.getParameter("paymenttype"));
System.out.println("Check-in successful");
request.getRequestDispatcher("employee-search.jsp").forward(request, response);
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

<h1> Check user In</h1>
<form id="convertBooking name="convertBooking" action="check-customer-in.jsp" method="post">
<input type ="hidden" name="convertBook" value="convertBooking">
<input type ="hidden" name="booking" value="<%=booking.getBookingID()%>">
<input type ="hidden" name="roomID" value ="<%=booking.getRoomID()%>">
<input type ="hidden" name="customerID" value ="<%=booking.getCustomerID()%>">
<input type ="hidden" name="checkin" value="<%=booking.getCheckinDate()%>">
<input type ="hidden" name="checkout" value ="<%=booking.getCheckoutDate()%>">
<input type ="hidden" name="payment" value ="<%=booking.getPayment()%>">
<input type ="hidden" name="paymentType" value ="<%=booking.getPaymentType()%>">
<label for="paymentType">Payment Type:</label>
        <select id="paymenttype" name="paymenttype">
            <option value="CreditCard">Credit Card</option>
            <option value="DebitCard">Debit Card</option>
            <option value="Cash">Cash</option>
        </select><br>

   <button class ="submit-button" type ="submit"><Create Booking></button>
</form>
