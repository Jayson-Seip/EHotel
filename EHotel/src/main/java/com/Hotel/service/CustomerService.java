package com.Hotel.service;

import com.Hotel.db.ConnectionDB;
import com.Hotel.entities.Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CustomerService {

    public static void createCustomer(Customer customer) throws SQLException{
        String query = "INSERT INTO customer(fullName, address,registration,ID) values (?,?,?,?)";
        Connection con = null;
        ConnectionDB db = new ConnectionDB();
        try{
            con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(query);

            statement.setString(1,customer.getFullname());
            statement.setString(2, customer.getAddress());
            statement.setBoolean(3,true);
            statement.setInt(4,customer.getId());

            statement.executeUpdate();
            statement.close();
            db.close();
            con.close();

        } catch (Exception e) {

        }

    }

}
