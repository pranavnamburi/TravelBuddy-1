<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 5/6/2023
  Time: 6:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transportation Form</title>
    <style>
        body {
            background: linear-gradient(to right, #45B649, #DCE35B);

            font-family: Arial, sans-serif;
            line-height: 1.5;
        }

        form {
            width: 50%;
            margin: 0 auto;
            background: linear-gradient(to right, #5D26C1, #a17fe0, #59C173);
            padding: 40px;
            box-shadow: 0px 3px 10px rgba(0,0,0,0.1);
            border-radius: 5px;
            position: relative;
        }

        h1 {
            text-align: center;
            font-weight: bold;
            font-family: 'Times New Roman', Times, serif;
            margin-bottom: 30px;
            background-image: linear-gradient(to right, #3a86ff, #6320ee, #23d5ab);
            background-clip: text;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #ffffff;
        }

        input[type="text"],
        select,
        input[type="date"],
        input[type="time"] {
            display: block;
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            box-sizing: border-box;
            margin-bottom: 20px;
            background-color: #f2f2f2;
            border: 1px solid #ccc;
            font-size: 16px;
            color: #555;
            transition: all 0.2s ease-in-out;
        }

        input[type="text"]:focus,
        select:focus,
        input[type="date"]:focus,
        input[type="time"]:focus {
            outline: none;
            border: 1px solid #4CAF50;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            position: relative;
            animation: pulse 1s ease-in-out infinite;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        @keyframes pulse {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.1);
            }
            100% {
                transform: scale(1);
            }
        }
    </style>
</head>
<body>
<h1>Journey Form</h1>
<form action="${pageContext.request.contextPath}/co-traveller-submit-add-journey" METHOD="POST">
    <label for="transportation">Transportation:</label>
    <select id="transportation" name="transportation">
        <option value="train">Train</option>
        <option value="bus">Bus</option>
    </select>

    <label for="service_number">Service Number:</label>
    <input type="text" id="service_number" name="service_number">

    <label for="from">From:</label>
    <input type="text" id="from" name="from">

    <label for="to">To:</label>
    <input type="text" id="to" name="to">

    <label for="date">Date:</label>
    <input type="date" id="date" name="date">

    <label for="time">Time:</label>
    <input type="time" id="time" name="time">
    <input type="submit" value="Submit">
</form>
</body>
</html>
