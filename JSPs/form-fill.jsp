
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/welcome-atc.css">
<title> Add a Flight </title>
<link rel="stylesheet" href="css/footer-distributed-with-address-and-phones.css">
	
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

	<link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
	<link href="http://fonts.googleapis.com/css?family=Dosis" rel="stylesheet" type="text/css">
	<link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
</head>
<body>
<div class="time">
 
</div>
<nav>
    <div class="container">
    
      <div class="nav2">
        <ul>
          <li><a href="index.html">Home</a></li>
          <li><a href="welcome-atc.jsp">General</a></li>
          <li><a href="atc-arrival.jsp">Arrival</a></li>
          <li><a href="atc-departure.jsp">Departure</a></li>
          <li><a href="atc-review.jsp">Review</a></li>
          <li><a href="atc-weather.jsp">Weather</a></li>
          <li><a href="airlines-request.html">Schedule New Flight</a></li>
          <li><a href="flight-cancel.html">Cancel a Flight</a></li>
          <li><a href="logout-atc.jsp">Logout</a></li>
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
	String airlines = request.getParameter("airlines");
	Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectflight" , "root" , "goodjoke");   
    PreparedStatement pst = conn.prepareStatement("select pilot_id from pilot where airlines=? and pilot_id not in(select pilot_id from flight where airlines=?)");
	pst.setString(1,airlines);
	pst.setString(2, airlines);
	ResultSet rs= pst.executeQuery();
	
	
%>

	
     <div class="display-pilot">
     
   
     
     </div>
	<div class="flight-form">
		<form method="post" action="flight-form.jsp">
			Flight ID : <input type="text"  name="flight_id" value="your id"><br>
			Aircraft Name : <select name="aircraft_name">
				<option value="A320">A320</option>
				<option value="A333">A333</option>
				<option value="A320N">A320N</option>
				<option value="B738">B738</option>
				<option value="B777">B777</option>
				<option value="DH8">DH8</option>
				<option value="B737">B737</option>
			</select><br>
		Priority : <input type="number" value="1" name="priority"><br>
		Number of Passengers : <input type="number" name="no_of_pass"><br>
		Emergency : <select name="emergency">
			<option value="no">no</option>
			<option value="yes">yes</option>
		</select><br>
		Airlines : <select name="airlines">
			<option value="Indigo">Indigo</option>
			<option value="Air India">Air India</option>
			<option value="Air Asia">Air Asia</option>
			<option value="Jet Airways">Jet Airways</option>
			<option value="Spicejet">Spicejet</option>
			<option value="Go Air">Go Air</option>
			<option value="Vistara">Vistara</option>
			<option value="Singapore Airlines">Singapore Airlines</option>
			<option value="Air France">Air France</option>
			<option value="Emirates">Emirates</option>
			<option value="Qatar Airways">Qatar Airways</option>
			<option value="Etihad Airways">Etihad Airways</option>
			<option value="Lufthansa">Lufthansa</option>
			<option value="British Airways">British Airways</option>
		</select><br>
		Status : <input type="text" value="On Time" name="status"><br>
		Type : <select name="type">
    				<option value="Domestic">Domestic</option>
    				<option value="International">International</option>
  				</select><br>
  		Source : <select name="source">
  					<option value="Bengaluru">Bengaluru</option>
  				</select><br>
		Destination : <input type="text" name="destination"><br>
		Departure : <input type="text" name="departure"><br>
		Arrival : <input type="text" name="arrival"><br>
		Pilot ID : <select name="pilot_id">
		<%while(rs.next()){%>
			<option value="<%out.print(rs.getInt(1));%> "><%out.print(rs.getInt(1));%> </option>
		<% 
		}%>
			
		</select><br> 
		<input type="submit" value="Select available pilot">
		</form>
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