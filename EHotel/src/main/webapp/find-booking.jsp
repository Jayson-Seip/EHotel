<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.Hotel.entities.Booking" %>
<%@ page import="com.Hotel.service.BookingService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Date"%>

<%
    BookingService bookingService = new BookingService();
    Booking booking = null;
    if(request.getMethod().equalsIgnoreCase("post")){
        if(request.getParameter("BookingID")==null){

        System.out.println("Could not find booking");
        request.getRequestDispatcher("employee-booking-search.jsp").forward(request, response);
        }
        else{

          int bookingID = Integer.parseInt(request.getParameter("BookingID"));
          booking = bookingService.getBooking(bookingID);
          request.setAttribute("booking",booking);

          if(request.getParameter("deleteBook").equals("deleteBooking")){
              System.out.println("Deleting Booking");
              request.getRequestDispatcher("delete-booking.jsp").forward(request, response);

          }
          request.getRequestDispatcher("employee-booking-search.jsp").forward(request, response);

        }

    }

%>