package com.quiz.controller;

import com.quiz.database.Subjectdb;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;

public class GetSubjectController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
         Subjectdb sdb=new Subjectdb();
         PrintWriter out=response.getWriter();
   String branc=request.getParameter("branch");
   int se=Integer.parseInt(request.getParameter("sem"));
   JSONArray al=Subjectdb.getSubjects(branc,se);
   out.print(al);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
      
    }
}