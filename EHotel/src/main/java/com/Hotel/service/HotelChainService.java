package com.Hotel.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.Hotel.entities.HotelChain;
import com.Hotel.db.ConnectionDB;

public class HotelChainService {

    /**
     * Gets the hotels from the database
     * 
     * @return List of Hotel Chains in the DataBase
     */
    public List<HotelChain> getHotelChains() {
        String sqlQuery = "SELECT * FROM HOTELCHAIN";
        Connection con = null;
        ConnectionDB db = new ConnectionDB();
        List<HotelChain> hotelChains = new ArrayList<>();

        try {

            con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(sqlQuery);

            ResultSet rSet = statement.executeQuery();

            while (rSet.next()) {
                HotelChain chain = new HotelChain(rSet.getInt("chainid"),
                        rSet.getString("name"),
                        rSet.getString("centraladdress"),
                        rSet.getInt("numberofhotels"),
                        rSet.getString("email"),
                        rSet.getString("phonenumber"));
                hotelChains.add(chain);
            }
            // Closes the database
            rSet.close();
            statement.close();
            con.close();
            db.close();

        } catch (Exception e) {
            System.out.println("Fail to Connect to Database");
            e.printStackTrace();
        }

        return hotelChains;
    }
}
