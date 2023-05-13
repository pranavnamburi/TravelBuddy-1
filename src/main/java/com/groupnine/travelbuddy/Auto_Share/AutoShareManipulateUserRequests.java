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

@WebServlet(name="AutoShareManipulateUserRequest", value="/auto_share_manipulate_user_request")
public class AutoShareManipulateUserRequests extends HttpServlet {
    final String host = "jdbc:mysql://db4free.net:3306/tb_base";
    final String userName = "tbadmin";
    final String userPass = "admintravel123";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String webUserRequestStatus = req.getParameter("status");
            String otherUserEmail = req.getParameter("other_user_email");
            String userEmail = (String) req.getSession().getAttribute("user_email");
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Making a new connection to MySQL server
            Connection connection = DriverManager.getConnection(host, userName, userPass);
            final String query1, query2, query3;
            if (webUserRequestStatus.equals("accept")) {
                query1 = "UPDATE tb_base.autosharerequests SET status='accepted' WHERE sender_id=? AND receiver_id=?";
                query2 = "UPDATE tb_base.autosharers SET no_of_vacs=no_of_vacs-1 WHERE email=?";
            } else {
                query1 = "DELETE FROM tb_base.autosharerequests WHERE sender_id=? AND receiver_id=?";
                query2 = "UPDATE tb_base.autosharers SET no_of_vacs=no_of_vacs+1 WHERE email=?";
            }
            PreparedStatement statement1 = connection.prepareStatement(query1);
            statement1.setString(1, otherUserEmail);
            statement1.setString(2, userEmail);
            statement1.executeUpdate();
            statement1.close();
            PreparedStatement statement2 = connection.prepareStatement(query2);
            statement2.setString(1, userEmail);
            statement2.executeUpdate();
            statement2.close();
            if (webUserRequestStatus.equals("accept")) {
                query3 = "DELETE FROM tb_base.autosharerequests WHERE sender_id=? AND status='pending'";
                PreparedStatement statement3 = connection.prepareStatement(query3);
                statement3.setString(1, otherUserEmail);
                statement3.executeUpdate();
                statement3.close();
            }
            connection.close();
            resp.sendRedirect("/share_auto/auto_share_requests.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
