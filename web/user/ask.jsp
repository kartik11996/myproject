<%-- 
    Document   : ask
    Created on : 3 Jul, 2019, 4:57:37 PM
    Author     : kartik kumar merotha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <%
            String e1="",ut="";
            session=request.getSession(false);
            if(session==null)
            {
                response.sendRedirect("../auth_error.jsp");
            }
            else
            {
                try
                {
                    e1=session.getAttribute("email").toString();
                    ut=session.getAttribute("usertype").toString();
                    if(ut.equalsIgnoreCase("user")==false)
                    {
                        response.sendRedirect("../auth_error.jsp");
                    }
                }
                catch(NullPointerException e)
                {
                    response.sendRedirect("../auth_error.jsp");
                }
            }
        %>
    </head>
    <body>
        <form name="form1" method="post" action="ask1.jsp">
            <p>Subject <input type="text" name="T1" id="f1"></p>
            <p>Query <input type="areatext" name="T2" id="f2"></p>
            <p><input type="submit" value="Submit" id="f3">
   
        </form> 
    </body>
</html>
