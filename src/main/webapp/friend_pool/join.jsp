<%--
  Created by IntelliJ IDEA.
  User: sathwik
  Date: 19-05-2023
  Time: 00:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*, java.time.LocalDate" %>

<% Class.forName("com.mysql.cj.jdbc.Driver"); %>

<HTML>
<HEAD>
    <TITLE> Join pool </TITLE>
</HEAD>

<BODY>
<%!
    private final static String dbURL = "jdbc:mysql://localhost:3306/practice";
    private final static String user = "root";
    private final static String password = "shizukachan#18";
    private final static String displayQuery = "select * from students_info where deptdate=?";
%>
<H1>Travellers</H1>

<%
    //Connection connection = DriverManager.getConnection(
    //		"jdbc:mysql://localhost:3306/practice", "root", "shizukachan#18");
    Connection connection = DriverManager.getConnection(dbURL, user, password);
    LocalDate d = LocalDate.now();
    String str = d.toString();
    String date = str.substring(8, 10) + str.substring(4, 8) + str.substring(0, 4);
    System.out.println(date);
    PreparedStatement statement = connection.prepareStatement(displayQuery) ;
    statement.setString(1, date);
    ResultSet resultset =
            statement.executeQuery() ;   //if table is empty then display "wait for some time"
%>

<TABLE BORDER="1">
    <TR>
        <TH>Name</TH>
        <TH>To</TH>
        <TH>From</TH>
        <TH>Means of Transport</TH>
        <TH>Departure Time</TH>
        <TH>Email</TH>
        <TH>Contact</TH>
        <TH>Departure Date</TH>
    </TR>
    <% while(resultset.next()){ %>
    <TR>
        <TD> <%= resultset.getString(1) %></TD>
        <TD> <%= resultset.getString(2) %></TD>
        <TD> <%= resultset.getString(3) %></TD>
        <TD> <%= resultset.getString(4) %></TD>
        <TD> <%= resultset.getString(5) %></TD>
        <TD> <%= resultset.getString(6) %></TD>
        <TD> <%= resultset.getString(7) %></TD>
        <TD> <%= resultset.getString(8) %></TD>
    </TR>
    <% } %>
</TABLE>
</BODY>
</HTML>
