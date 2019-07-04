<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
    </head>
    <body>
        <h1>Update page</h1>
        
        <% 
            Class.forName("com.mysql.jdbc.Driver");
            String path=("jdbc:mysql://localhost:3306/VGT");
            String dbuser="root";
            String dbpassword="Kartik1996";
            java.sql.Connection ch=java.sql.DriverManager.getConnection(path,dbuser,dbpassword);
            String Email=request.getParameter("p");

            String sql="select * from adminform where Email=?";
            PreparedStatement p1=ch.prepareStatement(sql);
            p1.setString(1,Email);
            
            ResultSet r1=p1.executeQuery();
            if(r1.next())
            {
                String a,b,c,d;
                a=r1.getString("Name");
                b=r1.getString("Address"); 
                c=r1.getString("Email");  
                d=r1.getString("Contact");
                %>
                <form method="post" action="UpdatePage1.jsp">         
                    <p>Name:<input type="text" name="T1" value="<%= a %>" /></p>
                    <p> Address:<input type="text" name="T2" value="<%= b %>"/></p>
                    <p>Email:<input type="text" name="T3" value="<%= c %>"/></p>
                    <p>Contact:<input type="text" name="T4" value="<%= d %>"/></p>
                    <p><input type="submit" value="submit"></p>
        
           
                </form>
                <%
            }
            else
            {
                out.println("<h2>No data found</h2>");
            }
        %>
    </body>
</html>
