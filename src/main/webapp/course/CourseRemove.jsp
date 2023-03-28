<%@ page import="course.CourseDao" %>
<%@ page import="connection.ConnectionDB" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/17/2023
  Time: 6:40 PM
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
    <title>Course Remove</title>
</head>
<body>
    <h1>Would you like to remove <%= CourseName %> ?</h1>
    <form>
        <input type='hidden' name='CourseID' value=<%=CourseID%> />
        <input type='hidden' name='CourseName' value=<%=CourseName%> />
        <input type="submit" value="Remove" name="remove">
        <input type="submit" value="Cancel" name="cancel">

    </form>

    <%
        if(request.getParameter("remove")!=null){
            if(request.getParameter("remove").equals("Remove")){
                cao.deleteCourse(Integer.valueOf(CourseID));
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
