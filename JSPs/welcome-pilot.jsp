<html>
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
<<<<<<< HEAD
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectflight" , "root" , "Admin@aryan1!");   
=======
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectflight" , "root" , "goodjoke");   
>>>>>>> a9283a95b16aa98ecd9545ac36e1b7a3debe5264
    PreparedStatement pst = conn.prepareStatement("Select * from pilot where pilot_id=? and password=?");
    pst.setString(1, username);
    pst.setString(2, password);
    ResultSet rs = pst.executeQuery();
    rs.next();
<<<<<<< HEAD
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
    <p>You have been assigned flight no. : <%out.print(rs.getString(7));%><a href= "" target ="blank">Click here</a> for details</p>
    <p>You have been assigned with Air Traffic Control Unit: <%out.print(rs.getInt(6)); %></p>
    </div>
    <footer>
    <!-- Add copyright and some more dilling -->
    </footer>
    <%
}
catch(Exception e){      
   out.println("Something went wrong !! Please try again " + e);
}   
=======
    out.println(rs.getString(1));
    out.println(rs.getString(5));
}
catch(Exception e){      
   out.println("Something went wrong !! Please try again " + e);

}   

>>>>>>> a9283a95b16aa98ecd9545ac36e1b7a3debe5264
%>


</body>
</html>

<<<<<<< HEAD

=======
>>>>>>> a9283a95b16aa98ecd9545ac36e1b7a3debe5264
