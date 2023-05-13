package com.groupnine.travelbuddy.Auto_Share;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name="AutoShareRequestCancellation", value="/auto_share_request_cancel")
public class AutoShareRequestCancellation extends HttpServlet {
    final String host = "jdbc:mysql://db4free.net:3306/tb_base";
    final String userName = "tbadmin";
    final String userPass = "admintravel123";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Checking if JDBC driver for MySQL exist in the project
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Making a new connection to MySQL server
            Connection connection = DriverManager.getConnection(host, userName, userPass);
            String userEmail = (String) req.getSession().getAttribute("user_email");
            // Instantiating a new Prepared Statement (known as pre-compiled statement) to insert the acquired data
            PreparedStatement statement = connection.prepareStatement("DELETE FROM tb_base.autosharerequests WHERE receiver_id=? AND sender_id=?");
            statement.setString(1, req.getParameter("user_for_req_cancel"));
            System.out.println(req.getParameter("user_for_req_cancel") + " Goat");
            statement.setString(2, userEmail);
            statement.executeUpdate();
            statement = connection.prepareStatement("UPDATE tb_base.autosharers SET no_of_vacs=no_of_vacs+1 WHERE email=?");
            statement.setString(1, req.getParameter("user_for_req_cancel"));
            statement.executeUpdate();
            // Closing the statement
            statement.close();
            // Closing the connection to the database
            connection.close();
            resp.sendRedirect("/share_auto/auto_share.jsp");
        } catch (ClassNotFoundException | SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
