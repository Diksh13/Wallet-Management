<%@ page language="java" contentType="text/html;"
pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,Dbase.*,pkg1.*"%>

<%
Query q = new Query();


		session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		String cashString = request.getParameter("cash");
		Double cash = null;
		if (cashString == null || cashString == "") {
			request.setAttribute("message", "Invalid amount entered.");
			doGet(request, response);
			return;
		}
		try {
			cash = Double.parseDouble(cashString);
		} catch (NumberFormatException e) {
			request.setAttribute("message", "Invalid amount entered.");
			doGet(request, response);
			return;
		}
		
		Wallet userWallet = q.getUserWalletBalance(user.getId());
		
		Wallet updatedWallet = q.updateUserWalletBalance(user.getId(), userWallet.getCash()+cash);
		
		request.setAttribute("wallet", updatedWallet);
		request.setAttribute("user", user);
                %>
                                <jsp:forward page="walletpage.jsp"/>
                                <%

%>