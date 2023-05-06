<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
    .class_contents_friend_pool, .class_contents_co_travel, .class_contents_share_auto {
      width: 100%;
      height: 210px;
      margin: 10px;
      position: relative;
      border-radius: 45px;
      box-sizing: border-box;
      translate: 0 -8%;
    }
    .class_contents_friend_pool {
      background: #59C173; /* fallback for old browsers*/
      background: -webkit-linear-gradient(to right, #5D26C1, #a17fe0, #59C173);   /*Chrome 10-25, Safari 5.1-6 8*/
      background: linear-gradient(to right, #5D26C1, #a17fe0, #59C173);/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

    }
    .class_contents_co_travel {
      background: #59C173;  /* fallback for old browsers */
      background: -webkit-linear-gradient(to right, #5D26C1, #a17fe0, #59C173);  /* Chrome 10-25, Safari 5.1-6 */
      background: linear-gradient(to right, #5D26C1, #a17fe0, #59C173); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
    }
    .class_contents_share_auto {
      background: #59C173;  /* fallback for old browsers */
      background: -webkit-linear-gradient(to right, #5D26C1, #a17fe0, #59C173);  /* Chrome 10-25, Safari 5.1-6 */
      background: linear-gradient(to right, #5D26C1, #a17fe0, #59C173); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
    }
    .hide{
      display: block;
      border:white;
      color: white;
    }
    .Button{
      background-color: transparent;
      color: white;
      border: none;
    }
    .class_friend_pool_heading .hide{
      display: none;
      position: relative;
      color: white;
      width: 100%;
    }
    .class_co_travel_heading .hide{
      display: none;
      position: relative;
      color: white;
      width: 100%;
    }
    .class_share_auto_heading .hide{
      display: none;
      position: relative;
      color: white;
      width: 100%;
    }
    .class_friend_pool_heading:hover .hide{
      display: block;
      position: relative;
      color: white;
      width: 100%;
    }
    .class_co_travel_heading:hover .hide {
      display: block;
      position: relative;
      color: white;
      width: 100%;
    }
    .class_share_auto_heading:hover .hide {
      display: block;
      position: relative;
      color: white;
      width: 100%;
    }
    .class_friend_pool_heading {
      display: block;
      position: relative;
      translate: 100px 30px;
      color: white;
      background-color: transparent;
      border: none;
      height: 30px;
    }
    .class_co_travel_heading{
      display: block;
      position: relative;
      translate: 100px 30px;
      color: white;
      background-color: transparent;
      border: none;
      height: 30px;
    }
    .class_share_auto_heading{
      display: block;
      position: relative;
      translate: 100px 30px;
      color: white;
      background-color: transparent;
      border: none;
      height: 30px;
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
    .content_horizontal {
      position: relative;
      width: 50%;
      translate: -50% -10px;
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
      <button onclick="window.location.href='practice.html';" class="class_home_nav">Home</button>
      <button onclick="window.location.href='#';" class="class_profile">Profile</button><br>
      <button onclick="window.location.href='friends_pool.html';" class="class_friend_pool">Friend Pooling</button><br>
      <button onclick="window.location.href='co-traveller.jsp';" class="class_co_travel">Co-Traveller</button><br>
      <button onclick="window.location.href='auto_share.jsp';" class="class_share_auto">Auto Share</button><br>
    </div>
    <div class="class_menu_bar_items_bottom">
      <button class="class_sos">SOS</button><br>
    </div>
  </div>
  <div class="class_contents">
    <div class="class_contents_friend_pool">
      <div class="class_friend_pool_heading">
        <button class="Button" onclick="window.location.href='https://www.google.com';"><h1>Friend Pooling</h1></button>
        <hr class="content_horizontal">
        <div class="hide">this is hidden section</div>
      </div>
      <div>
        <img src="${pageContext.request.contextPath}/images/friend_pool.png" alt="">

      </div>
    </div>
    <div class="class_contents_co_travel">
      <div class="class_co_travel_heading">
        <button class="Button" onclick="window.location.href='https://www.google.com';"><h1>Co-Traveller</h1></button>
        <hr class="content_horizontal">
        <div class="hide">this is hidden section</div>
      </div>
      <div>
        <img src="${pageContext.request.contextPath}/images/co-traveller_img.png" alt="">
      </div>
    </div>
    <div class="class_contents_share_auto">
      <div class="class_share_auto_heading">
        <button class="Button" onclick="window.location.href='auto_share.jsp';"><h1>Auto Share</h1></button>
        <hr class="content_horizontal">
        <div class="hide">this is hidden section</div>
      </div>
      <div>
        <img src="${pageContext.request.contextPath}/images/share_auto_img_1.png" alt="">
      </div>
      <div>
        <img src="${pageContext.request.contextPath}/images/share_auto_img2.png" style="width: 240px; height: 240px; transform: translate(310%,-98%);" alt="">
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
</html>
