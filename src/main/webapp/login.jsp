<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('images/login backround.jpg') no-repeat center center fixed;
            background-size: cover; /* Ensure the background image covers the entire page */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Full viewport height */
        }
        .container {
            background: linear-gradient(135deg, #000000, #434343); /* Black gradient background for the container */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.5);
            width: 100%;
            max-width: 500px; /* Increased max-width for more spacing */
            margin: 0 20px; /* Added margin to ensure spacing on larger screens */
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            color: #fff; /* White text color for better contrast */
        }
        label {
            display: block;
            margin-bottom: 10px;
            color: #ddd; /* Light gray text color for labels */
            font-weight: bold;
        }
        input[type="text"],
        input[type="password"] {
            width: calc(100% - 22px); /* Adjust width to account for padding and border */
            padding: 12px;
            margin-bottom: 20px;
            border: 2px solid #555; /* Dark border for input fields */
            border-radius: 5px;
            background: linear-gradient(135deg, #1a1a1a, #333333); /* Dark gradient background for input fields */
            color: #fff; /* White text color */
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.3);
            font-size: 16px;
            transition: border-color 0.3s, box-shadow 0.3s; /* Smooth transitions */
        }
        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #007bff; /* Blue border color on focus */
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* Focus shadow */
            outline: none;
        }
        input[type="submit"] {
            background: linear-gradient(135deg, #007bff, #0056b3); /* Gradient button background */
            color: #fff;
            border: none;
            padding: 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            font-weight: bold;
            width: 100%; /* Full-width button */
            transition: background 0.3s, transform 0.3s; /* Smooth transitions */
        }
        input[type="submit"]:hover {
            background: linear-gradient(135deg, #0056b3, #003d80); /* Darker gradient on hover */
            transform: scale(1.05); /* Slightly enlarge button on hover */
        }
        input[type="submit"]:active {
            transform: scale(0.98); /* Slightly shrink button on click */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <form action="LoginServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <input type="submit" value="Login">
        </form>
    </div>
</body>
</html>


