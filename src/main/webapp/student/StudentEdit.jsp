<%@ page import="student.StudentDao" %>
<%@ page import="connection.ConnectionDB" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/17/2023
  Time: 6:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%
  String StudentID = request.getParameter("StudentID");
  String StudentName = request.getParameter("StudentName");
  StudentDao sao = new StudentDao(ConnectionDB.getCon());
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
      <title>Student Edit</title>
  </head>
  <body>
      <h1>Please enter new name for <%= StudentName %>.</h1>
      <form>
          <input type='hidden' name='StudentID' value=<%=StudentID%> />
          <input type='hidden' name='StudentName' value=<%=StudentName%> />
          New Student Name: <input type='text' name='newStudentName'/><br>
          <input type="submit" value="Edit" name="edit">
          <input type="submit" value="Cancel" name="cancel">
      </form>

      <%
          if(request.getParameter("edit")!=null){
              if(request.getParameter("edit").equals("Edit")){
                sao.editStudent(Integer.valueOf(StudentID), request.getParameter("newStudentName"));
                response.sendRedirect("StudentList.jsp");
              }
          }
          if(request.getParameter("cancel")!=null){
              if(request.getParameter("cancel").equals("Cancel")){
                response.sendRedirect("StudentList.jsp");
              }
          }
      %>
  </body>
</html>
