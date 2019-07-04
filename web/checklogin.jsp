<%@page import="org.kartik.models.MyLib"%>
<%@page import="java.sql.*"%>
<%
    String email=request.getParameter("T1");
    String password=request.getParameter("T2");
    String sql="select * from logindata where email=? AND password=?";
    
    Connection cn=new MyLib().connect();
   

    PreparedStatement p1=cn.prepareStatement(sql);
    p1.setString(1, email);
    p1.setString(2, password);

    ResultSet r1=p1.executeQuery();
    if(r1.next())
    {
       String usertype=r1.getString("usertype");
       
       //create the session
       session=request.getSession(true); //True-Create new session if not exists, otherwise open existing
       session.setAttribute("email", email);
       session.setAttribute("usertype", usertype);
       
       //send to page
       if(usertype.equalsIgnoreCase("admin"))
       {
           response.sendRedirect("admin/adminhome.jsp");
        }
       else if(usertype.equalsIgnoreCase("user"))
       {
           response.sendRedirect("user/userhome.jsp");
       }
    }
    else
    {
        response.sendRedirect("loginerror.jsp");
    
    }
%>