package com.quiz.controller;

import com.quiz.buisness.Quizbo;
import com.quiz.model.Subject;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class semestersubjectcontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
           String sem=request.getParameter("given");
       HttpSession session=request.getSession();
      String field=(String)session.getAttribute("field");
       
         Quizbo bo=new Quizbo();  
         ArrayList<Subject> list=bo.retrieveSubject(sem);
       if(field.equalsIgnoreCase("mocktest"))
       {
           RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/jsp/member/instructions.jsp");
           session.setAttribute("sublist",list);
           rd.forward(request,response);
           
       }
       else 
       {
         if(list!=null)
         {
             RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/jsp/member/showsubject.jsp");
             request.setAttribute("sublist",list);
             rd.forward(request, response);
             
             
         }
       }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
    
    }
}
