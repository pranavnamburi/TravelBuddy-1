package com.groupnine.travelbuddy.Friend_Pool;

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
@WebServlet(name="FriendPoolDeregistration", value="/friend_pool_de_reg")
public class Friend_Pool_Deregistration extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            final String userEmail = (String) req.getSession().getAttribute("user_email");
            // Checking if JDBC driver for MySQL exist in the project
            Connection connection = new TBBaseConnection().getConnection();
            // Instantiating a new Prepared Statement (known as pre-compiled statement) to insert the acquired data
            PreparedStatement statement = connection.prepareStatement("DELETE FROM bt_base.friendpoolhosts WHERE email=?");
            statement.setString(1, userEmail);
            statement.executeUpdate();
            statement = connection.prepareStatement("DELETE FROM bt_base.friendpoolrequests WHERE receiver_id=?");
            statement.setString(1, userEmail);
            statement.executeUpdate();
            // Closing the statement
            statement.close();
            // Closing the connection to the database
            connection.close();
            req.getSession().setAttribute("isFriendPoolRegistered", false);
            resp.sendRedirect("/friend_pool/friend_pool.jsp");
        } catch (ClassNotFoundException | SQLException | IOException | ConfigurationException e) {
            throw new RuntimeException(e);
        }
    }
}
