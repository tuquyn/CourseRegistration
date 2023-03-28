<%@ page import="connection.ConnectionDB" %>
<%@ page import="studentcourse.StudentCourseDao" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/17/2023
  Time: 7:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    String StudentID = request.getParameter("StudentID");
    String StudentName = request.getParameter("StudentName");

    String CourseID = request.getParameter("CourseID");
    String CourseName = request.getParameter("CourseName");

    String from = request.getParameter("from");

    StudentCourseDao scao = new StudentCourseDao(ConnectionDB.getCon());
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Course Remove</title>
</head>
<body>
    <h1>Would you like to remove <%= CourseName %> from <%= StudentName %>?</h1>
    <form>
        <input type='hidden' name='StudentID' value=<%=StudentID%> />
        <input type='hidden' name='StudentName' value=<%=StudentName%> />
        <input type='hidden' name='CourseID' value=<%=CourseID%> />
        <input type='hidden' name='CourseName' value=<%=CourseName%> />
        <input type='hidden' name='from' value=<%=from%> />
        <input type="submit" value="Remove" name="remove">
        <input type="submit" value="Cancel" name="cancel">
    </form>
    <%
        if(request.getParameter("remove")!=null){
            if(request.getParameter("remove").equals("Remove")){
                scao.removeStudentCourse(Integer.valueOf(StudentID),Integer.valueOf(CourseID));
                if(from.equals("CourseDetail")){
                    response.sendRedirect("../course/CourseDetail.jsp?CourseID=" + CourseID + "&CourseName=" + CourseName);
                }
                if(from.equals("StudentDetail")){
                    response.sendRedirect("../student/StudentDetail.jsp?StudentID=" + StudentID + "&StudentName=" + StudentName);
                }
            }
        }
        if(request.getParameter("cancel")!=null){
            if(request.getParameter("cancel").equals("Cancel") ){
                if(from.equals("CourseDetail")){
                    response.sendRedirect("../course/CourseDetail.jsp?CourseID=" + CourseID + "&CourseName=" + CourseName);
                }
                if(from.equals("StudentDetail")){
                    response.sendRedirect("../student/StudentDetail.jsp?StudentID=" + StudentID + "&StudentName=" + StudentName);
                }
            }
        }
    %>
</body>
</html>
