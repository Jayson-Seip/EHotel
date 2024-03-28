package com.Hotel.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Hotel.db.ConnectionDB;
import com.Hotel.entities.Room;

public class RoomService {

    // Use left join
    public List<Room> getAllRooms() {

        String sqlQuery = "SELECT hotel.name as hotelName , room.*, amenities.amenities, problems.problems " +
                "FROM room " +
                "JOIN hotel on room.hotelid = hotel.hotelid " +
                "LEFT JOIN (" +
                "SELECT roomID, STRING_AGG(amenities, ', ') AS amenities " +
                "FROM room_amenities " +
                "GROUP BY roomID) AS amenities ON room.roomid = amenities.roomID " +
                "LEFT JOIN (" +
                "SELECT roomID, STRING_AGG(problem, ', ') AS problems " +
                "FROM room_problems " +
                "GROUP BY roomID) AS problems ON room.roomID = problems.roomID " +
                "ORDER BY room.roomid asc ";

        ConnectionDB db = new ConnectionDB();
        List<Room> rooms = new ArrayList<>();

        try {

            Connection connection = db.getConnection();
            PreparedStatement statement = connection.prepareStatement(sqlQuery);

            ResultSet rSet = statement.executeQuery();
            // Iterates through all the values from the query
            Room room = null;
            while (rSet.next()) {
                // If the room has no problems
                if (rSet.getString("problems") == null) {
                    String[] problem = { "None" };
                    room = new Room(rSet.getInt("roomid"),
                            rSet.getInt("hotelid"),
                            rSet.getDouble("price"),
                            rSet.getBoolean("seaview"),
                            rSet.getBoolean("mountainview"),
                            rSet.getString("capacity"),
                            rSet.getBoolean("extendable"),
                            rSet.getString("amenities").split(","),
                            problem,
                            rSet.getString("hotelname"));
                }
                // If hotel room has no amenities
                else if (rSet.getString("amenities") == null) {
                    String[] amenities = { "None" };
                    room = new Room(rSet.getInt("roomid"),
                            rSet.getInt("hotelid"),
                            rSet.getDouble("price"),
                            rSet.getBoolean("seaview"),
                            rSet.getBoolean("mountainview"),
                            rSet.getString("capacity"),
                            rSet.getBoolean("extendable"),
                            amenities,
                            rSet.getString("problems").split(","),
                            rSet.getString("hotelname"));
                }
                // If Room has no amenities or problems
                else if (rSet.getString("amenities") == null && rSet.getString("problems") == null) {
                    String[] none = { "None" };
                    room = new Room(rSet.getInt("roomid"),
                            rSet.getInt("hotelid"),
                            rSet.getDouble("price"),
                            rSet.getBoolean("seaview"),
                            rSet.getBoolean("mountainview"),
                            rSet.getString("capacity"),
                            rSet.getBoolean("extendable"),
                            none,
                            none,
                            rSet.getString("hotelname"));
                } else {
                    room = new Room(rSet.getInt("roomid"),
                            rSet.getInt("hotelid"),
                            rSet.getDouble("price"),
                            rSet.getBoolean("seaview"),
                            rSet.getBoolean("mountainview"),
                            rSet.getString("capacity"),
                            rSet.getBoolean("extendable"),
                            rSet.getString("amenities").split(","),
                            rSet.getString("problems").split(","),
                            rSet.getString("hotelname"));

                }
                rooms.add(room);
            }

            rSet.close();
            statement.close();
            connection.close();
            db.close();

        } catch (Exception e) {
            System.out.println("Fail to Connect to Database");
            e.printStackTrace();
        }

        return rooms;
    }

}
