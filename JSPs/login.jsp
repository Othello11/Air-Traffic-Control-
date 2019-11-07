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
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectflight" , "root" , "goodjoke");    
        PreparedStatement pst = conn.prepareStatement("Select pilot_id,password from pilot where pilot_id=? and password=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();   
        /*if(null!=request.getAttribute("errorMessage"))
        {
            out.println(request.getAttribute("errorMessage"));
        }*/
        if(rs.next()){           
           //out.println("Valid login credentials")
           int adminId = rs.getInt(1);
        	User user1 = new User();
        	user1.setLoggedIn(true);
        	user1.setUserId(adminId);
        	session.setAttribute("userLoggedIn", user1);
        	 RequestDispatcher rd = request.getRequestDispatcher("welcome-pilot.jsp");
             rd.include(request, response);
           
        }
        else{
        	%>
        	<h1>You have entered incorrect password</h1>
            <% RequestDispatcher rd = request.getRequestDispatcher("login.html");
            rd.include(request, response);
        }
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again " + e);
  
   }  

%>
