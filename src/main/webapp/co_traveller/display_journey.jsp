<%@ page import="com.groupnine.travelbuddy.Co_Traveller.Co_Traveller_Info" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/co-traveller-display-add-journey"/>
<jsp:include page="/co-traveller-search-traveller">
    <jsp:param name="getalldata" value="true" />
</jsp:include>
<% ArrayList<Co_Traveller_Info> journeyList = (ArrayList<Co_Traveller_Info>) session.getAttribute("journeyList");
    boolean isRegistered = (boolean) session.getAttribute("isCoTravellerRegistered");
%>
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
            height: 75%;
        }
        .class_menu_bar_items_bottom{
            position: relative;
            height: 20%;
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
        }
        @keyframes slide_left {
            0% {transform: translate(0%, 0); flex: 1;}
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
        .class_sos, .class_logout{
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
        .class_sos:hover, .class_logout:hover {
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
            transform: translate(280%, -10%);
        }
        .class_contents_body_mention_records h2 {
            position: relative;
            top: 10px;
            margin: 0;
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

        .card h2 {
            margin-top: 0;
        }

        .card p {
            margin: 0;
        }


        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }
        .add-button {
            padding: 10px 43px;
            background: linear-gradient(to right, #5D26C1, #a17fe0, #59C173);
            color: white;
            border: none;
            cursor: pointer;
            margin-bottom: 10px;
        }

        .search-button {
            align-items: end;
            padding: 10px 30px;
            background:linear-gradient(to right, #5D26C1, #a17fe0, #59C173);
            color: white;
            border: none;
            cursor: pointer;
            margin-bottom: 10px;
        }
        .requests-button{
            align-items: end;
            padding: 10px 30px;
            background:linear-gradient(to right, #5D26C1, #a17fe0, #59C173);
            color: white;
            border: none;
            cursor: pointer;
            margin-bottom: 10px;
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
            <button onclick="window.location.href='/friend_pool/friend_pool.jsp';" class="class_friend_pool">Friend Pooling</button><br>
            <button onclick="window.location.href='/display_journey.jsp';" class="class_co_travel">Co-Traveller</button><br>
            <button onclick="window.location.href='/share_auto/auto_share.jsp';" class="class_share_auto">Auto Share</button><br>
        </div>
        <div class="class_menu_bar_items_bottom">
            <button onclick="window.location.href='${pageContext.request.contextPath}/sos_button';" class="class_sos">SOS</button><br>
            <button onclick="window.location.href='${pageContext.request.contextPath}/logout_button';" class="class_logout">Logout</button>
        </div>
    </div>
    <div class="class_contents">
        <div class="class_contents-body">
            <h1>CO - TRAVELLER</h1>
            <div><button class="add-button" onclick="window.location.href='add_journey_form.jsp'">Add-journey</button></div>
            <div><button class="search-button" onclick="window.location.href='search_traveller.jsp'">Search-Traveller</button></div>
            <div><button id="requests_button" class="requests-button" onclick="window.location.href='/co_traveller/search_traveller_requests.jsp'">Requests</button></div>
            <div class="class_contents_body_table">
                <h1>(${journeyList.size()}) CURRENT - JOURNEY(S)</h1>
                <table>
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Transportation</th>
                        <th>Service Number</th>
                        <th>From</th>
                        <th>To</th>
                        <th>Date</th>
                        <th>Time</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% System.out.println("yes"); %>
                    <%
                        for (Co_Traveller_Info journey : journeyList) {
                            System.out.println(journey.getName());
                    %>
                    <tr>
                        <td><%= journey.getName() %></td>
                        <td><%= journey.getTransportation() %></td>
                        <td><%= String.valueOf(journey.getServiceno()) %></td>
                        <td><%= journey.getFromplace() %></td>
                        <td><%= journey.getToplace() %></td>
                        <td><%= journey.getDateInString() %></td>
                        <td><%= journey.getTimeInString() %></td>
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
<script>
    let isRegistered = <%=isRegistered%>;
    let requests_button = document.getElementById("requests_button");
    if(isRegistered) {
        requests_button.style.display = "none";
    } {
        requests_button.style.display = "block";
    }
</script>
</body>
</html>
