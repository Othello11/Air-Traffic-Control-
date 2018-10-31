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
try{
    String username = request.getParameter("username");  
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectflight" , "root" , "goodjoke");   
    PreparedStatement pst = conn.prepareStatement("Select * from pilot where pilot_id=? and password=?");
    pst.setString(1, username);
    pst.setString(2, password);
    ResultSet rs = pst.executeQuery();
    rs.next();
    out.println(rs.getString(1));
    out.println(rs.getString(5));
}
catch(Exception e){      
   out.println("Something went wrong !! Please try again " + e);

}   

%>


</body>
</html>

