
<%@page import="java.util.ArrayList"%>
<%@page import="com.quiz.buisness.Quizbo"%>
<%@page import="com.quiz.database.Subjectdb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.quiz.model.Subject"%>
<!DOCTYPE html>
<html>
<head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Online Quiz</title>
     <link rel="stylesheet" href="css/bootstrap.min.css">
 
<script src="js/jquery-3.3.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<link rel="stylesheet" href="css/login.css">
        
<style> 
div.tab {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
}
/* Style the buttons inside the tab */
div.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
}
/* Change background color of buttons on hover */
div.tab button:hover {
    background-color: #ddd;
}
/* Create an active/current tablink class */
div.tab button.active {
    background-color: #ccc;
}
/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
}
</style>
</head>
<body onload="startTimer()">
    <%
     ArrayList<Subject> sube=(ArrayList<Subject>)session.getAttribute("sublist");
     int l=sube.size();
     %>
         
     
    
       
        <script type="text/javascript">
            var l=<%=l%>
           var timer=l*10*60;
             var min=0;
              var sec=0;
               function startTimer(){
    	min=parseInt(timer/60);
    	sec=parseInt(timer%60);

    	if(timer<1){
          document.getElementById("submit").click();
        }
    		
    	document.getElementById("time").innerHTML = "<b>Time Left: </b>"+min.toString()+":"+sec.toString();
    	timer--;
    	setTimeout(function(){ startTimer(); }, 1000);
    }
       $(document).ready(function(){
      
         
             
            
         
           var arr=[];
         <%for(int i=0;i< sube.size();i++) {%>
           arr[<%= i %>] = "<%= sube.get(i).getSub() %>";
        <%}%>
            
            for(var f=0;f<arr.length;f++)
            {
                arr[f]=arr[f].replace(/\s/g,'');
            }
            
   
           
           
             var data=[];
             var jsondata;
          
            for(var k=0;k<arr.length;k++)
            {
                  
                    (function(index)
                    {
                        
           $.get('getMockTestController?table='+arr[index],function(dat,status){
            jsondata=JSON.parse(dat);
            data[index]=jsondata;
      
        
            
       var create;
        
           for(var j = 0; j < jsondata.length;j++)
	{
            
                 create ='<p><b>Question '+(j+1)+': </b><br/>'+jsondata[j].question+'</p>'
		
                        +'<br><p><b>A:</b><input type="radio" name="'+(arr[index]+j)+'" value="A">'+jsondata[j].ques_a+'</p>'
                +'<br><p><b>B:</b><input type="radio" name="'+(arr[index]+j)+'" value="B">'+jsondata[j].ques_b+'</p>'
                +'<br><p><b>C:</b><input type="radio" name="'+(arr[index]+j)+'" value="C">'+jsondata[j].ques_c+'</p>'
                +'<br><p><b>D:</b><input type="radio" name="'+(arr[index]+j)+'" value="D">'+jsondata[j].ques_d+'</p>'
                +'<hr>';
                       
                
              $('#question'+(index+1)).append(create);  
	}
          
          jsondata=null;
    });
                    })(k);
                   
            }
           
       var jsonarray=[];
       document.getElementById("defaultOpen").click();
        $('#submit').click(function(){
     
        var a;
  
        var answer;
         var jsond;
        var ques_no;
        for(var i=0;i<arr.length;i++)
        {
              jsond=data[i];
                 a={};
     for(var j=0;j< jsond.length;j++)
     {
         answer=$('input[name='+(arr[i]+j)+']:checked').val();
       
         ques_no=jsond[j].question_no;
        a[ques_no]=answer;
       
      }
      
      jsonarray[i]=JSON.stringify(a);
        }
     
          $.post('TestController?jsonfile0='+encodeURI(jsonarray[0]<% for(int j=1;j<sube.size();j++){%>+'&jsonfile<%=j%>='+jsonarray[<%=j%>]<%}%>),function(){
            
         document.location.href='MockTestResultController';   
          }
                  );
        });
        
        
   
        });
       
        function openSubject(evt, subName) {
    // Declare all variables
    var i, tabcontent, tablinks;
    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    // Show the current tab, and add an "active" class to the button that opened the tab
    document.getElementById(subName).style.display = "block";
    evt.currentTarget.className += " active";
}
      
  
 </script>
    
       
<div class="tab">
  <button id="defaultOpen" class="tablinks" onclick="openSubject(event, '<%=sube.get(0).getSub()%>')"><%=sube.get(0).getSub()%></button>
  <% for(int i=1;i<sube.size();i++) 
  { %>
      <button class="tablinks" onclick="openSubject(event, '<%=sube.get(i).getSub()%>')"><%=sube.get(i).getSub()%></button>

 <% } %>
 
 <h6 id="time" align="center"></h6>
 <button id="submit" style="float:right;">SUBMIT </button>
 
</div>
<% for(int i=0;i<sube.size();i++)
{ %>
    <div id="<%=sube.get(i).getSub()%>" class="tabcontent" >
     <p id="question<%=(i+1)%>"></p>
</div>

 <%} %>

      
      <p id="dummy"></p>
</body>
</html>