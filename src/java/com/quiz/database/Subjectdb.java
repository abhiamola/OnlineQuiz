/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.quiz.database;
import com.quiz.model.Question;
import com.quiz.model.Subject;
import java.util.ArrayList;
        
import java.sql.*;
import java.util.HashMap;
import java.util.Map;
import java.util.StringJoiner;
import org.json.JSONArray;
import org.json.JSONObject;


public class Subjectdb {
    public ArrayList<Subject> getSubject(String s)
    {
        s=s.toLowerCase();
        ArrayList<Subject> list=new ArrayList<>();
        String s1=s.substring(0,3);
        String s2=s.substring(3,4);
        int i=Integer.parseInt(s2);
        try
        {
        Connection con=DBConnection.getConnection();
        PreparedStatement st=con.prepareStatement("select subject from semsub where branch=? and sem=?");
        st.setString(1, s1);
        st.setInt(2,i);
        ResultSet rs=st.executeQuery();
        while(rs.next())
        {
            Subject sub=new Subject();
           sub.setSub(rs.getString("subject"));
           list.add(sub);
            
            
        }
        con.close();
        }
        catch(Exception ex)
        {
            System.out.println("database error");
        }
        return list;
    }
    public static JSONArray getSubjects(String branch,int sem)
    {
     
        JSONArray array=new JSONArray();
		JSONObject obj;
        try
        {
        Connection con=DBConnection.getConnection();
        PreparedStatement st=con.prepareStatement("select subject from semsub where branch=? and sem=?");
        st.setString(1, branch);
        st.setInt(2,sem);
        ResultSet rs=st.executeQuery();
        while(rs.next())
        {
           obj=new JSONObject();
           obj.put("subject", rs.getString("subject"));
            array.put(obj);
            
        }
        con.close();
        }
        catch(Exception ex)
        {
            System.out.println("database error");
        } 
        return array;
    }
    
