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
}
