package com.quiz.controller;

import com.quiz.buisness.Quizbo;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class logincontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        RequestDispatcher rd =null;
        HttpSession session=request.getSession();
     
        
            rd= request.getRequestDispatcher("WEB-INF/jsp/loginuser.jsp");
        
        
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
         HttpSession session=request.getSession();
         RequestDispatcher rd=null;
     
     
          
      
      String id=request.getParameter("uname");
      
      String pass=request.getParameter("psw");
      if(id.equals("9999999999"))
      {
     
  
      Quizbo qb=new Quizbo();
        if(qb.checkDetails(id,pass))
        {
            rd=request.getRequestDispatcher("WEB-INF/jsp/admin/adminoptions.jsp");
             
            session.setAttribute("Admin",id);
            rd.forward(request, response);
          
        }
        else 
        {
            rd=request.getRequestDispatcher("WEB-INF/jsp/loginuser.jsp");
            request.setAttribute("error","Id Or Password Is Not Correct");
            rd.forward(request, response);
        }
         
      }
      else
      {
      Quizbo bo=new Quizbo();
      if(bo.logIn(id,pass))
      {
           rd=request.getRequestDispatcher("WEB-INF/jsp/home.jsp");
           session=request.getSession();
            session.setAttribute("User",id);
           
          rd.forward(request,response);
          
      }
      else
      {
         rd=request.getRequestDispatcher("WEB-INF/jsp/loginuser.jsp");
          request.setAttribute("error","Id or password Is Not Correct");
          rd.forward(request,response); 
      }
      }
    
    }
    
    }

