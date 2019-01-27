
<%@page import="org.json.JSONObject;"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Question</title>
      <link rel="stylesheet" href="css/bootstrap.min.css">
 
       <script src="js/jquery-3.3.1.js"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

    </head>
    <body>
          <%@include file="../../jspf/adminheaderoptions.jspf" %>
         <script type="text/javascript">
          $(document).ready(function(){
              
                
       
           $('#Add').click(function(){
               var subject="${question.subject}";
               var id=${question.id}
                var  answer=$('input[name=answer]:checked').val();
                 var question=$('#question').val();
                 
               var  a=$('#a').val();
                 var b=$('#b').val();
                 var c=$('#c').val();
                 var d=$('#d').val();
                 $.get('UpdateQuestionController?answer='+answer+'&question='+question+'&subject='+subject+'&a='+a+'&b='+b+'&c='+c+'&d='+d+'&id='+id,function(data,status){
                    $('#success').html(data); 
                 });
                 
       
           });
              
          });
        </script>
       
     
       
       
       
         <table cellpadding="10">
   
         
                <tr>
                    <td><b>Question:${question.id}</b></td>
                    <td><textarea rows="10" cols="100" name="question"  id="question">${question.ques}</textarea></td>
                </tr>
                
                <tr>
                    <td><b>A:</b></td>
                    <td><textarea rows="2" cols="50" name="a"  id="a" >${question.a}</textarea></td>
                </tr>

                <tr>
                    <td><b>B:</b></td>
                    <td><textarea rows="2" cols="50" name="b" id="b" >${question.b}</textarea></td>
                </tr>

                <tr>
                    <td><b>C:</b></td>
                    <td><textarea rows="2" cols="50" name="c" id="c" >${question.c}</textarea></td>
                </tr>

                <tr>
                    <td><b>D:</b></td>
                    <td><textarea rows="2" cols="50" name="d" id="d" >${question.d}</textarea></td>
                </tr>
                
                <tr>
                <td><b>Answer:</b></td>
                <td>  <input type="radio" name="answer" value="A" id="A"  ${question.answer=='A'?'checked':''}> A &nbsp;
                <input type="radio" name="answer" id="B" value="B"  ${question.answer=='B'?'checked':''}> B &nbsp;
                <input type="radio" name="answer" id="C"  value="C"  ${question.answer=='C'?'checked':''}> C &nbsp;
                <input type="radio" name="answer" id="D"  value="D"  ${question.answer=='D'?'checked':''}> D &nbsp;
                </td>
                </tr>
               
              

                <tr>
                    <td><input type="submit" value="Update" id="Add"/></td>
                    <td><input type="reset" value="reset" id="reset"/></td>
                    <td><p id="success"></p></td>
                </tr>
            </table>
       
       
    </body>
</html>
