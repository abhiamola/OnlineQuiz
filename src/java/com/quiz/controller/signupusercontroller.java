package com.quiz.controller;

import com.quiz.buisness.Quizbo;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
  @WebServlet(name = "signupusercontroller", urlPatterns = {"/signupusercontroller"})
public class signupusercontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/jsp/signuppage.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
         String user=request.getParameter("email");
     String pass=request.getParameter("psw");
     Quizbo bo=new Quizbo();
  if(bo.addUser(user,pass))
  {
      RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/jsp/loginuser.jsp");
      request.setAttribute("signup","successfully signed up");
      rd.forward(request,response);
  }
    }
}
