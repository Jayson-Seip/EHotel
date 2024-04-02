package com.Hotel.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Hotel.db.ConnectionDB;
import com.Hotel.entities.Hotel;
import com.Hotel.entities.HotelCapacity;

public class HotelService {
    public List<HotelCapacity> getCapacityOfHotel(){
        String query = "SELECT * FROM capacity_of_hotel";
        Connection con = null;
        ConnectionDB db = new ConnectionDB();
        List<HotelCapacity> hotelCapacity = new ArrayList<>();
        try{
            con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(query); // the code that will be run in SQL

            ResultSet rSet = statement.executeQuery();// Gets all the results from the query

            while(rSet.next()){
                HotelCapacity hc = new HotelCapacity(rSet.getString("name"), rSet.getInt("totalcapacity"));
                hotelCapacity.add(hc);
            }
            rSet.close();
            statement.close();
            con.close();
            db.close();
        }catch(Exception e){
            e.printStackTrace();
        }

        return hotelCapacity;

    }
    /**
     * Gets the list of all hotels in the database
     * 
     * @return list of hotels
     */
    public List<Hotel> getAllHotel() {
        String sqlQuery = "SELECT * FROM HOTEL";// SQL query that will be run
        Connection con = null;
        ConnectionDB db = new ConnectionDB();
        List<Hotel> hotelChains = new ArrayList<>();

        try {

            con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(sqlQuery); // the code that will be run in SQL

            ResultSet rSet = statement.executeQuery();// Gets all the results from the query

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
            con.close();
            db.close();

        } catch (Exception e) {
            System.out.println("Fail to Connect to Database");
            e.printStackTrace();
        }

        return hotelChains;
    }

    // Aggergated query MAX()
    public List<Hotel> getMaxRatedHotel() {
        String query = "SELECT MAX(category) FROM HOTEL";
        Connection con = null;
        ConnectionDB db = new ConnectionDB();
        List<Hotel> maxHotels = new ArrayList<>();

        try {

            con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(query);

            ResultSet rSet = statement.executeQuery();
            while (rSet.next()) {
                Hotel hotel = new Hotel(
                        rSet.getInt("hotelid"),
                        rSet.getInt("chainID"),
                        rSet.getString("name"),
                        rSet.getString("hoteladdress"),
                        rSet.getString("area"),
                        rSet.getString("email"),
                        rSet.getString("phonenumber"),
                        rSet.getInt("category"));

                maxHotels.add(hotel);

            }
            rSet.close();
            statement.close();
            con.close();
            db.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
