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
@WebServlet(name = "coTravellerRetrieveUsetRequests",value = "/co-traveller-retrieve-user-request")
public class Co_Traveller_retrieve_user_requests extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Checking if JDBC driver for MySQL exist in the project
            // Making a new connection to MySQL server
            final String userEmail = (String) req.getSession().getAttribute("user_email");
            Connection connection = new TBBaseConnection().getConnection();
            // Instantiating a new Prepared Statement (known as pre-compiled statement) to insert the acquired data
            PreparedStatement statement = connection.prepareStatement("SELECT u.fullname, u.email, a.status, a.recieverid FROM bt_base.Copassengersrequests a JOIN bt_base.users u ON a.senderid = u.email WHERE a.recieverid LIKE CONCAT(?, ' %');");
            // Moving the data into the statement
            statement.setString(1, userEmail);
            ResultSet resultSet = statement.executeQuery();
            ArrayList<Co_Traveller_Requests> userRequests = new ArrayList<>();
            while (resultSet.next()) {
                String fullname = resultSet.getString("fullname");
                String email = resultSet.getString("email");
                String status = resultSet.getString("status");
                String[] emailAndServiceNo = resultSet.getString("recieverid").split(" ");
                String serviceno = emailAndServiceNo[1];
                userRequests.add(new Co_Traveller_Requests(fullname, email, status, Integer.parseInt(serviceno)));
            }
            // Closing the statement
            statement.close();
            // Closing the connection to the database
            connection.close();
            req.getSession().setAttribute("coTravellerUserRequests", userRequests);
            resp.sendRedirect("/co_traveller/search_traveller.jsp");
        } catch (ClassNotFoundException | SQLException | IOException | ConfigurationException e) {
            throw new RuntimeException(e);
        }
    }
}
