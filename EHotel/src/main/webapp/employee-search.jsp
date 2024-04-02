<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.Hotel.entities.Booking" %>
<%@ page import="com.Hotel.service.BookingService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Date"%>

<%
Booking booking = null;
if(request.getAttribute("booking")!=null){
    booking = (Booking) request.getAttribute("booking");
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

<body>
<div class="container">
    <div class="form-container">
        <form id="searchBookForm" action="find-booking.jsp" method="post">
            <label for="BookingID"> BookingID:</label>
            <input type="number" id="BookingID" name="BookingID"><br>
          </form>
    </div>
    <div class="table-container">
                <% if (booking == null) { %>
                <h1 style="margin-top: 5rem;">No Rooms found!</h1>
                <% } else { %>
                <div class="table-responsive">
                    <table class="table" style="width: 100%; height: 500px;">
                        <thead>
                            <tr>
                                <th>BookingID</th>
                                <th>CustomerID</th>
                                <th> convert to renting</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><%= booking.getBookingID() %></td>
                                <td><%= booking.getCustomerID() %></td>
                                <td>
                                <form id="bookingForm" action="fine-booking.jsp" method="post">
                                    <input type ="hidden" name="bookingID" value="<%= booking.getBookingID()%>">
                                    <button class ="submit-button" type ="submit"><Book Room></button>
                                </form>
                            </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <% } %>


</div>


</body>
</html>