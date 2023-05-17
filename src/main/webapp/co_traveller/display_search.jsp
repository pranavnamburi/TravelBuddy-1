<%@ page import="jakarta.resource.cci.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 5/6/2023
  Time: 9:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="${pageContext.request.contextPath}/images/tb_favicon.ico" type="image/x-icon">
    <title>Search Results</title>
    <style>
        .card {
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
            margin: 10px;
            padding: 10px;
        }

        .card h2 {
            margin-top: 0;
        }

        .card p {
            margin: 0;
        }
    </style>
</head>
<body>
<h1>Search Results</h1>

<% ResultSet rs = (ResultSet) request.getAttribute("searchResults"); %>
<% if (rs != null && rs.next()) { %>
<p>Matching passengers:</p>
<% do { %>
<div class="card">
    <h2><%= rs.getString("name") %></h2>
    <p><strong>Source:</strong> <%= rs.getString("source") %></p>
    <p><strong>Destination:</strong> <%= rs.getString("destination") %></p>
    <p><strong>Transport Mode:</strong> <%= rs.getString("transport") %></p>
    <p><strong>Date:</strong> <%= rs.getString("date") %></p>
    <p><strong>Time:</strong> <%= rs.getString("time") %></p>
    <p><strong>Registration Number:</strong> <%= rs.getString("registration") %></p>
    <p><strong>Branch:</strong> <%= rs.getString("branch") %></p>
</div>
<% } while (rs.next()); %>
<% } else { %>
<p>No matching passengers found.</p>
<% } %>

<p><a href="index.jsp">Back to Home</a></p>
</body>
</html>
