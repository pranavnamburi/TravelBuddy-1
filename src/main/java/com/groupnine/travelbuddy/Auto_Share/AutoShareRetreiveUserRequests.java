package com.groupnine.travelbuddy.Auto_Share;

import com.groupnine.travelbuddy.TBBase.TBBaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.configuration2.ex.ConfigurationException;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet(name="AutoShareRetreiveUserRequests", value="/auto_share_retreive_user_requests")
public class AutoShareRetreiveUserRequests extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Checking if JDBC driver for MySQL exist in the project
            // Making a new connection to MySQL server
            final String userEmail = (String) req.getSession().getAttribute("user_email");
            Connection connection = new TBBaseConnection().getConnection();
            // Instantiating a new Prepared Statement (known as pre-compiled statement) to insert the acquired data
            PreparedStatement statement = connection.prepareStatement("SELECT u.fullname, u.email, u.mobile, a.status FROM bt_base.autosharerequests a JOIN bt_base.users u ON a.sender_id=u.email WHERE a.receiver_id=?");
            // Moving the data into the statement
            statement.setString(1, userEmail);
            ResultSet resultSet = statement.executeQuery();
            ArrayList<AutoShareRequest> userRequests = new ArrayList<>();
            while (resultSet.next()) {
                String fullname = resultSet.getString("fullname");
                String email = resultSet.getString("email");
                System.out.println(email);
                String mobile = resultSet.getString("mobile");
                String status = resultSet.getString("status");
                userRequests.add(new AutoShareRequest(fullname, email, mobile, status));
            }
            // Closing the statement
            statement.close();
            // Closing the connection to the database
            connection.close();
            req.getSession().setAttribute("autoShareUserRequests", userRequests);
            resp.sendRedirect("/share_auto/auto_share_requests.jsp");
        } catch (ClassNotFoundException | SQLException | IOException | ConfigurationException e) {
            throw new RuntimeException(e);
        }
    }
}
