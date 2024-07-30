<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #2c3e50, #4ca1af); /* Darker gradient background */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Full viewport height */
            color: #fff; /* Text color */
        }
        .container {
            background: rgba(0, 0, 0, 0.7); /* Semi-transparent black background */
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            text-align: center;
            width: 100%;
            max-width: 400px; /* Responsive container width */
        }
        h2 {
            color: #fff; /* Text color */
            margin-bottom: 20px;
            font-size: 24px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Creative font */
            font-weight: 700; /* Bold text */
        }
        label {
            display: block;
            margin-bottom: 10px;
            color: #fff; /* Text color */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Creative font */
        }
        input[type="text"],
        input[type="password"],
        select {
            width: calc(100% - 24px); /* Adjusted width for padding */
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box; /* Ensure padding does not affect width */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Creative font */
        }
        input[type="submit"] {
            background: linear-gradient(135deg, #2c3e50, #4ca1af); /* Darker gradient background for button */
            color: #fff;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Creative font */
            width: 100%; /* Full-width button */
            transition: background 0.3s, transform 0.3s; /* Smooth transitions */
        }
        input[type="submit"]:hover {
            background: linear-gradient(135deg, #4ca1af, #2c3e50); /* Reverse gradient on hover */
            transform: scale(1.05); /* Slightly enlarge button on hover */
        }
        input[type="submit"]:active {
            transform: scale(0.98); /* Slightly shrink button on click */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Register</h2>
        <form action="RegisterServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br>
            <label for="role">Role:</label>
            <select id="role" name="role" required>
                <option value="Admin">Admin</option>
                <option value="Associate">Associate</option>
            </select><br>
            <input type="submit" value="Register">
        </form>
    </div>
</body>
</html>
