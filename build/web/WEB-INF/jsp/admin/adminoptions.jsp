
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

    </head>
    <body>
         <%@include file="../../jspf/adminheader.jspf" %>
        <h1>Admin Options</h1>
         <ol>
             <li> <h5>Add Questions</h5>
                <ol>
                    <li><a href="add">Add Manually</a></li>
                    <li><a href="UploadFileController">Upload File</a></li>
                </ol>
            </li>
                   
            <li><a href="editdelete">Edit/Delete Questions</a></li>
            
            <li><a href="addsubjectscontroller">Add Subjects</a></li>
          
        </ol>
    </body>
</html>
