package com.Hotel.service;

import com.Hotel.db.ConnectionDB;

import java.sql.*;
import java.time.LocalDate;

public class EmployeeService {

    public void createEmployee(int SIN, String fullName, String address,int salary,int hotelID,String position) {
        String query = "INSERT INTO employee(SIN, fullName, address, salary, hotelID) values (?,?,?,?,?)";

        Connection con = null;
        ConnectionDB db = new ConnectionDB();
        try{
            con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            statement.setInt(1,SIN);
            statement.setString(2, fullName);
            statement.setString(3, address);
            statement.setInt(4,salary);
            statement.setInt(5,hotelID);
            statement.executeUpdate();
            ResultSet employeeID = statement.getGeneratedKeys();
            String query1 ="INSERT INTO positions (employeeID, position) values (?,?)";
            if(employeeID.next()){
                PreparedStatement statement1 = con.prepareStatement(query1,Statement.RETURN_GENERATED_KEYS);
                statement1.setInt(1,employeeID.getInt(1));
                statement1.setString(2, position);
                statement1.executeUpdate();
                ResultSet positionID = statement1.getGeneratedKeys();
                if(positionID.next()){
                    String query2 ="INSERT INTO works_as(employeeID,positionID) values (?,?)";

                    PreparedStatement statement2 = con.prepareStatement(query2,Statement.RETURN_GENERATED_KEYS);
                    statement2.setInt(1,employeeID.getInt(1));
                    statement2.setInt(2,positionID.getInt(1));
                    statement2.executeUpdate();
                    statement2.close();
                }
                statement1.close();
                positionID.close();
            }
            employeeID.close();

            statement.close();
            db.close();
            con.close();
            System.out.println("Employee Created");

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
