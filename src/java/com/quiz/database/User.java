/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.quiz.database;

import java.sql.Connection;
import java.sql.*;

/**
 *
 * @author Abhishek
 */
public class User {
    public static boolean checkUser(Long id)
    {
        boolean status=false;
        try
        {
          Connection con=DBConnection.getConnection();
          PreparedStatement ps=con.prepareStatement("select * from userlogin where userid=?");
          ps.setLong(1,id);
          ResultSet rs=ps.executeQuery();
          if(rs.next())
          {
              status=true;
          }
        }catch(Exception ex)
        {
            
        }
        return status;
    }
    public boolean signUp(String id,String pass)
    {
      
        boolean flag=false;
        try
        {
            Connection con=DBConnection.getConnection();
          PreparedStatement ps=con.prepareStatement("insert into userlogin values(?,password(?))");
            ps.setString(1,id);
            ps.setString(2,pass);
            ps.executeUpdate();
            flag=true;
     con.close();
         
        }
        catch(Exception ex)
        {
            System.out.println(ex);
            flag=false;
        }
        return flag;
    }
    public boolean signIn(String id,String pass)
    {
        boolean flag=false;
        try
        {
            Connection con=DBConnection.getConnection();
            PreparedStatement st = con.prepareStatement("select * from userlogin where userid=? and password = password(?)");
            st.setString(1,id);
            st.setString(2,pass);
            ResultSet rs=st.executeQuery();
            if(rs.next())
            {
                flag=true;
            }
            con.close();
        }
        catch(Exception ex)
        {
            
        }
        return flag;
    }
    
}
