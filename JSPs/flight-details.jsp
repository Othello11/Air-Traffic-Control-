<html>
<head>
<link rel="stylesheet" href="css/footer-distributed-with-address-and-phones.css">
	
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/welcome-atc.css">

	<link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
	<link href="http://fonts.googleapis.com/css?family=Dosis" rel="stylesheet" type="text/css">
	<link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
</head>
<body>
<nav>
    <div class="container">
    
      <div class="nav2">
        <ul>
          <li><a href="index.html">Home</a></li>
          <li><a href="#">About</a></li>
          <li><a href="logout.jsp">Logout</a></li>
        </ul>
      </div>
    </div>
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
	String flight = request.getParameter("flight_id");
	Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectflight" , "root" , "goodjoke");    
    PreparedStatement pst = conn.prepareStatement("Select * from flight where flight_id=?");
    pst.setString(1, flight);
    ResultSet rs = pst.executeQuery();   
    rs.next();
	%>
	<nav>
	
	</nav>
	<div class="flight-details" style="padding:50px 0 100px 0;">
	<h3 align="center">Your Flight details are...</h3>
	<table align="center">
		<tr>
			<th>Flight ID</th>
			<td> <%out.print(rs.getString(1));%></td>
		</tr>
		<tr>
			<th>Aircraft Type</th>
			<td> <%out.print(rs.getString(2));%></td>
		</tr>
		<tr>
			<th>No. of Passengers</th>
			<td> <%out.print(rs.getInt(3));%></td>
		</tr>
		<tr>
			<th>Airlines</th>
			<td> <%out.print(rs.getString(6));%></td>
		</tr>
		<tr>
			<th>Status</th>
			<td> <%out.print(rs.getString(7));%></td>
		</tr>
		<tr>
			<th>Source</th>
			<td> <%out.print(rs.getString(9));%></td>
		</tr>
		<tr>
			<th>Departure</th>
			<td> <%out.print(rs.getTime(11));%></td>
		</tr>
		<tr>
			<th>Arrival</th>
			<td> <%out.print(rs.getTime(12));%></td>
		</tr>
		<tr>
			<th>Pilot ID</th>
			<td> <%out.print(rs.getString(13));%></td>
		</tr>
	</table>
	</div>
	
    


<%
}
catch(Exception e){       
        out.println("Something went wrong !! Please try again " + e);
   
    }    
    
%>
<footer class="footer-distributed">

			<div class="footer-left">

				<h3>Flight<span>Radar</span></h3>

				<p class="footer-links">
					<a href="index.html">Home</a>
					·
					<a href="About.html">About Project</a>
					·
					<a href="Developers.html">Developers</a>
				</p>

				<p class="footer-company-name">Flight Radar &copy; 2018</p>
			</div>

			<div class="footer-center">

				<div>
					<i class="fa fa-map-marker"></i>
					<p><span></span> Bengaluru, India</p>
				</div>

				<div>
					<i class="fa fa-phone"></i>
					<p>+ 998 877 6655</p>
				</div>

				<div>
					<i class="fa fa-envelope"></i>
					<p><a href="mailto:support@company.com">supportflight@gmail.com</a></p>
				</div>

			</div>

			<div class="footer-right">

				<p class="footer-company-about">
					<span>About the Project</span>
					This project is dedicated to provide a seamless interface for pilots, air traffic controller and passengers.
				</p>

				<div class="footer-icons">

					<a href="#"><i class="fa fa-facebook"></i></a>
					<a href="#"><i class="fa fa-twitter"></i></a>
					<a href="#"><i class="fa fa-linkedin"></i></a>
					<a href="https://github.com/Othello11/Air-Traffic-Control-"><i class="fa fa-github"></i></a>

				</div>

			</div>

		</footer>
      
</body>
</html>