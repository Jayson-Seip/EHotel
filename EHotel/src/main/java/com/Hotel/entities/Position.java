package com.Hotel.entities;

public class Position {
    private int PositionID;
    private int employeeID;
    private String jobTitle;

    public Position(int positionID, int employeeID, String jobTitle) {
        PositionID = positionID;
        this.employeeID = employeeID;
        this.jobTitle = jobTitle;
    }

    public int getPositionID() {
        return PositionID;
    }

    public int getEmployeeID() {
        return employeeID;
    }

    public String getJobTitle() {
        return jobTitle;
    }

}
