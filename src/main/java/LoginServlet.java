import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
            // Redirect to login page if input is empty
            response.sendRedirect("login.jsp");
            return;
        }

        String jdbcUrl = "jdbc:mysql://localhost:3306/EmployeeTaskTracker";
        String dbUser = "root";
        String dbPassword = "Hari@108";
        String sqlQuery = "SELECT * FROM Users WHERE username=? AND password=?";

        try (Connection con = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
             PreparedStatement ps = con.prepareStatement(sqlQuery)) {

            Class.forName("com.mysql.cj.jdbc.Driver");
            
            ps.setString(1, username);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    session.setAttribute("role", rs.getString("role"));
                    response.sendRedirect("dashboard.jsp");
                } else {
                    // Redirect to login page with an error message
                    response.sendRedirect("login.jsp?error=Invalid credentials");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=An error occurred");
        }
    }
}

