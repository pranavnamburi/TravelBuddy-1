package com.groupnine.travelbuddy.Registration_Authentication;

import com.groupnine.travelbuddy.TBBase.TBBaseConnection;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;
import org.apache.commons.configuration2.ex.ConfigurationException;

import java.io.IOException;
import java.sql.*;

import java.sql.DriverManager;

@WebServlet(name = "authentication", value = "/auth")
public class Authentication  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // Attributes of Server-url, Host-name, and Host-pass to access the database
        DriverManager.setLoginTimeout(30);
        try {
            final String acquiredEmail =  req.getParameter("email");
            final String acquiredPass = req.getParameter("password");
            boolean userValid = false;
            // Making a new connection to MySQL server
            Connection connection = new TBBaseConnection().getConnection();
            // Instantiating a new Prepared Statement (known as pre-compiled statement) to insert the acquired data
            PreparedStatement statement = connection.prepareStatement("SELECT email, userpass FROM bt_base.users");
            ResultSet resultSet = statement.executeQuery();
            while(resultSet.next() && !userValid) {
                boolean emailFound = acquiredEmail.equals(resultSet.getString("email"));
                boolean passValid = acquiredPass.equals(resultSet.getString("userpass"));
                if(emailFound && passValid) {
                    userValid = true;
                }
            }
            if(userValid) {
                req.getSession().setAttribute("logged_in", "true");
                req.getSession().setAttribute("user_email", acquiredEmail);
                resp.sendRedirect("index.jsp");
                System.out.println("Successfully logged in");
            } else {
                req.getSession().setAttribute("foundError", Boolean.valueOf(true));
                System.out.println("Got error!");
                resp.sendRedirect("login_page.jsp");
            }
            // Closing the statement
            statement.close();
            // Closing the connection to the database
            connection.close();
        } catch (ClassNotFoundException | SQLException | ConfigurationException e) {
            throw new RuntimeException(e);
        }
    }
}
