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
           Connection cn=new MyLib().connect();
           
            String solution=request.getParameter("T1");
            String qid=request.getParameter("p");

           
           

            String sql="Insert into solutions(qid,solution,soldate,solby) values(?,?,?,?) ";
            PreparedStatement p1=cn.prepareStatement(sql);
            p1.setString(2,solution);
            p1.setLong(3,System.currentTimeMillis());
            p1.setString(4,e1);
            p1.setInt(1,Integer.parseInt(qid));
            int a=p1.executeUpdate();
            if(a==1){
                   response.sendRedirect("../user/showquestion.jsp");
          }
          else        
            { 
         %>
                <H2>Error- cannot save data </H2>
         <%
            }%>

    </body>
</html>
