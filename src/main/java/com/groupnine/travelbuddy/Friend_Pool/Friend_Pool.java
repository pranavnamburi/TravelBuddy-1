package com.groupnine.travelbuddy.Friend_Pool;

import jakarta.servlet.http.*;
import java.io.*;
import jakarta.servlet.annotation.*;
@WebServlet(name = "friendPool", value = "/friend-pool")
public class Friend_Pool extends HttpServlet {
    String friendmsg="Sharing Auto Page";
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + friendmsg + "</h1>");
        out.println("</body></html>");
    }
    public void destroy() {
    }
}
