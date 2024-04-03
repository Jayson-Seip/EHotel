<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.Hotel.entities.Room" %>
<%@ page import="com.Hotel.service.RoomService"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Date"%>
<%@ page import="java.sql.SQLException"%>

<%
    boolean error = false;
    if ("amenityInsert".equals(request.getParameter("amenityForm"))){
        int roomID = Integer.parseInt(request.getParameter("roomID"));
        String amenity = request.getParameter("amenity");
        RoomService rs = new RoomService();
        try{
            rs.insertAmenity(roomID,amenity);
            response.sendRedirect("employee-view.jsp");
        }catch(SQLException e){
            error = true;
            System.out.println("Room does not exists");
        }

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
<%if(error){%>
<h1> Room Does not exists</h1>
<%}%>
<form id="amenityInsert" action="insert-room-amenity.jsp" method="post">
    <input type ="hidden" name="amenityForm" value="amenityInsert">

    <label for="roomID"> room ID:</label>
    <input type="number" id="roomID" name="roomID"><br>

    <label for="amenity">Amenity:</label>
    <input type="text" id="amenity" name="amenity"><br>
    <button class ="submit-button" type ="submit">Create Room</button>

 </form>

 </body>

 </html>