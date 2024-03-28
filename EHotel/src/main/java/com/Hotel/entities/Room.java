package com.Hotel.entities;

public class Room {
    private int roomID;
    private int hotelID;
    private double price;
    private boolean seaview;
    private boolean mountainview;
    private String capacity;
    private boolean extendable;
    private String[] amenities;
    private String[] problems;
    private String hotelName;

    public Room(int roomID, int hotelID, double price, boolean seaview, boolean mountainview, String capacity,
            boolean extendable, String[] amenities, String[] problems, String hotelName) {
        this.roomID = roomID;
        this.hotelID = hotelID;
        this.price = price;
        this.seaview = seaview;
        this.mountainview = mountainview;
        this.capacity = capacity;
        this.extendable = extendable;
        this.amenities = amenities;
        this.problems = problems;
        this.hotelName = hotelName;
    }

    public int getRoomID() {
        return roomID;
    }

    public int getHotelID() {
        return hotelID;
    }

    public double getPrice() {
        return price;
    }

    public boolean isSeaview() {
        return seaview;
    }

    public boolean isMountainview() {
        return mountainview;
    }

    public String getCapacity() {
        return capacity;
    }

    public boolean isExtendable() {
        return extendable;
    }

    public String[] getAmentites() {
        return amenities;
    }

    public String[] getProblems() {
        return problems;
    }

    public String getHotelName() {
        return hotelName;
    }
}
