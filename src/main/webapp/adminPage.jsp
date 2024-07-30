<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('images/time-tracking-1.png'); /* Replace 'background.jpg' with the path to your image */
            background-size: cover;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
            color: #fff;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: rgba(0, 0, 0, 0.8);
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
            border-radius: 8px;
        }
        h2 {
            text-align: center;
            color: #ffdd57;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        ul li {
            background-color: #28a745;
            margin: 10px 0;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        ul li a {
            display: block;
            padding: 15px;
            color: #fff;
            text-decoration: none;
            text-align: center;
        }
        ul li:hover {
            background-color: #218838;
        }
        .back-to-dashboard {
            display: block;
            margin: 20px 0;
            text-align: center;
        }
        .back-to-dashboard a {
            color: #ffdd57;
            text-decoration: none;
            transition: color 0.3s;
        }
        .back-to-dashboard a:hover {
            color: #ffc107;
        }
    </style>
    <script>
        window.onload = function() {
            let session = <%= request.getSession(false) %>;
            if (!session || !session.getAttribute("username")) {
                window.location.href = "login.jsp";
                return;
            }
            if (session.getAttribute("role") != "1") {
                window.location.href = "dashboard.jsp";
                return;
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Admin Page</h2>
        <ul>
            <li><a href="viewAllTasks.jsp">View All Tasks</a></li>
            <li><a href="viewAllCharts.jsp">View All Charts</a></li>
        </ul>
        <div class="back-to-dashboard">
            <a href="dashboard.jsp">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>

