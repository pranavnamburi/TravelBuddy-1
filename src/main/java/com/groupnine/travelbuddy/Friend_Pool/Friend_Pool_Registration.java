package com.groupnine.travelbuddy.Friend_Pool;

import com.groupnine.travelbuddy.TBBase.TBBaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.configuration2.ex.ConfigurationException;

import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "FriendPoolRegistration", value = "/friend_pool_reg")
public class Friend_Pool_Registration extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Checking if JDBC driver for MySQL exist in the project
            // Making a new connection to MySQL server
            Connection connection = new TBBaseConnection().getConnection();
            // Instantiating a new Prepared Statement (known as pre-compiled statement) to insert the acquired data
            PreparedStatement statement1 = connection.prepareStatement("INSERT INTO bt_base.friendpoolhosts(email, destination, `from`, transport, capacity, time, date) VALUES (?,?,?,?,?,?,?)");
            // Moving the data into the statement
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
            System.out.println(req.getParameter("date"));
            LocalTime localTime = LocalTime.parse(req.getParameter("time"), formatter);
            Time time = Time.valueOf(localTime);
            formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate localDate = LocalDate.parse(req.getParameter("date"), formatter);
            Date parsedDate = Date.valueOf(localDate);
            statement1.setString(1, (String) req.getSession().getAttribute("user_email"));
            statement1.setString(2, req.getParameter("destination"));
            statement1.setString(3, req.getParameter("from"));
            statement1.setString(4, req.getParameter("transport"));
            statement1.setInt(5, Integer.parseInt(req.getParameter("capacity")));
            statement1.setTime(6, time);
            statement1.setDate(7, parsedDate);
            // Executing the statement with all the data provided
            statement1.executeUpdate();
            // Closing the statement
            statement1.close();
            String userEmail = (String) req.getSession().getAttribute("user_email");
            PreparedStatement statement2 = connection.prepareStatement("DELETE FROM bt_base.friendpoolrequests WHERE sender_id=? AND status=?");
            statement2.setString(1, userEmail);
            statement2.setString(2, "pending");
            statement2.executeUpdate();
            statement2.close();
            // Closing the connection to the database
            connection.close();
            resp.sendRedirect("/friend_pool/friend_pool.jsp");
        } catch (ClassNotFoundException | SQLException | IOException | ConfigurationException e) {
            throw new RuntimeException(e);
        }
    }
    public void destroy() {

    }
}
