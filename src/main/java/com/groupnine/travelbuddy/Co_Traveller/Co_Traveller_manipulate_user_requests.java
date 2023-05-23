package com.groupnine.travelbuddy.Co_Traveller;

import com.groupnine.travelbuddy.TBBase.TBBaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.configuration2.ex.ConfigurationException;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "coTravellerManipulateUserRequests",value = "/co-traveller-manipulate-user-requests")
public class Co_Traveller_manipulate_user_requests extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            final String webUserRequestStatus = req.getParameter("status");
            final String otherUserEmail = req.getParameter("other_user_email");
            System.out.println(otherUserEmail);
            final String serviceno = req.getParameter("serviceno");
            System.out.println(serviceno);
            final String userEmail = (String) req.getSession().getAttribute("user_email");
            final String query1,query3;
            // Making a new connection to MySQL server
            Connection connection = new TBBaseConnection().getConnection();
            if (webUserRequestStatus.equals("accept")) {
                System.out.println("Accepted");
                query1 = "UPDATE bt_base.Copassengersrequests SET status='accepted' WHERE senderid=? AND recieverid=?";
                query3 = "DELETE FROM bt_base.autosharerequests WHERE sender_id=? AND status='pending'";
            } else {
                System.out.println("Rejected");
                query1 = "DELETE FROM bt_base.Copassengersrequests WHERE senderid=? AND recieverid=?";
                query3 = null;
            }
            PreparedStatement statement = connection.prepareStatement(query1);
            statement.setString(1, otherUserEmail);
            statement.setString(2, userEmail + " " + serviceno);
            statement.executeUpdate();
            if(query3 != null) {
                statement = connection.prepareStatement(query3);
                statement.setString(1, otherUserEmail);
                statement.executeUpdate();
            }
            statement.close();
            connection.close();
            resp.sendRedirect("/co_traveller/search_traveller.jsp");
        } catch (SQLException | ClassNotFoundException | ConfigurationException e) {
            throw new RuntimeException(e);
        }
    }
}
