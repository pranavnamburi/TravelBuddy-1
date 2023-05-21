<%@ page import="com.groupnine.travelbuddy.Co_Traveller.Co_Traveller_Info" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <link rel="icon" href="${pageContext.request.contextPath}/images/tb_favicon.ico" type="image/x-icon">
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
            background-image: url('/images/tb_favicon.ico');
            background-repeat: no-repeat;
            background-size: 45px 45px;
            background-color: #fcee16;
            background-position: center;
            padding-left: 20px;
            border-radius: 50%;
            margin: 15px;
            transform: translate(5%, 0%);
        }
        .class_menu_icon_in:hover, .class_menu_icon_out:hover {
            background-image: url('/images/tb_favicon.ico');
            background-repeat: no-repeat;
            padding-left: 20px;
            background-size: 43px 43px;
            background-position: center;
            background-color: #fcee16;
        }
        .class_menu_icon_out {
            position: absolute;
            box-shadow: 0 0 12px #005e4a;
            border-color: transparent;
        }
        .class_menu_icon_in {
            position: relative;
            border-color: transparent;
            opacity: 75%;
        }
        .class_menu_icon_in:hover{
            border-color: transparent;
            opacity: 100%;
        }
        .class_menu_icon_out:hover {
            box-shadow: 0 0 6px #005e4a;
            border-color: transparent;
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
        #adj{
            position: absolute;
            transform: translate(300%,200%);
            background-color:#00bf8f;
            width: 100px;
            height: 30px;
            font-style: italic;
        }
        #sj{
            position: absolute;
            transform: translate(500%,300%);
            background-color: #00bf8f;
            width: 100px;
            height: 30px;
            font-style: italic;
        }
        .class_contents_body {
            height: 75%;
            border-top-right-radius: 25px;
            border-top-left-radius: 25px;
        }
        .class_contents_body_mention_records {
            position: relative;
            top: 10px;
            margin-bottom: 10px;
            height: 50px;
            width: 400px;
            text-align: center;
            border-top-left-radius: 10px;
            border-top-right-radius: 20px;
            background-color: #f4fa6a;
        }
        .class_contents_body_mention_records h2 {
            position: relative;
            top: 10px;
            margin: 0;
        }
        .class_contents_body_table2 {
            background-color: #f0f58e;
            overflow-y: auto;
            height: 70%;
        }
        .class_contents_body_table2::-webkit-scrollbar {
            width: 10px;
            background-color: #eef38d;
        }
        .class_contents_body_table2::-webkit-scrollbar-thumb {
            background-color: green;
            border-radius: 5px;
        }
        .class_contents_body_table1 table, .class_contents_body_table2 table{
            width: 100%;
            height: 5%;
            background-color: #f0f58e;
        }
        .class_contents_body_table1 th{
            border-top: 1px solid #f6ffc1;
            border-bottom: 1px solid #b2c910;
            height: 45px;
            width: 5%;
        }
        .class_contents_body_table2 td{
            text-align: center;
            border-bottom: 1px solid #dce507;
            height: 45px;
            width: 15%;
        }
        .class_contents_body_table2 a {
            border-radius: 15px;
            border: 2px solid #c9d20d;
            background-color: #00731f;
            color: #f4fa6a;
            height: 20px;
            width: 75px;
            text-decoration: none;
            display: inline-block;
            text-align: center;
            line-height: 20px;
        }
        .class_contents_body_table2 a:hover {
            background-color: #c9d20d;
            border-color: #00731f;
            color: #00731f;
            font-weight: bold;
        }
        .card {
            position: absolute;
            transform: translate(20%,50%);
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
<button class="class_menu_icon_out" id="menu_icon_out"></button>
<div class="class_home">
    <div class="class_menu" id="menu">
        <div class="class_menu_bar_items_head">
            <button class="class_menu_icon_in" id="menu_icon_in"></button><br>
        </div>
        <div class="class_menu_bar_items_top">
            <button onclick="window.location.href='/../index.jsp';" class="class_home_nav">Home</button>
            <button onclick="window.location.href='/../profile.jsp';" class="class_profile">Profile</button><br>
            <button onclick="window.location.href='friends_pool.jsp';" class="class_friend_pool">Friend Pooling</button><br>
            <button onclick="window.location.href='co-traveller.jsp';" class="class_co_travel">Co-Traveller</button><br>
            <button onclick="window.location.href='share_auto/auto_share.jsp';" class="class_share_auto">Auto Share</button><br>
        </div>
        <div class="class_menu_bar_items_bottom">
            <button class="class_sos">SOS</button><br>
        </div>
    </div>
    <div class="class_contents">
        <div class="class_contents-body">
            <div><button id="adj" onclick="window.location.href='add_journey_form.jsp'">Add-journey</button></div>
            <div><button id="sj" onclick="window.location.href='search_traveller.jsp'">Search-Traveller</button></div>
            <div class="class_contents_body_table">
                <table>
                    <thead>
                    <tr>
                        <th>Transportation</th>
                        <th>Service Number</th>
                        <th>From</th>
                        <th>To</th>
                        <th>Date</th>
                        <th>Time</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% List<Co_Traveller_Info> journeyList = (List<Co_Traveller_Info>) request.getAttribute("journeyList");
                        for (Co_Traveller_Info journey : journeyList) { %>
                    <tr>
                        <td><%= journey.getTransportation() %></td>
                        <td><%= journey.getServiceno() %></td>
                        <td><%= journey.getFromplace() %></td>
                        <td><%= journey.getToplace() %></td>
                        <td><%= journey.getDate() %></td>
                        <td><%= journey.getTime() %></td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>

        </div>
</div>
    </div>
</div>
<script>
    let menu = document.getElementById("menu");
    let menu_icon_out = document.getElementById("menu_icon_out");
    let menu_icon_in = document.getElementById("menu_icon_in");
    menu.style.setProperty("animation", "0ms linear 0s slide_left forwards");
    menu_icon_in.onclick = ()  => {
        menu.style.setProperty("animation", "300ms linear 0s slide_left forwards")
    }
    menu_icon_out.onclick = () => {
        menu.style.setProperty("animation", "300ms linear 0s slide_right forwards");
    }

</script>
</body>
</html>
