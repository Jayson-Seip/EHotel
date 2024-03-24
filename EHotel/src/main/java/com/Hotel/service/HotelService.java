package com.Hotel.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Hotel.db.ConnectionDB;
import com.Hotel.entities.Hotel;

public class HotelService {

    /**
     * Gets the list of all hotels in the database
     * 
     * @return list of hotels
     */
    public List<Hotel> getHotel() {
        String sqlQuery = "SELECT * FROM HOTEL";

        ConnectionDB db = new ConnectionDB();
        List<Hotel> hotelChains = new ArrayList<>();

        try {

            Connection connection = db.getConnection();
            PreparedStatement statement = connection.prepareStatement(sqlQuery);

            ResultSet rSet = statement.executeQuery();
            // Iterates through all the values from the query
            while (rSet.next()) {
                Hotel hotel = new Hotel(rSet.getInt("hotelid"),
                        rSet.getInt("chainid"),
                        rSet.getString("name"),
                        rSet.getString("hoteladdress"),
                        rSet.getString("area"),
                        rSet.getString("email"),
                        rSet.getString("phonenumber"),
                        rSet.getInt("category"));

                hotelChains.add(hotel);

            }
            rSet.close();
            statement.close();
            connection.close();
            db.close();

        } catch (Exception e) {
            System.out.println("Fail to Connect to Database");
        }

        return hotelChains;
    }
}
