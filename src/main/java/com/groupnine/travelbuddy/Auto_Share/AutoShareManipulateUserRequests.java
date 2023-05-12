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
            final String query;
            if (webUserRequestStatus.equals("accept")) {
                query = "UPDATE autosharerequests SET status='accepted' WHERE sender_id=? AND receiver_id=?";
            } else {
                query = "DELETE FROM autosharerequests WHERE sender_id=? AND receiver_id=?";
            }
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, otherUserEmail);
            statement.setString(2, userEmail);
            statement.executeUpdate();
            statement.close();
            connection.close();
            req.getRequestDispatcher("/share_auto/auto_share_requests.jsp").forward(req, resp);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
