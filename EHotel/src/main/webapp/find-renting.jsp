<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.Hotel.entities.Renting" %>
<%@ page import="com.Hotel.service.RentingService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Date"%>

<%
    RentingService rService = new RentingService();
    Renting rent = null;
    if(request.getMethod().equalsIgnoreCase("post")){
        if(request.getParameter("rentingID")==null){
        System.out.println("Could not find renting");
        request.getRequestDispatcher("employee-renting-search.jsp").forward(request, response);
        }
        else{
          int rentingID = Integer.parseInt(request.getParameter("rentingID"));
          rent = rService.getRenting(rentingID);
          request.setAttribute("renting",rent);
          request.getRequestDispatcher("employee-renting-search.jsp").forward(request, response);
        }

    }

%>