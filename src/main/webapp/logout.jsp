<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Logout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('images/logout.webp') no-repeat center center fixed;
            background-size: cover; /* Cover the entire page with the background image */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Full viewport height */
            color: #fff; /* Text color */
        }
        .container {
            background: rgba(0, 0, 0, 0.7); /* Semi-transparent black background for better contrast */
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            text-align: center;
            width: 100%;
            max-width: 400px; /* Responsive container width */
        }
        h2 {
            color: #fff; /* White text color */
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: 700; /* Bold text */
        }
        a {
            display: inline-block;
            background: linear-gradient(135deg, #ff7e5f, #feb47b); /* Gradient background */
            color: #fff;
            padding: 12px 25px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            font-weight: 600;
            transition: background 0.3s, transform 0.3s; /* Smooth transitions */
        }
        a:hover {
            background: linear-gradient(135deg, #feb47b, #ff7e5f); /* Reverse gradient on hover */
            transform: scale(1.05); /* Slightly enlarge link on hover */
        }
        a:active {
            transform: scale(0.98); /* Slightly shrink link on click */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>You have been logged out.</h2>
        <a href="login.jsp">Login Again</a>
    </div>
</body>
</html>
