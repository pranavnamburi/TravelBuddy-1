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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
@WebServlet(name = "coTravellerUserMadeRequests" ,value = "/co-traveller-user-made-requests")
public class Co_Traveller_user_made_requests extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            final String userEmail = (String) req.getSession().getAttribute("user_email");
            // Checking if JDBC driver for MySQL exist in the project
            // Making a new connection to MySQL server
            Connection connection = new TBBaseConnection().getConnection();
            // Instantiating a new Prepared Statement (known as pre-compiled statement) to insert the acquired data
            PreparedStatement statement = connection.prepareStatement("SELECT recieverid, status from bt_base.Copassengersrequests where senderid=?", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            // Moving the data into the statement
            statement.setString(1, userEmail);
            ResultSet resultSet = statement.executeQuery();
            ArrayList<String> userMadeRequests = new ArrayList<>();
            int noOfRequests = 0;
            while(resultSet.next()) {
                userMadeRequests.add(resultSet.getString("recieverid"));
                noOfRequests++;
            }
            resultSet.first();
            if(noOfRequests == 1 && resultSet.getString("status").equals("accepted")) {
                req.getSession().setAttribute("coTravellerRequestAcceptance", true);
            }else {
                req.getSession().setAttribute("coTravellerRequestAcceptance", false);
            }
            // Closing the statement
            statement.close();
            // Closing the connection to the database
            connection.close();
            req.getSession().setAttribute("coTravellerUserMadeRequests", userMadeRequests);
            resp.sendRedirect("/co_traveller/search_traveller.jsp");
        } catch (ClassNotFoundException | SQLException | IOException | ConfigurationException e) {
            throw new RuntimeException(e);
        }
    }
}
