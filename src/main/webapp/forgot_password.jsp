<%@ page contentType="text/html;charset=UTF-8" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    try {
        if (session.getAttribute("logged_in").equals("true")) {
            response.sendRedirect("index.jsp");
            System.out.println("yes");
        }
    }
    catch(Exception e)
    {

    }
%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <link rel="icon" href="${pageContext.request.contextPath}/images/tb_favicon.ico" type="image/x-icon">
    <title>Travel Buddy</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            width: 530px;
            height: 530px;
            background: #fff;
            padding: 175px 100px 100px 100px;
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
        input[type="radio"]{
            display: none;
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

</head>
<body>
<div class="wrapper">
    <div class="title-text">
        <div class="title login" id="loginid">Forget password</div>
    </div>
    <div class="form-container">
        <div class="form-inner">
            <form action="forgot_pass" class="login" method="POST">
                <div class="field">
                    <label>
                        <input type="text"  name="email" placeholder="Email Address" required>
                    </label>
                </div>
                <div class="field btn">
                    <div class="btn-layer"></div>
                    <input type="submit" value="Send Email">
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    const login = document.getElementById('loginid');
</script>


</body>
</html>
