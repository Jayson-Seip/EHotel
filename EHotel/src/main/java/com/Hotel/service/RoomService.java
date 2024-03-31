package com.Hotel.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Hotel.db.ConnectionDB;
import com.Hotel.entities.Room;

public class RoomService {
    /**
     * 
     * @param city
     * @param lowerPrice
     * @param upperPrice
     * @param startDate
     * @param endDate
     * @param capacity
     * @param area
     * @param hotelChain
     * @return A list of rooms based off query searches specfied by the user
     * @throws SQLException
     */
    public List<Room> roomSearch(String city, Double lowerPrice, Double upperPrice, Date startDate, Date endDate,
            String capacity, String area, String hotelChain, Integer category, Integer numRooms) throws SQLException {
        List<Room> rooms = new ArrayList<>();
        Connection con = null;
        ConnectionDB db = new ConnectionDB();

        StringBuilder query = new StringBuilder(
                "SELECT hotel.name as hotelName , hotel.hoteladdress, room.*, amenities.amenities, problems.problems "
                        +
                        "FROM room " +
                        "JOIN hotel on room.hotelid = hotel.hotelid " +
                        "JOIN hotelchain on hotel.chainid = hotelchain.chainid " +
                        "LEFT JOIN (" +
                        "SELECT roomID, STRING_AGG(amenities, ', ') AS amenities " +
                        "FROM room_amenities " +
                        "GROUP BY roomID) AS amenities ON room.roomid = amenities.roomID " +
                        "LEFT JOIN (" +
                        "SELECT roomID, STRING_AGG(problem, ', ') AS problems " +
                        "FROM room_problems " +
                        "GROUP BY roomID) AS problems ON room.roomID = problems.roomID ");

        // Condtions to search by

        boolean condition = false;
        if (city != null) {
            query.append(condition ? " AND " : " WHERE ");
            query.append("split_part(hotel.hoteladdress, ',', 2) = " + "' " + city + "'");
            condition = true;
        }
        if (lowerPrice != null) {
            query.append(condition ? " AND " : " WHERE ");
            query.append("room.price >= " + lowerPrice);
            condition = true;
        }
        if (upperPrice != null) {
            query.append(condition ? " AND " : " WHERE ");
            query.append("room.price <= " + upperPrice);
            condition = true;
        }
        if (capacity != null) {
            query.append(condition ? " AND " : " WHERE ");
            query.append("room.capacity = '" + capacity + "'");
            condition = true;
        }
        if (area != null) {
            query.append(condition ? " AND " : " WHERE ");
            query.append("hotel.area = '" + hotelChain + "'");
            condition = true;
        }
        if (hotelChain != null) {
            query.append(condition ? " AND " : " WHERE ");
            query.append("hotelchain.name = '" + hotelChain + "'");
            condition = true;
        }
        if (category != null) {
            query.append(condition ? " AND " : " WHERE ");
            query.append("hotel.category = " + category);
            condition = true;
        }
        if (startDate != null && endDate != null) {
            query.append(condition ? " AND " : " WHERE ");
            query.append("room.roomid NOT IN (" +
                    "  SELECT booking.roomID " +
                    "  FROM booking " +
                    "  WHERE booking.checkOut > '" + startDate + "' OR booking.checkIn <= '" + endDate +
                    "' )");
            condition = true;
        }
        query.append(" ORDER BY room.roomid asc; ");

        try {
            con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(query.toString());
            ResultSet rSet = statement.executeQuery();
            while (rSet.next()) {
                Room room = null;
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
                            rSet.getString("hotelname"),
                            rSet.getString("hoteladdress"));
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
                            rSet.getString("hotelname"),
                            rSet.getString("hoteladdress"));
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
                            rSet.getString("hotelname"),
                            rSet.getString("hoteladdress"));
                }
                // If room has both amenities or problems
                else {
                    room = new Room(rSet.getInt("roomid"),
                            rSet.getInt("hotelid"),
                            rSet.getDouble("price"),
                            rSet.getBoolean("seaview"),
                            rSet.getBoolean("mountainview"),
                            rSet.getString("capacity"),
                            rSet.getBoolean("extendable"),
                            rSet.getString("amenities").split(","),
                            rSet.getString("problems").split(","),
                            rSet.getString("hotelname"),
                            rSet.getString("hoteladdress"));

                }
                rooms.add(room);
            }
            rSet.close();
            statement.close();
            con.close();
            db.close();
        } catch (Exception e) {

        }
        return rooms;

    }

    public static String createRoom(Room room) throws SQLException {
        Connection con = null;
        ConnectionDB db = new ConnectionDB();
        String message = "";

        String query = "INSERT INTO room (roomID,hotelID,price,seaview,mountainview,capacity,extendable) VALUES (?,?,?,?,?,?,?)";
        try {
            con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(query);

            statement.setInt(1, room.getRoomID());
            statement.setInt(2, room.getHotelID());
            statement.setDouble(3, room.getPrice());
            statement.setBoolean(4, room.isSeaview());
            statement.setBoolean(5, room.isMountainview());
            statement.setString(6, room.getCapacity());
            statement.setBoolean(7, room.isExtendable());

            statement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            message = "Error creating room";
        } finally {
            if (con != null)
                con.close();
            db.close();
            if (message.equals(""))
                message = "Room Sucessful Created";

        }
        return message;
    }

}
