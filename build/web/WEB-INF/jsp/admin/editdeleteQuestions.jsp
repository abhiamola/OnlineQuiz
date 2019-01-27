
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

         <style>
             span
             {
                 float:right;
             }
         </style>
    </head>
    <body>
          <%@include file="../../jspf/adminheaderoptions.jspf" %>
            
            <script type="text/javascript">
          $(document).ready(function(){
          
              var branch=$("#branch").val();
              var sem=$("#sem").val();
     $.get('GetSubjectController?branch='+branch+'&sem='+sem,function(data,status){
            var obj=JSON.parse(data);
         
          
       var create;
	for(var i = 0; i < obj.length;i++)
	{
		create += '<option value="'+obj[i].subject+'">'+obj[i].subject+'</option>';
	}
	
           $('#subject').append(create);
            
      getData();
           
        });
          $("#sem").change(function(){
              $("#subject").empty();
                         var branch=$("#branch").val();
              var sem=$("#sem").val();
                       $.get('GetSubjectController?branch='+branch+'&sem='+sem,function(data,status){
            var obj=JSON.parse(data);
         
          
       var create;
	for(var i = 0; i < obj.length;i++)
	{
	
                create += '<option value="'+obj[i].subject+'">'+obj[i].subject+'</option>';
	}
	
           $('#subject').append(create);
                
            getData();
        });
             
          });
       
               $("#branch").change(function(){
              $("#subject").empty();
                         var branch=$("#branch").val();
              var sem=$("#sem").val();
                       $.get('GetSubjectController?branch='+branch+'&sem='+sem,function(data,status){
            var obj=JSON.parse(data);
         
          
       var create;
	for(var i = 0; i < obj.length;i++)
	{
		create += '<option value="'+obj[i].subject+'">'+obj[i].subject+'</option>';
	}
	
           $('#subject').append(create);
                    var branch=$("#branch").val();  
                      var sem=$("#sem").val();
            getData(branch,sem);
        });
             
          });
          
          $("#subject").change(function(){
              
              
             getData(); 
          });
    
    
    function getData()
    {
                 $("#question").empty();    
         var jsondata1;
              var  subject=$('#subject').val();
              subject=subject.replace(/\s/g, '');
           $.get('getMockTestController?table='+subject,function(data,status){
            jsondata1=JSON.parse(data);
            
       var create;
       
           for(var i = 0; i < jsondata1.length;i++)
	{
		create ='<p><b>Question '+(i+1)+': </b><br/>'+jsondata1[i].question+'<span><a href=editquestioncontroller?table='+subject+'&id='+jsondata1[i].question_no+'>Edit</a>/<a  href=deletequestioncontroller?table='+subject+'&id='+jsondata1[i].question_no+'>Delete</a></span></p>'
                ;
                       
                             
              $('#question').append(create);  
	}
    });
    }
    
              
          });
        </script>
      
        
        <div id="section">
            
        <h2>Edit/Delete Question</h2>
     
   

            <table cellpadding="10">
                       
                <tr>
                    <td><b>BRANCH</b></td>
	<td>
	<select id="branch" name="branch">
	<option value="cse">Computer Science & Engineering</option>
	<option value="me">Mechanical Engineering</option>
	<option value="ce">Civil Engineering</option>
	</select>
	</td>
	
	</tr>
               <tr>
                    <td><b>SEMESTER</b></td>
	<td>
	<select id="sem" name="sem">
         
        <option value="3"  id="choose">SEMESTER 3</option>
        <option value="4" id="choose">SEMESTER 4 </option>
          <option value="5" id="choose">SEMESTER 5</option>
        <option value="6" id="choose">SEMESTER 6</option>
          <option value="7" id="choose">SEMESTER 7</option>
        <option value="8" id="choose">SEMESTER 8</option>
	</select>
	</td>
	
	</tr>
               <tr>
                     <td><b>Subjects</b></td>
	<td id="test">
            <select id="subject" name="subject">
                
            </select>
	</td>
	
	</tr>
             
            </table>
        <br><br><br>
        
        <p id="question"></p><br/>
      

        
    </div>
    </body>
</html>
