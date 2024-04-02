package com.Hotel.entities;

public class RoomsPerArea {
    private String city;
    private String area;
    private int rooms;

    public RoomsPerArea(String city, String area, int rooms){
        this.city=city;
        this.area=area;
        this.rooms=rooms;
    }

    public String getCity(){
        return city;
    }
    public String getArea(){
        return area;
    }
    public int getAvailableHotelRooms(){
        return rooms;
    }



}
