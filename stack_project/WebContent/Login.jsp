
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
    try{
        String username = request.getParameter("userId");   
        String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3309/gitdemo?" + "user=root&password=1234"); 
        PreparedStatement pst = conn.prepareStatement("Select userid,password from users where userId=? and password=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next())           
           out.println("Valid login credentials");        
        else
           out.println("Invalid login credentials");            
       }
   
    catch(Exception e)
    {       
       out.println("Something went wrong !! Please try again");       
    }   
    
%>
        