<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    
    <style>
ul {
  list-style-type: none;
  margin: 0;
  /*margin-top: 0px;*/
  padding: 0;
  overflow: hidden;
  background-color: #7926BE;
  /*top:0px;*/
  /*position:*/ 
  width:100%;
  
}
body{
    background-color: #B65FCF;
}

li {
  float: right;
}

li a{
  display: block;
  color: white;
  text-align: center;
  padding: 29px 16px;
  text-decoration: none;
  font-size:25px;
}
.a{
display: block;
  color: white;
  font-family:cursive;
  text-align: center;
  font-size:25px;
  padding: 0px 15px;
  
  text-decoration: none;
}
.b{
   /*display: block;*/
  color: white;
  text-align: center;
  font-size:45px;
  padding: 0px 15px;
  
  /*text-decoration: none;*/
 
}
.a img
{
    position:relative;
    top:20px;
}

li a:hover:not(.active) {
  background-color: #F88D24;
}

.active {
  background-color:green;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	
        
		<ul>
                    
			 <div class='a' style="float:left"><img src='css/wallet.png' height='50' width='50'>&nbsp;&nbsp;
      <b>Wallet Management</b></div>
                    <li></li>
                    <li></li>
                    <li></li>
		
			<c:if test="${sessionScope.user == null}">
				<li style="float:right;"><a 
					href="SignIn.jsp">Login</a></li>
			</c:if>
                                        <c:if test="${sessionScope.user != null}">
				<li style="float:right;"><a 
					href="logout.jsp"><b>Logout</b></a></li>
			</c:if>
                                        
			
                                        <li style="float:right;"><a 
				href="signup.jsp">Register</a></li>
                                 <li style="float:right;"><a  href="stats.jsp">Stats</a></li>
			<li style="float:right;"><a  href="Transaction.jsp">Transactions</a></li>	
			<li style="float:right;"><a href="walletpage.jsp">Wallet</a></li>	
			
                       
                        <li style="float:right;"><a  href="index.jsp">Home</a></li>
                        
			
			
		</ul>
	
	<div>
            <br>
		<c:if test="${sessionScope.user != null}">
			<div style="text-align: center;color: #ffffff;font-size: x-large;height: 41px;">Welcome <c:out value="${sessionScope.user.username}"></c:out></div>
		</c:if>
	</div>
</body>
</html>