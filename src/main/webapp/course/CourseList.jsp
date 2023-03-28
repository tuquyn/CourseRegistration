<%@ page import="course.CourseDao" %>
<%@ page import="connection.ConnectionDB" %>
<%@ page import="course.Course" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/17/2023
  Time: 5:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Course List</title>
</head>
<body>
    <h1>Manage Course</h1>
    <table>
        <tbody>
        <tr>
            <th><center>Course ID</center></th>
            <th>Course Name</th>
            <th><center>Course Action</center></th>
        </tr>
        <%
            CourseDao cao = new CourseDao(ConnectionDB.getCon());
            List<Course> listAllCourse = cao.listAllCourse();
            for(Course course: listAllCourse){
                int CourseID = course.getCourseID();
                String CourseName = course.getCourseName();

                out.print("<tr>");
                out.print("<td>" + CourseID + "</td>");
                out.print("<td><a href=\"CourseDetail.jsp?CourseID="+CourseID+"&CourseName=" + CourseName+"\">"+CourseName+"</a>" + "</td>");
                out.print("<td><a href=\"CourseRemove.jsp?CourseID="+CourseID+"&CourseName="+CourseName+"\">Remove</a> | <a href=\"CourseEdit.jsp?CourseID="+CourseID+"&CourseName="+CourseName+"\">Edit</a></td>");
                out.print("</tr>");
            }
        %>
        </tbody>
    </table><br>
    <a href="CourseAdd.jsp"> New Course</a><br>
    <a href="../CourseRegistration.jsp">Homepage</a><br>
</body>
</html>
