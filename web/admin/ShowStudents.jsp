<%@page import="java.sql.*"%>
<%
        Class.forName("com.mysql.jdbc.Driver");
        String path=("jdbc:mysql://localhost:3306/VGT");
        String dbuser="root";
        String dbpassword="Kartik1996";
        java.sql.Connection ch=java.sql.DriverManager.getConnection(path,dbuser,dbpassword);
        String sql="select * from adminform";
        PreparedStatement p1=ch.prepareStatement(sql);
        ResultSet r1=p1.executeQuery();
        %>
        
        <table align="center" width="80%" cellspacing="0"  border="1px solid color=#000">
            <tr>
                <th colspan='5' height='50' width="100%">Student Table</th>
            </tr>
     <tr>
         <th width="30%">Name</th>
         <th>Address</th>
         <th>Email</th>
         <th>Contact</th>
         <th>Update</th>
     </tr>
     
         <%       
        while(r1.next()){
            String a,b,c,d;
            a=r1.getString("Name");
            b=r1.getString("Address"); 
            c=r1.getString("Email");  
            d=r1.getString("Contact");
        %>
 
        <tr align="center">
         <td><%= a %></td>
         <td><%= b %></td>
         <td><%= c %></td>
         <td><%= d %></td>
        
            <td>
        <form method="post" action="UpdatePage.jsp">
            <input type="hidden" name="p" value="<%= c %>" />
                <input type="submit" name="Update" value="Update" />
        </form>
         </td>
    </tr>
        
  
 <% 
        }
        %></table>