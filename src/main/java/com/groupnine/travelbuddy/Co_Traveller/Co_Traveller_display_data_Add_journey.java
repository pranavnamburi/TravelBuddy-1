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
import java.util.Date;
import java.util.List;

@WebServlet(name = "coTravellerDisplayAddJourney", urlPatterns = "/co-traveller-display-add-journey")
public class Co_Traveller_display_data_Add_journey extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Co_Traveller_Info> journeyList = new ArrayList<>();

        try {

            Connection connection = new TBBaseConnection().getConnection();
            PreparedStatement statement = connection.prepareStatement("SELECT Transportation,Serviceno,Fromplace,Toplace,Date,Time  FROM Copassengers");
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String transportation = resultSet.getString("Transportation");
                int serviceNo = resultSet.getInt("Serviceno");
                String from = resultSet.getString("Fromplace");
                String to = resultSet.getString("Toplace");
                java.sql.Date date = resultSet.getDate("Date");
                Time time = resultSet.getTime("Time");
                Co_Traveller_Info travelInfo = new Co_Traveller_Info(transportation, serviceNo, from, to, date, time);
                journeyList.add(travelInfo);
                System.out.println(from);
            }
            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ConfigurationException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        request.getSession().setAttribute("journeyList", journeyList);
        System.out.println("YEs");
        response.sendRedirect("/co_traveller/display_journey.jsp");
    }
}


