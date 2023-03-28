<%@ page import="student.StudentDao" %>
<%@ page import="connection.ConnectionDB" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/17/2023
  Time: 6:48 PM
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
    <title>Student Remove</title>
</head>
<body>
  <h1>Would you like to remove <%= StudentName %> ?</h1>
  <form>
    <input type='hidden' name='StudentID' value=<%=StudentID%> />
    <input type='hidden' name='StudentName' value=<%=StudentName%> />
    <input type="submit" value="Remove" name="remove">
    <input type="submit" value="Cancel" name="cancel">

  </form>

  <%
    if(request.getParameter("remove")!=null){
      if(request.getParameter("remove").equals("Remove")){
        sao.deleteStudent(Integer.valueOf(StudentID));
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
