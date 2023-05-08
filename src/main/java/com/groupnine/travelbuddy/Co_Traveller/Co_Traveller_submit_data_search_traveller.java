package com.groupnine.travelbuddy.Co_Traveller;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;


@WebServlet(name = "coTraveller", value = "/co-traveller")
public class FindCoTravelersServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get user input from form
        String host = "jdbc:mysql://34.143.179.189:3306/travelbuddy";
        String userName = "admin";
        String userPass = "admintravel123";
        String source = request.getParameter("source");
        String destination = request.getParameter("destination");
        String transport = request.getParameter("transport");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        // Save user input to database
        // Search for co-travelers
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(host, userName, userPass);
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM passengers WHERE source = ? AND destination = ? AND transport = ? AND date = ?");
            stmt.setString(1, source);
            stmt.setString(2, destination);
            stmt.setString(3, transport);
            stmt.setString(4, date);
            ResultSet rs = stmt.executeQuery();

            // Create ArrayList to hold matching passengers
            ArrayList<Passenger> passengers = new ArrayList<Passenger>();

            while (rs.next()) {
                // Create Passenger object for each matching record
                Passenger passenger = new Passenger();
                passenger.setSource(rs.getString("source"));
                passenger.setDestination(rs.getString("destination"));
                passenger.setTransport(rs.getString("transport"));
                passenger.setDate(rs.getString("date"));
                passenger.setTime(rs.getString("time"));
                // Add Passenger object to ArrayList
                passengers.add(passenger);

            }
            rs.close();
            stmt.close();
            con.close();
            request.setAttribute("searchResults", passengers);
            request.getRequestDispatcher("search_traveller.jsp").forward(request, response);

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }
}
