<%@ page language="java" contentType="text/html;"
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
  padding: 10px;
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

</head>
<body>
    <%
        
        Query q=new Query();
		User user = (User) session.getAttribute("user");
		List<Transaction> transactions = q.getTransactions(5, user);
		request.setAttribute("transactions", transactions);
        %>
    <jsp:include page="header.jsp" />
	<div class="transTable" style="float: right;">
            
				<h3 style="color:white;"><b>My Last 5 transactions</b></h3>
                                <!--<input type="number" value="5" name="num" style="width:100px;height:30px;border-radius: 5px;" onchange="walletpage.jsp"><br><br>-->
                                
		<table id="t1">
		<thead>
				<th colspan="1">Transaction Id</th>
				<th  colspan="1">Transaction Amount</th>
				<th  colspan="1">Comments</th>
				<th  colspan="1">Time</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${transactions}" var="element">
			<tr>
				<td>${element.id}</td>
				<td>${element.amount}</td>
				<td>${element.comments}</td>
				<td>${element.time}</td>
			</tr>
		</c:forEach>
			
		</tbody>
		</table>
	</div>
        <div class="container" style="margin: auto; ">
		<h3>Transaction</h3>
		<c:if test="${transError != ''}">
			<p style="color: red;"><c:out value="${transError}"/></p>
		</c:if>
		<c:if test="${transSuccess != ''}">
			<p style="color: green;"><c:out value="${transSuccess}"/></p>
		</c:if>
		<br>
		<form action="trans.jsp" method="post">
			<label for="cash">Transaction Amount</label> 
			<input type="text" name="cash" placeholder="Enter Amount" required/>
			<br>
			<br>
			<label for="comments">Transaction Comments</label> 
                        <div style="width:300px;">
                            <select name="comments" required >
                            <option>Select One</option>
                            <option value="Travel">Travel</option>
                            <option value="Food & Beverage">Food & Beverage</option>
                            <option value="Shopping">Shopping</option>                            
                            <option value="Entertainment">Entertainment</option>
                            <option value="Recharges">Recharges</option>
                            <option value="Bill Payment">Bill Payment</option>
                            <option value="Transaction">Transaction</option>
                            <option value="Others" >Others</option>
  </select>
</div>
                        
			<!--<input type="text" name="comments" placeholder="Enter transaction comments" required/>-->
			
			<input type="submit" value="Do Transaction">
		</form>
                <a href="https://paytm.com/" style="text-decoration:none;"><p style="font-size:15px;color:#B65FCF;">Perform Transaction through Payment Gateway</p></a>
	</div>
                <jsp:include page="footer.jsp" />
</body>
</html>