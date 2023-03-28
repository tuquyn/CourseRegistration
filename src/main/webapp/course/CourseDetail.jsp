<%@ page import="course.CourseDao" %>
<%@ page import="connection.ConnectionDB" %>
<%@ page import="student.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="studentcourse.StudentCourseDao" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/17/2023
  Time: 6:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    String CourseID = request.getParameter("CourseID");
    String CourseName = request.getParameter("CourseName");
    CourseDao cao = new CourseDao(ConnectionDB.getCon());
    StudentCourseDao scao = new StudentCourseDao(ConnectionDB.getCon());
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Course Detail</title>
</head>
<body>
    <h1>Course's Details</h1>
    Course ID: <%= CourseID%> <br>
    Course name: <%= CourseName%> <br>
    <h2>Student list:</h2>
    <table>
        <tbody>
            <tr>
                <th>Student ID</th>
                <th>Student Name</th>
                <th>Action</th>
            </tr>
        <%
            List<Student> listAllStudent = scao.listAllStudent(Integer.valueOf(CourseID));
            for(Student student : listAllStudent){
                int StudentID = student.getStudentID();
                String StudentName = student.getStudentName();
                out.print("<tr>");
                out.print("<td>" + StudentID + "</td>");
                out.print("<td>" + StudentName + "</td>");
                out.print("<td><a href=\"../studentcourse/StudentCourseRemove.jsp?StudentID="+StudentID+"&StudentName="+StudentName+"&CourseID="+CourseID+"&CourseName="+CourseName+"&from=CourseDetail"+"\">Remove</a></td>");
                out.print("</tr>");
            }
        %>
        </tbody>
    </table>
    <br>
    <a href="../CourseRegistration.jsp">Homepage</a><br>
    </body>
</html>
