package com.Hotel.entities;

import java.sql.Date;

public class Customer {
    private int customerID;
    private String fullname;
    private String address;
    private Date registration;
    private int id;

    public Customer(int customerID, String fullname, String address, Date registration, int id) {
        this.customerID = customerID;
        this.fullname = fullname;
        this.address = address;
        this.registration = registration;
        this.id = id;
    }

    public int getCustomerID() {
        return customerID;
    }

    public String getFullname() {
        return fullname;
    }

    public String getAddress() {
        return address;
    }

    public Date getRegistration() {
        return registration;
    }

    public int getId() {
        return id;
    }

}
