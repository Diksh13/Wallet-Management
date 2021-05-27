<%@ page language="java" contentType="text/html"
pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,Dbase.*,pkg1.*"%>

<%
Query q = new Query();
	session = request.getSession();
		if (session!=null) {
			session.invalidate();
			session.setMaxInactiveInterval(1);
		}%>
                                <jsp:forward page="index.jsp"/>
                                <%
		return;
%>