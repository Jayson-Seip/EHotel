package com.Hotel.service;

import java.sql.*;

import com.Hotel.db.ConnectionDB;
import com.Hotel.entities.Booking;

// Contains all the services for booking a room
public class BookingService {

    /**
     * Creates a booking for the customer
     * 
     * @param booking
     * @return message confirming if booking was made
     * @throws SQLException
     */
    public String createBooking(Booking booking) throws SQLException {
        String message = "";
        Connection con = null;
        ConnectionDB db = new ConnectionDB();

        String query = "INSERT INTO booking (roomID, customerID,checkout,checkin, payment, paymentType) VALUES(?,?,?,?,?,?);";

        try {
            con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(query);

            // the values for the database
            statement.setInt(1, booking.getRoomID());
            statement.setInt(2, booking.getCustomerID());
            statement.setDate(3, booking.getCheckoutDate());
            statement.setDate(4, booking.getCheckinDate());
            statement.setBoolean(5, booking.getPayment());
            statement.setString(6,booking.getPaymentType());

            statement.executeUpdate();
            statement.close();
            db.close();

        } catch (Exception e) {
            message = "Error Creating booking";
            e.printStackTrace();
        } finally {
            if (con != null)
                con.close();
            if (message.equals(""))
                message = "Booking sucessful created";
        }

        return message;

    }

    public String deleteBooking(int bookingID) throws SQLException {
        String message = "";
        Connection con = null;
        ConnectionDB db = new ConnectionDB();
        String query = "DELETE FROM BOOKING WHERE bookingid=?";

        try {
            con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1,bookingID);
            statement.executeUpdate();
            statement.close();

        } catch (Exception e) {
            message = "Error Deleting Booking";
        } finally {
            if (con != null) {
                con.close();
            }
            if (message.equals(""))
                message = "Booking Sucessfully deleted";
        }
        return message;
    }

    public Booking getBooking(int bookingID){
        Connection con = null;
        Booking booking = null;
        ConnectionDB db = new ConnectionDB();
        String query = "SELECT * FROM booking WHERE bookingID=?";
        try{
            con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1,bookingID);

            ResultSet resultSet = statement.executeQuery();

            while(resultSet.next()){
                booking = new Booking(resultSet.getInt("bookingID"),
                        resultSet.getInt("roomID"),
                        resultSet.getInt("customerID"),
                        resultSet.getDate("checkout"),
                        resultSet.getDate("checkin"),
                        resultSet.getBoolean("payment"),
                        resultSet.getString("paymentType"));
            }
            statement.close();
            db.close();
            con.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return booking;
    }


}
