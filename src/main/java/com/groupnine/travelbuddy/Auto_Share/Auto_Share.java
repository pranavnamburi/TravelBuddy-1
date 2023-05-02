package com.groupnine.travelbuddy.Auto_Share;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "autoshare", value = "/auto-share")
public class Auto_Share extends HttpServlet{
    String automsg="Auto Share Page";
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
