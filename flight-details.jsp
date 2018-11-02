<html>
<head></head>
<body>

<%@ page import ="java.sql.*" %>
<%@ page import =" java.sql.Connection" %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page import ="java.sql.Statement" %>
<%@ page import ="java.lang.*" %>
<%

try{
	String flight = request.getParameter("flight_id");
	Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectflight" , "root" , "Admin@aryan1!");    
    PreparedStatement pst = conn.prepareStatement("Select * from flight where flight_id=?");
    pst.setString(1, flight);
    ResultSet rs = pst.executeQuery();   
    rs.next();
	%>
	<nav>
	
	</nav>
	<div class="flight_details">
	<p>Flight ID: <%out.print(rs.getString(1));%></p>
	<p>Aircraft Type: <%out.print(rs.getString(2));%></p>
	<p>No. of Passengers: <%out.print(rs.getInt(4));%></p>
	<p>Airlines: <%out.print(rs.getString(6));%></p>
	<p>Status: <%out.print(rs.getString(7));%></p>
	<p>Source: <%out.print(rs.getString(9));%></p>
	<p>Destination: <%out.print(rs.getString(10));%></p>
	<p>Departure: <%out.print(rs.getTime(11));%></p>
	<p>Arrival: <%out.print(rs.getTime(12));%></p>
	<p>Pilot ID: <%out.print(rs.getInt(13));%></p>
	
	</div>
	
    


<%
}
catch(Exception e){       
        out.println("Something went wrong !! Please try again " + e);
   
    }    
    
%>
</body>
</html>