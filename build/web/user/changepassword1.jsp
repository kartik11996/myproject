
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
            String op=request.getParameter("p1");
            String np=request.getParameter("p2");
          
             
          
            String sql="update logindata set password=? where email=? AND password=?;";
            
            Connection cn=new MyLib().connect();
            
            PreparedStatement p1=cn.prepareStatement(sql);
            p1.setString(1,np);
            p1.setString(2,e1);
            p1.setString(3,op);
   
            int a=p1.executeUpdate();
            if(a==1){
         %>
            <H2>Change password</H2>

         <%
          }
          else        
            { 
         %>
                <H2>Error- cannot change password </H2>
         <%
            }%>

 
       
    </body>
</html>
