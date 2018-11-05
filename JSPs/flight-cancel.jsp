<html>
<head>
<title>
</title>
</head>
<%@ page import ="java.sql.*" %>
<%@ page import =" java.sql.Connection" %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page import ="java.sql.Statement" %>
<%@ page import ="java.lang.*" %>
<%

	try{
		String flight_id = request.getParameter("flight_id");
		Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
	    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectflight" , "root" , "Admin@aryan1!");  
		PreparedStatement pst = conn.prepareStatement("delete from flight where flight_id=?");
		pst.setString(1,flight_id);
		int count = pst.executeUpdate();
		out.println(count+"1 row deleted");
	}
catch(Exception e){      
	   out.println("Something went wrong !! Please try again " + e);
	}   
%>
</body>
</html>