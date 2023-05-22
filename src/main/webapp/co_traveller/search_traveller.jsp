<%--//<%@ page import="jakarta.resource.cci.ResultSet" %>--%>
<%@ page import="com.groupnine.travelbuddy.Co_Traveller.Co_Traveller_Info" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.groupnine.travelbuddy.Co_Traveller.Co_Traveller_Requests" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/co-traveller-user-made-requests"/>
<jsp:include page="/co-traveller-retrieve-user-request"/>
<%
ArrayList<Co_Traveller_Requests> coTravellerUserRequests = (ArrayList<Co_Traveller_Requests>) request.getSession().getAttribute("coTravellerUserRequests");
ArrayList<String> coTravellerUserMadeRequests = (ArrayList<String>) session.getAttribute("coTravellerUserMadeRequests");
ArrayList<Co_Traveller_Info> coTravelersList = (ArrayList<Co_Traveller_Info>) session.getAttribute("coTravelersList");
for(Co_Traveller_Requests a : coTravellerUserRequests) {
System.out.println(a.getFullname());
}
    boolean requestAcceptance = (boolean) request.getSession().getAttribute("coTravellerRequestAcceptance");
    System.out.println(requestAcceptance);
    String userForReqCancel = "";
    Co_Traveller_Info acceptedUserObject = null;
    if(coTravellerUserRequests.size() == 1) {
        userForReqCancel = coTravellerUserMadeRequests.get(0);
        for(Co_Traveller_Info user : coTravelersList) {
            if(user.getMail().equals(userForReqCancel)) {
                acceptedUserObject = user;
                break;
            }
        }
        System.out.println(userForReqCancel);
    }
    boolean requestsMade = true;
    if(coTravellerUserMadeRequests.size() == 0) {
        requestsMade = false;
    }
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
        .table-container {
            display: flex;
            flex-direction: column;
            height: 400px;
            /*transform: translate(100%,600%);*/
        }

        .header-table {
            background-color: #f1f1f1;
        }

        .scrollable-table-container {
            overflow-y: auto;
            flex-grow: 1;
        }

        .scrollable-table {
            width: 100%;
            border-collapse: collapse;
        }

        .scrollable-table td {
            padding: 8px;
            border: 1px solid #000;
        }
        td{
            text-align: center;
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
        <h1>Search For Traveller!</h1>
        <div class="class_contents_form">
            <form action="/co-traveller-search-traveller" method="GET">
                <!-- Form inputs -->
                <label for="destination">Destination:</label>
                <input type="text" id="destination" name="destination"><br><br>

                <label for="date">Date:</label>
                <input type="date" id="date" name="date"><br><br>

                <label for="time">Time:</label>
                <input type="time" id="time" name="time"><br>

                <button type="submit">Search</button>
            </form>
        </div>
        <div class="table-container">
            <h1>CO-Traveller(s)</h1>
            <table class="header-table">
                <tr>
                    <th style="translate: 0px 0px">Co-Travelers</th>
                    <th style="translate: 0px 0px">Action</th>
                </tr>
            </table>
            <div class="scrollable-table-container">
                <table class="scrollable-table">

                        <% if (coTravelersList != null && !coTravelersList.isEmpty()) { %>
                            <% for (Co_Traveller_Info coTraveller : coTravelersList) { %>
                    <tr>
                            <td><%= coTraveller.getName() %></td>
                            <% boolean userMadeRequestFound = false; %>
                            <% if(!requestAcceptance) { %>
                            <% for(String other_user_email : coTravellerUserMadeRequests) {
                                String[] emailAndServiceno = other_user_email.split(" ");
                                if(coTraveller.getMail().equals(emailAndServiceno[0]) && coTraveller.getServiceno() == Integer.parseInt(emailAndServiceno[1])) {
                                    userMadeRequestFound = true;
                                    break;
                            }
                        }
                            if(!userMadeRequestFound) {
                        %>
                        <td><button id="asreqsbutton" onclick="window.location.href='${pageContext.request.contextPath}/co-traveller-request-manager?email=<%=coTraveller.getMail()%>&serviceno=<%=coTraveller.getServiceno()%>'"> Request </button></td>
                        <% } else { %>
                        <TD><p style="color: #00b700;">Requested</p></TD>
                        <% }%>
                    <%}%>
                    </tr>
                    <%}%>
                        <% } %>


                </table>
            </div>

        </div>
    </div>
</div>
</body>
</html>

<script>
    // Function to handle form submission
    function searchCoTravelers() {
        var form = document.getElementById('searchForm');
        var destination = form.elements['destination'].value;
        var date = form.elements['date'].value;
        var time = form.elements['time'].value;

        // Make an AJAX request to the servlet
        var xhr = new XMLHttpRequest();
        xhr.open('GET', '/co-traveller-search-traveller?destination=' + destination + '&date=' + date + '&time=' + time);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                // Parse the JSON response
                var coTravelers = JSON.parse(xhr.responseText);

                // Update the co-travelers' names on the page
                var coTravelersContainer = document.getElementById('coTravelersContainer');
                coTravelersContainer.innerHTML = ''; // Clear previous results

                if (coTravelers.length > 0) {
                    var names = '';
                    for (var i = 0; i < coTravelers.length; i++) {
                        names += coTravelers[i].Name + '<br>';
                    }
                    coTravelersContainer.innerHTML = names;
                } else {
                    coTravelersContainer.textContent = 'No co-travelers found.';
                }
            }
        };
        xhr.send();

        return false; // Prevent form submission
    }

    // Add form submission event listener
    var form = document.getElementById('searchForm');
    form.addEventListener('submit', searchCoTravelers);
</script>

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