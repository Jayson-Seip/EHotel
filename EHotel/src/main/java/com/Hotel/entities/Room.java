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
    private String hotelAddress;
    private String email;
    private String phoneNumber;
    private String area;
    private int rating;

    public Room(int roomID, int hotelID, double price, boolean seaview, boolean mountainview, String capacity,
            boolean extendable, String[] amenities, String[] problems, String hotelName, String hotelAddress,
                String email,String phoneNumber,String area, int rating) {
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
        this.hotelAddress = hotelAddress;
        this.email=email;
        this.phoneNumber=phoneNumber;
        this.area=area;
        this.rating=rating;
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

    public String getAmenities() {
        String str="";
        for(String s : amenities){
            str+=", "+s;
        }

        return str;
    }

    public String getProblems() {
        String str="";
        for(String s : problems){
            str+=s+", ";
        }

        return str;
    }

    public String getHotelName() {
        return hotelName;
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

    public int getRating(){
        return rating;
    }

    public String getArea(){
        return area;
    }
}
