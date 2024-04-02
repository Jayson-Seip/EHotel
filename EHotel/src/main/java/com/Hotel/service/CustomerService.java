package com.Hotel.service;

import com.Hotel.db.ConnectionDB;
import com.Hotel.entities.Customer;

import java.sql.*;
import java.time.LocalDate;

public class CustomerService {

    public void createCustomer(String name, String customer,int id) throws SQLException{
        String query = "INSERT INTO customer(fullName, address,registration,ID) values (?,?,?,?)";

        Connection con = null;
        ConnectionDB db = new ConnectionDB();
        try{
            con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            LocalDate currentDate = LocalDate.now();
            statement.setString(1,name);
            statement.setString(2, customer);
            statement.setDate(3, Date.valueOf(currentDate));
            statement.setInt(4,id);

            statement.executeUpdate();
            ResultSet resultSet = statement.getGeneratedKeys();
            while(resultSet.next()){
                System.out.println("ID:"+ resultSet.getInt(1));
            }
            System.out.println("Customer Created");
            statement.close();
            db.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error Creating Customer");
        }

    }

}
