package com.groupnine.travelbuddy.Co_Traveller;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;


@WebServlet(name = "coTraveller", value = "/co-traveller")
public class Co_Traveller_display_data_Add_journey extends HttpServlet{
    // Attributes of Server-url, Host-name, and Host-pass to access the database
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Set up the database connection
        String dbUrl = "jdbc:mysql://localhost:3306/tb_base";
        String dbUser = "tbadmin";
        String dbPassword = "admintravel123";
        Connection conn = null;

        // Retrieve data from the database
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
            String query = "SELECT * FROM Copassengers";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            // Display the retrieved data on the JSP page
            request.setAttribute("passengerData", rs);
            RequestDispatcher view = request.getRequestDispatcher("display_journey.jsp");
            view.forward(request, response);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }


}

