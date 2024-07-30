import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/AssociaterPageServlet")
public class AssociaterPageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (isSessionInvalid(session)) {
            redirectToLogin(response);
        } else if (!isAssociateRole(session)) {
            redirectToDashboard(response);
        } else {
            forwardToAssociaterPage(request, response);
        }
    }

    private boolean isSessionInvalid(HttpSession session) {
        return session == null || session.getAttribute("username") == null;
    }

    private boolean isAssociateRole(HttpSession session) {
        String role = (String) session.getAttribute("role");
        return "Associate".equals(role);
    }

    private void redirectToLogin(HttpServletResponse response) throws IOException {
        response.sendRedirect("login.jsp");
    }

    private void redirectToDashboard(HttpServletResponse response) throws IOException {
        response.sendRedirect("dashboard.jsp");
    }

    private void forwardToAssociaterPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("associaterPage.jsp").forward(request, response);
    }
}
