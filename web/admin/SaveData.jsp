<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Student Registration</h1>
        <%
        Class.forName("com.mysql.jdbc.Driver");
        String path=("jdbc:mysql://localhost:3306/VGT");
        String dbuser="root";
        String dbpassword="Kartik1996";
        java.sql.Connection ch=java.sql.DriverManager.getConnection(path,dbuser,dbpassword);
        String roll=request.getParameter("a1");
        String name=request.getParameter("a2");
        String branch=request.getParameter("a3");
        
        String sql="Insert into registerform values(?,?,?)";
        PreparedStatement p1=ch.prepareStatement(sql);
        p1.setString(1,roll);
        p1.setString(2,name);
        p1.setString(3,branch);
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