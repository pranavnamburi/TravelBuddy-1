<%@ page import="java.sql.*, java.time.LocalDate" %>

<% Class.forName("com.mysql.cj.jdbc.Driver"); %>

<HTML>
<HEAD>
    <TITLE> Join pool </TITLE>
    <link rel="stylesheet" type="text/css" href="join_style.css">

</HEAD>

<BODY>
<%!
    private final static String dbURL = "jdbc:mysql://localhost:3306/practice";
    private final static String user = "root";
    private final static String password = "shizukachan#18";
    private final static String displayQuery = "select * from students_info where deptdate=?";
%>


<%
    Connection connection = DriverManager.getConnection(dbURL, user, password);
    LocalDate d = LocalDate.now();
    String str = d.toString();
    String date = str.substring(8, 10) + str.substring(4, 8) + str.substring(0, 4);
    System.out.println(date);
    PreparedStatement statement = connection.prepareStatement(displayQuery) ;
    statement.setString(1, date);
    ResultSet resultset =
            statement.executeQuery() ;
    if(!resultset.next())
        out.print("no hosts available at the moment! try after sometime");
    else{
%>
<div class="bg-container">
    <div class="card-container">
        <H1>Travellers</H1>
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
            <% }
            }%>
        </TABLE>
    </div>
</div>
</BODY>
</HTML>
