<%@ page import="course.CourseDao" %>
<%@ page import="connection.ConnectionDB" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/17/2023
  Time: 6:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    String CourseID = request.getParameter("CourseID");
    String CourseName = request.getParameter("CourseName");
    CourseDao cao = new CourseDao(ConnectionDB.getCon());
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Course Edit</title>
</head>
    <body>
        <h1>Please enter new name for <%= CourseName %>.</h1>
        <form>
            <input type='hidden' name='CourseID' value=<%=CourseID%> />
            <input type='hidden' name='CourseName' value=<%=CourseName%> />
            New Course Name: <input type='text' name='newCourseName'/><br>
            <input type="submit" value="Edit" name="edit">
            <input type="submit" value="Cancel" name="cancel">
        </form>

        <%
            if(request.getParameter("edit")!=null){
                if(request.getParameter("edit").equals("Edit")){
                    cao.editCourse(Integer.valueOf(CourseID), request.getParameter("newCourseName"));
                    response.sendRedirect("CourseList.jsp");
                }
            }
            if(request.getParameter("cancel")!=null){
                if(request.getParameter("cancel").equals("Cancel")){
                    response.sendRedirect("CourseList.jsp");
                }
            }
        %>
    </body>
</html>
