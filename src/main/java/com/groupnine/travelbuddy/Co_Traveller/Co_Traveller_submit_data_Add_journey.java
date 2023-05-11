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
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;


@WebServlet(name = "coTravellerSubmitAddJourney", value = "/co-traveller-submit-add-journey")
public class Co_Traveller_submit_data_Add_journey extends HttpServlet{
    // Attributes of Server-url, Host-name, and Host-pass to access the database
@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
    String dbUrl = "jdbc:mysql://db4free.net:3306/tb_base";
    String dbUser = "tbadmin";
    String dbPassword = "admintravel123";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
            PreparedStatement pst = con.prepareStatement("INSERT INTO tb_base.Copassengers(Mail,Transportation,Serviceno,Fromplace,Toplace,Date,Time) VALUES (?,?, ?, ?, ?, ?, ?)");
            pst.setString(1, (String) req.getSession().getAttribute("user_email"));
            pst.setString(2, req.getParameter("transportation"));
            pst.setString(3, req.getParameter("service_number"));
            pst.setString(4, req.getParameter("from"));
            pst.setString(5, req.getParameter("to"));
            pst.setDate(6, java.sql.Date.valueOf(req.getParameter("date")));
            pst.setString(7, String.valueOf(LocalTime.parse(req.getParameter("time"), DateTimeFormatter.ofPattern("HH:mm"))));
            pst.executeUpdate();
            con.close();
            resp.sendRedirect("/co_traveller/display_journey.jsp");
        }catch (ClassNotFoundException | SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }

}

