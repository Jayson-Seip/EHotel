package com.Hotel.entities;

public class Hotel {
    private int hotelID;
    private int chainID;
    private String name;
    private String hotelAddress;
    private String email;
    private String phoneNumber;
    private int rating;

    public Hotel(int hotelID, int chainID, String name, String hotelAddress, String email, String phoneNumber,
            int rating) {
        this.hotelID = hotelID;
        this.chainID = chainID;
        this.name = name;
        this.hotelAddress = hotelAddress;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.rating = rating;
    }

    public int getHotelID() {
        return hotelID;
    }

    public int getChainID() {
        return chainID;
    }

    public String getName() {
        return name;
    }

    public String getHotelAddress() {
        return hotelAddress;
    }

    public String getEmail() {
        return email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public int getRating() {
        return rating;
    }

}
