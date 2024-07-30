<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return; // Prevent further processing if the user is not logged in
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>View My Charts</title>
</head>
<body>
    <h2>My Charts</h2>
    <ul>
        <li><a href="dailyChart.jsp">View Daily Chart</a></li>
        <li><a href="weeklyChart.jsp">View Weekly Chart</a></li>
        <li><a href="monthlyChart.jsp">View Monthly Chart</a></li>
    </ul>
    <a href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>