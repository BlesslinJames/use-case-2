import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@WebServlet("/MonthlyChartServlet")
public class MonthlyChartServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String username = (String) session.getAttribute("username");
        JsonObject jsonResponse = new JsonObject();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EmployeeTaskTracker", "root", "Hari@108");

            PreparedStatement ps = con.prepareStatement("SELECT DATE(date) as day, SUM(TIMESTAMPDIFF(MINUTE, start_time, end_time)) as duration FROM Tasks WHERE employee_id = (SELECT user_id FROM Users WHERE username=?) AND MONTH(date) = MONTH(CURDATE()) GROUP BY day");
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            JsonArray labels = new JsonArray();
            JsonArray data = new JsonArray();

            while (rs.next()) {
                labels.add(rs.getString("day"));
                data.add(rs.getInt("duration"));
            }

            jsonResponse.add("labels", labels);
            jsonResponse.add("data", data);

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(jsonResponse.toString());
        out.flush();
    }
}
