<%@ page import ="java.sql.*" %>
<%@ page import =" java.sql.Connection" %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page import ="java.sql.Statement" %>
<%@ page import ="java.lang.*" %>
<%
    try{
        String username = request.getParameter("p_id");   
      
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectflight" , "root" , "goodjoke");    
       
		%>
			<h2>Write a Review</h2>
			<form method="post" action="review-submit.jsp">
			Passenger ID : <input type="text" value="<%out.println(username);%>" name="username">
			<textarea name="review" rows="10" width="5000">			
			</textarea>
			<input type="submit" value="submit">
			</form>
		<%       
          
        /*if(null!=request.getAttribute("errorMessage"))
        {
            out.println(request.getAttribute("errorMessage"));
        }*/
       
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again " + e);
  
   }    
   
%>
