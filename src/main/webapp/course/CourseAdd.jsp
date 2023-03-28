<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/17/2023
  Time: 6:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Course Add</title>
</head>
    <body>
        <h1>Add Course</h1>
        <form action="CourseAddServlet" method="post">
            <table>
                <tbody>
                    <tr>
                        <td>Course Name:</td>
                        <td><input type="text" name="CourseName"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Add"></td>
                    </tr>
                </tbody>
            </table>
        </form>
        <br>
        <a href="CourseList.jsp">Manage Course</a><br>
        <a href="../CourseRegistration.jsp">Homepage</a>
    </body>
</html>
