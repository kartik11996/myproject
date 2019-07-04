<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result Page</title>
    </head>
    <body>
        <H1>Addition</h1>
        <% 
            String s=request.getParameter("T1");
            String t=request.getParameter("T2");
            
            int a= Integer.parseInt(s);
            int b= Integer.parseInt(t);
            int ans= a*b;     
        %>
        <h2>The result is <%= ans %></h2>
    </body>
</html>