package com.groupnine.travelbuddy.Co_Traveller;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
@WebServlet(name = "coTraveller", value = "/co-traveller")
public class Co_Traveller extends HttpServlet{
    String coTravellermsg="Co-Traveller Page";
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + coTravellermsg + "</h1>");
        out.println("</body></html>");
    }
    public void destroy() {
    }
}

