
<html>
</head>
	<link rel="stylesheet" type="text/css" href="style1.css">
	<link rel="stylesheet" href="css/footer-distributed-with-address-and-phones.css">	
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
	<link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
	<link href="http://fonts.googleapis.com/css?family=Dosis" rel="stylesheet" type="text/css">
	<link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
</head>
<body>
<h1>Pilot landing page</h1>
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

	   response.sendRedirect("atc-login.html");
	   return;
	}
try{
    String flight_id = request.getParameter("flight_id");
    String aircraft_name = request.getParameter("aircraft_name");
    String priority = request.getParameter("priority");
    String no_of_pass = request.getParameter("no_of_pass");
    String emergency = request.getParameter("emergency");
    String airlines = request.getParameter("airlines");
    String status = request.getParameter("status");
    String type = request.getParameter("type"); 
    String source = request.getParameter("source");
    String destination = request.getParameter("destination");
    String departure = request.getParameter("departure");
    String arrival = request.getParameter("arrival");
    String pilot_id = request.getParameter("pilot_id");
    Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectflight" , "root" , "goodjoke");
    PreparedStatement pst = conn.prepareStatement("insert into flight values (?,?,?,?,?,?,?,?,?,?,?,?,?)");
    PreparedStatement pst1 = conn.prepareStatement("select pilot_id from pilot where airlines=? and pilot_id not in(select pilot_id from flight where airlines=?)");
    pst.setString(1,flight_id);
    pst.setString(2,aircraft_name);
    pst.setString(3,priority);
    pst.setString(4,no_of_pass);
    pst.setString(5,emergency);
    pst.setString(6,airlines);
    pst.setString(7,status);
    pst.setString(8,type);
    pst.setString(9,source);
    pst.setString(10,destination);
    pst.setString(11,departure);
    pst.setString(12,arrival);
    pst.setString(13,pilot_id);
    pst1.setString(1,airlines);
    pst1.setString(2, airlines);
    ResultSet rs= pst1.executeQuery();
    int count = pst.executeUpdate();
    rs.next();
    out.println(count + " Row Inserted");
    %>
    <h3><% out.println("Availabe Pilots");%></h3>
    <%
    while(rs.next()){
    %>	<p><%out.println(rs.getInt(1));%></p>
    <%
    }
    %>
    <nav>
    <!--Add font and logout link here -->
   	<form method="get" action="logout.jsp">
    	<button type="submit">Logout</button>
	</form>
    </nav>
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
}
catch(Exception e){       
    out.println("Something went wrong !! Please try again " + e);
    
} 
%>
</body>
</html>


