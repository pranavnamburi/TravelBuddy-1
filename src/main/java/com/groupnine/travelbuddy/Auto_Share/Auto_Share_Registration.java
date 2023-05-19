package com.groupnine.travelbuddy.Auto_Share;

import com.groupnine.travelbuddy.TBBase.TBBaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.apache.commons.configuration2.ex.ConfigurationException;

import java.io.IOException;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "AutoShareRegistration", value = "/auto_share_reg")
public class Auto_Share_Registration extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Checking if JDBC driver for MySQL exist in the project
            // Making a new connection to MySQL server
            Connection connection = new TBBaseConnection().getConnection();
            // Instantiating a new Prepared Statement (known as pre-compiled statement) to insert the acquired data
            PreparedStatement statement1 = connection.prepareStatement("INSERT INTO bt_base.autosharers(email, place, no_of_vacs, time, date) VALUES (?,?,?,?,?)");
            // Moving the data into the statement
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
            System.out.println(req.getParameter("date"));
            LocalTime localTime = LocalTime.parse(req.getParameter("time"), formatter);
            Time time = Time.valueOf(localTime);
            formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate localDate = LocalDate.parse(req.getParameter("date"), formatter);
            java.sql.Date parsedDate = java.sql.Date.valueOf(localDate);
            statement1.setString(1, (String) req.getSession().getAttribute("user_email"));
            statement1.setString(2, req.getParameter("to_place"));
            statement1.setInt(3, Integer.parseInt(req.getParameter("no_of_vacs")));
            statement1.setTime(4, time);
            statement1.setDate(5, parsedDate);
            // Executing the statement with all the data provided
            statement1.executeUpdate();
            // Closing the statement
            statement1.close();
            String userEmail = (String) req.getSession().getAttribute("user_email");
            PreparedStatement statement2 = connection.prepareStatement("DELETE FROM bt_base.autosharerequests WHERE sender_id=? AND status=?");
            statement2.setString(1, userEmail);
            statement2.setString(2, "pending");
            statement2.executeUpdate();
            statement2.close();
            // Closing the connection to the database
            connection.close();
            resp.sendRedirect("/share_auto/auto_share.jsp");
        } catch (ClassNotFoundException | SQLException | IOException | ConfigurationException e) {
            throw new RuntimeException(e);
        }
    }
    public void destroy() {

    }
}
