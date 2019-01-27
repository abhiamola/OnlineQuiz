/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.quiz.model;


import java.io.InputStream;
import java.util.ArrayList;
import java.util.Scanner;
import javax.servlet.http.Part;


public class FileManager {
       public static ArrayList<Question> uploadFile(Part p)throws Exception{
     
           
             InputStream ir=p.getInputStream();
//         
             Scanner sc=new Scanner(ir);
            
    
             String q,a,b,c,d,answer;
      
         
             ArrayList<Question> al=new ArrayList<>();


             while(sc.hasNextLine())
             {
        String s=sc.nextLine();
        if(s.length()>0)
        {
    
        String s1=sc.nextLine();
    
          String s2=sc.nextLine();
   
        String s3=sc.nextLine();
      
          String s4=sc.nextLine();
     
        String s5=sc.nextLine();
      
        String data[]=s.split("-",2);
        String data1[]=s1.split("-",2);
        String data2[]=s2.split("-",2);
        String data3[]=s3.split("-",2);
        String data4[]=s4.split("-",2);
        String data5[]=s5.split("-",2);
        q=data[1];
        a=data1[1];
        b=data2[1];
        c=data3[1];
        d=data4[1];
        answer=data5[1];
     Question ques=new Question();
     ques.setQues(q);
     ques.setA(a);
     ques.setB(b);
     ques.setC(c);
     ques.setD(d);
     ques.setAnswer(answer);
     al.add(ques);
        
        }
             }
            
          
      return al;     
    }
}
