<html>
<head>
</head>
<title>
</title>


<%@ page import ="java.sql.*" %>
<%@ page import =" java.sql.Connection" %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page import ="java.sql.Statement" %>
<%@ page import ="java.lang.*" %>
<%@ page import ="java.util.*" %>
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
     <header>
     
    <!--Add font and logout link here -->
   	<form method="get" action="logout-atc.jsp">
    	<button type="submit">Logout</button>
	</form>
    
     </header>
    <div class="weather">
    <ul style="list-style-type:none">
  		<li>Temperature <% out.println(rs1.getString(4));%></li>
  		<li>Wind Speed <% out.println(rs1.getInt(5)); %>KMPH</li>
  		<li>Wind Direction <% out.println(rs1.getString(6)); %></li>
  		<li>Visibility <%out.println(rs1.getString(7)); %></li>
</ul>  
    
    
    </div>
     <nav>
     	<ul>
     	<li><a href ="welcome-atc.jsp">General</a></li>
     	<li><a href ="atc-arrival.jsp">Arrival</a></li>
     	<li><a href ="atc-departure.jsp">Departure</a></li>
     	<li><a href ="atc-review.jsp">Reviews</a></li>
     	<li><a href ="atc-weather.jsp">Weather</a></li>
		</ul>  
     </nav>
     <div class="operations">
     	  <a href="airlines-request.html">Schedule New Flight</a>
     	  <a href="flight-cancel.html">Cancel a flight</a>
     </div>
     <div class="flight-details">
     <table>
     	<th>
     		<td>Flight ID</td>
     		<td>Aircraft Name</td>
     		<td>Passengers</td>
     		<td>Emergency</td>
     		<td>Airlines</td>
     		<td>Status</td>
     		<td>Type</td>
     		<td>Source</td>
     		<td>Destination</td>
     		<td>Departure</td>
     		<td>Arrival</td>
     		<td>Pilot ID</td>
     		
     	</th>
     	<% while(rs.next()){ %>
     	<tr>
     		<td><%out.print(rs.getString(1));%></td>
			<td><%out.print(rs.getString(2));%></td>
			<td><%out.print(rs.getInt(4));%></td>
			<td><%out.print(rs.getString(5));%></td>
			<td><%out.print(rs.getString(6));%></td>
			<td><%out.print(rs.getString(7));%></td>
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
</html>