<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ page import="java.util.List" %>
<%@ page import="com.Hotel.entities.Booking" %>
<%@ page import="com.Hotel.service.BookingService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Date"%>

<%
Booking booking = null;
if(request.getAttribute("booking")!=null){
    BookingService bs = new BookingService();
    booking = (Booking) request.getAttribute("booking");
    bs.deleteBooking(booking.getBookingID());
    System.out.println("Booking Deleted");
    request.getRequestDispatcher("customer-view.jsp").forward(request, response);

}else{
    booking = null;
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
<h1>Delete Booking:</h1>
<div class="form-container">
        <form id="searchBookForm" action="find-booking.jsp" method="post">
            <label for="BookingID"> BookingID:</label>
            <input type="number" id="BookingID" name="BookingID"><br>

            <input type ="hidden" name="deleteBook" value="deleteBooking">

            <button class ="submit-button" type ="submit"><Check-in></button>
          </form>
    </div>

 </html>