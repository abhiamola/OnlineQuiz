/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.quiz.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import com.quiz.buisness.Quizbo;
import java.io.PrintWriter;
import javax.servlet.http.HttpSession;
    import org.json.JSONArray;

/**
 *
 * @author Abhishek
 */
public class subjectquestioncontroller extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       String table=request.getParameter("given");
       PrintWriter out=response.getWriter();
       HttpSession session=request.getSession();
       session.setAttribute("table",table);
       String field=(String)session.getAttribute("field");
       
      Quizbo qb=new Quizbo();
      RequestDispatcher rd;
      if(field.equalsIgnoreCase("study"))
      {
  JSONArray arr=qb.getArray(table);
rd=request.getRequestDispatcher("WEB-INF/jsp/member/studyquestions.jsp");
request.setAttribute("table",arr );
rd.forward(request, response);
    }
        else if(field.equalsIgnoreCase("practice"))
    {
      
   
  rd=request.getRequestDispatcher("WEB-INF/jsp/member/practicequestioninstructions.jsp");
  rd.forward(request,response);
 
    }
    }
  
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
