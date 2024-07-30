import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AllDailyChartServlet")
public class AllDailyChartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AllDailyChartServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Map<String, Integer> dataMap = new HashMap<>();

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/EmployeeTaskTracker", "root", "Hari@108");
             PreparedStatement ps = conn.prepareStatement(
                     "SELECT category, SUM(TIMESTAMPDIFF(HOUR, start_time, end_time)) AS hours " +
                     "FROM Tasks " +
                     "WHERE DATE(date) = CURDATE() " +
                     "GROUP BY category");
             ResultSet rs = ps.executeQuery()) {

            Class.forName("com.mysql.cj.jdbc.Driver");

            while (rs.next()) {
                dataMap.put(rs.getString("category"), rs.getInt("hours"));
            }

            if (dataMap.isEmpty()) {
                dataMap.put("No Data", 1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        JSONObject json = new JSONObject(dataMap);
        response.setContentType("application/json");
        try (PrintWriter out = response.getWriter()) {
            out.print(json.toString());
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
