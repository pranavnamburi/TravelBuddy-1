package com.groupnine.travelbuddy.Auto_Share;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet(name="AutoShareRetreiveRequests", value="auto_share_retreive_requests")
public class AutoShareRetreiveRequests extends HttpServlet {
    final String host = "jdbc:mysql://db4free.net:3306/tb_base";
    final String userName = "tbadmin";
    final String userPass = "admintravel123";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Boolean isRegistered = (Boolean) req.getAttribute("isRegistered");
        if(isRegistered == true) {
            try {
                // Checking if JDBC driver for MySQL exist in the project
                Class.forName("com.mysql.cj.jdbc.Driver");
                // Making a new connection to MySQL server
                Connection connection = DriverManager.getConnection(host, userName, userPass);
                // Instantiating a new Prepared Statement (known as pre-compiled statement) to insert the acquired data
                PreparedStatement statement = connection.prepareStatement("SELECT u.fullname, u.email, u.mobile, a.status FROM autosharerequests a JOIN users u ON a.sender_id=u.email WHERE a.receiver_id=?");
                // Moving the data into the statement
                String userEmail = (String) req.getSession().getAttribute("user_email");
                statement.setString(1, userEmail);
                ResultSet resultSet = statement.executeQuery();
                ArrayList<AutoShareRequest> otherUserRequests = new ArrayList<>();
                while (resultSet.next()) {
                    if (resultSet.getString("receiver_id").equals(userEmail)) {
                        String fullname = resultSet.getString("fullname");
                        String email = resultSet.getString("email");
                        String mobile = resultSet.getString("mobile");
                        String status = resultSet.getString("status");
                        otherUserRequests.add(new AutoShareRequest(fullname, email, mobile, status));
                    }
                }
                // Closing the statement
                statement.close();
                // Closing the connection to the database
                connection.close();
                req.setAttribute("otherUserRequests", otherUserRequests);
                req.getRequestDispatcher("/share_auto/auto_share.jsp").forward(req, resp);
            } catch (ClassNotFoundException | SQLException | IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            try {
                // Checking if JDBC driver for MySQL exist in the project
                Class.forName("com.mysql.cj.jdbc.Driver");
                // Making a new connection to MySQL server
                Connection connection = DriverManager.getConnection(host, userName, userPass);
                // Instantiating a new Prepared Statement (known as pre-compiled statement) to insert the acquired data
                PreparedStatement statement = connection.prepareStatement("SELECT receiver_id from autosharerequests where sender_id=?");
                // Moving the data into the statement
                String userEmail = (String) req.getSession().getAttribute("user_email");
                statement.setString(1, userEmail);
                ResultSet resultSet = statement.executeQuery();
                ArrayList<String> userMadeRequests = new ArrayList<>();
                while(resultSet.next()) {
                    userMadeRequests.add(resultSet.getString("receiver_id"));
                }
                // Closing the statement
                statement.close();
                // Closing the connection to the database
                connection.close();
                req.getSession().setAttribute("userMadeRequests", userMadeRequests);
                req.getRequestDispatcher("/share_auto/auto_share.jsp").forward(req, resp);
            } catch (ClassNotFoundException | SQLException | IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
