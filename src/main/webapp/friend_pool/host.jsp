<%--
  Created by IntelliJ IDEA.
  User: sathwik
  Date: 20-05-2023
  Time: 00:18
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
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
    h1 {
      text-align: center;
      color: #333333;
    }

    .class_contents form {
      max-width: 500px;
      margin: 0 auto;
      background-color: darkslategray;
      border-radius: 20px;
      box-shadow: 10px 10px 20px rgba(0, 0, 0, 0.1), -10px -10px 20px rgba(255, 255, 255, 0.5);
      padding: 40px;
    }

    .neumorphic-container {
      display: grid;
      grid-gap: 20px;

    }

    .neumorphic-input {
      background-color: #f2f2f2;
      border-radius: 20px;
      padding: 10px;
      box-shadow: inset 10px 10px 20px rgba(0, 0, 0, 0.1), inset -10px -10px 20px rgba(255, 255, 255, 0.5);
    }

    .neumorphic-container label {
      font-weight: bold;
    }

    .neumorphic-container input, select {
      width: 75%;
      padding: 5px;
      border: none;
      background-color: transparent;
      outline: none;
    }

    .class_contents form button {
      display: block;
      width: 100%;
      padding: 10px;
      background-color: black;
      color: #ffffff;
      border: none;
      border-radius: 3px;
      cursor: pointer;
      font-size: 16px;
      margin-top: 40px; /* Add space between contact and submit button */
      margin-bottom: 20px;
    }

    .class_contents form button:hover {
      background-color: #45a049;
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
      <button onclick="window.location.href='#';" class="class_friend_pool">Friend Pooling</button><br>
      <button onclick="window.location.href='/co_traveller/co-traveller.jsp';" class="class_co_travel">Co-Traveller</button><br>
      <button onclick="window.location.href='/share_auto/auto_share.jsp';" class="class_share_auto">Auto Share</button><br>
    </div>
    <div class="class_menu_bar_items_bottom">
      <button class="class_sos">SOS</button><br>
    </div>
  </div>
  <div class="class_contents">
    <div class="class_contents_form">
      <h1>Booking Form</h1>
      <form>
        <div class="neumorphic-container">
          <div class="neumorphic-input">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
          </div>
          <div class="neumorphic-input">
            <label for="destination">Destination:</label>
            <input type="text" id="destination" name="destination" required>
          </div>
          <div class="neumorphic-input">
            <label for="from">From:</label>
            <input type="text" id="from" name="from" required>
          </div>
          <div class="neumorphic-input">
            <label for="transport">Transport:</label>
            <select id="transport" name="transport">
              <option value="car">Car</option>
              <option value="train">Train</option>
              <option value="airplane">Airplane</option>
            </select>
          </div>
          <div class="neumorphic-input">
            <label for="datetime">Time and Date:</label>
            <input type="datetime-local" id="datetime" name="datetime" required>
          </div>
          <div class="neumorphic-input">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
          </div>
          <div class="neumorphic-input">
            <label for="contact">Contact:</label>
            <input type="tel" id="contact" name="contact" required>
          </div>
        </div>
        <button type="submit">Submit</button>
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
