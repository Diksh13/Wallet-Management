<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; ">
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <jsp:include page="header.jsp" />

	<div class="container" style="margin: auto;border: 3px solid #9b239f; padding: 40px;">
		<p style="color: red;"><c:out value="${message}" /></p>
		<form action="login.jsp" method="post" >
<br>
                    <label for="uname">Username</label> <br>
			<input type="text" id="uname"
				name="uName" placeholder="Username" required> 
                        <br>
                        <label for="pword">Password</label> <br>
			<input type="password" id="pword"
				name="pWord" placeholder="Password" required> 
<br>
			<input type="submit" value="Login">

		</form>
	</div>
                </div>
              <jsp:include page="footer.jsp" />
</body>
</html>