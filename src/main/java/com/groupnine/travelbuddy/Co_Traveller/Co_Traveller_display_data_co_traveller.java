package com.groupnine.travelbuddy.Co_Traveller;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;


@WebServlet(name = "coTraveller", value = "/co-traveller")
public class Co_Traveller_display_data_co_traveller extends HttpServlet{
    // Attributes of Server-url, Host-name, and Host-pass to access the database

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Get the search query parameter from the request
        String searchQuery = request.getParameter("query");

        // Check if the search query parameter is not empty or null
        if (searchQuery != null && !searchQuery.isEmpty()) {

            // Define the SQL query to search for matching passengers
            String sql = "SELECT * FROM passengers WHERE destination LIKE ?";

            // Create a database connection and prepare the statement
            String dbUrl = "jdbc:mysql://localhost:3306/mydb";
            String dbUser = "username";
            String dbPassword = "password";
            Connection connection = null;
            PreparedStatement statement = null;
            ResultSet resultSet = null;
            try {
                connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
                statement = connection.prepareStatement(sql);

                // Set the search parameter in the prepared statement
                String searchPattern = "%" + searchQuery + "%";
                statement.setString(1, searchPattern);

                // Execute the SQL query
                resultSet = statement.executeQuery();

                // Store the search results in the request attribute
                request.setAttribute("searchResults", resultSet);
            } catch (SQLException ex) {
                ex.printStackTrace();
            } finally {
                // Close the database resources
                try {
                    if (resultSet != null) {
                        resultSet.close();
                    }
                    if (statement != null) {
                        statement.close();
                    }
                    if (connection != null) {
                        connection.close();
                    }
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }

        // Forward the request to the search results page
        RequestDispatcher view = request.getRequestDispatcher("co-traveller.jsp");
        view.forward(request, response);
    }
}

