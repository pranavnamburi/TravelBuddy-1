<%@ page import="java.util.ArrayList" %>
<%@ page import="com.groupnine.travelbuddy.Auto_Share.AutoShareInfo" %>
<%@ page import="com.oracle.wls.shaded.org.apache.xpath.operations.Bool" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/auto_share_retreive_data"/>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    if(session.getAttribute("logged_in") == null) {
        session.setAttribute("logged_in", "false");
    }
    ArrayList<AutoShareInfo> autoShareInfos = (ArrayList<AutoShareInfo>) session.getAttribute("autoShareInfos");
    Boolean isRegistered = (Boolean) session.getAttribute("isRegistered");
%>

<!DOCTYPE html>
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
        .class_contents_top {
            height: 15%;
        }
        #asunregbutton, #asreqsbutton {
            position: relative;
            top: 40%;
            bottom:50%;
            background-color: #45ffbe;
            border-radius: 20px;
            width: 110px;
            height: 35px;
            font-size: medium;
            border-color: #f4fa6a;
            border-style: solid;
            border-width: 1px;
            color: #bcc446;
            display: none;
        }
        #asunregbutton:hover, #asreqsbutton:hover {
            position: relative;
            top: 40%;
            bottom:50%;
            background-color: #23e39e;
            border-radius: 20px;
            width: 110px;
            height: 35px;
            font-size: medium;
            font-weight: bold;
            border-color: #f4fa6a;
            border-style: solid;
            border-width: 1px;
            color: #e1ee9e;
            display: none;
        }
        #asregbutton {
            position: relative;
            top: 40%;
            bottom:50%;
            background-color: #45ffbe;
            border-radius: 20px;
            width: 180px;
            height: 35px;
            font-size: medium;
            border-color: #f4fa6a;
            border-style: solid;
            border-width: 1px;
            color: #bcc446;
            display: none;
        }
        #asregbutton:hover {
            position: relative;
            top: 40%;
            bottom:50%;
            background-color: #23e39e;
            border-radius: 20px;
            width: 180px;
            height: 35px;
            font-size: medium;
            font-weight: bold;
            border-color: #f4fa6a;
            border-style: solid;
            border-width: 1px;
            color: #e1ee9e;
            display: none;
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
            width: 20%;
        }
        .class_contents_bottom {
            height: 10%;
            background-color: #95ff8c;
        }
    </style>
</head>
<body>
<button class="class_menu_icon_out" id="menu_icon_out">!TB</button>
<div class="class_home">
    <div class="class_menu" id="menu">
        <div class="class_menu_bar_items_head">
            <button class="class_menu_icon_in" id="menu_icon_in">!TB</button><br>
        </div>
        <div class="class_menu_bar_items_top">
            <button onclick="window.location.href='practice.jsp';" class="class_home_nav">Home</button>
            <button onclick="window.location.href='#';" class="class_profile">Profile</button><br>
            <button onclick="window.location.href='friends_pool.jsp';" class="class_friend_pool">Friend Pooling</button><br>
            <button onclick="window.location.href='co-traveller.jsp';" class="class_co_travel">Co-Traveller</button><br>
            <button onclick="window.location.href='auto_share.jsp';" class="class_share_auto">Auto Share</button><br>
        </div>
        <div class="class_menu_bar_items_bottom">
            <button class="class_sos">SOS</button><br>
        </div>
    </div>
    <div class="class_contents">
        <div class="class_contents_top">
            <button id="asregbutton" onclick="window.location.href='auto_share_registration.jsp'"> Register Auto-Share </button>
            <button id="asunregbutton" onclick="window.location.href='auto_share_registration.jsp'"> Unregister </button>
            <button id="asreqsbutton" onclick="window.location.href='auto_share_requests.jsp'"> Requests </button>
        </div>
        <div class="class_contents_body">
            <div class="class_contents_body_mention_records"><h2>100 no. of autoshares recorded</h2></div>
            <div class="class_contents_body_table1">
                <table>
                    <tr>
                        <th>Name</th>
                        <th>To Place</th>
                        <th>No Of Vacancies</th>
                        <th>Date</th>
                        <th><p>Timeframe</p></th>
                        <th><p>Request</p></th>
                    </tr>
                </table>
            </div>
            <div class="class_contents_body_table2">
                <table>
                    <tr>
                        <td>Name1</td>
                        <td>Place1</td>
                        <td>NOV1</td>
                        <td>Date1</td>
                        <td>Timeframe1</td>
                        <td>Request</td>
                    </tr>
                    <c:forEach var="data" items="${autoShareInfos}">
                        <tr>
                            <td>${data.getFullname()}</td>
                            <td>${data.getPlace()}</td>
                            <td>${data.getNo_of_vacs()}</td>
                            <td>${data.getDateInString()}</td>
                            <td>${data.getTimeInString()}</td>
                            <td>Text Here</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <div class="class_contents_bottom">

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
    <%--let isRegistered = '<%= isRegistered %>';--%>
    let isRegistered = false;
    let aSRegButton = document.getElementById("asregbutton");
    let aSUnRegButton = document.getElementById("asunregbutton");
    let aSReqsButton = document.getElementById("asreqsbutton");
    if(isRegistered == true){
        aSRegButton.style.display = "none";
        aSUnRegButton.style.display = "inline";
        aSReqsButton.style.display = "inline";
    } else {
        aSUnRegButton.style.display = "none";
        aSReqsButton.style.display = "none";
        aSRegButton.style.display = "inline";
    }
</script>
</body>
</html>
