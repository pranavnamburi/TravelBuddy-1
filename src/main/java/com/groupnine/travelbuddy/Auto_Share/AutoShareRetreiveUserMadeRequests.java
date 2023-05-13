package com.groupnine.travelbuddy.Auto_Share;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet(name="AutoShareRetreiveUserMadeRequests", value="/auto_share_retreive_user_made_requests")
public class AutoShareRetreiveUserMadeRequests extends HttpServlet {
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
            PreparedStatement statement = connection.prepareStatement("SELECT receiver_id, status from tb_base.autosharerequests where sender_id=?", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            // Moving the data into the statement
            String userEmail = (String) req.getSession().getAttribute("user_email");
            statement.setString(1, userEmail);
            ResultSet resultSet = statement.executeQuery();
            ArrayList<String> userMadeRequests = new ArrayList<>();
            int noOfRequests = 0;
            while(resultSet.next()) {
                userMadeRequests.add(resultSet.getString("receiver_id"));
                noOfRequests++;
            }
            resultSet.first();
            if(noOfRequests == 1 && resultSet.getString("status").equals("accepted")) {
                req.getSession().setAttribute("requestAcceptance", true);
            }else {
                req.getSession().setAttribute("requestAcceptance", false);
            }
            // Closing the statement
            statement.close();
            // Closing the connection to the database
            connection.close();
            req.getSession().setAttribute("autoShareUserMadeRequests", userMadeRequests);
            resp.sendRedirect("/share_auto/auto_share.jsp");
        } catch (ClassNotFoundException | SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
