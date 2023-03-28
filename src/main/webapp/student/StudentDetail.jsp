<%@ page import="student.StudentDao" %>
<%@ page import="connection.ConnectionDB" %>
<%@ page import="course.CourseDao" %>
<%@ page import="course.Course" %>
<%@ page import="java.util.List" %>
<%@ page import="studentcourse.StudentCourseDao" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/17/2023
  Time: 6:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    String StudentID = request.getParameter("StudentID");
    String StudentName = request.getParameter("StudentName");
    StudentDao sao = new StudentDao(ConnectionDB.getCon());
    CourseDao cao = new CourseDao(ConnectionDB.getCon());
    StudentCourseDao scao = new StudentCourseDao(ConnectionDB.getCon());
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Detail</title>
</head>
    <body>
        <h1>Student's Details</h1>
        Student ID: <%= StudentID%> <br>
        Student name: <%= StudentName%> <br>
        <h2>Select Course</h2>
        Course:
        <form>
            <input type="hidden" name="StudentID" value=<%=StudentID%>>
            <input type="hidden" name="StudentName" value=<%=StudentName%>>

            <select name="field_of_study">
                <%
                    List<Course> listAllAvailableCourse = cao.listAllCourse();
                    for(Course course : listAllAvailableCourse){
                        String CourseName = course.getCourseName();
                        out.print("<option value=" + CourseName +">" + CourseName + "</option>");
                    }
                %>
            </select>
            <input type="submit" value="Add" name="Add">
        </form>
        <%
            if(request.getParameter("Add")!= null){
                if(request.getParameter("Add").equals("Add")){
                    String CourseNameDecoded = request.getParameter("field_of_study");
                    String StudentNameDecoded = request.getParameter("StudentName");
                    Integer CourseID = cao.findCourseID(CourseNameDecoded);
                    scao.addStudentCourse(Integer.valueOf(StudentID), CourseID);
                    response.sendRedirect("StudentDetail.jsp?StudentName=" + StudentNameDecoded + "&StudentID=" + StudentID);
                }
            }

        %>
        <h2>Registered Courses:</h2>
        <table>
            <tbody>
            <tr>
                <th>Course ID</th>
                <th>Course Name</th>
                <th>Action</th>
            </tr>
            <%
                List<Course> listAllCourse = scao.listAllCourse(Integer.valueOf(StudentID));
                for(Course course : listAllCourse){
                    int CourseID = course.getCourseID();
                    String CourseName = course.getCourseName();
                    out.print("<tr>");
                    out.print("<td>" + CourseID + "</td>");
                    out.print("<td>" + CourseName + "</td>");
                    out.print("<td><a href=\"../studentcourse/StudentCourseRemove.jsp?StudentID="+StudentID+"&StudentName="+StudentName+"&CourseID="+CourseID+"&CourseName="+CourseName+"&from=StudentDetail"+"\">Remove</a></td>");
                    out.print("</tr>");
                }
            %>
            </tbody>
        </table>
        <br>
        <a href="../CourseRegistration.jsp"> Homepage</a><br>
    </body>
</html>
