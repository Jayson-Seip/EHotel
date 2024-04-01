package com.Hotel.entities;

import java.sql.Date;

public class Booking {
    private int bookingID;
    private int roomID;
    private int customerID;
    private Date checkoutDate;
    private Date checkinDate;
    private boolean payment;
    private String paymentType;

    public Booking(int bookingID, int roomID, int customerID, Date checkoutDate, Date checkinDate,
            boolean payment, String paymentType) {
        this.bookingID = bookingID;
        this.roomID = roomID;
        this.customerID = customerID;
        this.checkoutDate = checkoutDate;
        this.checkinDate = checkinDate;
        this.payment = payment;
        this.paymentType=paymentType;
    }

    public int getBookingID() {
        return bookingID;
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

    public boolean getPayment() {
        return payment;
    }

    public String getPaymentType(){
        return paymentType;
    }

}
