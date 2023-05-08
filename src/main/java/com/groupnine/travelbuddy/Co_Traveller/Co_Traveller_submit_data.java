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
public class Co_Traveller_submit_data extends HttpServlet{
    // Attributes of Server-url, Host-name, and Host-pass to access the database
@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        String host = "jdbc:mysql://34.143.179.189:3306/travelbuddy";
        String userName = "admin";
        String userPass = "admintravel123";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(host, userName, userPass);
            PreparedStatement pst = con.prepareStatement("INSERT INTO tb_base.Copassengers(Transportation,Serviceno,Fromplace,Toplace,Date,Time) VALUES (?, ?, ?, ?, ?, ?)");
            pst.setString(1, "transportation");
            pst.setString(2, "service_number");
            pst.setString(3, "from");
            pst.setString(4, "to");
            pst.setString(5, "date");
            pst.setString(6, "time");
            pst.executeUpdate();
            con.close();
            resp.sendRedirect("display_journey.jsp");
        }catch (ClassNotFoundException | SQLException | IOException e) {
            throw new RuntimeException(e);
        }

    }

}

