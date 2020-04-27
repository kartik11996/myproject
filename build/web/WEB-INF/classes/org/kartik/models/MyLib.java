package org.kartik.models;
import java.sql.*;

public class MyLib {
    public Connection connect()
    {
        Connection cn=null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            String path=("jdbc:mysql://localhost:3306/VGT"); 
            String dbuser="root";
            String dbpassword="Kartik1996";
            cn=DriverManager.getConnection(path,dbuser,dbpassword);
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return cn;
    }
    public String getName(String email)
    {
        Connection cn=this.connect();
        String name="Noname";
        try
        {
            String sql="select * from userdata where email=?";
            PreparedStatement p1=cn.prepareStatement(sql);
            p1.setString(1, email);
            ResultSet r1=p1.executeQuery();
            if(r1.next())
            {
                name=r1.getString("name");
            }
            
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return name;
    }
    //for admin
    public String getName1(String email)
    {
        Connection cn=this.connect();
        String name="Noname";
        try
        {
            String sql="select * from adminform where email=?";
            PreparedStatement p1=cn.prepareStatement(sql);
            p1.setString(1, email);
            ResultSet r1=p1.executeQuery();
            if(r1.next())
            {
                name=r1.getString("name");
            }
            
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return name;
    }
}
