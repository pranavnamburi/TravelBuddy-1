<%@ page import="com.groupnine.travelbuddy.Co_Traveller.Co_Traveller_Requests" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.groupnine.travelbuddy.Co_Traveller.Co_Traveller_Info" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 5/23/2023
  Time: 2:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/co-traveller-retrieve-user-request"/>

<%ArrayList<Co_Traveller_Requests> coTravellerUserRequests = (ArrayList<Co_Traveller_Requests>) request.getSession().getAttribute("coTravellerUserRequests");
    if(coTravellerUserRequests.isEmpty()) {
        System.out.println("Yessss");
    }
ArrayList<Co_Traveller_Info> coTravelersList = (ArrayList<Co_Traveller_Info>) session.getAttribute("coTravelersList");%>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
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
            /*box-shadow: 0 0 6px #318181;*/
            border-color: transparent;
            opacity: 75%;
        }
        .class_menu_icon_in:hover{
            /*box-shadow: 0 0 1px #318181;*/
            border-color: transparent;
            opacity: 100%;
        }
        .class_menu_icon_out:hover {
            box-shadow: 0 0 6px #005e4a;
            border-color: transparent;
        }
        .class_contents {
            flex: 5;
            padding-left: 1%;
            padding-right: 5%;
        }
        .class_contents_title {
            text-align: center;
            font-weight: bolder;
            color: #1e7545;
            height: 5px;
            width: 100%;
            background-color: #fff;
            padding: 15px 20px 25px 20px;
            border-radius: 5px;
            margin: 5px auto;
            translate: 0 200%;
        }
        .class_contents_requests_container {
            height: 50%;
            width: 100%;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            margin: 0 auto;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            translate: 0 22%;
            overflow-y: scroll;
            overflow-x: hidden;
        }
        .class_contents_requests_container::-webkit-scrollbar {
            width: 2px;
            background-color: white;
        }
        .class_contents_requests_container::-webkit-scrollbar-thumb {
            background-color: green;
            border-radius: 5px;
        }
        .class_contents_request {
            position: relative;
            width: 100%;
            height: 15%;
            background-color: white;
            border-radius: 2px;
            border: 1px solid whitesmoke;
            box-shadow: 1px 1px 4px #556270;
            display: flex;
            align-content: center;
            align-items: center;
            justify-content: center;
            margin-bottom: 10px;
        }
        .class_contents_request_name {
            position: relative;
            height: 20px;
            flex: 3;
            left: 3%;
            margin-top: -25px;
        }
        .class_contents_request_email {
            position: relative;
            height: 20px;
            flex: 4;
            left: 3%;
            margin-top: -25px;
        }
        .class_contents_request_mobile {
            position: relative;
            height: 20px;
            flex: 3;
            margin-top: -25px;
        }
        .class_contents_request_accept {
            position: relative;
            flex: 1;
        }
        .class_contents_request_reject {
            position: relative;
            flex: 1;
        }
        .class_contents_request_text{
            position: relative;
            flex: 1;
        }
        .class_contents_request_accept a, .class_contents_request_reject a {
            border-radius: 15px;
            border: 2px solid #00b700;
            background-color: #0cd226;
            color: white;
            height: 20px;
            width: 75px;
            text-decoration: none;
            display: inline-block;
            text-align: center;
            line-height: 20px;
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
        <div class="class_contents_title">
            Requests
        </div>
        <div class="class_contents_requests_container">
            <% for(Co_Traveller_Requests data : coTravellerUserRequests) { %>
                <div class="class_contents_request">
                    <div class="class_contents_request_name"><span style="font-weight: bold">Name</span><br><%=data.getFullname()%></div>
                    <div class="class_contents_request_email"><span style="font-weight: bold">Email</span><br><%=data.getEmail()%></div>
                    <% String dataStatus = data.getStatus(); %>
                    <% if(dataStatus.equals("pending")) { %>
                            <div class="class_contents_request_accept"><a href="${pageContext.request.contextPath}/co-traveller-manipulate-user-requests?status=accept&other_user_email=<%=data.getEmail()%>&serviceno=<%=data.getServiceno()%>">Accept</a></div>
                            <div class="class_contents_request_reject"><a href="${pageContext.request.contextPath}/co-traveller-manipulate-user-requests?status=reject&other_user_email=<%=data.getEmail()%>&serviceno=<%=data.getServiceno()%>">Reject</a></div>
                    <% } else { %>
                            <div class="class_contents_request_text"><span style="color:limegreen">Joined</span></div>
                    <% } %>
                </div>
            <% } %>
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
