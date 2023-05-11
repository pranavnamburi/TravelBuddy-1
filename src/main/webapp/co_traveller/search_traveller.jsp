<%@ page import="jakarta.resource.cci.ResultSet" %><%--
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 5/6/2023
  Time: 7:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Travel Buddy</title>
    <style>
        html, body, .class_home {
            height: 100%;
            margin: 0;
            color: #00741f;
            overflow: hidden;
            background: #43C6AC;  /* fallback for old browsers */
            background: -webkit-linear-gradient(to left, #F8FFAE, #43C6AC);  /* Chrome 10-25, Safari 5.1-6 */
            background: linear-gradient(to left, #F8FFAE, #43C6AC); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
        }
        .class_home {
            display: flex;
        }
        .class_menu_bar_items_head {
            position: relative;
            background-color: rgba(0, 0, 0, 0.73);
            height: 12%;
            width: 104%;
        }
        .class_menu_bar_items_top{
            position: relative;
            height: 80%;
        }
        .class_menu_bar_items_bottom{
            position: relative;
            height: 14%;
        }
        .class_menu{
            height: 100%;
            background: #4ECDC4;  /* fallback for old browsers */
            background: -webkit-linear-gradient(to right, #556270, #4ECDC4);  /* Chrome 10-25, Safari 5.1-6 */
            background: linear-gradient(to right, #556270, #4ECDC4); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            box-sizing: border-box;
            /*box-shadow: 1px 5px 3px 1px #557321;*/
            border-right: 1px solid black;
            padding-right: 8px;
            flex: 1;
        }
        @keyframes slide_left {
            0% {}
            100% {transform: translate(-100%, 0); flex: 0;}
        }
        @keyframes slide_right {
            0% {transform: translate(-100%, 0); flex: 0;}
            100% {transform: translate(0%, 0); flex: 1;}
        }
        .class_home_nav, .class_friend_pool, .class_co_travel, .class_share_auto, .class_profile{
            color: white;
            width: 93%;
            height: 32px;
            font-weight: bolder;
            background: #00bf8f;  /* fallback for old browsers */
            background: -webkit-linear-gradient(to top, #001510, #00bf8f);  /* Chrome 10-25, Safari 5.1-6 */
            background: linear-gradient(to top, #001510, #00bf8f); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            margin: 5px 0 10px 10px;
            border-radius: 21px;
            border-style: inset;
            border-width: 2px;
            border-color: cadetblue;
            translate: 0 50%;
        }
        .class_home_nav:hover, .class_friend_pool:hover, .class_co_travel:hover, .class_share_auto:hover, .class_profile:hover {
            opacity: 75%;
            border: 1px solid white;
        }
        .class_sos{
            color: white;
            width: 93%;
            height: 32px;
            font-weight: bolder;
            background: #00bf8f;  /* fallback for old browsers */
            background: -webkit-linear-gradient(to top, #001510, #00bf8f);  /* Chrome 10-25, Safari 5.1-6 */
            background: linear-gradient(to top, #001510, #00bf8f); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            margin: 5px 0 10px 10px;
            border-radius: 21px;
            border-style: inset;
            border-width: 2px;
            border-color: #1e7545;
        }
        .class_sos:hover {
            opacity: 75%;
            border: 1px solid white;
        }
        .class_menu_icon_in, .class_menu_icon_out {
            width: 50px;
            height: 50px;
            font-weight: bold;
            color: #1e7545;
            background:linear-gradient(90deg, hsla(136, 48%, 54%, 1) 0%, hsla(58, 99%, 48%, 1) 100%);
            border-radius: 50%;
            border: 4px solid #f4fa6a;
            margin: 15px;
            transform: translate(5%, 0%);
        }
        .class_menu_icon_in:hover, .class_menu_icon_out:hover {
            color: white;
            background:linear-gradient(90deg, hsla(136, 48%, 54%, 1) 0%, hsla(58, 99%, 48%, 1) 100%);
            opacity: 75%;
        }
        .class_menu_icon_out {
            position: absolute;
        }
        .class_menu_icon_in {
            position: relative;
        }
        .class_contents {
            flex: 5;
            padding: 3%;
        }
        .class_friend_pool_heading button {
            border: none;
            background-color: transparent;
            color: white;
        }
        .class_contents_share_auto img {
            width: 300px;
            height: 200px;
            transform: translate(300%,-10%) ;
        }
        .class_contents_friend_pool img {
            width: 300px;
            height: 200px;
            transform: translate(280%,-10%) ;
        }
        .class_contents_co_travel img {
            width: 300px;
            height: 200px;
            transform: translate(280%,-10%) ;
        }
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
<div class="class_home">
    <form action="${pageContext.request.contextPath}/co-traveller-search-traveller" method="GET">
        <label for="source">Source:</label>
        <input type="text" id="source" name="source"><br><br>
        <label for="destination">Destination:</label>
        <input type="text" id="destination" name="destination"><br><br>
        <label for="transport">Transport Mode:</label>
        <select id="transport" name="transport">
            <option value="bus">Bus</option>
            <option value="train">Train</option>
        </select><br><br>
        <label for="date">Date:</label>
        <input type="date" id="date" name="date"><br><br>
        <label for="time">Time:</label>
        <input type="time" id="time" name="time"><br><br>
        <input type="submit" value="Submit">
    </form>
    <div>
        <% ResultSet rs = (ResultSet)   request.getAttribute("searchResults"); %>
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
    </div>

</div>


</body>
</html>
