package com.groupnine.travelbuddy.Auto_Share;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "autoshare", value = "/auto-share")
public class Auto_Share extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String host = "jdbc:mysql://db4free.net:3306/tb_base";
        String userName = "tbadmin";
        String userPass = "admintravel123";

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String host = "jdbc:mysql://db4free.net:3306/tb_base";
        String userName = "tbadmin";
        String userPass = "admintravel123";
        try {
            // Checking if JDBC driver for MySQL exist in the project
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Making a new connection to MySQL server
            Connection connection = DriverManager.getConnection(host, userName, userPass);
            // Instantiating a new Prepared Statement (known as pre-compiled statement) to insert the acquired data
            PreparedStatement statement = connection.prepareStatement("INSERT INTO users(fullname, email, alt_email, mobile, userpass) VALUES (?,?,?,?,?)");
            // Moving the data into the statement
            statement.setString(1, req.getParameter("fullname"));
            statement.setString(2, req.getParameter("email"));
            statement.setString(3, req.getParameter("alt_email"));
            statement.setString(4, req.getParameter("mobile"));
            statement.setString(5, req.getParameter("password"));
            // Executing the statement with all the data provided
            statement.executeUpdate();
            // Closing the statement
            statement.close();
            // Closing the connection to the database
            connection.close();
            resp.sendRedirect("login_page.jsp");
        } catch (ClassNotFoundException | SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void destroy() {

    }
}
