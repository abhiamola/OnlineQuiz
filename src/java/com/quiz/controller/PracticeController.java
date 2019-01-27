package com.quiz.controller;


import com.quiz.buisness.Quizbo;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "PracticeController", urlPatterns = {"/PracticeController"})
public class PracticeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
    
  
      
        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/jsp/member/practicequestions.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
       String json1=request.getParameter("jsonfile1");
      
         HttpSession session=request.getSession();
         String sub1=(String)session.getAttribute("table");
       
         int right1[]=new int[2];
      Quizbo bo=new Quizbo();
   right1=bo.getMockAnswer(json1,sub1);
 session.setAttribute("right1",right1);
////  RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/jsp/member/getResult.jsp");
////request.setAttribute("right1",right1);
//
//rd.forward(request, response);
    }
}