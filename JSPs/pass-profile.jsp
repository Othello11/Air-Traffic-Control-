
<html>
</head>
<link rel="stylesheet" type="text/css" href="css/welcome-atc.css">
<link rel="stylesheet" href="css/footer-distributed-with-address-and-phones.css">
	
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

	<link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
	<link href="http://fonts.googleapis.com/css?family=Dosis" rel="stylesheet" type="text/css">
	<link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
</head>
<body>



<%@ page import ="java.sql.*" %>
<%@ page import =" java.sql.Connection" %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page import ="java.sql.Statement" %>
<%@ page import ="java.lang.*" %>
<%@ page import ="test1.User" %>
<%
try{
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");

	User user = (User)session.getAttribute("userLoggedIn");
	if (user == null || !user.getLoggedIn()) {

	   response.sendRedirect("passenger-login.html");
	   return;
	}

try{
    String username = request.getParameter("p_id");  
   
    Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectflight" , "root" , "goodjoke");   
    PreparedStatement pst = conn.prepareStatement("Select * from passenger where p_id=?");
  	
    pst.setString(1, username);
   
   
    ResultSet rs = pst.executeQuery();
   
    rs.next();
   
    %>
  	
  	<nav>
    <div class="container">
    
      <div class="nav2">
        <ul>
          <li><a href="index.html">Home</a></li>
          <li><a href="pass-profile.jsp">Profile</a></li>
          <li><a href="passenger-logout.jsp?&p_id=<%=rs.getInt(1)%>">Logout</a></li>
        </ul>
      </div>
    </div>
  </nav>
  
    <div class="flight-details" style="padding:50px 0 100px 0;">
    	
	<h3 align="center">Your details are...</h3>
	<table align="center">
		<tr>
			<th>Passenger ID</th>
			<td> <%out.print(rs.getInt(1));%></td>
		</tr>
		<tr>
			<th>Name </th>
			<td> <%out.print(rs.getString(2));%></td>
		</tr>
		<tr>
			<th>Gender </th>
			<td> <%out.print(rs.getString(3));%></td>
		</tr>
		<tr>
			<th>Your Flight ID</th>
			<td> <%out.print(rs.getString(4));%></td>
		</tr>
	</table>
    
    <p>How would you rate this airport? Care for a short review <br> <a href="passenger-review.jsp?&p_id=<%=rs.getInt(1)%>">Click Here!</a></p>
    
    </div>
    
    <%
}
catch(Exception e){      
   out.println("Something went wrong !! Please try again " + e);
}  
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


