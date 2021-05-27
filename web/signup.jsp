<%@ page language="java" contentType="text/html;"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

</head>
<body>
    <jsp:include page="header.jsp" />
        
	<div class="container" style="margin: auto;border: 3px solid #9b239f; padding: 40px; height:410px">
            
            <c:set var="userExists" value="${userExists}" />
	<c:if test="${userExists}">
		<p style="color: red;">
			User <b><c:out value="${currentUser}" /></b> already
			exists. Please try with different user name.
		</p>
	</c:if>
		<form action="reg.jsp" method="post">
			<label for="username">Username</label> 
			<input type="text" name="username" placeholder="Username" required/>
			
			<label for="email">Email</label> 
			<input type="text" name="email" placeholder="Email" required/>
			
			<label for="password">Password</label> 
			<input type="password" name="password" placeholder="Password" required/>
			
			<label for="cpassword">Confirm Password</label> 
			<input type="password" name="cpassword" placeholder="Re-Enter Password" required/>
			
			<input type="submit" value="Sign Up">
		</form>
        </div>
<jsp:include page="footer.jsp" />
</body>
</html>