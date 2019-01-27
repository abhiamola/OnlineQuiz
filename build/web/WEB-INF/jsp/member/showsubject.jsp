

<%@page contentType="text/html" pageEncoding="UTF-8" import="com.quiz.model.Subject"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subjects</title>
     <link rel="stylesheet" href="css/bootstrap.min.css">
 
<script src="js/jquery-3.3.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<link rel="stylesheet" href="css/login.css">  
    </head>
    <body>
    <%@include file="../../jspf/fieldheader.jspf" %>
    <div class="container">
        <div class="jumbotron">
        <h1>${field}</h1>
        <p>Where Students Can Practice</p>
        </div>
    </div>
         
        <div class="container">
                   <div class="row">
                       
                <c:forEach items="${sublist}" var="s">
                    <div class="col-md-4 col-sm-6">
                        <div style="margin:20px 10px">
                           <a href="subjectquestioncontroller?given=${s.sub}" class="btn btn-lg btn-success">
                               ${s.sub} 
                            </a>
                        </div>   
                    </div>             
                </c:forEach>
                       
                   </div>
           

       



        </div>



    </body>
</html>