   public static JSONArray getQuestions(String set){
       
       set=set.toLowerCase();
		  String query="select * from "+set+" ";
                
		JSONArray array=new JSONArray();
		JSONObject obj;
		
		try{
			Connection con=DBConnection.getConnection();
			PreparedStatement ps=con.prepareStatement(query);
			
			
			ResultSet rs=ps.executeQuery();			
			
			
			while(rs.next()){
				obj=new JSONObject();
				obj.put("question", rs.getString(2));
				
                                String s=rs.getString(7);
                                if(s.equals("A"))
                                {
                                    obj.put("answer",rs.getString(3));
                                }
                                else if(s.equals("B"))
                                {
                                    obj.put("answer",rs.getString(4));
                                
                                }
                                else if(s.equals("C"))
                                {
                                    obj.put("answer",rs.getString(5));
                                }
                                else
                                {
                                    obj.put("answer",rs.getString(6));
                                    
                                }
                                    
				
				
				
				
				array.put(obj);
			}
			
			rs.close();
			
			ps.close();
			con.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return array;
	}
	public static int count(String table)
        { int k=0;
        table=table.toLowerCase();
        table=table.replaceAll("\\s","");
              String query="select count(*) from "+table+" ";
            try
            {
                Connection con=DBConnection.getConnection();
                PreparedStatement ps=con.prepareStatement(query);
               ResultSet rs=ps.executeQuery();
               while(rs.next())
               {
                    k=rs.getInt(1);
               }
               
            }
            catch(Exception ex)
            {
                ex.printStackTrace();
            }
            return k;
        }
	
 
    public static Question getQuestion(String tablename,int qno)
    {
        tablename=tablename.toLowerCase();
          tablename=tablename.replaceAll("\\s","");
        Question q=new Question();
          String query="select * from "+tablename+" where ques_id=?";
          
        try
        {
            Connection con=DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
                    ps.setInt(1,qno);                    
          
           ResultSet rs=ps.executeQuery();
          
          if(rs.next())
          {
               q.setId(rs.getInt(1));
               q.setQues(rs.getString(2));
               q.setA(rs.getString(3));
               q.setB(rs.getString(4));
               q.setC(rs.getString(5));
               q.setD(rs.getString(6));
               q.setAnswer(rs.getString(7));
               q.setSubject(tablename);
          }
               
           con.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        return q;
    }
    
    
    
    
    
    
    public int[] getRightAnswer(HashMap<String,String> lm,String table)
    {
        table=table.toLowerCase();
 table=table.replaceAll("\\s","");
     String a[]=new String[lm.size()];
     int ans[]=new int[2];
     int k=0;
     

   
  StringJoiner joiner = new StringJoiner(",","select answer from "+table+" where ques_id in (",")");
               for( String key : lm.keySet() ) {
       joiner.add("?");
     ++k;
    
}

String query = joiner.toString();
Connection conn=DBConnection.getConnection();
try  {
    PreparedStatement ps = conn.prepareStatement(query);
    int c=1;
for( String key : lm.keySet() ) {
     int ques_no=Integer.parseInt(key);
     System.out.println(ques_no);
     ps.setObject(c++, ques_no);
}
  ResultSet rs = ps.executeQuery();
  int i=0;
  while(rs.next())
  {
     a[i]=rs.getString("answer"); 
     a[i]=a[i].trim();
   
     i++;
  }

  }
catch(Exception ex)
{
}
        int  i=0;
        int c=0;
 
    for(Map.Entry m:lm.entrySet()){  
   if(m.getValue().equals(a[i]))
   {
       
     c++;  
   }
   System.out.print("hashmap:"+m.getValue());
   System.out.println("a[i]:"+a[i]);
   i++;
   
  } 
    

  ans[0]=c;
  ans[1]=k;
     
    return ans;
    }
    
    
    
    
    
    
    
    
    
    
    
    public static int getAnswers(String table,HashMap<Integer,String> lm)
    {
        table=table.toLowerCase();
     table=table.replaceAll("\\s","");
       String a[]=new String[Subjectdb.count(table)];
        String query="select * from "+table+" ";
     
    
     int c=0;
     int i=0;
        try
        {
          Connection con=DBConnection.getConnection();
          PreparedStatement ps=con.prepareStatement(query);
          ResultSet rs=ps.executeQuery();
          while(rs.next())
          {
          String answer=rs.getString(7);
          a[i]=answer;
       
            i++;
          
        
          }
        }catch(Exception ex)
        {
           ex.printStackTrace();
        }
       i=0;
 
    for(Map.Entry m:lm.entrySet()){  
   if(m.getValue().equals(a[i]))
   {
     c++;  
   }
   i++;
  } 
    
    return c;
    }
      public static JSONArray getMockQuestions(String set){
          set=set.toLowerCase();
            set=set.replaceAll("\\s","");
		  String query="select * from "+set+" ";
                
		JSONArray array=new JSONArray();
		JSONObject obj;
		
		try{
			Connection con=DBConnection.getConnection();
			PreparedStatement ps=con.prepareStatement(query);
			
			
			ResultSet rs=ps.executeQuery();			
			
			
			while(rs.next()){
				obj=new JSONObject();
                                obj.put("question_no",rs.getInt(1));
				obj.put("question", rs.getString(2));
				obj.put("ques_a",rs.getString(3));
                                obj.put("ques_b",rs.getString(4));
                                obj.put("ques_c",rs.getString(5));
                                obj.put("ques_d",rs.getString(6));
                                
                                    
				
				
				
				
				array.put(obj);
			}
			
			rs.close();
			
			ps.close();
			con.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return array;
	}
      public static boolean deleteQuestion(String sub,int id)
      {
           boolean status=false;
       sub=sub.toLowerCase();
        sub=sub.replaceAll("\\s","");
        
        String query="delete from "+sub+" where ques_id=?";
        try
        {
            Connection con=DBConnection.getConnection();
            PreparedStatement ps=con.prepareStatement(query);
          
            ps.setInt(1, id);
          
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
      
      public static boolean insertSubject(String branch,int sem, String subject)
      {
          subject=subject.toLowerCase();
             boolean status;
       
       String sub=subject;
         sub=sub.replaceAll("\\s","");
       String query="create table "+sub+" (ques_id int not null AUTO_INCREMENT,ques_text varchar(500),ques_a varchar(500),ques_b varchar(500),ques_c varchar(500),ques_d varchar(500),answer varchar(50),PRIMARY KEY(ques_id))";
        try
        {
            Connection con=DBConnection.getConnection();
            PreparedStatement ps=con.prepareStatement("insert into semsub values(?,?,?)");
          
            ps.setString(1, subject);
            ps.setString(2,branch);
            ps.setInt(3,sem);
            ps.executeUpdate();
            
            PreparedStatement st=con.prepareStatement(query);
            st.executeUpdate();
            
            
           status=true;
        }catch(Exception e)
        {
           
            status=false;
            e.printStackTrace();
        }
        return status; 
      }
}
