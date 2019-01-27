
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Questions</title>
          <link rel="stylesheet" href="css/bootstrap.min.css">
 
       <script src="js/jquery-3.3.1.js"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

     
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
                    
           
        });
            
          });
       
           $('#Add').click(function(){
               
                 answer=$('input[name=answer]:checked').val();
                 question=$('#question').val();
                 subject=$('#subject').val();
                 a=$('#a').val();
                 b=$('#b').val();
                 c=$('#c').val();
                 d=$('#d').val();
                 $.get('AddQuestionController?answer='+answer+'&question='+question+'&subject='+subject+'&a='+a+'&b='+b+'&c='+c+'&d='+d,function(data,status){
                    $('#success').html(data); 
                 });
                 
       
           });
              
          });
        </script>
      
        
        <div id="section">
            
        <h2>Add Question</h2>
     
   

            <table cellpadding="10">
                       
                <tr>
                    <td><b>BRANCH</b></td>
	<td>
	<select id="branch" name="branch">
	 <option value="cse" selected >Computer Science & Engineering</option>
        <option value="mec">Mechanical</option>
          <option value="civ">CIVIL</option>
        <option value="ele">Electronics & Communication</option>
          <option value="elt">Electrical</option>
        <option value="ift">Information Technology</option>
	</select>
	</td>
	
	</tr>
               <tr>
                    <td><b>SEMESTER</b></td>
	<td>
	   <select id="sem" name="sem">
         
        <option value="3" selected >SEMESTER 3</option>
        <option value="4" >SEMESTER 4 </option>
          <option value="5">SEMESTER 5</option>
        <option value="6">SEMESTER 6</option>
          <option value="7">SEMESTER 7</option>
        <option value="8">SEMESTER 8</option>
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
                <tr>
                    <td><b>Question:</b></td>
                    <td><textarea rows="10" cols="100" name="question" required id="question"></textarea></td>
                </tr>
                
                <tr>
                    <td><b>A:</b></td>
                    <td><textarea rows="2" cols="50" name="a"  id="a" required></textarea></td>
                </tr>

                <tr>
                    <td><b>B:</b></td>
                    <td><textarea rows="2" cols="50" name="b" id="b" required></textarea></td>
                </tr>

                <tr>
                    <td><b>C:</b></td>
                    <td><textarea rows="2" cols="50" name="c" id="c" required></textarea></td>
                </tr>

                <tr>
                    <td><b>D:</b></td>
                    <td><textarea rows="2" cols="50" name="d" id="d" required></textarea></td>
                </tr>
                
                <tr>
                <td><b>Answer:</b></td>
                <td>  <input type="radio" name="answer" value="A" required> A &nbsp;
                <input type="radio" name="answer" value="B"> B &nbsp;
                <input type="radio" name="answer" value="C"> C &nbsp;
                <input type="radio" name="answer" value="D"> D &nbsp;
                </td>
                </tr>
               
              

                <tr>
                    <td><input type="submit" value="Add" id="Add"/></td>
                    <td><input type="reset" value="reset" id="reset"/></td>
                    <td><p id="success"></p></td>
                </tr>
            </table>
         

        
    </div>
    </body>
</html>
