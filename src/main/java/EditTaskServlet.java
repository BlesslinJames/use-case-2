import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/EditTaskServlet")
public class EditTaskServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int taskId = Integer.parseInt(request.getParameter("taskId"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EmployeeTaskTracker", "root", "Hari@108");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Tasks WHERE task_id=?");
            ps.setInt(1, taskId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                request.setAttribute("task", rs);
                request.getRequestDispatcher("editTask.jsp").forward(request, response);
            } else {
                response.sendRedirect("taskPage.jsp?error=Task not found");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        String project = request.getParameter("project");
        Date date = Date.valueOf(request.getParameter("date"));
        Time startTime = Time.valueOf(request.getParameter("startTime") );
        Time endTime = Time.valueOf(request.getParameter("endTime") );
        String category = request.getParameter("category");
        String description = request.getParameter("description");

        if (startTime.equals(endTime) || endTime.before(startTime)) {
            response.sendRedirect("editTask.jsp?error=Invalid time range&taskId=" + taskId);
            return;
        }

        long duration = (endTime.getTime() - startTime.getTime()) / (1000 * 60 * 60);
        if (duration > 8) {
            response.sendRedirect("editTask.jsp?error=Task duration cannot exceed 8 hours&taskId=" + taskId);
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EmployeeTaskTracker", "root", "sanjay01");
            PreparedStatement ps = con.prepareStatement("UPDATE Tasks SET project=?, date=?, start_time=?, end_time=?, category=?, description=? WHERE task_id=?");
            ps.setString(1, project);
            ps.setDate(2, date);
            ps.setTime(3, startTime);
            ps.setTime(4, endTime);
            ps.setString(5, category);
            ps.setString(6, description);
            ps.setInt(7, taskId);
            ps.executeUpdate();
            response.sendRedirect("taskPage.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
