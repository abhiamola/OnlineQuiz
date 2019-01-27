
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" href="css/bootstrap.min.css">
 
<script src="js/jquery-3.3.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<link rel="stylesheet" href="css/login.css">
    </head>
    <body>
           <%@include file="../../jspf/fieldheader.jspf" %>
         <div id="section">
    <h2>Instructions:</h2>
    <ul>
	  <li>Total Questions: 60</li>
	  <li>Time Alloted: 60 Minutes</li>
          <li>Questions based subjects present in the semester</li>
          <li> 10 Questions in each subject</li>
          <li>There is no negative marking</li>
	  <li>Click on <b>Start</b> button to start the test</li>
	  <li>After the test starts, don't press back or refresh button or don't close the browser window</li>
	</ul>  
    
    <br/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="TestController"><button id="start" style="width:60px;height:30px">Start</button> </a>   
    </div>
    </body>
</html>
