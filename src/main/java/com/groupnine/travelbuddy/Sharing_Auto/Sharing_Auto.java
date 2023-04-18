package com.groupnine.travelbuddy.Sharing_Auto;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "sharingAuto", value = "/sharing-auto")
public class Sharing_Auto extends HttpServlet{
    String automsg="Sharing Auto Page";
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + automsg + "</h1>");
        out.println("</body></html>");
    }
    public void destroy() {
    }
}
