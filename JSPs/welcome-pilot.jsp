
<html>
<body>
<h1>Pilot landing page</h1>
<%@ page import ="java.sql.*" %>
<%@ page import =" java.sql.Connection" %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page import ="java.sql.Statement" %>
<%@ page import ="java.lang.*" %>
<% 
String username = request.getParameter("username");
String password = request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectflight" , "root" , "Admin@aryan1!");
Statement st = conn.createStatement();
String query=  "Select * from pilot";
ResultSet rs = st.executeQuery(query);
%>
<p>Hi,</p> <% System.out.print(rs.getInt(1));%>


</body>
</html>