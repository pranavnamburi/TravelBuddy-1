<jsp:useBean id="rs" scope="request" type="java.sql.ResultSet"/>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="/profile-update-password"/>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    if(session.getAttribute("logged_in") == null) {
        session.setAttribute("logged_in", "false");
    }
    if(session.getAttribute("logged_in").equals("false")) {
        response.sendRedirect("login_page.jsp");
    }
    rs = (ResultSet) session.getAttribute("rs");

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <link rel="icon" href="${pageContext.request.contextPath}/images/tb_favicon.ico" type="image/x-icon">
    <title>Travel Buddy</title>
    <style>

        .button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 10px 0;
            cursor: pointer;
        }

        .form-container {
            display: none;
            background: linear-gradient(to right, #5D26C1, #a17fe0, #59C173);
            padding: 20px;
            border-radius: 5px;
        }

        .form-container label {
            display: block;
            color: #fff;
            margin-bottom: 10px;
        }

        .form-container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .form-container input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            float: left;
        }
        html, body ,.class_home {
            height: 100%;
            margin: 0;
            background: linear-gradient(to left, #45B649, #DCE35B);
            overflow: hidden;
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
            background-image: url('images/tb_favicon.ico');
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
            background-image: url('images/tb_favicon.ico');
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
            padding: 3%;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
        }
        .profile-container {
            background: linear-gradient(to right, #5D26C1, #a17fe0, #59C173);
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .profile-field {
            margin-bottom: 15px;
        }
        .profile-field label {
            display: block;
            color: #fff;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .profile-field input[type="text"] {
            width: 100%;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
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
            <button onclick="window.location.href='index.jsp';" class="class_home_nav">Home</button>
            <button onclick="window.location.href='profile.jsp';" class="class_profile">Profile</button><br>
            <button onclick="window.location.href='webapp/share_auto/friends_pool.jsp';" class="class_friend_pool">Friend Pooling</button><br>
            <button onclick="window.location.href='co-traveller.jsp';" class="class_co_travel">Co-Traveller</button><br>
            <button onclick="window.location.href='auto_share.jsp';" class="class_share_auto">Auto Share</button><br>
        </div>
        <div class="class_menu_bar_items_bottom">
            <button class="class_sos">SOS</button><br>
        </div>
    </div>
    <div class="class_contents">
        <h1>View Profile</h1>
        <div class="profile-container">
            <div class="profile-field">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value=${rs.getString("fullname")} readonly>
            </div>
            <div class="profile-field">
                <label for="email">Email ID:</label>
                <input type="text" id="email" name="email" value=${rs.getString("email")} readonly>
            </div>
            <div class="profile-field">
                <label for="alt-email">Alternate Email ID:</label>
                <input type="text" id="alt-email" name="alt-email" value=${rs.getString("alt_email")} readonly>
            </div>
            <div class="profile-field">
                <label for="phone">Phone Number:</label>
                <input type="text" id="phone" name="phone" value=${rs.getString("mobile")} readonly>
            </div>
            <button class="button" onclick="showForm()">Update Password</button>

            <div id="passwordForm" class="form-container">
                <form action="${pageContext.request.contextPath}/profile-update-password" method="post">
                    <label for="oldPassword">Old Password:</label>
                    <input type="password" id="oldPassword" name="oldPassword" required><br>

                    <label for="newPassword">New Password:</label>
                    <input type="password" id="newPassword" name="newPassword" required><br>

                    <input type="submit" value="Submit">
                </form>
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
        menu.style.setProperty("animation", "300ms linear 0s slide_left forwards");
    }
    menu_icon_out.onclick = () => {
        menu.style.setProperty("animation", "300ms linear 0s slide_right forwards");
    }
    function showForm() {
        var form = document.getElementById("passwordForm");
        form.style.display = "block";
    }
</script>
</body>
</html>



<%--<!DOCTYPE html>
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
            background-image: url('images/tb_favicon.ico');
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
            background-image: url('images/tb_favicon.ico');
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
            padding: 3%;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
        }
        .profile-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .profile-field {
            margin-bottom: 15px;
        }
        .profile-field label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .profile-field input[type="text"] {
            width: 100%;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
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
            <button onclick="window.location.href='index.jsp';" class="class_home_nav">Home</button>
            <button onclick="window.location.href='profile.jsp';" class="class_profile">Profile</button><br>
            <button onclick="window.location.href='webapp/share_auto/friends_pool.jsp';" class="class_friend_pool">Friend Pooling</button><br>
            <button onclick="window.location.href='co-traveller.jsp';" class="class_co_travel">Co-Traveller</button><br>
            <button onclick="window.location.href='auto_share.jsp';" class="class_share_auto">Auto Share</button><br>
        </div>
        <div class="class_menu_bar_items_bottom">
            <button class="class_sos">SOS</button><br>
        </div>
    </div>
    <div class="class_contents">
    <h1>View Profile</h1>
    <div class="profile-container">
        <div class="profile-field">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="John Doe" readonly>
        </div>
        <div class="profile-field">
            <label for="email">Email ID:</label>
            <input type="text" id="email" name="email" value="johndoe@example.com" readonly>
        </div>
        <div class="profile-field">
            <label for="alt-email">Alternate Email ID:</label>
            <input type="text" id="alt-email" name="alt-email" value="johndoe.alt@example.com" readonly>
        </div>
        <div class="profile-field">
            <label for="phone">Phone Number:</label>
            <input type="text" id="phone" name="phone" value="1234567890" readonly>
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
        menu.style.setProperty("animation", "300ms linear 0s slide_left forwards");
    }
    menu_icon_out.onclick = () => {
        menu.style.setProperty("animation", "300ms linear 0s slide_right forwards");
    }
</script>
</body>
</html>--%>
