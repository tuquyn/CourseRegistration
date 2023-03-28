<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/17/2023
  Time: 6:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Add</title>
</head>
    <body>
        <h1>Add Student</h1>
        <form action="StudentAddServlet" method="post">
            <table>
                <tbody>
                <tr>
                      <td>Full Name:</td>
                      <td><input type="text" name="StudentName"></td>
                </tr>
                <tr>
                      <td></td>
                      <td><input type="submit" value="Add"></td>
                </tr>
                </tbody>
            </table>
        </form>
        <br>
        <a href="StudentList.jsp">Manage Student</a><br>
        <a href="../CourseRegistration.jsp">Homepage</a><br>
    </body>
</html>
