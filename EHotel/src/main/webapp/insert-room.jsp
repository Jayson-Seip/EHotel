<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.Hotel.entities.Room" %>
<%@ page import="com.Hotel.service.RoomService"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Date"%>
<%

if ("roomCreateForm".equals(request.getParameter("roomForm"))){
    int roomID = Integer.parseInt(request.getParameter("roomID"));
    int hotelID = Integer.parseInt(request.getParameter("hotelID"));
    double price = Double.parseDouble(request.getParameter("price"));
    boolean seaview = Boolean.parseBoolean(request.getParameter("seaview"));
    boolean mountainview = Boolean.parseBoolean(request.getParameter("mountainview"));
    String capacity = request.getParameter("capacity");
    boolean extendable = Boolean.parseBoolean(request.getParameter("extendable"));
    RoomService rs = new RoomService();
    Room room = new Room(roomID,hotelID,price,seaview,mountainview,capacity,extendable);
    rs.createRoom(room);
    response.sendRedirect("employee-view.jsp");
}

%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title> Home Page </title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
</head>

<body>
    <form id="roomCreateForm" action="insert-room.jsp" method="post">
    <input type ="hidden" name="roomForm" value="roomCreateForm">
        <label for="roomID"> room ID:</label>
        <input type="number" id="roomID" name="roomID"><br>

        <label for="hotelID">Hotel ID:</label>
        <input type="number" id="hotelID" name="hotelID"><br>

        <label for="price"> price:</label>
        <input type="number" id="price" name="price"><br>

         <label for="seaview"> seaview:</label>
            <select id="seaview" name="seaview">
                <option value="true">Yes</option>
                <option value="false">No</option>
                </select><br>

        <label for="mountainview"> mountainview:</label>
        <select id="mountainview" name="mountainview">
            <option value="true">Yes</option>
            <option value="false">No</option>
            </select><br>

        <label for="capacity">capacity:</label>
            <select id="capacity" name="capacity">
                <option value="Single">Single</option>
                <option value="Double">Double</option>
                <option value="Suite">Suite</option>
            </select><br>

        <label for="extendable">Extendable:</label>
            <select id="extendable" name="extendable">
            <option value="true">Yes</option>
            <option value="false">No</option>
        </select><br>

        <button class ="submit-button" type ="submit">Create Room</button>
        </form>
<body>
</html>