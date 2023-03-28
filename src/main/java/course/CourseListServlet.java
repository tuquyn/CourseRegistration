package course;

import connection.ConnectionDB;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CourseListServlet", value = "/CourseListServlet")
public class CourseListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            CourseDao cao = new CourseDao(ConnectionDB.getCon());
            List<Course> listAllCourse = cao.listAllCourse();
            for(Course course: listAllCourse){

                out.print("<tr>");
                out.print("<td>" + course.getCourseName() + "</td>");
                out.print("<td>" + course.getCourseID() + "</td>");
                out.print("<td><a href=\"CourseRemove.jsp\">Remove</a> | <a href=\"\">Edit</a></td>");
                out.print("</tr>");

            }
            HttpSession session = request.getSession();
            session.setAttribute("loggedAllCourse", listAllCourse);
        }
    }
}
