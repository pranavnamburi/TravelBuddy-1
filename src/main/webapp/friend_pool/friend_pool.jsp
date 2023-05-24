<%@ page import="java.sql.*, java.time.LocalDate" %>
<%@ page import="com.groupnine.travelbuddy.Friend_Pool.FriendPoolInfo" %>
<%@ page import="java.util.ArrayList" %>

<jsp:include page="/friend_pool_retreive_data"/>
<jsp:include page="/friend_pool_retreive_user_made_requests"/>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    if(session.getAttribute("logged_in") == null) {
        session.setAttribute("logged_in", "false");
    }
    ArrayList<FriendPoolInfo> friendPoolInfos = (ArrayList<FriendPoolInfo>) session.getAttribute("friendPoolInfos");
    ArrayList<String> friendPoolUserMadeRequests = (ArrayList<String>) session.getAttribute("friendPoolUserMadeRequests");
    boolean isRegistered = (boolean) request.getSession().getAttribute("isFriendPoolRegistered");
    boolean requestAcceptance = (boolean) request.getSession().getAttribute("friendPoolRequestAcceptance");
    System.out.println(requestAcceptance);
    String userForReqCancel = "";
    FriendPoolInfo acceptedUserObject = null;
    if(friendPoolUserMadeRequests.size() == 1) {
        userForReqCancel = friendPoolUserMadeRequests.get(0);
        for(FriendPoolInfo user : friendPoolInfos) {
            if(user.getEmail().equals(userForReqCancel)) {
                acceptedUserObject = user;
                break;
            }
        }
        System.out.println(userForReqCancel);
    }
    boolean requestsMade = true;
    if(friendPoolUserMadeRequests.size() == 0) {
        requestsMade = false;
    }
    int noOfVacanciesLeftOver = 0;
    if(isRegistered) {
        for (FriendPoolInfo user : friendPoolInfos) {
            if (user.getEmail().equals(session.getAttribute("user_email"))){
                noOfVacanciesLeftOver = user.getCapacity();
            }
        }
    }
    for(FriendPoolInfo user : friendPoolInfos) {
        System.out.println(user.getFullname());
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <link rel="icon" href="${pageContext.request.contextPath}/images/tb_favicon.ico" type="image/x-icon">
    <link rel="join_style.css" type="text/css">
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
        .class_contents_top {
            height: 15%;
        }
        #asunregbutton, #asreqsbutton {
            position: relative;
            top: 40%;
            bottom:50%;
            background-color: #45ffbe;
            border-radius: 20px;
            width: auto;
            height: 35px;
            font-size: medium;
            border-color: #f4fa6a;
            border-style: solid;
            border-width: 1px;
            color: #bcc446;
            display: none;
        }
        #asunregbutton:hover, #asreqsbutton:hover{
            position: relative;
            top: 40%;
            bottom:50%;
            background-color: #23e39e;
            border-radius: 20px;
            width: auto;
            height: 35px;
            font-size: medium;
            font-weight: bold;
            border-color: #f4fa6a;
            border-style: solid;
            border-width: 1px;
            color: #e1ee9e;
            display: none;
        }
        #ascancelreqbutton {
            position: relative;
            top: 40%;
            bottom:50%;
            background-color: #45ffbe;
            border-radius: 20px;
            width: 150px;
            height: 35px;
            font-size: medium;
            border-color: #f4fa6a;
            border-style: solid;
            border-width: 1px;
            color: #bcc446;
            display: none;
        }
        #ascancelreqbutton:hover {
            position: relative;
            top: 40%;
            bottom:50%;
            background-color: #23e39e;
            border-radius: 20px;
            width: 150px;
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

        .card-container {
            background-color: #f7fbff;
            padding: 10px;
            border-radius: 8px;
            text-align: center;
        }

        table {
            border-collapse: separate;
            background: #fff;
            border-radius: 5px;
            margin: 50px auto;
            box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
            translate: 0 -50px;
            text-align: center;
        }

        .scrollable-table {
            overflow-y: auto;
            display: block;
            height: 250px; /* Set the desired height of the scrollable area */
        }
        .scrollable-table table {
            table-layout: fixed;
            width: 100%;
        }
        .scrollable-table thead {
            position: sticky;
            top: 0;
            background-color: #fff; /* Set the desired background color */
        }
        thead th {
            font-family: 'Patua One', cursive;
            font-size: 16px;
            font-weight: 400;
            text-align: center;
            padding: 10px;
            border-top: 1px solid #858d99;
        }
        thead {
            z-index: 1;
        }

        thead th:first-child {
            border-top-left-radius: 5px;
        }

        thead th:last-child {
            border-top-right-radius: 5px;
        }

        tr td {
            font-family: 'Open Sans', sans-serif;
            font-weight: 400;
            color: #5f6062;
            font-size: 13px;
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #e0e0e0;
        }

        tbody tr:nth-child(2n) {
            background: #f0f3f5;
        }

        tbody tr:last-child td {
            border-bottom: none;
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;
        }

        tbody tr:hover>td {
            opacity: 0.5;
        }

        tbody tr:hover>tr:hover td {
            color: #2d2d2d;
            opacity: 1.0;
        }
        .class_contents_bottom {
            position: relative;
            height: 10%;
            background-color: white;
            border-radius: 20px;
            padding: 5px;
            text-align: center;
            font-size: 20px;
            align-content: center;
            align-items: center;
            justify-content: center;
        }
        #request_accepted {
            position: relative;
            bottom: -20px;
        }
        .request_style {
            position: relative;
            height: 10px;
            padding: 5px;
            border-radius: 20px;
            color: white;
            background: #363636;
            text-decoration: none;
            font-weight: bold;
        }
        .scrollable-table-container {
            height: calc(100% - 20px);
            margin-top: 10px;
            overflow-y: auto;
        }
        .scrollable-table {
            width: 100%;
            border-collapse: collapse;
        }
        .scrollable-table th,
        .scrollable-table td {
            padding: 8px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        .scrollable-table thead,
        .scrollable-table tbody tr {
            display: table;
            width: 100%;
            table-layout: fixed;
        }
        .scrollable-table thead {
            width: calc(100% - 0px); /* Adjusted for scrollbar width */
        }
    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            <button onclick="window.location.href='friend_pool.jsp';" class="class_friend_pool">Friend Pooling</button><br>
            <button onclick="window.location.href='/co_traveller/display_journey.jsp';" class="class_co_travel">Co-Traveller</button><br>
            <button onclick="window.location.href='/share_auto/auto_share.jsp';" class="class_share_auto">Auto Share</button><br>
        </div>
        <div class="class_menu_bar_items_bottom">
            <button onclick="window.location.href='${pageContext.request.contextPath}/sos_button';" class="class_sos">SOS</button><br>
            <button onclick="window.location.href='${pageContext.request.contextPath}/logout_button';" class="class_logout">Logout</button>
        </div>
    </div>
    <div class="class_contents">
        <div class="class_contents_top">
            <button id="ascancelreqbutton" onclick="window.location.href='${pageContext.request.contextPath}/friend_pool_request_cancel?user_for_req_cancel=<%= userForReqCancel%>'"> Cancel Request </button>
            <button id="asregbutton" onclick="window.location.href='friend_pool_registration.jsp'"> Create Pool </button>
            <button id="asunregbutton" onclick="window.location.href='${pageContext.request.contextPath}/friend_pool_de_reg'"> Exit Pooling </button>
            <button id="asreqsbutton" onclick="window.location.href='friend_pool_requests.jsp'"> Pool Requests </button>
        </div>
        <div class="class_contents_body">
            <div class="card-container">

                <H1>Travellers</H1>
                <div class="scrollable-table-container">
                    <table class="scrollable-table">
                        <thead>
                        <TR>
                            <TH>Name</TH>
                            <TH>From</TH>
                            <TH>Destination</TH>
                            <TH>Transport</TH>
                            <TH>Capacity</TH>
                            <TH>Departure Time</TH>
                            <TH>Departure Date</TH>
                            <% if(!isRegistered && !requestAcceptance) {%>
                            <TH>Action</TH>
                            <% } %>
                        </TR>
                        </thead>
                        <% for(FriendPoolInfo resultset : friendPoolInfos){ %>
                        <TR>
                            <TD> <%= resultset.getFullname() %></TD>
                            <TD> <%= resultset.getFrom() %></TD>
                            <TD> <%= resultset.getDestination() %></TD>
                            <TD> <%= resultset.getTransport() %></TD>
                            <TD> <%= resultset.getCapacity() %></TD>
                            <TD> <%= resultset.getTimeInString() %></TD>
                            <TD> <%= resultset.getDateInString() %></TD>
                            <% boolean userMadeRequestFound = false; %>
                            <% if(!isRegistered && !requestAcceptance) { %>
                            <% for(String other_user_email : friendPoolUserMadeRequests) {
                                    if(resultset.getEmail().equals(other_user_email)) {
                                        userMadeRequestFound = true;
                                        break;
                                    }
                                }
                                if(!userMadeRequestFound) {
                             %>
                            <TD> <a href="${pageContext.request.contextPath}/friend_pool_request_manager?email=<%=resultset.getEmail()%>" class="request_style">Request</a></TD>
                            <% } else { %>
                            <TD><p style="color: #00b700;">Requested</p></TD>
                            <% } %>
                            <% } %>
                        </TR>
                        <% } %>
                    </table>
                </div>
            </div>
        </div>
        <div class="class_contents_bottom">
            <div id="requests_invalid">
                <p><pre style="position: relative; display: inline;"> --- </pre> Your Friend Pool has still <%= noOfVacanciesLeftOver %> vacancies left over <pre style="position: relative; display: inline;"> --- </pre></p>
            </div>
            <div id="requests_not_made">
                <p><pre style="position: relative; display: inline;"> --- </pre> You have not made any requests yet <pre style="position: relative; display: inline;"> --- </pre></p>
            </div>
            <div id="request_not_accepted">
                <p><pre style="position: relative; display: inline;"> --- </pre>You do not have any request approvals yet<pre style="position: relative; display: inline;"> --- </pre></p>
            </div>
            <div id="request_accepted">
                <% if (requestAcceptance) {%>
                    <p style="position: relative; display: inline;">You joined the Friend Pool by <span style="font-weight: bold"><%=acceptedUserObject.getFullname()%></span> on <span style="font-weight: bold"><%=acceptedUserObject.getDateInString()%></span> at <span style="font-weight: bold"><%=acceptedUserObject.getTimeInString()%></span></p>
                    <pre style="position: relative; display: inline;"> --- </pre>
                    <div style="position: relative; display: inline;">Contact: <span style="font-weight: bold;"><%=acceptedUserObject.getMobile()%></span></div>
                    <pre style="position: relative; display: inline;"> --- </pre>
                    <div style="position:relative; display: inline;">Email: <span style="font-weight: bold;">email@gmail.com</span></div>
                <% } %>
            </div>
        </div>
    </div>
</div>

<script>
    let areRequestsInvalid = <%= isRegistered %>;
    let areRequestsMade = <%= requestsMade %>;
    let isRequestAccepted = <%= requestAcceptance %>;
    let request_invalid = document.getElementById("requests_invalid");
    let requests_not_made = document.getElementById("requests_not_made");
    let request_not_accepted = document.getElementById("request_not_accepted");
    let request_accepted = document.getElementById("request_accepted");
    if(areRequestsInvalid) {
        requests_not_made.style.display = "none";
        request_accepted.style.display = "none";
        request_not_accepted.style.display = "none";
        request_invalid.style.display = "block";
    } else {
        request_invalid.style.display = "none";
        if (!areRequestsMade) {
            request_not_accepted.style.display = "none";
            request_accepted.style.display = "none";
            requests_not_made.style.display = "block";
        } else {
            requests_not_made.style.display = "none";
            if (isRequestAccepted) {
                request_not_accepted.style.display = "none";
                request_accepted = "block";
            } else {
                request_accepted.style.display = "none";
                request_not_accepted.style.display = "block";
            }
        }
    }
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
<script>
    let isRegistered = <%= isRegistered %>;
    let requestAcceptance = <%= requestAcceptance %>;
    let aSRegButton = document.getElementById("asregbutton");
    let aSUnRegButton = document.getElementById("asunregbutton");
    let aSReqsButton = document.getElementById("asreqsbutton");
    let aSCancelReqButton = document.getElementById("ascancelreqbutton");
    if(requestAcceptance === true) {
        aSRegButton.style.display = "none";
        aSUnRegButton.style.display="none";
        aSReqsButton.style.display="none";
        aSCancelReqButton.style.display="inline";
    } else {
        if(isRegistered === true){
            aSCancelReqButton.style.display = "none";
            aSRegButton.style.display = "none";
            aSUnRegButton.style.display = "inline";
            aSReqsButton.style.display = "inline";
        } else {
            aSCancelReqButton.style.display = "none";
            aSUnRegButton.style.display = "none";
            aSReqsButton.style.display = "none";
            aSRegButton.style.display = "inline";
        }
    }
</script>
</body>
</html>