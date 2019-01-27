/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.quiz.controller;

import com.quiz.database.Subjectdb;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Abhishek
 */
public class addsubjectscontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/jsp/admin/addSubjects.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
      
        String branch=request.getParameter("branch");
        int sem=Integer.parseInt(request.getParameter("sem"));
        String subject=request.getParameter("subject");
        boolean flag=Subjectdb.insertSubject(branch,sem,subject);
        RequestDispatcher rd= null;
        if(flag)
        {
            rd=request.getRequestDispatcher("WEB-INF/jsp/admin/addSubjects.jsp");
            request.setAttribute("msg","Successfully Added");
            rd.forward(request,response);
        }
        else
        {
              rd=request.getRequestDispatcher("WEB-INF/jsp/admin/addSubjects.jsp");
              request.setAttribute("msg","Error");
              rd.forward(request,response);
        }
        
        
    }
}

