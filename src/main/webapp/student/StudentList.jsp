<%@ page import="student.Student" %>
<%@ page import="student.StudentDao" %>
<%@ page import="connection.ConnectionDB" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/17/2023
  Time: 5:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student List</title>
</head>
<body>
    <h1>Manage Student</h1>
    <table>
        <tbody>
            <tr>
                <th><center>Student ID</center></th>
                <th>Student Name</th>
                <th><center>Student Action</center></th>
            </tr>
        <%
            StudentDao sao = new StudentDao(ConnectionDB.getCon());
            List<Student> listAllStudent = sao.listAllStudent();
            for(Student student : listAllStudent){
                int StudentID = student.getStudentID();
                String StudentName = student.getStudentName();

                out.print("<tr>");
                out.print("<td>" + StudentID + "</td>");
                out.print("<td><a href=\"StudentDetail.jsp?StudentID=" + StudentID + "&StudentName=" + StudentName+"\">"+StudentName+"</a>" + "</td>");
                out.print("<td><a href=\"StudentRemove.jsp?StudentID="+StudentID+"&StudentName="+StudentName
                        +"\">Remove</a> | <a href=\"StudentEdit.jsp?StudentID="+StudentID+"&StudentName="+StudentName+"\">Edit</a></td>");
                out.print("</tr>");
            }
        %>
        </tbody>
    </table>
    <br>
    <a href="StudentAdd.jsp"> New Student</a><br>
    <a href="../CourseRegistration.jsp"> Homepage</a><br>
</body>
</html>
