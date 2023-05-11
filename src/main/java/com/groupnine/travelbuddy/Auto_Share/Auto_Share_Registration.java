package com.groupnine.travelbuddy.Auto_Share;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "AutoShareRegistration", value = "/auto_share_reg")
public class Auto_Share_Registration extends HttpServlet{
    final String host = "jdbc:mysql://db4free.net:3306/tb_base";
    final String userName = "tbadmin";
    final String userPass = "admintravel123";
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Checking if JDBC driver for MySQL exist in the project
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Making a new connection to MySQL server
            Connection connection = DriverManager.getConnection(host, userName, userPass);
            // Instantiating a new Prepared Statement (known as pre-compiled statement) to insert the acquired data
            PreparedStatement statement = connection.prepareStatement("INSERT INTO autosharers(email, place, no_of_vacs, time, date) VALUES (?,?,?,?,?)");
            // Moving the data into the statement
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
            System.out.println(req.getParameter("date"));
            LocalTime localTime = LocalTime.parse(req.getParameter("time"), formatter);
            Time time = Time.valueOf(localTime);
            formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate localDate = LocalDate.parse(req.getParameter("date"), formatter);
            java.sql.Date parsedDate = java.sql.Date.valueOf(localDate);
            statement.setString(1, (String) req.getSession().getAttribute("user_email"));
            statement.setString(2, req.getParameter("to_place"));
            statement.setInt(3, Integer.parseInt(req.getParameter("no_of_vacs")));
            statement.setTime(4, time);
            statement.setDate(5, parsedDate);
            // Executing the statement with all the data provided
            statement.executeUpdate();
            // Closing the statement
            statement.close();
            // Closing the connection to the database
            connection.close();
            req.getSession().setAttribute("isRegistered", true);
            resp.sendRedirect("/share_auto/auto_share.jsp");
        } catch (ClassNotFoundException | SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }
    public void destroy() {

    }
}
