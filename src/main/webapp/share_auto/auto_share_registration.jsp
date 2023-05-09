<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.setHeader("Pragma", "no-cache");
  response.setDateHeader("Expires", 0);

  if(session.getAttribute("logged_in") == null) {
    session.setAttribute("logged_in", "false");
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
      padding-left: 1%;
      padding-right: 5%;
    }
    .class_contents_form {
      height: 50%;
      width: 100%;
      background-color: #fff;
      padding: 20px;
      border-radius: 5px;
      margin: 0 auto;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
      translate: 0 22%;
    }
    label {
      display: block;
      margin-bottom: 10px;
      font-weight: bold;
    }
    input[type="text"],
    input[type="number"]{
      width: 95%;
      padding: 10px;
      border-radius: 5px;
      border-color: #00bf8f;
      margin-bottom: 20px;
    }
    select {
      width: 97%;
      padding: 10px;
      border-radius: 5px;
      border-color: #00bf8f;
      margin-bottom: 20px;
    }
    input[type="submit"] {
      background-color: #4CAF50;
      color: #fff;
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px;
    }
    input[type="submit"]:hover {
      background-color: #3e8e41;
    }
    input:invalid {
      border-color: red;
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
    <div class="class_contents_title">
      Auto Share Registration
    </div>
    <div class="class_contents_form">
      <form action="/auto_share_reg" method="POST">
        <label for="to_place">To Place:</label>
        <input type="text" name="to_place" id="to_place" required><br>
        <label for="no_of_vacs">Number Of Vacancies:</label>
        <input type="number" name="no_of_vacs" id="no_of_vacs" min="1" max="10" pattern="[1-9]|10" required><br>
        <label for="timeframe">Time-frame:</label>
        <select name="timeframe" id="timeframe">
          <option value="00:00:00">12:00 AM - 01:00 AM</option>
          <option value="01:00:00">01:00 AM - 02:00 AM</option>
          <option value="02:00:00">02:00 AM - 03:00 AM</option>
          <option value="03:00:00">03:00AM - 04:00AM</option>
          <option value="04:00:00">04:00AM - 05:00AM</option>
          <option value="05:00:00">05:00AM - 06:00AM</option>
          <option value="06:00:00">06:00AM - 07:00AM</option>
          <option value="07:00:00">07:00AM - 08:00AM</option>
          <option value="08:00:000">08:00AM - 09:00AM</option>
          <option value="09:00:00">09:00AM - 10:00AM</option>
          <option value="10:00:00">10:00AM - 11:00AM</option>
          <option value="11:00:00">11:00AM - 12:00PM</option>
          <option value="12:00:00">12:00PM - 01:00PM</option>
          <option value="13:00:00">01:00PM - 02:00PM</option>
          <option value="14:00:00">02:00PM - 03:00PM</option>
          <option value="15:00:00">03:00PM - 04:00PM</option>
          <option value="16:00:00">04:00PM - 05:00PM</option>
          <option value="17:00:00">05:00PM - 06:00PM</option>
          <option value="18:00:00">06:00PM - 07:00PM</option>
          <option value="19:00:00">07:00PM - 08:00PM</option>
          <option value="20:00:00">08:00PM - 09:00PM</option>
          <option value="21:00:00">09:00PM - 10:00PM</option>
          <option value="22:00:00">10:00PM - 11:00PM</option>
          <option value="23:00:00">11:00PM - 12:00AM</option>
        </select>
        </select>
        <input type="submit" value="Submit">
      </form>
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
