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
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

@WebServlet(name = "AutoShareRetreiveData", value = "/auto_share_retreive_data")
public class Auto_Share_Retreive_Data extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            final String userEmail = (String) req.getSession().getAttribute("user_email");
            req.getSession().setAttribute("isAutoShareRegistered", false);
            Connection connection = new TBBaseConnection().getConnection();
            PreparedStatement statement = connection.prepareStatement("SELECT u.fullname, u.email, u.mobile, a.place, a.no_of_vacs, a.date, a.time FROM bt_base.autosharers a JOIN bt_base.users u ON u.email = a.email WHERE NOT a.no_of_vacs = 0");
            ResultSet resultSet = statement.executeQuery();
            ArrayList<AutoShareInfo> autoShareInfos = new ArrayList<>();
            while(resultSet.next()) {
                String fullname = resultSet.getString("fullname");
                String email = resultSet.getString("email");
                if(userEmail.equals(email)) {
                    req.getSession().setAttribute("isAutoShareRegistered", true);
                }
                String mobile = resultSet.getString("mobile");
                String place = resultSet.getString("place");
                int no_of_vacs = resultSet.getInt("no_of_vacs");
                Date date = resultSet.getDate("date");
                Time time = resultSet.getTime("time");
                autoShareInfos.add(new AutoShareInfo(fullname, email, mobile, place, no_of_vacs, date, time));
            }
            req.getSession().setAttribute("autoShareInfos", autoShareInfos);
            // Closing the statement
            statement.close();
            // Closing the connection to the database
            connection.close();
            resp.sendRedirect("/share_auto/auto_share.jsp");
        } catch (ClassNotFoundException | SQLException | IOException | ConfigurationException e) {
            throw new RuntimeException(e);
        }
    }
}
