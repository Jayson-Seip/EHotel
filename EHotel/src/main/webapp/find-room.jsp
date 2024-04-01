<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.Hotel.entities.Room" %>
<%@ page import="com.Hotel.service.RoomService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Date"%>

<%
    // get all students from database
    RoomService roomService = new RoomService();
            List<Room> rooms = new ArrayList<>();
    if (request.getMethod().equalsIgnoreCase("post")){
        String hotelChain = request.getParameter("hotelChain");
           String city = request.getParameter("city");
           Double lowerPrice = null;
           Double upperPrice = null;
           Date startDate = null;
           Date endDate = null;
           String capacity = request.getParameter("capacity");
           String area = request.getParameter("area");
           Integer category = null;
           Integer numRooms = null;

        try {
        if(hotelChain == null || hotelChain.trim().isEmpty()){
                hotelChain = null;
                }
                if(city==null || city.trim().isEmpty()){
                city=null;
                }
            if (request.getParameter("lowerPrice") != null && !request.getParameter("lowerPrice").isEmpty()) {
                lowerPrice = Double.parseDouble(request.getParameter("lowerPrice"));
            }
            if (request.getParameter("upperPrice") != null && !request.getParameter("upperPrice").isEmpty()) {
                upperPrice = Double.parseDouble(request.getParameter("upperPrice"));
            }
            if (request.getParameter("startDate") != null && !request.getParameter("startDate").isEmpty()) {
                startDate = Date.valueOf(request.getParameter("startDate"));
            }
            if (request.getParameter("endDate") != null && !request.getParameter("endDate").isEmpty()) {
                endDate = Date.valueOf(request.getParameter("endDate"));
            }
            if (request.getParameter("category") != null && !request.getParameter("category").isEmpty()) {
                category = Integer.parseInt(request.getParameter("category"));
            }
            if (request.getParameter("numRooms") != null && !request.getParameter("numRooms").isEmpty()) {
                numRooms = Integer.parseInt(request.getParameter("numRooms"));
            }


            rooms = roomService.roomSearch(city,lowerPrice,upperPrice,startDate,endDate,capacity,area,hotelChain,category,numRooms);
            request.setAttribute("rooms", rooms);
            request.getRequestDispatcher("customer.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>