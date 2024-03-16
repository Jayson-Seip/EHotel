package com.Hotel.entities;

public class HotelChain {
    private int chainID;
    private String name;
    private String centralAddress;
    private String numberOfHotels;
    private String email;
    private String phoneNumber;

    public HotelChain(int chainID, String name, String centralAddress, String numberOfHotels, String email,
            String phoneNumber) {
        this.chainID = chainID;
        this.name = name;
        this.centralAddress = centralAddress;
        this.numberOfHotels = numberOfHotels;
        this.email = email;
        this.phoneNumber = phoneNumber;
    }

    public int getChainID() {
        return chainID;
    }

    public String getName() {
        return name;
    }

    public String getCentralAddress() {
        return centralAddress;
    }

    public String getNumberOfHotels() {
        return numberOfHotels;
    }

    public String getEmail() {
        return email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

}
