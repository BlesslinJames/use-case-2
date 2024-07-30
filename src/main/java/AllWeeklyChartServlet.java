import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@WebServlet("/AllWeeklyChartServlet")
public class AllWeeklyChartServlet extends HttpServlet {
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
                           "WHERE WEEK(t.date) = WEEK(CURDATE()) " +
                           "GROUP BY u.username, day " +
                           "ORDER BY u.username, day";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            JsonArray datasets = new JsonArray();

            while (rs.next()) {
                JsonObject dataset = new JsonObject();
                dataset.addProperty("username", rs.getString("username"));
                dataset.addProperty("day", rs.getString("day"));
                dataset.addProperty("duration", rs.getInt("duration"));
                datasets.add(dataset);
            }

            jsonResponse.add("datasets", datasets);

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(jsonResponse.toString());
        out.flush();
    }
}
