<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Admin panel</h1>
        
        <% 
            Class.forName("com.mysql.jdbc.Driver");
            String path=("jdbc:mysql://localhost:3306/VGT");
            String dbuser="root";
            String dbpassword="Kartik1996";
            java.sql.Connection ch=java.sql.DriverManager.getConnection(path,dbuser,dbpassword);
            String Name=request.getParameter("a1");
            String Address=request.getParameter("a2");
            String Email=request.getParameter("a3");
            String Contact=request.getParameter("a4");

            String sql="Insert into adminform values(?,?,?,?)";
            PreparedStatement p1=ch.prepareStatement(sql);
            p1.setString(1,Name);
            p1.setString(2,Address);
            p1.setString(3,Email);
            p1.setString(4,Contact);
            int a=p1.executeUpdate();
            if(a==1){
         %>
            <H2>Data Saved</H2>

         <%
          }
          else        
            { 
         %>
                <H2>Error- cannot save data </H2>
         <%
            }%>
    </body>
</html>
