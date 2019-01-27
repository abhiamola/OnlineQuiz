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

public class TestController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
 RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/jsp/member/test.jsp");
        rd.forward(request, response);
     
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
             HttpSession session=request.getSession();
          ArrayList<Subject> sube=(ArrayList<Subject>)session.getAttribute("sublist");
          String arr[]=new String[sube.size()];
          String str="";
          for(int j=0;j<arr.length;j++)
          {
              str="jsonfile"+j;
              String json=request.getParameter(str);
              arr[j]=json;
          }
       String sub;
      Quizbo bo=new Quizbo();
       int right1[]=new int[2];
       int answers[][]=new int[arr.length][2];
       for(int i=0;i<sube.size();i++)
       {
           sub=sube.get(i).getSub();
          right1=bo.getMockAnswer(arr[i],sub);
          for(int j=0;j<right1.length;j++)
          {
              answers[i][j]=right1[j];
          }
          right1=null;
          
       }
       session.setAttribute("right",answers);
    }
}
