package com.groupnine.travelbuddy;
import java.io.IOException;
import java.sql.*;

import com.groupnine.travelbuddy.TBBase.TBBaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;
import org.apache.commons.configuration2.ex.ConfigurationException;

@WebServlet(name = "profileupdatepassword", value = "/profile-update-password")
public class ProfileUpdatePassword extends HttpServlet{
    // Attributes of Server-url, Host-name, and Host-pass to access the database
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        try {
            Connection con = new TBBaseConnection().getConnection();
            PreparedStatement pst = con.prepareStatement("UPDATE users SET userpass=? WHERE email=?");
            pst.setString(2, (String) req.getSession().getAttribute("user_email"));
            pst.setString(1,req.getParameter("newPassword"));
            pst.executeUpdate();
            pst.close();
            con.close();
            resp.sendRedirect("profile.jsp");
        }catch (ClassNotFoundException | SQLException | IOException | ConfigurationException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Connection con = new TBBaseConnection().getConnection();
            PreparedStatement pst = con.prepareStatement("Select fullname,email,alt_email,mobile from bt_base.users where email=?");
            pst.setString(1, (String) req.getSession().getAttribute("user_email"));
            ResultSet rs = pst.executeQuery();
            req.getSession().setAttribute("rs",rs);
            rs.next();
            System.out.println(rs.getString("fullname"));
            resp.sendRedirect("profile.jsp");
        } catch (SQLException | ConfigurationException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
