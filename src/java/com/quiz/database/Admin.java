/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.quiz.database;

/**
 *
 * @author Abhishek
 */
import com.quiz.model.Question;
import java.sql.*;
import java.util.ArrayList;
public class Admin {
    public static boolean loginDetails(String id,String password)
    {
        boolean status=false;
    
        try
    {
        Connection con=DBConnection.getConnection();
        PreparedStatement ps=con.prepareStatement("select * from userlogin where userid=? and password=password(?)");
        ps.setString(1, id);
        ps.setString(2, password);
        ResultSet rs=ps.executeQuery();
        if(rs.next())
        {
            status=true;
        }
        }
    
    catch(Exception ex)
    {
      ex.printStackTrace();
    }
        return status;
}
    public boolean addQues(Question q)
    {
        boolean status=false;
        String table=q.getSubject();
        table=table.toLowerCase();
        table=table.replaceAll("\\s","");
        
        String query="insert into "+table+" (ques_text,ques_a,ques_b,ques_c,ques_d,answer) values(?,?,?,?,?,?)";
        try
        {
            Connection con=DBConnection.getConnection();
            PreparedStatement ps=con.prepareStatement(query);
          
            ps.setString(1, q.getQues());
            ps.setString(2,q.getA());
            ps.setString(3,q.getB());
            ps.setString(4,q.getC());
            ps.setString(5,q.getD());
            ps.setString(6,q.getAnswer());
            ps.executeUpdate();
            con.close();
           status=true;
        }catch(Exception e)
        {
           
            status=false;
            e.printStackTrace();
        }
        return status;
    }
    
    public boolean UpdateQues(Question q)
    {
        boolean status=false;
        String table=q.getSubject();
        table=table.toLowerCase();
        table=table.replaceAll("\\s","");
        
        String query="update "+table+" set ques_text=?,ques_a=?,ques_b=?,ques_c=?,ques_d=?,answer=? where ques_id=?";
        try
        {
            Connection con=DBConnection.getConnection();
            PreparedStatement ps=con.prepareStatement(query);
          
            ps.setString(1, q.getQues());
            ps.setString(2,q.getA());
            ps.setString(3,q.getB());
            ps.setString(4,q.getC());
            ps.setString(5,q.getD());
            ps.setString(6,q.getAnswer());
            ps.setInt(7,q.getId());
            ps.executeUpdate();
            con.close();
           status=true;
        }catch(Exception e)
        {
           
            status=false;
            e.printStackTrace();
        }
        return status;
    }
    public static boolean addQuestions(ArrayList<Question> al,String subject)
    {
        boolean status=true;
         subject=subject.replaceAll("\\s","");
         subject=subject.toLowerCase();
          int i=0;
           String query="insert into "+subject+" (ques_text,ques_a,ques_b,ques_c,ques_d,answer) values(?,?,?,?,?,?)";
        try
        {
            Connection con=DBConnection.getConnection();
            PreparedStatement ps=con.prepareStatement(query);
          while(i<al.size())
          {
              Question quest=al.get(i);
            ps.setString(1, quest.getQues());
            ps.setString(2,quest.getA());
            ps.setString(3,quest.getB());
            ps.setString(4,quest.getC());
            ps.setString(5,quest.getD());
            ps.setString(6,quest.getAnswer());
            ps.executeUpdate();
          i++;
          }
            con.close();
        }catch(Exception e)
        {
           status=false;
           
            e.printStackTrace();
        }
        return status;
    }
}