<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/17/2023
  Time: 10:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="connection.ConnectionDB"%>
<%@page import="student.StudentDao"%>

<%
  StudentDao sao = new StudentDao(ConnectionDB.getCon());
%>

<html>
<head>
    <title>JSP Page</title>
</head>
<body>
  <h1>Course Registration Demo</h1>
  <form>
    Student ID: <input type="text" name="StudentID"/>
    <input type="submit" value="Submit" name="Submit"/>
  </form>

  <%
    if(request.getParameter("Submit")!=null){
      if(request.getParameter("Submit").equals("Submit")){
        Integer StudentID = Integer.valueOf(request.getParameter("StudentID"));
        String StudentName = sao.findStudentName(StudentID);
        response.sendRedirect("student/StudentDetail.jsp?StudentName=" + StudentName + "&StudentID=" + StudentID);
      }
    }
  %>

  <h2>Manager</h2>
  <a href="student/StudentList.jsp">Students Manager</a><br>
  <a href="course/CourseList.jsp">Courses Manager</a>
</body>
</html>
