package com.Hotel.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Hotel.db.ConnectionDB;
import com.Hotel.entities.Room;

public class RoomService {

    public List<Room> getAllRooms() {

        String sqlQuery = "SELECT * FROM ROOM";

        ConnectionDB db = new ConnectionDB();
        List<Room> rooms = new ArrayList<>();

        try {

            Connection connection = db.getConnection();
            PreparedStatement statement = connection.prepareStatement(sqlQuery);

            ResultSet rSet = statement.executeQuery();
            // Iterates through all the values from the query
            while (rSet.next()) {
                Room room = new Room(rSet.getInt("roomid"),
                        rSet.getInt("hotelid"),
                        rSet.getDouble("price"),
                        rSet.getBoolean("seaview"),
                        rSet.getBoolean("mountainview"),
                        rSet.getInt("capacity"),
                        rSet.getBoolean("extendable"));

                rooms.add(room);
            }

            rSet.close();
            statement.close();
            connection.close();
            db.close();

        } catch (Exception e) {
            System.out.println("Fail to Connect to Database");
        }

        return rooms;
    }

}
