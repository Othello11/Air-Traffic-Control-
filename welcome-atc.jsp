<html>
<head>
<title>Welcome ATC </title>
<link rel="stylesheet" type="text/css" href="css/welcome-atc.css">
<link rel="stylesheet" href="css/footer-distributed-with-address-and-phones.css">
	
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

	<link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
	<link href="http://fonts.googleapis.com/css?family=Dosis" rel="stylesheet" type="text/css">
	<link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<script type="text/javascript">
	
$.ajax({
    url:'http://api.openweathermap.org/data/2.5/weather?q=Bangalore&appid=9c8e99d481587c0b1d13e5010533b420',
    type:'GET',
    
    success: function(response){
    	var data = $('<ul><li>Temperature:'+Math.floor((parseInt(response.main.temp)-272.15))+'&deg;C'+'<li>Description:'+response.weather[0].main+'</li><li>Wind Speed:'+ response.wind.speed+'KMPH</li><li>Wind Direction:'+response.wind.deg +'</li><li>Visibility:'+response.visibility +' </li></ul>');
    	$('.nav3').append(data);
    }

});
    	
    
</script>
<body>


<%@ page import ="java.sql.*" %>
<%@ page import =" java.sql.Connection" %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page import ="java.sql.Statement" %>
<%@ page import ="java.lang.*" %>
<%@ page import ="java.util.*" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%Calendar calendar = Calendar.getInstance();
int hours = calendar.get(Calendar.HOUR_OF_DAY); 
response.setIntHeader("Refresh", 3600); %>
<%
    try{
    	String hour = String.valueOf(hours) + ":00:00";
    	
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectflight" , "root" , "Admin@aryan1!");    
        PreparedStatement pst = conn.prepareStatement("Select * from flight order by departure");
        PreparedStatement pst1 = conn.prepareStatement("Select * from weather where st_time=?");
        pst1.setString(1, hour);
        ResultSet rs = pst.executeQuery();
        ResultSet rs1= pst1.executeQuery();
        rs1.next();
        %>
   
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
  
    
   
    <div class="container">
    
      <div class="nav3">
        
      </div>
    </div>
     
    
     <div class="flight-details">
     <table align="center">
     	<tr>
     		<th>Flight ID</th>
     		<th>Aircraft Name</th>
     		<th>Passengers</th>
     		<th>Emergency</th>
     		<th>Airlines</th>
     		<th>Status</th>
     		<th>Type</th>
     		<th>Source</th>
     		<th>Destination</th>
     		<th>Departure</th>
     		<th>Arrival</th>
     		<th>Pilot ID</th>	
     	</tr>
     	<% while(rs.next()){ %>
     	<tr>
     		
     		<td><%out.print(rs.getString(1));%></td>
			<td><%out.print(rs.getString(2));%></td>
			<td><%out.print(rs.getInt(4));%></td>
			<td><%out.print(rs.getString(5));%></td>
			<td><%out.print(rs.getString(6));%></td>
			<td>
			<%
			if(rs.getString(7).equals("Cancelled"))
				out.print("Cancelled");
			else if(rs.getString(9).equals("Bengaluru")){
				java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("HH:mm:ss");
    			sdf.setTimeZone(java.util.TimeZone.getTimeZone("IST"));
    			java.util.Date dt = new java.util.Date();
    			String startTime =rs.getTime(11).toString();
    			String a = sdf.format(dt);
    			System.out.println(a);
    			java.util.Date d1 = sdf.parse(startTime);
    			java.util.Date d2 = sdf.parse(a);
		        long elapsed = d2.getTime() - d1.getTime(); 
    			
    			if(elapsed >0)
    				out.print("Departed");
    			else
    				out.print("On Time");
			}		
			else{
				String endTime = rs.getTime(12).toString();
				String startTime = rs.getTime(11).toString();
				java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("HH:mm:ss");
				sdf.setTimeZone(java.util.TimeZone.getTimeZone("IST"));
				java.util.Calendar cal = java.util.Calendar.getInstance();
				java.util.Date d1 = sdf.parse(endTime);
				java.util.Date d3 = sdf.parse(startTime);
				String a = sdf.format(cal.getTime());
    			java.util.Date d2 = sdf.parse(a);
		        long elapsed = d2.getTime() - d1.getTime();
		        long elapsed_1 = d2.getTime() - d3.getTime();
		        if(elapsed >=0)
		        	out.print("Arrived");
		        else if(elapsed_1 >= 0)
		        	out.print("En route");
		        else
		        	out.print("On Time");
			}
    		%>		
			</td>
			<td><%out.print(rs.getString(8));%></td>
			<td><%out.print(rs.getString(9));%></td>
			<td><%out.print(rs.getString(10));%></td>
			<td><%out.print(rs.getTime(11));%></td>
			<td><%out.print(rs.getTime(12));%></td>
			<td><%out.print(rs.getInt(13));%></td>
     	</tr>
     	<% } %>
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