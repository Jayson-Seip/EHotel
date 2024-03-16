package com.Hotel.entities;

public class Employee {
    private int employeeID;
    private int hotelID;
    private String fullname;
    private int salary;
    private int sin;
    private String Address;

    public Employee(int employeeID, int hotelID, String fullname, int salary, int sin, String address) {
        this.employeeID = employeeID;
        this.hotelID = hotelID;
        this.fullname = fullname;
        this.salary = salary;
        this.sin = sin;
        Address = address;
    }

    public int getEmployeeID() {
        return employeeID;
    }

    public int getHotelID() {
        return hotelID;
    }

    public String getFullname() {
        return fullname;
    }

    public int getSalary() {
        return salary;
    }

    public int getSin() {
        return sin;
    }

    public String getAddress() {
        return Address;
    }

}
