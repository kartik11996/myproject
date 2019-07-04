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
        <h1>Questions</h1>
        <%
        Connection cn=new MyLib().connect();
        String sql="select * from qbank";
        PreparedStatement p1=cn.prepareStatement(sql);
        ResultSet r1=p1.executeQuery();
        
        
        
               
        while(r1.next()){
            String a,b,c,d,e;
            a=r1.getString("qid");
            b=r1.getString("qsubject"); 
            c=r1.getString("question"); 
            d=r1.getString("qdate");
            e=r1.getString("qby");
        %>
 
        
        <h3><%= a %>.<%= c %></h3>
        <p><%= b%><span>   Date <%= d %></span> <span>CreatedBy: <%= e %></span></p>            
        <form method="post" action="">
                <input type="submit" name="Solve" value="Solve" />
        </form>
         </td>
    </tr>
        
  
 <% 
        }
        %></table>
    </body>
</html>
