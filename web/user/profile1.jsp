<%-- 
    Document   : profile.jsp
    Created on : 1 Jul, 2019, 5:17:04 PM
    Author     : kartik kumar merotha
--%>

<%@page import="org.kartik.models.MyLib"%>
<%@page import="java.sql.*"%>
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
       <%
        String sql="select * from adminform where Email=?";

        Connection cn=new MyLib().connect();

        PreparedStatement p1=cn.prepareStatement(sql);
      
        p1.setString(1,e1);  //use email of session
        ResultSet r1=p1.executeQuery();
        if(r1.next())
        {
            String a,b,c,d;
            a=r1.getString("Name");
            b=r1.getString("Address"); 
            c=r1.getString("Email");  
            d=r1.getString("Contact");
            %>
 
            <form method="post" action="profile2.jsp">
                <p>Name <input type="text" name="T1" value="<%= a %>" /></p>
                <p>Address <input type="text" name="T2" value="<%= b %>" /></p>
                <p>Email <input type="text" name="T3" value="<%= c %>" /></p>
                <p>Contact <input type="text" name="T4" value="<%= d %>" /></p>
                <p><input type="submit" name="T5" value="change"/></p>
            </form>
        <%
        }
        else
        {
            %>
            <h2>No data found</h2>
            <%
        }
        %>
        
            
        
    </body>
</html>
