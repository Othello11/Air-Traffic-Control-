
<html>
</head>
<link rel="stylesheet" type="text/css" href="syle1.css">
</head>
<body>
<nav>
	<!-- image tag for logo -->
	
	<ul>
		<li> <img src="images/passenger-profile.png" width="50" height="50"></li>
		<li> <a href="pass-profile.jsp">Profile</a></li>
		<li> <a href="passenger-logout.jsp">Logout</a> 	</li>
	</ul>
</nav>
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
    String password = request.getParameter("flight_id");
    Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectflight" , "root" , "goodjoke");   
    PreparedStatement pst = conn.prepareStatement("Select * from passenger where p_id=? and flight_id=?");
  	PreparedStatement pst1 = conn.prepareStatement("select * from flight where flight_id=?");
    pst.setString(1, username);
    pst.setString(2, password);
    pst1.setString(1,password);
    ResultSet rs = pst.executeQuery();
   	ResultSet rs1 = pst1.executeQuery();
    rs.next();
    rs1.next();
    %>
  
   <!--  <div class = "profile">
    <p>Welcome <%--out.print(rs.getString(2));--%></p>
    <p>Your Passenger ID is : <%--out.print(rs.getString(1)); --%></p>
    <p>Gender:<%--out.println(rs.getString(3));--%></p>
    <p>Flight ID:<%--out.println(rs.getString(4));--%></p>    
    </div> -->
    <div class = "flight_details">
    	<p>Flight ID: <%out.print(rs1.getString(1));%></p>
	<p>Aircraft Type: <%out.print(rs1.getString(2));%></p>
	
	<p>Airlines: <%out.print(rs1.getString(6));%></p>
	<p>Status: <%out.print(rs1.getString(7));%></p>
	<p>Source: <%out.print(rs1.getString(9));%></p>
	<p>Destination: <%out.print(rs1.getString(10));%></p>
	<p>Departure: <%out.print(rs1.getTime(11));%></p>
	<p>Arrival: <%out.print(rs1.getTime(12));%></p>
	
    <p>How would you rate this airport? Care for a short review <br> <a href="passenger-review.jsp?&p_id=<%=rs.getInt(1)%>">Click Here!</a></p>
    <% %>
    <!--  <p>You have been assigned flight no. : <%--out.print(rs.getString(7));--%><a href= "" target ="blank">Click here</a> for details</p>
    <p>You have been assigned with Air Traffic Control Unit: <%--out.print(rs.getInt(6)); --%></p> -->
    </div>
    <footer>
    <!-- Add copyright and some more dilling -->
    </footer>
    <%
}
catch(Exception e){      
   out.println("Something went wrong !! Please try again " + e);
}   
%>


</body>
</html>


