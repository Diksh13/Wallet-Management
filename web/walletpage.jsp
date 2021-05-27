<%@ page language="java" contentType="text/html"
         pageEncoding="UTF-8" import="java.sql.*,java.util.*,Dbase.*,pkg1.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <style>
        #t1 {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#t1 td, #t1 th {
  border: 1px solid #ddd;
  padding: 22px;
}


#t1 tr:hover {background-color: #ddd;}

#t1 th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
    </style>
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <%
        
                Query q = new Query();
		User user = (User) session.getAttribute("user");
		Wallet userWallet = q.getUserWalletBalance(user.getId());
                if (userWallet.getCash() < 100)
                {
                    
			request.setAttribute("message", "Your Balance is below the minimum balance i.e. Rs 100. Please add cash to the wallet");
                }
		request.setAttribute("wallet", userWallet);
		request.setAttribute("user", user);

        %>
    <jsp:include page="header.jsp" />
    
	<div style="float: right;">
            
				<h2 style="color:white;"><b>Wallet Details</b></h2>
		<table id="t1">
			<thead>
				<tr>
					<!--<th scope="col" colspan="1">Wallet Id</th>-->
					<th scope="col" colspan="1">Wallet User</th>
					<th scope="col" colspan="1">Wallet Cash</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<!--<td><c:out value="${wallet.id}" /></td>-->
					<td><c:out value="${user.username}" /></td>
					<td><c:out value="${wallet.cash}" /></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="container" style="margin: auto; height:200px;">
		<h4 style="color: black;">Load cash to wallet</h4>
		<c:if test="${message != ''}">
			<p style="color: red;">
				<c:out value="${message}"></c:out>
			</p>
		</c:if>
		<form action="addBalance.jsp" method="post">
			<input type="text" id="cash" name="cash" placeholder="Amount">

			<input type="submit" value="Add Money">
		</form>
	</div>
                                <jsp:include page="footer.jsp" />
</body>
</html>