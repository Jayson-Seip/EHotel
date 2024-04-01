<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ page import="java.util.List" %>
<%@ page import="com.Hotel.entities.Hotel" %>
<%@ page import="com.Hotel.service.HotelService" %>
<%@ page import="java.util.ArrayList" %>
<%

    // get all students from database
    HotelService hotelService = new HotelService();
    List<Hotel> hotels = new ArrayList<>();
    try {
        hotels = hotelService.getAllHotel();
    } catch (Exception e) {
        e.printStackTrace();
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
    <form id="searchForm">
        <label for="hotelChain"> Hotel Chain:</label>
        <input type="text" id="hotelChain" name="hotelChain"><br>


        <label for="city">City:</label>
        <input type="text" id="city" name="city"><br>

        <label for="lowerPrice">Lower Price:</label>
        <input type="number" id="lowerPrice" name="lowerPrice" step="0.01" min="0" placeholder="0.00" required><br>

        <label for="upperPrice">Upper Price:</label>
        <input type="number" id="upperPrice" name="upperPrice" step="0.01" min="0" placeholder="0.00" required><br>

        <label for="startDate">Start Date:</label>
        <input type="date" id="startDate" name="startDate"><br>


        <label for="endDate">End Date:</label>
        <input type="date" id="endDate" name="endDate"><br>

        <p>Capacity:<br>
       <input type="radio" id="single" name="capacity" value="Single"> <label for="single">Single</label><br>
       <input type="radio" id="double" name="capacity" value="Double"> <label for="double">Double</label><br>
       <input type="radio" id="suite" name="capacity" value="Suite"> <label for="suite">Suite</label><br>

          <br>Area:<br>
          <label><input type="radio" name="area" value="Mountainside">Mountainside</label><br>
          <label><input type="radio" name="area" value="Midtown">Midtown</label><br>
          <label><input type="radio" name="area" value="Suburb">Suburb</label><br>
          <label><input type="radio" name="area" value="Beachfront">Beachfront</label><br>
          <label><input type="radio" name="area" value="Riverside">Riverside</label><br>
          <label><input type="radio" name="area" value="Downtown">Downtown</label><br>

          <label for="category">Category:</label>
          <select id="category" name="category">
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
          </select><br>

          <label for="numRooms">Number of Rooms:</label>
          <input type="number" id="numRooms" name="numRooms"><br>
          </form>
        </div>

        <div class="table-container">
            <% if (hotels.isEmpty()) { %>
            <h1 style="margin-top: 5rem;">No Hotels found!</h1>
            <% } else { %>
            <div class="table-responsive">
                <table class="table" style="width: 100%; height: 500px;">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Address</th>
                            <th>Area</th>
                            <th>Email</th>
                            <th>Phone Number</th>
                            <th>Category</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Hotel hotel : hotels) { %>
                        <tr>
                            <td><%= hotel.getHotelID() %></td>
                            <td><%= hotel.getName() %></td>
                            <td><%= hotel.getHotelAddress() %></td>
                            <td><%= hotel.getArea() %></td>
                            <td><%= hotel.getEmail() %></td>
                            <td><%= hotel.getPhoneNumber() %></td>
                            <td><%= hotel.getRating() %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            <% } %>

        </div>
</div>


</body>
</html>