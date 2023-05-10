package com.groupnine.travelbuddy.Auto_Share;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

@WebServlet(name = "AutoShareRetreiveData", value = "/auto_share_retreive_data")
public class Auto_Share_Retreive_Data extends HttpServlet {
    final String host = "jdbc:mysql://db4free.net:3306/tb_base";
    final String userName = "tbadmin";
    final String userPass = "admintravel123";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Checking if JDBC driver for MySQL exist in the project
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Making a new connection to MySQL server
            Connection connection = DriverManager.getConnection(host, userName, userPass);
            // Instantiating a new Prepared Statement (known as pre-compiled statement) to insert the acquired data
            PreparedStatement statement = connection.prepareStatement("SELECT u.fullname, a.place, a.no_of_vacs, a.date, a.time FROM autosharers a JOIN users u ON u.email = a.email");
            // Moving the data into the statement
            // Executing the statement with all the data provided
            ResultSet resultSet = statement.executeQuery();
            ArrayList<AutoShareInfo> autoShareInfos = new ArrayList<>();
            while(resultSet.next()) {
                String fullname = resultSet.getString("fullname");
                String place = resultSet.getString("place");
                int no_of_vacs = resultSet.getInt("no_of_vacs");
                Date date = resultSet.getDate("date");
                Time time = resultSet.getTime("time");
                autoShareInfos.add(new AutoShareInfo(fullname, place, no_of_vacs, date, time));
            }
            if(autoShareInfos.size() == 0) {
                System.out.println("Size is zero!");
            }else {
                for(AutoShareInfo obj : autoShareInfos) {
                    System.out.println(obj.getFullname());
                }
            }
            req.getSession().setAttribute("autoShareInfos", autoShareInfos);
            // Closing the statement
            statement.close();
            // Closing the connection to the database
            connection.close();
            resp.sendRedirect("/share_auto/auto_share.jsp");
        } catch (ClassNotFoundException | SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
