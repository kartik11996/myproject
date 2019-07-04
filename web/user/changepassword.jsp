<%-- 
    Document   : changepassword.jsp
    Created on : 1 Jul, 2019, 5:07:20 PM
    Author     : kartik kumar merotha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../js/confirmpassword.js" type="text/javascript"></script>
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
        <form name="form1" method="post" action="changepassword1.jsp" onsubmit="return A()"/>           
        <p>old password</p><input type="password" name="p1" id="a1" />
            <p>New Password</p><input type="password" name="p2" id="a2"/>
            <p>Confirm password</p><input type="password" name="p3" id="a3"/>
            <p><input type="submit" name="p4" id="a4" value="change"/>
        </form>
    </body>
</html>
