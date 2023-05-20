package com.groupnine.travelbuddy.Friend_Pool;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpServlet;
@WebServlet(name = "HOST", value = "/host_details")
public class host_servlet extends HttpServlet{

    //database name
    private String dbURL = "jdbc:mysql://localhost:3306/TravelBuddy";
    private String user = "root";
    private String password = "shizukachan#18";

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(dbURL, user, password);
            PreparedStatement statement = connection.prepareStatement("INSERT INTO bt_base.friendpoolhosts VALUES (?,?,?,?,?,?,?,?)");
            statement.setString(1, req.getParameter("name"));
            statement.setString(2, req.getParameter("destination"));
            statement.setString(3, req.getParameter("from"));
            statement.setString(4, req.getParameter("transport"));
            statement.setString(5, req.getParameter("time"));
            statement.setString(6, req.getParameter("date"));
            statement.setString(7, req.getParameter("email"));
            statement.setString(8, req.getParameter("contact"));
            statement.executeUpdate();
            statement.close();
            connection.close();
            System.out.println("done!");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
