<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.Hotel.entities.Renting" %>
<%@ page import="com.Hotel.service.RentingService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Date"%>

<%
Renting renting = null;
if(request.getAttribute("renting")!=null){
    renting = (Renting) request.getAttribute("renting");
}else{
    renting = null;
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
<<div class="container">
     <div class="form-container">
         <form id="searchRentForm" action="find-renting.jsp" method="post">
             <label for="rentingID"> Renting ID:</label>
             <input type="number" id="rentingID" name="rentingID"><br>
           </form>
     </div>
   <div class="table-container">
       <% if (renting == null) { %>
       <h1 style="margin-top: 5rem;">No Rentings found!</h1>
       <% } else { %>
       <div class="table-responsive">
           <table class="table" style="width: 100%; height: 500px;">
               <thead>
                   <tr>
                       <th>Renting ID</th>
                       <th>Customer ID</th>
                       <th>Check-in Date</th>
                       <th>Check-out Date</th>
                       <th> Checkout</th>
                   </tr>
               </thead>
               <tbody>
                   <tr>
                       <td><%= renting.getRentingID() %></td>
                       <td><%= renting.getCustomerID() %></td>
                       <td><%= renting.getCheckinDate() %></td>
                       <td><%= renting.getCheckoutDate() %></td>
                       <td>
                       <form id="rentingForm" action="checkout-customer.jsp" method="post">
                           <input type ="hidden" name="rentingID" value="<%=renting.getRentingID()%>">
                           <input type ="hidden" name="roomID" value ="<%=renting.getRoomID()%>">
                           <input type ="hidden" name="customerID" value ="<%=renting.getCustomerID()%>">
                           <input type ="hidden" name="checkinDate" value="<%=renting.getCheckinDate()%>">
                           <input type ="hidden" name="checkoutDate" value ="<%=renting.getCheckoutDate()%>">
                           <input type ="hidden" name="paymentType" value ="<%=renting.getPaymentType()%>">
                          <button class ="submit-button" type ="submit">Checkout</button>
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