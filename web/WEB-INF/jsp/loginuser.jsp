
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
         <title>Sign In</title>
    <link rel="stylesheet" href="css/login.css">       
 <link rel="stylesheet" href="css/bootstrap.min.css">
 
<script src="js/jquery-3.3.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
    </head>
<body>
 
    
   
    
    
 <%@include file="../jspf/header.jspf" %>
<div class="container">
    <% String signup=(String)request.getAttribute("signup");
    if(signup!=null)
    { %>
       <h2 style="color:greenyellow"><%=signup%></h2>  
   <% } %>
   
   <div class="formbasic">
    <form action="logincontroller" method="post">
        <div class="form-group">
            <label for="userid"><strong>USER ID</strong></label>
            <input type="text" placeholder="Enter Userid" name="uname" id="userid" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="password"><strong>PASSWORD</strong></label>
            <input type="password" placeholder="Enter Password" name="psw" id="password" class="form-control" required>
        </div>
                <c:if test="${!empty error}">
                    <div>
                        <h5 style="color:red;">${error}</h5>
                    </div>
                </c:if>

    <button class="btn btn-lg btn-outline-primary" type="submit">Login</button>
    <button class="btn btn-lg btn-outline-danger" type="reset">Reset</button>
 

 
</form>
</div>
</div>
    
   
</body>
</html>