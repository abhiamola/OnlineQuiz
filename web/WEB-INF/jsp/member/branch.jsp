
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Online Quiz</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="stylesheet" href="css/bootstrap.min.css">
 
<script src="js/jquery-3.3.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<link rel="stylesheet" href="css/login.css">  

    </head>
    <body>
            <%@include file="../../jspf/fieldheader.jspf" %>
        <!-- Wrapper -->
        <div class="container">
            <div class="jumbotron">
                   <h1>${field.toUpperCase()}</h1>
            </div>
      
        <div class="row">
        	<div class="col-md-4 col-sm-6">
                  <div class="btn-group">
                       <button type="button" class="btn btn-lg btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                         Computer Science
                       </button>
                          <div class="dropdown-menu">
                         <a class="dropdown-item" href="semestersubjectcontroller?given=cse3">SEM 3</a>
                         <a class="dropdown-item" href="semestersubjectcontroller?given=cse4">SEM 4</a>
                          <a class="dropdown-item" href="semestersubjectcontroller?given=cse5">SEM 5</a>
                           <a class="dropdown-item" href="semestersubjectcontroller?given=cse6">SEM 6</a>
                         <a class="dropdown-item" href="semestersubjectcontroller?given=cse7">SEM 7</a>
                          <a class="dropdown-item" href="semestersubjectcontroller?given=cse8">SEM 8</a>
   
                          </div>
        	</div>
                </div>
        	<div class="col-md-4 col-sm-6">
                      <div class="btn-group">
                       <button type="button" class="btn btn-lg btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                         Information Technology
                       </button>
                          <div class="dropdown-menu">
                         <a class="dropdown-item" href="semestersubjectcontroller?given=ift3">SEM 3</a>
                         <a class="dropdown-item" href="semestersubjectcontroller?given=ift4">SEM 4</a>
                          <a class="dropdown-item" href="semestersubjectcontroller?given=ift5">SEM 5</a>
                           <a class="dropdown-item" href="semestersubjectcontroller?given=ift6">SEM 6</a>
                         <a class="dropdown-item" href="semestersubjectcontroller?given=ift7">SEM 7</a>
                          <a class="dropdown-item" href="semestersubjectcontroller?given=ift8">SEM 8</a>
   
                          </div>
        	</div>

        	</div>
        	<div class="col-md-4 col-sm-6">
                  <div class="btn-group">
                       <button type="button" class="btn btn-lg btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          Civil
                       </button>
                          <div class="dropdown-menu">
                         <a class="dropdown-item" href="semestersubjectcontroller?given=civ3">SEM 3</a>
                         <a class="dropdown-item" href="semestersubjectcontroller?given=civ4">SEM 4</a>
                          <a class="dropdown-item" href="semestersubjectcontroller?given=civ5">SEM 5</a>
                           <a class="dropdown-item" href="semestersubjectcontroller?given=civ6">SEM 6</a>
                         <a class="dropdown-item" href="semestersubjectcontroller?given=civ7">SEM 7</a>
                          <a class="dropdown-item" href="semestersubjectcontroller?given=civ8">SEM 8</a>
   
                          </div>
        	</div>
        	</div>
        
        </div>
            <div class="row">
            <div class="col-md-4 col-sm-6">
                    <div class="btn-group">
                       <button type="button" class="btn btn-lg btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          Mechanical
                       </button>
                          <div class="dropdown-menu">
                         <a class="dropdown-item" href="semestersubjectcontroller?given=mec3">SEM 3</a>
                         <a class="dropdown-item" href="semestersubjectcontroller?given=mec4">SEM 4</a>
                          <a class="dropdown-item" href="semestersubjectcontroller?given=mec5">SEM 5</a>
                           <a class="dropdown-item" href="semestersubjectcontroller?given=mec6">SEM 6</a>
                         <a class="dropdown-item" href="semestersubjectcontroller?given=mec7">SEM 7</a>
                          <a class="dropdown-item" href="semestersubjectcontroller?given=mec8">SEM 8</a>
   
                          </div>
        	</div>
        	</div>
        	<div class="col-md-4 col-sm-6">
                     <div class="btn-group">
                       <button type="button" class="btn btn-lg btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                         Electronics
                       </button>
                          <div class="dropdown-menu">
                         <a class="dropdown-item" href="semestersubjectcontroller?given=ele3">SEM 3</a>
                         <a class="dropdown-item" href="semestersubjectcontroller?given=ele4">SEM 4</a>
                          <a class="dropdown-item" href="semestersubjectcontroller?given=ele5">SEM 5</a>
                           <a class="dropdown-item" href="semestersubjectcontroller?given=ele6">SEM 6</a>
                         <a class="dropdown-item" href="semestersubjectcontroller?given=ele7">SEM 7</a>
                          <a class="dropdown-item" href="semestersubjectcontroller?given=ele8">SEM 8</a>
   
                          </div>
        	</div>


        	</div>
        	<div class="col-md-4 col-sm-6">
                  <div class="btn-group">
                       <button type="button" class="btn btn-lg btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                         Electrical
                       </button>
                          <div class="dropdown-menu">
                         <a class="dropdown-item" href="semestersubjectcontroller?given=elt3">SEM 3</a>
                         <a class="dropdown-item" href="semestersubjectcontroller?given=elt4">SEM 4</a>
                          <a class="dropdown-item" href="semestersubjectcontroller?given=elt5">SEM 5</a>
                           <a class="dropdown-item" href="semestersubjectcontroller?given=elt6">SEM 6</a>
                         <a class="dropdown-item" href="semestersubjectcontroller?given=elt7">SEM 7</a>
                          <a class="dropdown-item" href="semestersubjectcontroller?given=elt8">SEM 8</a>
   
                          </div>
        	</div>
        	</div>
                </div>
            </div>
   
       


    </body>
</html>
