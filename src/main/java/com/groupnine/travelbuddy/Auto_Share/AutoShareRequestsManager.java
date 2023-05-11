package com.groupnine.travelbuddy.Auto_Share;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name="AutoShareRequestsManager", value="/auto_share_request_manager")
public class AutoShareRequestsManager extends HttpServlet {
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
            PreparedStatement statement = connection.prepareStatement("INSERT INTO autosharerequests(sender_id, receiver_id, status) VALUES (?,?,?)");
            // Moving the data into the statement
            statement.setString(1, (String) req.getSession().getAttribute("user_email"));
            statement.setString(2, req.getParameter("email"));
            statement.setString(3, "pending");
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
