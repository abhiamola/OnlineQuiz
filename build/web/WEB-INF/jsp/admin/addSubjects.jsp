

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="css/bootstrap.min.css">
 
       <script src="js/jquery-3.3.1.js"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
           <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<link rel="stylesheet" href="css/login.css">

    </head>
    <body>
        <%@include file="../../jspf/adminheaderoptions.jspf" %>
        <h2 align="center">ADD SUBJECTS</h2>
        <div class="container formbasic">
        <form action="addsubjectscontroller" method="POST">
            
            <div class="form-group">
               <select id="branch" name="branch" class="form-control">
         
        <option value="cse" selected >Computer Science & Engineering</option>
        <option value="mec">Mechanical</option>
          <option value="civ">CIVIL</option>
        <option value="ele">Electronics & Communication</option>
          <option value="elt">Electrical</option>
        <option value="ift">Information Technology</option>
	</select>
                </div>
                    <div class="form-group">
            <select id="sem" name="sem" class="form-control">
         
        <option value="3" selected >SEMESTER 3</option>
        <option value="4" >SEMESTER 4 </option>
          <option value="5">SEMESTER 5</option>
        <option value="6">SEMESTER 6</option>
          <option value="7">SEMESTER 7</option>
        <option value="8">SEMESTER 8</option>
	</select>
                        </div>
           <div class="form-group">
            <input type="text" name="subject" id="subject" class="form-control">
            </div>
            <input type="submit" value="Submit" class="btn btn-success">
        </form>
        </div>
        
         <c:if test="${!empty msg}">
                <h2>${msg}</h2>
            </c:if>
    </body>
</html>
