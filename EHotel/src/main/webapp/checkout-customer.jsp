<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.Hotel.entities.Renting" %>
<%@ page import="com.Hotel.service.RentingService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Date"%>
<%
        Renting renting = null;
        int rentingID = Integer.parseInt(request.getParameter("rentingID"));
        int roomID = Integer.parseInt(request.getParameter("roomID"));
        int customerID = Integer.parseInt(request.getParameter("customerID"));
        Date checkin = Date.valueOf(request.getParameter("checkinDate"));
        Date checkout = Date.valueOf(request.getParameter("checkoutDate"));
        String paymentType = request.getParameter("paymentType");
        renting = new Renting(rentingID, roomID, customerID, checkin, checkout,paymentType); // Change Booking to Renting
if ("convertRenting".equals(request.getParameter("convertRent"))){
    RentingService rentService = new RentingService();
    rentService.customerCheckout(renting);
    System.out.println("Check-out successful");
    request.getRequestDispatcher("employee-view.jsp").forward(request, response);
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EHotel</title>
    <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" href="assets/css/styles.css">
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
</head>
<h1> Checkout</h1>
<form id="convertRenting" name="convertRenting" action="checkout-customer.jsp" method="post">
    <input type="hidden" name="convertRent" value="convertRenting">
    <input type="hidden" name="rentingID" value="<%=renting.getRentingID()%>">
    <input type="hidden" name="roomID" value="<%=renting.getRoomID()%>">
    <input type="hidden" name="customerID" value="<%=renting.getCustomerID()%>">
    <input type="hidden" name="checkinDate" value="<%=renting.getCheckinDate()%>">
    <input type="hidden" name="checkoutDate" value="<%=renting.getCheckoutDate()%>">
    <input type="hidden" name="paymentType" value="<%=renting.getPaymentType()%>">

    <button class ="submit-button" type ="submit">Checkout</button>
</form>