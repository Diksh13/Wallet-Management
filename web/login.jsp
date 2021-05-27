<%@ page language="java" contentType="text/html; "
pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,Dbase.*,pkg1.*"%>

<%
Query q = new Query();

String uName = request.getParameter("uName");
String pWord = request.getParameter("pWord");
		
		if (uName == "" || pWord == "") {
			request.setAttribute("message", "User Name (or) Password shouldn't be empty");
                        
			return;
		}

		User user = q.login(uName, pWord);
		
		if (null == user.getEmail()) {
			request.setAttribute("message", "Login failed. Please check User Name and Password.");
                         %>
                                <jsp:forward page="SignIn.jsp"/>
                                <%
			return;
		} else {
			session = request.getSession(true);
			session.setAttribute("user", user);
//			request.setAttribute("message", "User successfully logged in.");
			request.setAttribute("user", user);
 %>
                                <jsp:forward page="walletpage.jsp"/>
                                <%

		}	
%>