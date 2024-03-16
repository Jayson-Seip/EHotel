package com.Hotel.entities;

public class Room {
    private int roomID;
    private int hotelID;
    private double price;
    private boolean seaview;
    private boolean mountainview;
    private int capacity;
    private boolean extendable;

    public Room(int roomID, int hotelID, double price, boolean seaview, boolean mountainview, int capacity,
            boolean extendable) {
        this.roomID = roomID;
        this.hotelID = hotelID;
        this.price = price;
        this.seaview = seaview;
        this.mountainview = mountainview;
        this.capacity = capacity;
        this.extendable = extendable;
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

    public int getCapacity() {
        return capacity;
    }

    public boolean isExtendable() {
        return extendable;
    }
}
