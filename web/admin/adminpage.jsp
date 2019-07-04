<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="saveadmin.jsp">
            Name:<input type="text" name='T1'>
            Address:<input type="text" name='T2'>
            Email:<input type="email" name='T3'>
            Contact:<input type="text" name='T4'>
            <input type="submit" value="save">
            
        </form>
    </body>
</html>
