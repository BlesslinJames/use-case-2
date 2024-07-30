import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/TaskServlet")
public class TaskServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        String project = request.getParameter("project");
        Date date = Date.valueOf(request.getParameter("date"));
        Time startTime = Time.valueOf(request.getParameter("startTime")+":00");
        Time endTime = Time.valueOf(request.getParameter("endTime") +":00");
        String category = request.getParameter("category");
        String description = request.getParameter("description");

        if (startTime.equals(endTime) || endTime.before(startTime)) {
            response.sendRedirect("taskPage.jsp?error=Invalid time range");
            return;
        }

        long duration = (endTime.getTime() - startTime.getTime()) / (1000 * 60 * 60);
        if (duration > 8) {
            response.sendRedirect("taskPage.jsp?error=Task duration cannot exceed 8 hours");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EmployeeTaskTracker", "root", "Hari@108");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Tasks WHERE employee_id=? AND date=? AND start_time=?");
            ps.setInt(1, userId);
            ps.setDate(2, date);
            ps.setTime(3, startTime);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                response.sendRedirect("taskPage.jsp?error=Duplicate task entry");
                return;
            }

            ps = con.prepareStatement("INSERT INTO Tasks (employee_id, project, date, start_time, end_time, category, description) VALUES (?, ?, ?, ?, ?, ?, ?)");
            ps.setInt(1, userId);
            ps.setString(2, project);
            ps.setDate(3, date);
            ps.setTime(4, startTime);
            ps.setTime(5, endTime);
            ps.setString(6, category);
            ps.setString(7, description);
            ps.executeUpdate();
            response.sendRedirect("taskPage.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
