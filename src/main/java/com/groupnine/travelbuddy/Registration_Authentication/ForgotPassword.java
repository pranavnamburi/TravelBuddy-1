package com.groupnine.travelbuddy.Registration_Authentication;

import com.groupnine.travelbuddy.TBBase.TBBaseConnection;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.configuration2.ex.ConfigurationException;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

@WebServlet(name="forgotpassword", value="/forgot_pass")
public class ForgotPassword extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()";

        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder(10);

        for (int i = 0; i < 10; i++) {
            int randomIndex = random.nextInt(characters.length());
            char randomChar = characters.charAt(randomIndex);
            sb.append(randomChar);
        }
        final String acquiredEmail =  req.getParameter("email");
        String newpass = sb.toString();
        try {
            Connection connection = new TBBaseConnection().getConnection();
            PreparedStatement statement = connection.prepareStatement("UPDATE users SET userpass=? where email=?");
            statement.setString(1,newpass);
            statement.setString(2,acquiredEmail);
            statement.executeUpdate();
        }
        catch (ClassNotFoundException | SQLException | ConfigurationException e) {
            throw new RuntimeException(e);
        }
        String host = "smtp.outlook.com";
        int port = 587;

        // Create properties object and configure SMTP server
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        String senderEmail = "buddy.travel@outlook.com";
        String senderPassword = "buddy_travel_srmap";
        // Create session with authenticator
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });
        try {
            // Create message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(acquiredEmail));
            message.setSubject("Forget Password");
            message.setText("Your updated password is : "+newpass+"\n\nUse this PASSWORD to login and under profile section you change your password using UPDATE PASSWORD\n\nRegards,\nTravel Buddy\n");
            // Send message
            Transport.send(message);
            System.out.println("Email sent successfully!");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        resp.sendRedirect("/login_page.jsp");
    }
}
