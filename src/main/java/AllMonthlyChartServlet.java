import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@WebServlet("/AllMonthlyChartServlet")
public class AllMonthlyChartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        JsonObject jsonResponse = new JsonObject();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EmployeeTaskTracker", "root", "Hari@108");

            String query = "SELECT u.username, DATE(t.date) as day, SUM(TIMESTAMPDIFF(MINUTE, t.start_time, t.end_time)) as duration " +
                           "FROM Tasks t JOIN Users u ON t.employee_id = u.user_id " +
                           "WHERE MONTH(t.date) = MONTH(CURDATE()) " +
                           "GROUP BY u.username, day " +
                           "ORDER BY u.username, day";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            JsonObject userTasks = new JsonObject();
            while (rs.next()) {
                String username = rs.getString("username");
                String day = rs.getString("day");
                int duration = rs.getInt("duration");

                if (!userTasks.has(username)) {
                    JsonObject userData = new JsonObject();
                    userData.add("labels", new JsonArray());
                    userData.add("data", new JsonArray());
                    userTasks.add(username, userData);
                }

                JsonObject userData = userTasks.getAsJsonObject(username);
                userData.getAsJsonArray("labels").add(day);
                userData.getAsJsonArray("data").add(duration);
            }

            jsonResponse.add("userTasks", userTasks);

            // Debugging log
            System.out.println("JSON Response: " + jsonResponse.toString());

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(jsonResponse.toString());
        out.flush();
    }
}