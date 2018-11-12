
<html>
<head>
<link rel="stylesheet" type="text/css" href="style1.css">
<title> Add a Flight </title>
</head>
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
	String airlines = request.getParameter("airlines");
	Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectflight" , "root" , "Admin@aryan1!");   
    PreparedStatement pst = conn.prepareStatement("select pilot_id from pilot where airlines=? and pilot_id not in(select pilot_id from flight where airlines=?)");
	pst.setString(1,airlines);
	pst.setString(2, airlines);
	ResultSet rs= pst.executeQuery();
	
	
%>

	 <header>
     
    <!--Add font and logout link here -->
   	<form method="get" action="logout-atc.jsp">
    	<button type="submit">Logout</button>
	</form>
    
     </header>
     <nav>
     	<ul>
     	<li><a href ="welcome-atc.jsp">General</a></li>
     	<li><a href ="atc-arrival.jsp">Arrival</a></li>
     	<li><a href ="atc-departure.jsp">Departure</a></li>
     	<li><a href ="atc-review.jsp">Reviews</a></li>
     	<li><a href ="atc-weather.jsp">Weather</a></li>
		</ul>  
     </nav>
     <div class="display-pilot">
     
     <h2>Available pilots for the airline <%out.println(airlines); %></h2>
    <%while(rs.next()){
    	%>
    
    	<p><%out.println(rs.getInt(1));%></p>
    <%} %>	
    	
  
     
     </div>
	<div class="flight-form">
		<form method="post" action="flight-form.jsp">
			Flight ID : <input type="text"  name="flight_id"><br>
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
			<option value="yes">yes</option>
			<option value="no">no</option>
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
		<!-- Pilot ID : <input type="number" name="pilot_id" min=2001 max=2067><br> -->
		<input type="submit" value="Select available pilot">
		</form>
	</div>

	 <%
}
catch(Exception e){      
   out.println("Something went wrong !! Please try again " + e);
}   
%>
	

</body>
</html>