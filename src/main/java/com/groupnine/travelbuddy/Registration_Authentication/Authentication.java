package com.groupnine.travelbuddy.Registration_Authentication;

import jakarta.servlet.ServletException;
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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Attributes of Server-url, Host-name, and Host-pass to access the database
        String dBURL = "jdbc:mysql://localhost:3306/travelbuddy";
        String hostName = "root";
        String hostPass = "Sql.tmc@01";
        try {
            // Checking if JDBC driver for MySQL exist in the project
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Making a new connection to MySQL server
            Connection connection = DriverManager.getConnection(dBURL, hostName, hostPass);
            // Instantiating a new Prepared Statement (known as pre-compiled statement) to insert the acquired data
            PreparedStatement statement = connection.prepareStatement("SELECT email, userpass FROM Users");
            ResultSet resultSet = statement.executeQuery();
            String acquiredEmail =  req.getParameter("email");
            String acquiredPass = req.getParameter("password");
            boolean userValid = false;
            while(resultSet.next() && !userValid) {
                boolean emailFound = acquiredEmail.equals(resultSet.getString("email"));
                boolean passValid = acquiredPass.equals(resultSet.getString("password"));
                if(emailFound && passValid) {
                    userValid = true;
                }
            }
            if(userValid) {
                resp.sendRedirect("home.jsp");
            } else {
                req.setAttribute("errorMessage", "Invalid email or password!");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
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
