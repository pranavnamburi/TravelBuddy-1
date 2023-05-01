<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 4/19/2023
  Time: 11:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<style>
    @import url('fonts.css');
    *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;
    }
    html,body{
        display: grid;
        height: 100%;
        width: 100%;
        place-items: center;
        background-image: url('images/login_background.gif');
        background-repeat: no-repeat;
        background-position: center center;
        background-color: #d7ffbf;
        background-size: cover;
    }
    ::selection{
        background: #74d846;
        color: #fff;
    }
    .wrapper{
        overflow: hidden;
        max-width: 650px;
        max-height: 650px;
        background: #fff;
        padding: 100px;
        border-radius: 50%;
        box-shadow: 0 15px 20px rgba(0,0,0,0.1);
    }
    .wrapper .title-text{
        display: flex;
        width: 200%;
    }
    .wrapper .title{
        width: 50%;
        font-size: 30px;
        font-weight: 600;
        text-align: center;
        transition: all 0.6s cubic-bezier(0.68,-0.55,0.265,1.55);
    }
    .wrapper .slide-controls{
        position: relative;
        display: flex;
        height: 50px;
        width: 100%;
        overflow: hidden;
        margin: 15px 0 0 0;
        justify-content: space-between;
        border: 1px solid lightgrey;
        border-radius: 5px;
    }
    .slide-controls .slide{
        height: 100%;
        width: 100%;
        color: #fff;
        font-size: 18px;
        font-weight: 500;
        text-align: center;
        line-height: 48px;
        cursor: pointer;
        z-index: 1;
        transition: all 0.6s ease;
    }
    .slide-controls label.signup{
        color: #000;
    }
    .slide-controls .slider-tab{
        position: absolute;
        height: 100%;
        width: 50%;
        left: 0;
        z-index: 0;
        border-radius: 5px;
        background: -webkit-linear-gradient(left, #74d846, #e3ff8e);
        transition: all 0.6s cubic-bezier(0.68,-0.55,0.265,1.55);
    }
    input[type="radio"]{
        display: none;
    }
    #signup:checked ~ .slider-tab{
        left: 50%;
    }
    #signup:checked ~ label.signup{
        color: #fff;
        cursor: default;
        user-select: none;
    }
    #signup:checked ~ label.login{
        color: #000;
    }
    #login:checked ~ label.signup{
        color: #000;
    }
    #login:checked ~ label.login{
        cursor: default;
        user-select: none;
    }
    .wrapper .form-container{
        width: 100%;
        overflow: hidden;
    }
    .form-container .form-inner{
        display: flex;
        width: 200%;
    }
    .form-container .form-inner form{
        width: 50%;
        transition: all 0.6s cubic-bezier(0.68,-0.55,0.265,1.55);
    }
    .form-inner form .field{
        height: 40px;
        width: 100%;
        margin-top: 10px;
    }
    .form-inner form .field input{
        height: 100%;
        width: 100%;
        outline: none;
        padding-left: 15px;
        border-radius: 15px;
        border: 2px solid lightgrey;
        border-bottom-width: 1px;
        font-size: 12px;
        transition: all 0.3s ease;
    }
    .form-inner form .field input:focus{
        border-color: #74d846;
        /* box-shadow: inset 0 0 3px #fb6aae; */
    }
    .form-inner form .field input::placeholder{
        color: #999;
        transition: all 0.3s ease;
    }
    form .field input:focus::placeholder{
        color: #b3b3b3;
    }
    .form-inner form .pass-link{
        margin-top: 5px;
    }
    .form-inner form .signup-link{
        text-align: center;
        margin-top: 30px;
    }
    .form-inner form .pass-link a,
    .form-inner form .signup-link a{
        color: #74d846;
        text-decoration: none;
    }
    .form-inner form .pass-link a:hover,
    .form-inner form .signup-link a:hover{
        text-decoration: underline;
    }
    form .btn{
        height: 50px;
        width: 100%;
        border-radius: 5px;
        position: relative;
        overflow: hidden;
    }
    form .btn .btn-layer{
        height: 100%;
        width: 300%;
        position: absolute;
        left: -100%;
        background: -webkit-linear-gradient(right, #74d846, #e3ff8e, #74d846, #e3ff8e);
        border-radius: 5px;
        transition: all 0.4s ease;;
    }
    form .btn:hover .btn-layer{
        left: 0;
    }
    form .btn input[type="submit"]{
        height: 100%;
        width: 100%;
        z-index: 1;
        position: relative;
        background: none;
        border: none;
        color: #fff;
        padding-left: 0;
        border-radius: 5px;
        font-size: 20px;
        font-weight: 500;
        cursor: pointer;
    }

</style>
<head>
    <meta charset="utf-8">
    <title>Travel Buddy</title>
    <!-- <link rel="stylesheet" href="style.css"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<div class="wrapper">
    <div class="title-text">
        <div class="title login" id="loginid">Login</div>
        <div class="title signup" id="signupid" style="visibility: hidden">Signup</div>
    </div>
    <div class="form-container">
        <div class="slide-controls">
            <input type="radio" name="slide" id="login" checked>
            <input type="radio" name="slide" id="signup">
            <label for="login" class="slide login">Login</label>
            <label for="signup" class="slide signup">Signup</label>
            <div class="slider-tab"></div>
        </div>
        <div class="form-inner">
            <form action="auth" class="login" method="POST">
                <div class="field">
                    <input type="text"  name="email" placeholder="Email Address" required>
                </div>
                <div class="field">
                    <input type="password" name="password" placeholder="Password" required>
                </div>
                <div class="pass-link"><a href="#">Forgot password?</a></div>
                <div class="field btn">
                    <div class="btn-layer"></div>
                    <input type="submit" value="Login">
                </div>
                <div class="signup-link">Not a member? <a href="">Signup now</a></div>
            </form>
            <form action="reg" class="signup" method="POST">
                <div class="field">
                    <input type="text" name="firstname" placeholder="First Name" required>
                </div>
                <div class="field">
                    <input type="text" name="lastname" placeholder="Last Name" required>
                </div>
                <div class="field">
                    <input type="text" name="email" placeholder="Email Address" required>
                </div>
                <div class="field">
                    <input type="text" name="mobile" placeholder="Contact" required>
                </div>
                <div class="field">
                    <input type="password" name="password" placeholder="Password" required>
                </div>
                <div class="field btn">
                    <div class="btn-layer"></div>
                    <input type="submit" value="Signup">
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    const loginText = document.querySelector(".title-text .login");
    const loginForm = document.querySelector("form.login");
    const loginBtn = document.querySelector("label.login");
    const signupBtn = document.querySelector("label.signup");
    const signupLink = document.querySelector("form .signup-link a");
    signupBtn.onclick = (()=>{
        loginForm.style.marginLeft = "-50%";
        loginText.style.marginLeft = "-50%";
        document.getElementById("signupid").style.visibility = "visible";
        document.getElementById("loginid").style.visibility = "hidden";
    });
    loginBtn.onclick = (()=>{
        loginForm.style.marginLeft = "0%";
        loginText.style.marginLeft = "0%";
        document.getElementById("loginid").style.visibility = "visible";
        document.getElementById("signupid").style.visibility = "hidden";
    });
    signupLink.onclick = (()=>{
        signupBtn.click();
        return false;
    });
</script>

</body>
</html>