<%@ page language="java" contentType="text/html"
pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,Dbase.*,pkg1.*"%>

<%
Query q = new Query();

                session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		Double cash = Double.parseDouble(request.getParameter("cash"));
		Transaction trans = new Transaction(cash,request.getParameter("comments"));
		
		trans.setUser(user.getId());
		
		Wallet userWallet = q.getUserWalletBalance(user.getId());
		Double existingCash = userWallet.getCash();
		Double updatedAmount = existingCash-trans.getAmount();
		if(updatedAmount < 0){
			request.setAttribute("transError", "Last transaction failed due to lack of sufficient funds");
%>
                                <jsp:forward page="Transaction.jsp"/>
                                <%

		}
		
		Wallet newWallet = q.updateUserWalletBalance(user.getId(), updatedAmount);
		
		if(newWallet!=null){
			q.doTransaction(trans);
		} else {
			request.setAttribute("transError", "Last Transaction failed due to unexpected error.");
			%>
                                <jsp:forward page="Transaction.jsp"/>                             
                                <%

		}
		request.setAttribute("transSuccess", "Transaction Successful. Current user wallet balance : "+updatedAmount);
			%>
                                <jsp:forward page="Transaction.jsp"/>
                                <%

		
		
%>