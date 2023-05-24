package com.groupnine.travelbuddy.Co_Traveller;

import com.groupnine.travelbuddy.TBBase.TBBaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.ws.rs.core.Request;
import org.apache.commons.configuration2.ex.ConfigurationException;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "coTravellerSearchTraveller", value = "/co-traveller-search-traveller")
public class Co_Traveller_display_data_search_traveller extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String getTravelData = (String) request.getParameter("getalldata");
        String currentEmail = (String) request.getSession().getAttribute("user_email");
        List<Co_Traveller_Info> coTravelersList = null;
        List<Co_Traveller_Info> allCoTravelersList = null;
        if (getTravelData.equals("true")) {
            System.out.println("Reached it");
            System.out.println(currentEmail);
            allCoTravelersList = retrieveCoTravelers(request, currentEmail);
            request.getSession().setAttribute("allCoTravelersList", allCoTravelersList);
        } else {
            String destination = request.getParameter("destination");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            coTravelersList = retrieveCoTravelers(destination, date, time, currentEmail);
            request.getSession().setAttribute("coTravelersList", coTravelersList);
        }


//        String coTravelersString = "";
//        for (Co_Traveller_Info coTraveler : coTravelersList) {
//            coTravelersString += "<li>" + coTraveler.getName() + "</li>";
//        }
//        // Send the co-travelers' names as the response
        response.sendRedirect("/co_traveller/search_traveller.jsp");
    }

    private List<Co_Traveller_Info> retrieveCoTravelers(String destination, String date, String time,String currentEmail) {
        List<Co_Traveller_Info> coTravelersList = new ArrayList<>();
        try {
            String query = "SELECT u.fullname, u.email, a.Serviceno FROM bt_base.Copassengers a JOIN bt_base.users u ON u.email = a.Mail WHERE a.Toplace = ? AND a.Date = ? AND a.Time = ? AND NOT a.Mail = ?";
            Connection connection = new TBBaseConnection().getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, destination);
            statement.setString(2, date);
            statement.setString(3, time);
            statement.setString(4,currentEmail);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("fullname");
                String email = resultSet.getString("email");
                Integer serviceno = resultSet.getInt("Serviceno");
                Co_Traveller_Info coTraveler = new Co_Traveller_Info(name,email, serviceno);
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
    private List<Co_Traveller_Info> retrieveCoTravelers(HttpServletRequest request, String currentEmail){
        List<Co_Traveller_Info> allCoTravelersList = new ArrayList<>();
        try {
            String query = "SELECT u.fullname, u.email, a.Serviceno, a.Date, a.Time FROM bt_base.Copassengers a JOIN bt_base.users u ON u.email = a.Mail WHERE NOT a.Mail = ?";
            Connection connection = new TBBaseConnection().getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1,currentEmail);
            ResultSet resultSet = statement.executeQuery();
            request.getSession().setAttribute("isCoTravellerRegistered", false);
            String user_email = (String) request.getSession().getAttribute("user_email");
            while (resultSet.next()) {
                String name = resultSet.getString("fullname");
                String email = resultSet.getString("email");
                Integer serviceno = resultSet.getInt("Serviceno");
                Date date = resultSet.getDate("Date");
                Time time = resultSet.getTime("Time");
                if (email.equals(user_email)) {
                    request.getSession().setAttribute("isCoTravellerRegistered", true);
                }
                Co_Traveller_Info coTraveler = new Co_Traveller_Info(name, email, serviceno, date, time);
                allCoTravelersList.add(coTraveler);
            }
            statement.close();
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ConfigurationException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        return allCoTravelersList;
    }


}







