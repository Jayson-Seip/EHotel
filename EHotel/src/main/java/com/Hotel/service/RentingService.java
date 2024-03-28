package com.Hotel.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.Hotel.db.ConnectionDB;
import com.Hotel.entities.Booking;

import com.Hotel.entities.Renting;

public class RentingService {
    /**
     * Creates a renting if the person walks into the hotel (Done by Employee)
     * 
     * @return Confirmation message that renting was sucessful created
     */
    public String createRenting(Renting renting) throws SQLException {
        String message = "";
        Connection con = null;
        ConnectionDB db = new ConnectionDB();

        String query = "INSERT INTO renting (rentingID, roomID, customerID, checkoutDate, checkinDate) VALUES(?,?,?,?,?)";

        try {
            con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(query);

            statement.setInt(1, renting.getRentingID());
            statement.setInt(2, renting.getRoomID());
            statement.setInt(3, renting.getCustomerID());
            statement.setDate(4, renting.getCheckoutDate());
            statement.setDate(5, renting.getCheckinDate());

            statement.close();
            db.close();
        } catch (Exception e) {
            message = "Error creating renting";
        } finally {
            if (con != null) {
                con.close();
            }
            if (message.equals("")) {
                message = "renting successfully created";
            }
        }

        return message;
    }

    /**
     * Converts a booking to a renting upon customer checkin
     * 
     * @return confirmation message that check-in was sucessful
     */
    public String bookingToRenting(Booking booking) throws SQLException {
        String message = "";
        Connection con = null;
        ConnectionDB db = new ConnectionDB();

        String query1 = "insert INTO renting (roomID,customerID,checkout,checkin) Values(?,?,?,?)";
        String query2 = "insert INTO archives()";

        try {
            // Turns renting into a booking
            con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(query1);
            statement.setInt(1, booking.getRoomID());
            statement.setInt(2, booking.getCustomerID());
            statement.setDate(3, booking.getCheckoutDate());
            statement.setDate(4, booking.getCheckinDate());
            statement.executeUpdate();
            statement.close();
            //

        } catch (Exception e) {
            message = "Error moving booking to renting";
        } finally {
            if (con != null)
                con.close();
            db.close();
            if (message.equals(""))
                message = "Renting sucessfully updated";
        }

        return message;
    }

}
