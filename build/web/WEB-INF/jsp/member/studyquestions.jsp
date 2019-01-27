
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>

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
    <body style="background: ">
           <%@include file="../../jspf/fieldheader.jspf" %>
        <% JSONArray arr=(JSONArray)request.getAttribute("table");%>
        <h1 align="center" style="text-color:blue">
             <%=(String)session.getAttribute("field")%>
        </h1>
      
            
             <% for(int i=0;i<arr.length();i++)
             {
               JSONObject obj=arr.getJSONObject(i);
            %>
            <h2 ><%=i+1%>).  <%=obj.get("question")%></h2>
            <h2 style="color: green">Answer :-  <%=obj.get("answer")%></h2>
            <hr>
            
           <%    
             }
             %>
    </body>
</html>
