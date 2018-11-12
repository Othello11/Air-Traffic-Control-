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
        String password = request.getParameter("flight_id");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectflight" , "root" , "goodjoke");    
        PreparedStatement pst = conn.prepareStatement("Select p_id,flight_id from passenger where p_id=? and flight_id=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();   
        /*if(null!=request.getAttribute("errorMessage"))
        {
            out.println(request.getAttribute("errorMessage"));
        }*/
        if(rs.next()){           
           //out.println("Valid login credentials")
           RequestDispatcher rd = request.getRequestDispatcher("welcome-passenger.jsp");
           rd.forward(request, response);
        }
        else{
        	%>
        	<h1>You have entered incorrect password</h1>
            <% RequestDispatcher rd = request.getRequestDispatcher("passenger-login.html");
            rd.include(request, response);
        }
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again " + e);
  
   }    
   
%>
