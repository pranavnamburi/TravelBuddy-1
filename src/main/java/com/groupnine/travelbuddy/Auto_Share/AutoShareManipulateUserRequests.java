package com.groupnine.travelbuddy.Auto_Share;

import com.groupnine.travelbuddy.TBBase.TBBaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.configuration2.ex.ConfigurationException;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name="AutoShareManipulateUserRequest", value="/auto_share_manipulate_user_request")
public class AutoShareManipulateUserRequests extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            final String webUserRequestStatus = req.getParameter("status");
            final String otherUserEmail = req.getParameter("other_user_email");
            final String userEmail = (String) req.getSession().getAttribute("user_email");
            final String query1, query2, query3;
            // Making a new connection to MySQL server
            Connection connection = new TBBaseConnection().getConnection();
            if (webUserRequestStatus.equals("accept")) {
                query1 = "UPDATE tb_base.autosharerequests SET status='accepted' WHERE sender_id=? AND receiver_id=?";
                query2 = "UPDATE tb_base.autosharers SET no_of_vacs=no_of_vacs-1 WHERE email=?";
                query3 = "DELETE FROM tb_base.autosharerequests WHERE sender_id=? AND status='pending'";
            } else {
                query1 = "DELETE FROM tb_base.autosharerequests WHERE sender_id=? AND receiver_id=?";
                query2 = null;
                query3 = null;
            }
            PreparedStatement statement = connection.prepareStatement(query1);
            statement.setString(1, otherUserEmail);
            statement.setString(2, userEmail);
            statement.executeUpdate();
            if(query2 != null) {
                statement = connection.prepareStatement(query2);
                statement.setString(1, userEmail);
                statement.executeUpdate();
            }
            if(query3 != null) {
                statement = connection.prepareStatement(query3);
                statement.setString(1, otherUserEmail);
                statement.executeUpdate();
            }
            statement.close();
            connection.close();
            resp.sendRedirect("/share_auto/auto_share_requests.jsp");
        } catch (SQLException | ClassNotFoundException | ConfigurationException e) {
            throw new RuntimeException(e);
        }
    }
}
