package com.Hotel.entities;

import java.sql.Date;

public class Renting {
    private int rentingID;
    private int roomID;
    private int customerID;
    private Date checkoutDate;
    private Date checkinDate;
    private String paymentType;

    public Renting(int rentingID, int roomID, int customerID, Date checkoutDate, Date checkinDate, String paymentType) {
        this.rentingID = rentingID;
        this.roomID = roomID;
        this.customerID = customerID;
        this.checkoutDate = checkoutDate;
        this.checkinDate = checkinDate;
        this.paymentType=paymentType;
    }

    public int getRentingID() {
        return rentingID;
    }

    public int getRoomID() {
        return roomID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public Date getCheckoutDate() {
        return checkoutDate;
    }

    public Date getCheckinDate() {
        return checkinDate;
    }

    public String getPaymentType(){
        return paymentType;
    }

}
