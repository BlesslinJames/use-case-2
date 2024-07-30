import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/DeleteTaskServlet")
public class DeleteTaskServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int taskId = Integer.parseInt(request.getParameter("taskId"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EmployeeTaskTracker", "root", "Hari@108");
            PreparedStatement ps = con.prepareStatement("DELETE FROM Tasks WHERE task_id=?");
            ps.setInt(1, taskId);
            ps.executeUpdate();
            response.sendRedirect("taskPage.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
