<html>
<head>
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
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectflight" , "root" , "goodjoke");    
        PreparedStatement pst = conn.prepareStatement("Select p_name,review from passenger where review != ''");
        ResultSet rs = pst.executeQuery();
        %>
     <header>
     <!-- logout and logo -->
      
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
      	
      <div class="review">
     	<h2>Reviews</h2>
      		<%	
      		while(rs.next())
      		{
      			%>
      			<h4><% out.println(rs.getString(1)); %></h4>
      			<p><% out.println(rs.getString(2)); %></p>
      			
      			<%
      		}
      			%>
      
      </div>    
  
<%        
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again " + e);
  
   }    
   
%>
</body>
</html>