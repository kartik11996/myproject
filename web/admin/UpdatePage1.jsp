<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
    </head>
    <body>
        <h1> Update Page</h1>
        
        <% 
            Class.forName("com.mysql.jdbc.Driver");
            String path=("jdbc:mysql://localhost:3306/VGT");
            String dbuser="root";
            String dbpassword="Kartik1996";
            java.sql.Connection ch=java.sql.DriverManager.getConnection(path,dbuser,dbpassword);
            String Name=request.getParameter("T1");
            String Address=request.getParameter("T2");
            String Email=request.getParameter("T3");
            String Contact=request.getParameter("T4");

           
            
            String sql="update adminform set Name=?,Address=?,Contact=? where Email=?";
            PreparedStatement p1=ch.prepareStatement(sql);
            p1.setString(1,Name);
            p1.setString(2,Address);
            p1.setString(3,Contact);
            p1.setString(4,Email);
            int a=p1.executeUpdate();
            if(a==1){
         %>
            <H2>Data Updated</H2>

         <%
          }
          else        
            { 
         %>
                <H2>Error- cannot update data </H2>
         <%
            }%>
    </body>
</html>
