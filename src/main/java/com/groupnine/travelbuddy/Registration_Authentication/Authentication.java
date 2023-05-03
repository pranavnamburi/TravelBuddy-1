package com.groupnine.travelbuddy.Registration_Authentication;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;
import java.sql.*;

import java.sql.DriverManager;

@WebServlet(name = "authentication", value = "/auth")
public class Authentication  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // Attributes of Server-url, Host-name, and Host-pass to access the database
        String host = "jdbc:mysql://34.143.179.189:3306/travelbuddy";
        String userName = "admin";
        String userPass = "admintravel123";
        DriverManager.setLoginTimeout(30);
        try {
            // Checking if JDBC driver for MySQL exist in the project
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Making a new connection to MySQL server
            Connection connection = DriverManager.getConnection(host, userName, userPass);
            // Instantiating a new Prepared Statement (known as pre-compiled statement) to insert the acquired data
            PreparedStatement statement = connection.prepareStatement("SELECT email, userpass FROM users");
            ResultSet resultSet = statement.executeQuery();
            String acquiredEmail =  req.getParameter("email");
            String acquiredPass = req.getParameter("password");
            boolean userValid = false;
            while(resultSet.next() && !userValid) {
                boolean emailFound = acquiredEmail.equals(resultSet.getString("email"));
                boolean passValid = acquiredPass.equals(resultSet.getString("userpass"));
                if(emailFound && passValid) {
                    userValid = true;
                }
            }
            if(userValid) {
                req.getSession().setAttribute("logged_in", "true");
                resp.sendRedirect("index.jsp");
                System.out.println("Successfully logged in");
            } else {
                req.getSession().setAttribute("foundError", Boolean.valueOf(true));
                System.out.println("Got error!");
                resp.sendRedirect("login_page.jsp");
            }
            // Closing the statement
            statement.close();
            // Closing the connection to the database
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
