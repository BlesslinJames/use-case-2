<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--  
    //HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return; // Prevent further processing if the user is not logged in
    } else if (!"Associate".equals(session.getAttribute("role"))) {
        response.sendRedirect("dashboard.jsp");
        return; // Redirect to dashboard if the user is not an associate
    }
-->
<!DOCTYPE html>
<html>
<head>
    <title>Associate Page</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to right, #e0c3fc, #8ec5fc);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            max-width: 600px;
            width: 90%;
            margin: 20px;
            padding: 30px;
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        h2 {
            color: #333;
            margin-bottom: 30px;
            font-size: 2rem;
        }
        ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        ul li {
            margin: 15px 0;
        }
        ul li a {
            display: block;
            padding: 15px;
            text-align: center;
            text-decoration: none;
            color: #ffffff;
            background: linear-gradient(to right, #f79c42, #f15f79);
            border-radius: 12px;
            transition: all 0.3s ease-in-out;
            font-weight: bold;
            font-size: 1.1rem;
        }
        ul li a:hover {
            background: linear-gradient(to right, #f15f79, #f79c42);
            transform: translateY(-3px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .back-to-dashboard {
            margin-top: 30px;
        }
        .back-to-dashboard a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
            font-size: 1.2rem;
            transition: color 0.3s ease-in-out;
        }
        .back-to-dashboard a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Associate Page</h2>
        <ul>
            <li><a href="viewMyCharts.jsp">View My Charts</a></li>
        </ul>
        <div class="back-to-dashboard">
            <a href="dashboard.jsp">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>
