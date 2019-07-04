<%-- 
    Document   : ask1.jsp
    Created on : 3 Jul, 2019, 5:19:40 PM
    Author     : kartik kumar merotha
--%>

<%@page import="java.sql.*"%>
<%@page import="org.kartik.models.MyLib"%>
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
            
            Connection cn=new MyLib().connect();
             
            String qsubject=request.getParameter("T1");
            String questiontext=request.getParameter("T2");
           
            String sql="Insert into qbank(qsubject,question,qdate,qby) values(?,?,?,?)";
            PreparedStatement p1=cn.prepareStatement(sql);
            
            p1.setString(1,qsubject);
            p1.setString(2,questiontext);
            p1.setLong(3,System.currentTimeMillis());
            p1.setString(4,e1);
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
