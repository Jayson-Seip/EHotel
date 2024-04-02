<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.Hotel.entities.RoomsPerArea" %>
<%@ page import="com.Hotel.service.RoomService" %>
<%@ page import="com.Hotel.entities.HotelCapacity" %>
<%@ page import="com.Hotel.service.HotelService" %>
<%@ page import="java.util.ArrayList" %>
<%
    RoomService rs = new RoomService();
    List<RoomsPerArea> roomsList = rs.availableHotelRoomsPerArea();

    HotelService hs = new HotelService();
    List<HotelCapacity> capacityList = hs.getCapacityOfHotel();


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
<body>
    <!-- Your HTML content here -->

    <h1>EHotel Website</h1>
    <p>Are you an employee or customer<p>
   <div class="container">
    <div class="button-container">
        <a href="customer-view.jsp"><button>Customer</button></a>
        <a href="employee-view.jsp"><button>Employee</button></a>
        <a href="create-customer.jsp"<button>Create new Customer</button></a>
    </div>
     <div class="view-table-container">
          <h1> Available Rooms per area</h1>
                      <% if (roomsList.isEmpty()) { %>
                      <h1 style="margin-top: 5rem;">No Rooms found!</h1>
                      <% } else { %>
                      <div class="table-responsive">
                       <table class="table" style="width: 80%; height: 100px;">
                  <thead>
                      <tr>
                          <th>City</th>
                          <th>Area</th>
                          <th>Available Hotel Rooms</th>
                      </tr>
                  </thead>
                  <tbody>
                      <%

                          for (RoomsPerArea room : roomsList) {
                      %>
                          <tr>
                              <td><%= room.getCity() %></td>
                              <td><%= room.getArea() %></td>
                              <td><%= room.getAvailableHotelRooms() %>
                              </td>
                          </tr>
                      <% } %>

                 </tbody>
             </table>
             </div>
        <% } %>
      </div>
      <div>
    <div class="view-table-container">
    <h1> Hotel Capacity</h1>
                <% if (capacityList .isEmpty()) { %>
                <h1 style="margin-top: 5rem;">No Rooms found!</h1>
                <% } else { %>
                <div class="table-responsive">
                 <table class="table" style="width: 100%; height: 100px;">
            <thead>
                <tr>
                    <th>Hotel Name</th>
                    <th>Hotel Capacity</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (HotelCapacity hc : capacityList) {
                %>
                    <tr>
                        <td><%= hc.getHotelName() %></td>
                        <td><%= hc.getTotalCapacity()  %></td>
                        </td>
                    </tr>
                <% } %>

           </tbody>
       </table>
   </div>
   <% } %>
  </div>
  <div>

</div>



    <script src="EHotel\src\main\webapp\assets\bootstrap\js\bootstrap.min.js"></script>
</body>

</html>