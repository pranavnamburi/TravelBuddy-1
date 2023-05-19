package com.groupnine.travelbuddy;
import java.io.IOException;
import java.sql.*;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;
@WebServlet(name = "profileupdatepassword", value = "/profile-update-password")
public class ProfileUpdatePassword extends HttpServlet{
    // Attributes of Server-url, Host-name, and Host-pass to access the database
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        String dbUrl = "jdbc:mysql://db4free.net:3306/tb_base";
        String dbUser = "tbadmin";
        String dbPassword = "admintravel123";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
            PreparedStatement pst = con.prepareStatement("Select fullname,email,alt_email,mobile from users where email=?");
            pst.setString(1, (String) req.getSession().getAttribute("user_email"));
            ResultSet rs = pst.executeQuery();
            req.getSession().setAttribute("rs",rs);
            pst = con.prepareStatement("UPDATE users SET userpass=? WHERE email=?");
            pst.setString(2,req.getParameter("oldPassword"));
            pst.setString(1,req.getParameter("newPassword"));
            pst.executeUpdate();
            con.close();
            resp.sendRedirect("profile.jsp");
        }catch (ClassNotFoundException | SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }

}
