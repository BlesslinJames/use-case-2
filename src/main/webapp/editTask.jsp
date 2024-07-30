<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    //HttpSession session = request.getSession(false);
    ResultSet task = (ResultSet) request.getAttribute("task");
    if (task != null) {
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Task</title>
</head>
<body>
    <h2>Edit Task</h2>
    <form action="EditTaskServlet" method="post">
        <input type="hidden" name="taskId" value="<%= task.getInt("task_id") %>">
        <label for="project">Project:</label>
        <input type="text" id="project" name="project" value="<%= task.getString("project") %>"><br><br>
        <label for="date">Date:</label>
        <input type="date" id="date" name="date" value="<%= task.getDate("date") %>"><br><br>
        <label for="startTime">Start Time:</label>
        <input type="time" id="startTime" name="startTime" value="<%= task.getTime("start_time") %>"><br><br>
        <label for="endTime">End Time:</label>
        <input type="time" id="endTime" name="endTime" value="<%= task.getTime("end_time") %>"><br><br>
        <label for="category">Category:</label>
        <input type="text" id="category" name="category" value="<%= task.getString("category") %>"><br><br>
        <label for="description">Description:</label>
        <textarea id="description" name="description"><%= task.getString("description") %></textarea><br><br>
        <input type="submit" value="Update Task">
    </form>
    <a href="taskPage.jsp">Back to Task Management</a>
</body>
</html>
<%
    }
%>
