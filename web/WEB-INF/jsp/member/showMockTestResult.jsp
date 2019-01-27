
<%@page import="java.util.ArrayList"%>
<%@page import="com.quiz.buisness.Quizbo"%>
<%@page import="com.quiz.database.Subjectdb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.quiz.model.Subject"%>
<!DOCTYPE html>
    <%     ArrayList<Subject> sube=(ArrayList<Subject>)session.getAttribute("sublist");
           int noq[]=new int[sube.size()];
           for(int i=0;i<sube.size();i++)
           {
             noq[i]=Subjectdb.count(sube.get(i).getSub());  
           }
          
        
            
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
              
      <link rel="stylesheet" href="css/bootstrap.min.css">
 
<script src="js/jquery-3.3.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<link rel="stylesheet" href="css/login.css">
     
        <title>Result</title>
    </head>
    <body>
           <%@include file="../../jspf/fieldheader.jspf" %>
        <h1 align="center"><%=(String) session.getAttribute("field")%> </h1>
        <br><br>
        
        <%
                int l=sube.size();
                
             int right[][]=new int[l][2];
          
                    
        
            right=(int[][])session.getAttribute("right");
             int wrong[]=new int[l];
             for(int i=0;i<wrong.length;i++)
             {
                 wrong[i]=Math.abs(right[i][1]-right[i][0]);
             }
          int na[]=new int[l];
           for(int i=0;i<na.length;i++)
             {
                 na[i]=Math.abs(noq[i]-right[i][1]);
              
             }

        %>
        <table class="table table-striped">
            <tr>
                <th>SUBJECT</th>
                <th>Number of Questions</th>
                <th>Right Answers</th> 
                <th>Wrong Answers</th>
                <th>Not attempted</th>
                <th>Attempted</th>
            </tr>
            <% for(int j=0;j<l;j++) { %>
            <tr>
                <td><%=sube.get(j).getSub()%></td>
                <td><%=noq[j]%></td>
                <td><%=right[j][0]%></td>
                <td><%=wrong[j]%></td>
                <td><%=na[j]%></td>
                <td><%=right[j][1]%></td>
            </tr>
            <%  } %>

        </table>


    </body>
</html>
