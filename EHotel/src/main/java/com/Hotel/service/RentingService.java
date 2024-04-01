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
     * @param renting
     * @return Confirmation message that renting was sucessful created
     */
    public String createRenting(Renting renting) throws SQLException {
        String message = "";
        Connection con = null;
        ConnectionDB db = new ConnectionDB();

        String query = "INSERT INTO renting (rentingID, roomID, customerID, checkoutDate, checkinDate, paymentType) VALUES(?,?,?,?,?,?)";

        try {
            con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(query);

            statement.setInt(1, renting.getRentingID());
            statement.setInt(2, renting.getRoomID());
            statement.setInt(3, renting.getCustomerID());
            statement.setDate(4, renting.getCheckoutDate());
            statement.setDate(5, renting.getCheckinDate());
            statement.setString(6,renting.getPaymentType());

            statement.close();

        } catch (Exception e) {
            message = "Error creating renting";
        } finally {
            if (con != null) {
                con.close();
            }
            db.close();
            if (message.equals("")) {
                message = "renting successfully created";
            }
        }

        return message;
    }

    /**
     * Converts a booking to a renting upon customer checkin and moves booking
     * information to the archive
     * 
     * @param booking
     * @return confirmation message that check-in was sucessful
     */
    public String bookingToRenting(Booking booking, String updatedPayment) throws SQLException {
        String message = "";
        Connection con = null;
        ConnectionDB db = new ConnectionDB();

        String query1 = "INSERT INTO renting (roomID,customerID,checkout,checkin, paymentType) Values(?,?,?,?,?)";
        String query2 = "INSERT INTO archives(customerID,bookingID,rentingID,checkin, checkout,paymentType) Values (?,?,null,?,null,null)";
        String query3 = "UPDATE booking SET payment=true, paymentType =? WHERE bookingID=?";

        try {
            // Turns renting into a booking
            con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(query1);
            statement.setInt(1, booking.getRoomID());
            statement.setInt(2, booking.getCustomerID());
            statement.setDate(3, booking.getCheckoutDate());
            statement.setDate(4, booking.getCheckinDate());
            statement.setString(5,booking.getPaymentType());
            statement.executeUpdate();
            statement.close();

            // Moves booking information into archive
            PreparedStatement statement2 = con.prepareStatement(query2);
            statement2.setInt(1, booking.getCustomerID());
            statement2.setInt(2, booking.getBookingID());
            statement2.setDate(3, booking.getCheckinDate());
            statement2.executeUpdate();
            statement2.close();

            // Sets payment to true inorder to get the check in
            PreparedStatement statement3 = con.prepareStatement(query3);
            statement3.setInt(1, booking.getBookingID());
            statement3.setString(2,updatedPayment);
            statement3.executeUpdate();
            statement3.close();

        } catch (Exception e) {
            message = "Error moving booking to renting";
        } finally {
            if (con != null)
                con.close();
            db.close();
            if (message.equals(""))
                message = "Renting sucessfully created";
        }

        return message;
    }

    /**
     * Allows employee to checkout customer and transfers infromation to archive
     * 
     * @param renting
     * @return message displaying if checkout was sucessful
     * @throws SQLException
     */
    public String customerCheckout(Renting renting) throws SQLException {
        String message = "";
        Connection con = null;
        ConnectionDB db = new ConnectionDB();

        String query = "UPDATE renting SET rentingID=?, checkout=?, WHERE customerID=? AND checkin=?";
        try {
            con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(query);

            statement.setInt(1, renting.getRentingID());
            statement.setDate(2, renting.getCheckoutDate());
            statement.setInt(3, renting.getCustomerID());
            statement.setDate(4, renting.getCheckinDate());

            statement.executeUpdate();
            statement.close();
            con.close();

        } catch (Exception e) {
            message = "Error checking customer out";
        } finally {
            if (con != null)
                con.close();
            db.close();
            if (message.equals(""))
                message = "Customer Successfully move out";
        }

        return message;
    }

}
