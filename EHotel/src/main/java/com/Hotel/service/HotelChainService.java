package com.Hotel.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.Hotel.entities.HotelChain;
import com.Hotel.db.ConnectionDB;

public class HotelChainService {
    HotelChainService() {

    }

    /**
     * Gets the hotels from the database
     * 
     * @return List of Hotel Chains in the DataBase
     */
    public List<HotelChain> getHotelChains() {
        String sqlQuery = "SELECT * FROM HOTELCHAIN";

        ConnectionDB db = new ConnectionDB();
        List<HotelChain> hotelChains = new ArrayList<>();

        try {

            Connection connection = db.getConnection();
            PreparedStatement statement = connection.prepareStatement(sqlQuery);

            ResultSet rSet = statement.executeQuery();

            while (rSet.next()) {
                HotelChain chain = new HotelChain(rSet.getInt("chainid"),
                        rSet.getString("name"),
                        rSet.getString("centraladdress"),
                        rSet.getInt("numberofhotel"),
                        rSet.getString("email"),
                        rSet.getString("phonenumber"));
                hotelChains.add(chain);

            }
            // Closes the database
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
