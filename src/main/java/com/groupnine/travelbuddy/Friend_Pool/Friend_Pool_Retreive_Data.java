package com.groupnine.travelbuddy.Friend_Pool;

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

@WebServlet(name = "FriendPoolRetreiveData", value = "/friend_pool_retreive_data")
public class Friend_Pool_Retreive_Data extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            final String userEmail = (String) req.getSession().getAttribute("user_email");
            req.getSession().setAttribute("isFriendPoolRegistered", false);
            Connection connection = new TBBaseConnection().getConnection();
            PreparedStatement statement = connection.prepareStatement("SELECT u.fullname, u.email, u.mobile, a.`from`, a.destination, a.transport, a.capacity, a.date, a.time FROM bt_base.friendpoolhosts a JOIN bt_base.users u ON u.email = a.email WHERE not a.capacity=0");
            ResultSet resultSet = statement.executeQuery();
            ArrayList<FriendPoolInfo> friendPoolInfos = new ArrayList<>();
            while(resultSet.next()) {
                String fullname = resultSet.getString("fullname");
                String email = resultSet.getString("email");
                if(userEmail.equals(email)) {
                    req.getSession().setAttribute("isFriendPoolRegistered", true);
                }
                String mobile = resultSet.getString("mobile");
                String from = resultSet.getString("from");
                String destination = resultSet.getString("destination");
                int capacity = resultSet.getInt("capacity");
                String transport = resultSet.getString("transport");
                Date date = resultSet.getDate("date");
                Time time = resultSet.getTime("time");
                friendPoolInfos.add(new FriendPoolInfo(fullname, email, mobile, from,destination,transport,capacity, date, time));
            }
            req.getSession().setAttribute("friendPoolInfos", friendPoolInfos);
            // Closing the statement
            statement.close();
            // Closing the connection to the database
            connection.close();
            resp.sendRedirect("/friend_pool/friend_pool.jsp");
        } catch (ClassNotFoundException | SQLException | IOException | ConfigurationException e) {
            throw new RuntimeException(e);
        }
    }
}
