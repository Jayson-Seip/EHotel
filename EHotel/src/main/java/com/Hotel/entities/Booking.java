package com.Hotel.entities;

import java.sql.Date;

public class Booking {
    private int bookingID;
    private int roomID;
    private int customerID;
    private Date checkoutDate;
    private Date checkinDate;
    private double totalCost;
    private boolean payment;

    public Booking(int bookingID, int roomID, int customerID, Date checkoutDate, Date checkinDate, double totalCost,
            boolean payment) {
        this.bookingID = bookingID;
        this.roomID = roomID;
        this.customerID = customerID;
        this.checkoutDate = checkoutDate;
        this.checkinDate = checkinDate;
        this.totalCost = totalCost;
        this.payment = payment;
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

    public double getTotalCost() {
        return totalCost;
    }

    public boolean getPayment() {
        return payment;
    }

}
