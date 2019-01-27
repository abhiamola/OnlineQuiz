package com.quiz.controller;

import com.quiz.buisness.Quizbo;
import com.quiz.model.Question;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddQuestionController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
   PrintWriter out=response.getWriter();
  Question q=new Question();
  q.setQues(request.getParameter("question"));
  q.setA(request.getParameter("a"));
  q.setB(request.getParameter("b"));
  q.setC(request.getParameter("c"));
  q.setD(request.getParameter("d"));
  q.setSubject(request.getParameter("subject"));
  q.setAnswer(request.getParameter("answer"));
  Quizbo bo=new Quizbo();
  if(bo.addQuestion(q))
  {
    out.print("Question Succesfully Added");
  }
  else
  {
      out.print("Question Cannot be Added");
  }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
       
    }
}