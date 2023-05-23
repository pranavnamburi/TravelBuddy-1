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
@WebServlet(name = "coTravellerRequestCancellation", value = "/co-traveller-request-cancellation")
public class Co_Traveller_requeset_cancellation extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            final String userEmail = (String) req.getSession().getAttribute("user_email");
            final String serviceno = req.getParameter("serviceno");
            // Checking if JDBC driver for MySQL exist in the project
            // Making a new connection to MySQL server
            Connection connection = new TBBaseConnection().getConnection();
            // Instantiating a new Prepared Statement (known as pre-compiled statement) to insert the acquired data
            PreparedStatement statement = connection.prepareStatement("DELETE FROM bt_base.Copassengersrequests WHERE recieverid=? AND senderid=?");
            statement.setString(1, req.getParameter("user_for_req_cancel") + " " + serviceno);
            statement.setString(2, userEmail);
            statement.executeUpdate();
            // Closing the statement
            statement.close();
            // Closing the connection to the database
            connection.close();
            resp.sendRedirect("/co_traveller/search_traveller.jsp");
        } catch (ClassNotFoundException | SQLException | IOException | ConfigurationException e) {
            throw new RuntimeException(e);
        }
    }
}
