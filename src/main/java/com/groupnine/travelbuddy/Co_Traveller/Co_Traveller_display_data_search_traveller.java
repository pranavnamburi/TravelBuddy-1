package com.groupnine.travelbuddy.Co_Traveller;

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
import java.util.List;

@WebServlet(name = "coTravellerSearchTraveller", value = "/co-traveller-search-traveller")
public class Co_Traveller_display_data_search_traveller extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String destination = request.getParameter("destination");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        // Perform search operation based on the form inputs
        List<Co_Traveller_Info> coTravelersList = retrieveCoTravelers(destination, date, time);
        request.getSession().setAttribute("coTravelersList", coTravelersList);
        String coTravelersString = "";
        for (Co_Traveller_Info coTraveler : coTravelersList) {
            coTravelersString += "<li>" + coTraveler.getName() + "</li>";
        }
        // Send the co-travelers' names as the response
        response.sendRedirect("/co_traveller/search_traveller.jsp");
    }

    private List<Co_Traveller_Info> retrieveCoTravelers(String destination, String date, String time) {
        List<Co_Traveller_Info> coTravelersList = new ArrayList<>();
        try {
            String query = "SELECT u.fullname FROM bt_base.Copassengers a JOIN bt_base.users u ON u.email = a.Mail WHERE Toplace = ? AND Date = ? AND Time = ?";
            Connection connection = new TBBaseConnection().getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, destination);
            statement.setString(2, date);
            statement.setString(3, time);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("fullname");
                Co_Traveller_Info coTraveler = new Co_Traveller_Info(name);
                coTravelersList.add(coTraveler);
            }
            statement.close();
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ConfigurationException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        return coTravelersList;
    }

}