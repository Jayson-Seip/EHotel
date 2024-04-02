package com.Hotel.entities;

public class HotelCapacity {
    private String hotelName;
    private int totalCapacity;
    public HotelCapacity(String hotelName,int totalCapacity){
        this.hotelName=hotelName;
        this.totalCapacity=totalCapacity;
    }

    public int getTotalCapacity() {
        return totalCapacity;
    }

    public String getHotelName() {
        return hotelName;
    }
}
