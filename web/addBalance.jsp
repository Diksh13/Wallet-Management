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
		}
		try {
			cash = Double.parseDouble(cashString);
                        if(cash<0)
                        {
                            request.setAttribute("message", "Invalid amount entered.");
                           }
		} catch (NumberFormatException e) {
			request.setAttribute("message", "Invalid amount entered.");
			%>
                                <jsp:forward page="walletpage.jsp"/>
                                <%
		}
		if ((cash>0 && cash<=50000))
{
		Wallet userWallet = q.getUserWalletBalance(user.getId());
		
		Wallet updatedWallet = q.updateUserWalletBalance(user.getId(), userWallet.getCash()+cash);
		
		request.setAttribute("wallet", updatedWallet);
		request.setAttribute("user", user);}
else{
	request.setAttribute("message", "You have exceeded the maximum limit");
}
                %>
                                <jsp:forward page="walletpage.jsp"/>
                                <%

%>