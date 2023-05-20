package com.groupnine.travelbuddy.Friend_Pool;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "friendPoolHostAddJourney", value = "/friend-pool-add-journey")
public class host_servelet {
    final private String dbURL = "jdbc:mysql://db4free.net:3306/tb_base";   //CHANGE TB_BASE?
    final private String user = "tbadmin";
    final private String password = "admintravel123";
    final private String query = "INSERT INTO TABLE_NAME VALUES (?,?,?,?,?,?,?,?)";  //WRITE TABLE NAME

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(dbURL, user, password);
            PreparedStatement statement = connection.prepareStatement(query);

            statement.setString(1, request.getParameter("name"));
            statement.setString(2, request.getParameter("destination"));
            statement.setString(3, request.getParameter("from"));
            statement.setString(4, request.getParameter("transport"));
            statement.setString(5, request.getParameter("time"));
            statement.setString(6, request.getParameter("date"));
            statement.setString(7, request.getParameter("email"));
            statement.setString(8, request.getParameter("contact"));
            statement.executeUpdate();

            RequestDispatcher display = request.getRequestDispatcher("src/main/webapp/friend_pool/display_message.jsp");  //ADD MESSAGE
            display.forward(request, response);

            statement.close();
            connection.close();
            System.out.println("done!");  // REMOVE

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
