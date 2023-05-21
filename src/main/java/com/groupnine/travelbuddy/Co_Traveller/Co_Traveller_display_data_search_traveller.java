package com.groupnine.travelbuddy.Co_Traveller;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "coTravellerSearchTraveller", value = "/co-traveller-search-traveller")
public class Co_Traveller_display_data_search_traveller extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String destination = request.getParameter("Transportation");
        String date = request.getParameter("Date");
        String time = request.getParameter("Time");
        List<Co_Traveller_Info> coTravelersList = searchCoTravelers(destination, date, time);
        request.setAttribute("coTravelersList", coTravelersList);
        request.getRequestDispatcher("/webapp/co_traveller/display_search.jsp").forward(request, response);
    }
    private List<Co_Traveller_Info> searchCoTravelers(String destination, String date, String time) {

        String query = "SELECT Transportation,Serviceno,Name FROM Copassengers WHERE Toplace = ? AND Date = ? AND Time = ?";
        List<Co_Traveller_Info> coTravelersList = new ArrayList<>();
            try (
                Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, destination);
            statement.setString(2, date);
            statement.setString(3, time);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("Name");
                String dest = resultSet.getString("Toplace");
                Date Date = java.sql.Date.valueOf(resultSet.getString("Date"));
                Time Time = java.sql.Time.valueOf(resultSet.getString("Time"));
                Co_Traveller_Info coTraveler = new Co_Traveller_Info(name, dest,Date,Time);
                coTravelersList.add(coTraveler);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return coTravelersList;
    }
    private Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://db4free.net:3306/bt_base";
        String username = "bt_admin";
        String password = "buddy_travel_srmap";
        return DriverManager.getConnection(url, username, password);
    }
}


