
<html>
</head>
<link rel="stylesheet" type="text/css" href="syle1.css">
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
<%
try{
    String username = request.getParameter("username");  
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectflight" , "root" , "Admin@aryan1!");   
    PreparedStatement pst = conn.prepareStatement("Select * from pilot where pilot_id=? and password=?");
    PreparedStatement pst1 = conn.prepareStatement("Select flight_id from flight where pilot_id=?");

    pst.setString(1, username);
    pst.setString(2, password);
    
    pst1.setString(1, username);
    
    ResultSet rs = pst.executeQuery();
    ResultSet rs1 = pst1.executeQuery();
    rs.next();
    %>
    <nav>
    <!--Add font and logout link here -->
   	<form method="get" action="logout.jsp">
    	<button type="submit">Logout</button>
	</form>
    </nav>
    <div class = "profile">
    <p>Welcome <%out.print(rs.getString(2));%></p>
    <p>Your Pilot ID is : <%out.print(rs.getString(1)); %></p>
    <p>Airlines:<%out.println(rs.getString(5));%></p>
    </div>
    <div class = "flight_details">
    <%
    while(rs1.next()){
    	%><p>You have been assigned flight no. : <%out.print(rs1.getString(1));%><a href= "flight-details.jsp?&flight_id=<%=rs1.getString(1)%>" target ="blank">Click here</a> for details</p> </p>
    <% 
    }
    
    	
    	
    	
    	
    	
    	
    %>
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


