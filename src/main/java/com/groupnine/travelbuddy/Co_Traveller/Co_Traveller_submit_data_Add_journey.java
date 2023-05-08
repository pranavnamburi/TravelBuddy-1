package com.groupnine.travelbuddy.Co_Traveller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;


@WebServlet(name = "coTraveller", value = "/co-traveller")
public class Co_Traveller_submit_data_Add_journey extends HttpServlet{
    // Attributes of Server-url, Host-name, and Host-pass to access the database
@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        String host = "jdbc:mysql://34.143.179.189:3306/travelbuddy";
        String userName = "admin";
        String userPass = "admintravel123";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(host, userName, userPass);
            PreparedStatement pst = con.prepareStatement("INSERT INTO passengers(name, source, destination, transport, date, time, regno, branch) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            pst.setString(1, name);
            pst.setString(2, source);
            pst.setString(3, destination);
            pst.setString(4, transport);
            pst.setString(5, date);
            pst.setString(6, time);
            pst.setString(7, regno);
            pst.setString(8, branch);
            pst.executeUpdate();
            con.close();
            resp.sendRedirect("display_journey.jsp");
        }catch (ClassNotFoundException | SQLException | IOException e) {
            throw new RuntimeException(e);
        }

    }

}

