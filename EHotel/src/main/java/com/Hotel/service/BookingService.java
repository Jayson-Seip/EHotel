package com.Hotel.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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

        String query = "INSERT INTO booking (roomID, customerID,checkout,checkin, payment) VALUES(?,?,?,?,?)";

        try {
            con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(query);

            // the values for the database
            statement.setInt(1, booking.getRoomID());
            statement.setInt(2, booking.getCustomerID());
            statement.setDate(3, booking.getCheckoutDate());
            statement.setDate(4, booking.getCheckinDate());
            statement.setBoolean(5, booking.getPayment());

            statement.executeUpdate();
            statement.close();
            db.close();

        } catch (Exception e) {
            message = "Error Creating booking";
        } finally {
            if (con != null)
                con.close();
            if (message.equals(""))
                message = "Booking sucessful created";
        }

        return message;

    }

    /**
     * Updates the booking of a hotel room
     * 
     * @param booking
     * @return a message displaying if the update was successful
     */
    public String updateBooking(Booking booking) throws SQLException {
        String message = "";
        Connection con = null;
        ConnectionDB db = new ConnectionDB();

        String query = "UPDATE booking SET roomid=?,customerid=?,checkoutdate=?,checkingdate=?,payment=? WHERE id =?";

        try {
            con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(query);

            // sets the values for the query for the database
            statement.setInt(1, booking.getRoomID());
            statement.setInt(2, booking.getCustomerID());
            statement.setDate(3, booking.getCheckoutDate());
            statement.setDate(4, booking.getCheckinDate());
            statement.setBoolean(5, booking.getPayment());
            statement.setInt(6, booking.getBookingID());

            statement.executeUpdate(); // Runs the query
            statement.close();
            db.close();

        } catch (Exception e) {
            message = "Error updating booking";
        } finally {
            if (con != null)
                con.close();
            if (message.equals(""))
                message = "Booking sucessful updated";
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

    // Using an aggergated query to retrieve the total cost
    // Used by employee
    public String getTotalCost(int bookingID) {
        String message = "";
        Connection con = null;
        ConnectionDB db = new ConnectionDB();

        String query = "SELECT * FROM booking where bookingid=?";
        try {
            con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(query);

            statement.setInt(1, bookingID);

        } catch (Exception e) {

        }
        return message;
    }

}
