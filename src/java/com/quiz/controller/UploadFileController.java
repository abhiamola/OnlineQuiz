/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.quiz.controller;

import com.quiz.database.Admin;
import com.quiz.model.FileManager;
import com.quiz.model.Question;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
/**
 *
 * @author Abhishek
 */
@MultipartConfig
public class UploadFileController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
       RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/jsp/admin/uploadfile.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
   
        String subject=request.getParameter("subject");                   
        Part p = request.getPart("file");
          ArrayList<Question> al=null;
        try
        {
          al= FileManager.uploadFile(p);
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        
    boolean status= Admin.addQuestions(al,subject);
 RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/jsp/admin/uploadfile.jsp");
       if(status)
       {
            
            request.setAttribute("Error","File uploaded Successfully");
           
       }
       else
       {
             request.setAttribute("Error","File Cannot be uploaded Successfully");
       }
        rd.forward(request,response);
    }
}

